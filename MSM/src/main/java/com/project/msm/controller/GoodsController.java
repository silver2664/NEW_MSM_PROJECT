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
	

	
	
		
	// 01. ��ǰ��ü���(AAS-Studio)
	@RequestMapping(value = "/aasList", method = RequestMethod.GET)
	public String aasList(Model model) throws Exception {
		
		logger.info("Goods List");	
		
		model.addAttribute("list", service.aasList());
		
		return "/product/aasList";
	}
	
	// 01. ��ǰ��ü���(BBS-Studio)
	@RequestMapping(value = "/bbsList", method = RequestMethod.GET)
	public String bbsList(Model model) throws Exception {
			
		logger.info("Goods List");	
			
		model.addAttribute("list", service.bbsList());
			
		return "/product/bbsList";
	}
	
	// 01. AAS�귣�� ī�װ��� - 1
	@RequestMapping(value = "/listView2", method = RequestMethod.GET)
	public String aasList(Model model, @RequestParam("c") int cateCode) throws Exception {
			
		logger.info("Goods List");	
			
		model.addAttribute("list", service.catelist(cateCode));
			
		return "/product/aasList";
	}
	
	// 01. AAS�귣�� ī�װ��� - 1
	@RequestMapping(value = "/listView3", method = RequestMethod.GET)
	public String bbsList(Model model, @RequestParam("c") int cateCode) throws Exception {
				
		logger.info("Goods List");	
				
		model.addAttribute("list", service.catelist(cateCode));
				
		return "/product/bbsList";
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
	@RequestMapping(value="product/product_reg")
	public String goodsRegisterView(Model model)throws Exception {
		logger.info("registerView");
				
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category",JSONArray.fromObject(category));
		return "product/product_reg";			
	}
			
	
	//ck������ �̹��� ���
	@RequestMapping(value = "product/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
		HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		
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
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // �ۼ�ȭ��
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
			public String register(GoodsVO vo,MultipartFile file,Model model) throws Exception {
				
				System.out.println("��ǰ���");
				
				
				//�̹��� ���ε�
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
				
				//��ǰ���
				service.register(vo);
				
				return "redirect:/admin/goodsList";
				
			}
			
			//  ��ǰ �󼼺���
			@RequestMapping(value = "/productView/{mgNum}")
			public ModelAndView tablist(@PathVariable("mgNum")int mgNum,ModelAndView mav) throws Exception {
				
				logger.info("productview");	
				
				
				
				mav.setViewName("/product/productView");
				mav.addObject("vo",service.detailProduct(mgNum));
				mav.addObject("tablist",tabservice.tabslist());
				
			
				
				return mav;
			}
			
			//��ǰ ����
			@RequestMapping(value="/product/productModifyView",method=RequestMethod.GET)
			public void getProductModify(@RequestParam("mgNum") int mgNum,Model model) throws Exception	 {
				
				logger.info("get product modify");
				
				GoodsViewVO vo = service.detailProduct(mgNum);				
				model.addAttribute("mo",vo);
				
				
				
				List<CategoryVO> category = null;
				category=service.category();
				model.addAttribute("category",JSONArray.fromObject(category));
				
				
			
			}
			//��ǰ���� 
			@RequestMapping(value="/product/productModify",method=RequestMethod.POST)
			public String productModify(GoodsVO vo,MultipartFile file,HttpServletRequest req) throws Exception {
				logger.info("productModify");
				
				//���ο� ��ǰ�� ��ϵǾ����� Ȯ��
				if (file.getOriginalFilename() != null && file.getOriginalFilename() !="") {
					//���� ������ ����
					new File(uploadPath + req.getParameter("mgImg")).delete();
					new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
					
					//���ο� ÷�� ������ ���
					String imgUploadPath = uploadPath + File.separator + "imgUpload";
					String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
					String fileName = UploadFileUtils.uploadFile(imgUploadPath, file.getOriginalFilename(),file.getBytes());
					
					vo.setMgImg( "imgUpload"   + File.separator +ymdPath + File.separator + fileName);
					vo.setMgThumbImg(  "imgUpload" + ymdPath +File.separator +"s" + File.separator +"s" +fileName);
				} else { //���ο� ������ ��ϵ��� �ʾҴٸ�
					//���� �̹��� �״�� ���
					vo.setMgImg(req.getParameter("mgImg"));
					vo.setMgThumbImg(req.getParameter("mgThumbImg"));
				}
				
				service.productModify(vo);
				
				return "redirect:/product/listView";
			}
			
			//��ǰ ����
			@RequestMapping(value="/product/productDelete", method=RequestMethod.POST)
			public String productDelete(@RequestParam("mgNum") int mgNum) {
				logger.info("productDelete");
				
				service.productDelete(mgNum);
				
				return "redirect:/admin/goodsList";
				
			}
			
			
			
			
}
			

			

