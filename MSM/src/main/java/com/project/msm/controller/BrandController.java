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

import com.project.goods.service.GoodsService;
import com.project.goods.vo.GoodsViewVO;

@Controller
@RequestMapping("/brand/*")
public class BrandController {
	
	private static final Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Inject
	GoodsService service;
	
	//카테고리별 리스트
	@RequestMapping(value="/brandList", method=RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,@RequestParam("l")int level,Model model) throws Exception{
		logger.info("BrandList");
		
		List<GoodsViewVO> list = null;
		list = service.catelist(cateCode);
		
		model.addAttribute("list",list);
	}

}
