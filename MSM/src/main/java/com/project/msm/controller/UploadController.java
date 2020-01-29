package com.project.msm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.msm.util.MediaUtils;
import com.project.msm.util.UploadFileUtils;

@Controller(value = "/upload/*")
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name = "uploadPath")
	String uploadPath;
	// root-context 등록한 uploadPath 호출.
	
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		
	}
	
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mv) throws Exception {
		logger.info("파일이름 : " + file.getOriginalFilename() );
		String savedName = file.getOriginalFilename();
		logger.info("파일크기 : " + file.getSize());
		logger.info("컨텐츠 타입  : " + file.getContentType());
		
		savedName = uploadFile(savedName, file.getBytes());
		
		mv.setViewName("/upload/uploadResult");
		mv.addObject("savedName", savedName);
		return mv;
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		//uuid 생성 (universal unique identitfier, 범용 고유 식별자)
		//uuid 생성 이유는 파일 업로드 시 이름이 중복되어 파일이 삭제될 수 있으므로 고유코드를 만들어 이름중복을 막아준다.
		
		File target = new File(uploadPath, savedName); // 파일을 실제로 저장한다.
		// 임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy (바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target); // 파일을 복사
		return savedName;
	}
	
	/*============================ # Ajax 방식의 업로드 처리 =======================*/
	
	// 1. AJAX 업로드 페이지 매핑
	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	// 2. AJAX 업로드 처리 매핑
	@ResponseBody
	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	// 3. 이미지 표시 매핑
	@ResponseBody // view가 아닌 data리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		// 서버의 파일을 다운로드 하기 위한 스트림
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 01. 확장자를 추출하여 formatName에 저장
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			// 02. 추출한 확장자를 MediaUtils클래스에서 이미지파일 여부를 검사하고 리턴받아 mType에 저장
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 03. 헤더 구성 객체 (외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
			HttpHeaders headers = new HttpHeaders();
			// 04. InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			// 이미지 파일이면
			if (mType != null) {
				headers.setContentType(mType);
			}
			// 이미지가 아니면
			else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				// 다운로드용 컨텐츠 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				// 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"), "iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에 " \" 내용 \" "
				// 파일의 한글 깨짐 방지
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
			}
			// 바이트배열, 헤더, HTTP상태코드
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);			
		} finally {
			in.close();
		}
		return entity;
	}
	
	// 4. 파일 삭제 매핑
	@ResponseBody // view가 아닌 data 리턴
	@RequestMapping(value = "/upload/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		// 01. 파일의 확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// 02. 이미지 파일 여부 검사
		MediaType mType = MediaUtils.getMediaType(formatName);
		// 이미지의 경우 (썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
		// 이미지의 경우
		if (mType != null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			//썸네일 이미지 삭제
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		// 원본파일 삭제
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		// 데이터와 http 상태 코드 전송
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
