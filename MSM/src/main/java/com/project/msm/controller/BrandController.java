package com.project.msm.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.goods.service.GoodsService;
import com.project.goods.vo.GoodsVO;
import com.project.goods.vo.GoodsViewVO;

@Controller
@RequestMapping("/brand/*")
public class BrandController {
	
	private static final Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Inject
	GoodsService service;
	
	//�귣���ε���
	@RequestMapping(value = "/brandIndex")
	public String brandIndex() {
		return "/brand/brandIndex";
	}
	
	//�귣�帮��Ʈ.
	@RequestMapping(value="/brandList", method=RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,@RequestParam("l")int level,Model model) throws Exception{
		logger.info("BrandList");
		
		List<GoodsViewVO> list = null;
		list = service.catelist(cateCode);
		
		model.addAttribute("list",list);
	}
	
	//���θ� ��ü ���� ����Ʈ.
	@RequestMapping(value="/ringList", method=RequestMethod.GET)
	public ModelAndView getRingList() throws Exception{
		logger.info("BrandList");
			
		ModelAndView mv = new ModelAndView();
			
		List<GoodsViewVO> list = null;
		list = service.ringList();
			
		mv.addObject("list", list);
		mv.setViewName("/brand/brandList");
			
		return mv;
	}
	
	//���θ� ��ü ���� ����Ʈ.
	@RequestMapping(value="/braceletList", method=RequestMethod.GET)
	public ModelAndView getBraceletList() throws Exception{
		logger.info("Bracelet List");
				
		ModelAndView mv = new ModelAndView();
				
		List<GoodsViewVO> list = null;
		list = service.braceletList();
				
		mv.addObject("list", list);
		mv.setViewName("/brand/brandList");
				
		return mv;
	}
		
	//���θ� ��ü �Ͱ��� ����Ʈ.
	@RequestMapping(value="/earringList", method=RequestMethod.GET)
	public ModelAndView getEarringList() throws Exception{
		logger.info("Earring List");
				
		ModelAndView mv = new ModelAndView();
				
		List<GoodsViewVO> list = null;
		list = service.earringList();
				
		mv.addObject("list", list);
		mv.setViewName("/brand/brandList");
				
		return mv;
	}
		
	//���θ� ��ü ����� ����Ʈ.
	@RequestMapping(value="/necklaceList", method=RequestMethod.GET)
	public ModelAndView getNecklaceList() throws Exception{
		logger.info("Necklace List");
				
		ModelAndView mv = new ModelAndView();
				
		List<GoodsViewVO> list = null;
		list = service.necklaceList();
				
		mv.addObject("list", list);
		mv.setViewName("/brand/brandList");
				
		return mv;
	}
	
	//���θ� ��ü ����� ����Ʈ.
	@RequestMapping(value="/allList", method=RequestMethod.GET)
	public ModelAndView allList() throws Exception{
		logger.info("Necklace List");
					
		ModelAndView mv = new ModelAndView();
					
		List<GoodsVO> list = null;
		list = service.listProduct();
					
		mv.addObject("list", list);
		mv.setViewName("/brand/brandList");
					
		return mv;
	}

}
