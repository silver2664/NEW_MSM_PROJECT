package com.project.msm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.TabsVO;

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
	
	// 01. ��ǰ��ü���
	@RequestMapping(value = "/listView", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		logger.info("Goods List");	
		
		model.addAttribute("list", service.listProduct());
		
		return "/product/listView";
	}
	
	// 02. ��ǰ�󼼺���
	@RequestMapping(value = "/detailView/{mgNum}")
	public ModelAndView detail(@PathVariable("mgNum") int mgNum, ModelAndView mav) {
		logger.info("Goods Detail");
		mav.setViewName("/product/detailView");
		mav.addObject("vo", service.detailProduct(mgNum));
		return mav;
	}
	
	//��ǰ���ȭ��
			@RequestMapping("product/product_reg")
			public String goodsRegisterView() {
				logger.info("registerView");
				return "product/product_reg";			
			}
	
	//ck������ �̹��� ���
			@RequestMapping(value = "product/ckUpload", method = RequestMethod.POST)
			public void postCKEditorImgUpload(HttpServletRequest req,
			          HttpServletResponse res,
			          @RequestParam MultipartFile upload) throws Exception {
			 logger.info("post CKEditor img upload");
			 
			 // ���� ���� ����
			 UUID uid = UUID.randomUUID();
			 
			 OutputStream out = null;
			 PrintWriter printWriter = null;
			 JsonObject json = new JsonObject();
			 
			   
			 // ���ڵ�
			 res.setCharacterEncoding("utf-8");
			 res.setContentType("text/html;charset=utf-8");
			 
			 try {
			  
			  String fileName = upload.getOriginalFilename();  // ���� �̸� ��������
			  byte[] bytes = upload.getBytes();
			  
			  // ���ε� ���
			  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			  System.out.println(ckUploadPath);
			  
			  out = new FileOutputStream(new File(ckUploadPath));
			  out.write(bytes);
			  out.flush();  // out�� ����� �����͸� �����ϰ� �ʱ�ȭ
			  
			  String callback = req.getParameter("CKEditorFuncNum");
			  System.out.println(callback);
			  printWriter = res.getWriter();
			  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // �ۼ�ȭ��
			  System.out.println(fileUrl + "fileUrl");
			  // ���ε�� �޽��� ���
			/*  printWriter.println("<script>"
			     + "window.parent.CKEDITOR.tools.callFunction("
			     + callback+",'"+ fileUrl+"','�̹����� ���ε��Ͽ����ϴ�.')"
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
			
			//��ǰ���
			@RequestMapping(value="product/register", method=RequestMethod.POST)
			public String register(GoodsVO vo) throws Exception {
				service.register(vo);
				
				return "redirect:admin";
				
			}
			
			//  tab����Ʈ
			@RequestMapping(value = "/product/productView", method = RequestMethod.GET)
			public String tablist(Model model) throws Exception {
				
				logger.info("productview");	
				
				model.addAttribute("tablist", tabservice.tabslist());
				
				System.out.println(model);
			
				
				return "/product/productView";
			}

}
