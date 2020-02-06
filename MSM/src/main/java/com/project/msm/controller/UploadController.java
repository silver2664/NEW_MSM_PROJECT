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
	// root-context ����� uploadPath ȣ��.
	
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		
	}
	
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mv) throws Exception {
		System.out.println(file);
		logger.info("�����̸� : " + file.getOriginalFilename() );
		String savedName = file.getOriginalFilename();
		logger.info("����ũ�� : " + file.getSize());
		logger.info("������ Ÿ��  : " + file.getContentType());
		
		savedName = uploadFile(savedName, file.getBytes());
		
		mv.setViewName("/upload/uploadResult");
		mv.addObject("savedName", savedName);
		return mv;
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		//uuid ���� (universal unique identitfier, ���� ���� �ĺ���)
		//uuid ���� ������ ���� ���ε� �� �̸��� �ߺ��Ǿ� ������ ������ �� �����Ƿ� �����ڵ带 ����� �̸��ߺ��� �����ش�.
		
		File target = new File(uploadPath, savedName); // ������ ������ �����Ѵ�.
		// �ӽ� ���丮�� ����� ���ε�� ������ ������ ���丮�� ����
		// FileCopyUtils.copy (����Ʈ�迭, ���ϰ�ü)
		FileCopyUtils.copy(fileData, target); // ������ ����
		return savedName;
	}
	
	/*============================ # Ajax ����� ���ε� ó�� =======================*/
	
	// 1. AJAX ���ε� ������ ����
	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	// 2. AJAX ���ε� ó�� ����
	@ResponseBody
	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	// 3. �̹��� ǥ�� ����
	@ResponseBody // view�� �ƴ� data����
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		// ������ ������ �ٿ�ε� �ϱ� ���� ��Ʈ��
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 01. Ȯ���ڸ� �����Ͽ� formatName�� ����
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			// 02. ������ Ȯ���ڸ� MediaUtilsŬ�������� �̹������� ���θ� �˻��ϰ� ���Ϲ޾� mType�� ����
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 03. ��� ���� ��ü (�ܺο��� �����͸� �ְ���� ������ header�� body�� �����ؾ��ϱ� ������)
			HttpHeaders headers = new HttpHeaders();
			// 04. InputStream ����
			in = new FileInputStream(uploadPath + fileName);
			// �̹��� �����̸�
			if (mType != null) {
				headers.setContentType(mType);
			}
			// �̹����� �ƴϸ�
			else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				// �ٿ�ε�� ������ Ÿ��
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				// ����Ʈ�迭�� ��Ʈ������ : new String(fileName.getBytes("utf-8"), "iso-8859-1") * iso-8859-1 ���������, ū ����ǥ ���ο� " \" ���� \" "
				// ������ �ѱ� ���� ����
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
			}
			// ����Ʈ�迭, ���, HTTP�����ڵ�
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);			
		} finally {
			in.close();
		}
		return entity;
	}
	
	// 4. ���� ���� ����
	@ResponseBody // view�� �ƴ� data ����
	@RequestMapping(value = "/upload/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		// 01. ������ Ȯ���� ����
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// 02. �̹��� ���� ���� �˻�
		MediaType mType = MediaUtils.getMediaType(formatName);
		// �̹����� ��� (����� + �������� ����), �̹����� �ƴϸ� �������ϸ� ����
		// �̹����� ���
		if (mType != null) {
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			//����� �̹��� ����
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		// �������� ����
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		// �����Ϳ� http ���� �ڵ� ����
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
