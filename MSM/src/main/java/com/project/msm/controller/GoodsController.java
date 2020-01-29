package com.project.msm.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.goods.service.GoodsService;

@Controller
@RequestMapping("/product/*")
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
	// 01. 상품전체목록
	@RequestMapping(value = "/listView", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		logger.info("Goods List");	
		
		model.addAttribute("list", service.listProduct());
		
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

}
