package com.project.msm.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.order.service.OrderService;
import com.project.order.vo.OrderVO;

@Controller
@RequestMapping(value="/order/*")
public class OrderController {
	
	@Inject
	OrderService service;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	@RequestMapping(value="/order/insert")
	public String insert(@ModelAttribute OrderVO order)throws Exception{
		logger.info("¡÷πÆ");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String subNum ="";
		for (int i = 0; i <= 6; i++) {
			subNum += (int)(Math.random()*10);
		}
		String orderNum = ymd + "_" + subNum;
		
		order.setOrderNum(orderNum);
		
		service.insert(order);
		
		return null;
		
	}
}
