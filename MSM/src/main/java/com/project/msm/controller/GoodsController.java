package com.project.msm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.project.goods.service.GoodsService;
import com.project.goods.service.TabService;
import com.project.goods.vo.CategoryVO;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;
import com.project.msm.util.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/product/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	@Inject
	TabService tabservice;
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	
	// 01. 상품전체목록
	@RequestMapping(value = "/brandListView", method = RequestMethod.GET)
	public String list2(Model model) throws Exception {
			
		logger.info("Goods List");	
			
		model.addAttribute("list", service.listProduct());
			
		return "/product/brandListView";
	}
		
	// 01. 상품전체목록
	@RequestMapping(value = "/listView", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		logger.info("Goods List");	
		
		model.addAttribute("list", service.listProduct());
		
		return "/product/listView";
	}
	
	// 01. AAS브랜드 카테고리별 - 1
	@RequestMapping(value = "/listView2", method = RequestMethod.GET)
	public String aasList(Model model, @RequestParam("c") int cateCode) throws Exception {
			
		logger.info("Goods List");	
			
		model.addAttribute("list", service.catelist(cateCode));
			
		return "/product/listView";
	}

	// 02. 상품상세보기
	@RequestMapping(value = "/detailView/{mgNum}")
	public ModelAndView detail(@PathVariable("mgNum") int mgNum, ModelAndView mav) {
		logger.info("Goods Detail");
		mav.setViewName("/product/detailView");
		mav.addObject("vo", service.detailProduct(mgNum));
		return mav;
	}
	
	//상품등록화면
	@RequestMapping(value="product/product_reg")
	public String goodsRegisterView(Model model)throws Exception {
		logger.info("registerView");
				
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category",JSONArray.fromObject(category));
		return "product/product_reg";			
	}
			
	
	//ck에디터 이미지 등록
	@RequestMapping(value = "product/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
		HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		
		logger.info("post CKEditor img upload");
			 
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
			 
		OutputStream out = null;
		PrintWriter printWriter = null;
		JsonObject json = new JsonObject();
			 
			   
		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
			 
		try {
			  
			String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();
			  
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			System.out.println(ckUploadPath);
			  
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();  // out에 저장된 데이터를 전송하고 초기화
			  
			String callback = req.getParameter("CKEditorFuncNum");
			System.out.println(callback);
			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
			System.out.println(fileUrl + "fileUrl");
			// 업로드시 메시지 출력
			/*  printWriter.println("<script>"
			     + "window.parent.CKEDITOR.tools.callFunction("
			     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
			     +"</script>");*/
			  
			json.addProperty("uploaded", 1);
	        json.addProperty("fileName", fileName);
	        json.addProperty("url", fileUrl);

	        printWriter.println(json);


			  
			printWriter.flush();
			  
			} catch (IOException e) { 
				 e.printStackTrace();
			} finally {
			  try {
				  if(out != null) { 
					  out.close();
				  }
				  if(printWriter != null) { 
				   printWriter.close(); 
				   }
			   
			  
			  
			  } catch(IOException e) {
				  e.printStackTrace(); 
				  }
			 }
			 
			 return; 
			}
			
			
			//상품등록
			@RequestMapping(value="product/register", method=RequestMethod.POST)
			public String register(GoodsVO vo,MultipartFile file,Model model) throws Exception {
				
				System.out.println("상품등록");
				
				
				//이미지 업로드
				String imgUploadPath = uploadPath + File.separator + "imgUpload";
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = null;
				
				System.out.println("imgUploadPath : " + imgUploadPath);
				if(file != null) {
					fileName = UploadFileUtils.uploadFile(imgUploadPath, file.getOriginalFilename(),file.getBytes());
				} else {
					fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
				}
				vo.setMgImg( "imgUpload"   + File.separator +ymdPath + File.separator + fileName);
				vo.setMgThumbImg(  "imgUpload" + ymdPath +File.separator +"s" + File.separator +"s" +fileName);
				
				
				System.out.println(fileName);
				
				//상품등록
				service.register(vo);
				
				return "redirect:/product/listView";
				
			}
			
			//  상품 상세보기
			@RequestMapping(value = "/productView/{mgNum}")
			public ModelAndView tablist(@PathVariable("mgNum")int mgNum,ModelAndView mav) throws Exception {
				
				logger.info("productview");	
				
				
				
				mav.setViewName("/product/productView");
				mav.addObject("vo",service.detailProduct(mgNum));
				mav.addObject("tablist",tabservice.tabslist());
				
			
				
				return mav;
			}
			
			//상품 수정
			@RequestMapping(value="/product/productModifyView",method=RequestMethod.GET)
			public void getProductModify(@RequestParam("mgNum") int mgNum,Model model) throws Exception	 {
				
				logger.info("get product modify");
				
				GoodsViewVO vo = service.detailProduct(mgNum);				
				model.addAttribute("mo",vo);
				
				
				
				List<CategoryVO> category = null;
				category=service.category();
				model.addAttribute("category",JSONArray.fromObject(category));
				
				
			
			}
			//상품수정 
			@RequestMapping(value="/product/productModify",method=RequestMethod.POST)
			public String productModify(GoodsVO vo,MultipartFile file,HttpServletRequest req) throws Exception {
				logger.info("productModify");
				
				//새로운 상품이 등록되었는지 확인
				if (file.getOriginalFilename() != null && file.getOriginalFilename() !="") {
					//기존 파일을 삭제
					new File(uploadPath + req.getParameter("mgImg")).delete();
					new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
					
					//새로운 첨부 파일을 등록
					String imgUploadPath = uploadPath + File.separator + "imgUpload";
					String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
					String fileName = UploadFileUtils.uploadFile(imgUploadPath, file.getOriginalFilename(),file.getBytes());
					
					vo.setMgImg( "imgUpload"   + File.separator +ymdPath + File.separator + fileName);
					vo.setMgThumbImg(  "imgUpload" + ymdPath +File.separator +"s" + File.separator +"s" +fileName);
				} else { //새로운 파일이 등록되지 않았다면
					//기존 이미지 그대로 사용
					vo.setMgImg(req.getParameter("mgImg"));
					vo.setMgThumbImg(req.getParameter("mgThumbImg"));
				}
				
				service.productModify(vo);
				
				return "redirect:/product/listView";
			}
			
			//상품 삭제
			@RequestMapping(value="/product/productDelete", method=RequestMethod.POST)
			public String productDelete(@RequestParam("mgNum") int mgNum) {
				logger.info("productDelete");
				
				service.productDelete(mgNum);
				
				return "redirect:/product/listView";
				
			}
			
			
			
			
}
			

			

