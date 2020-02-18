package com.project.msm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.cart.service.CartService;
import com.project.cart.vo.CartVO;
import com.project.order.service.OrderService;
import com.project.order.vo.OrderVO;

@Controller
@RequestMapping(value="/order/*")
public class OrderController {
	
	@Inject
	OrderService service;
	
	@Inject
	CartService cartService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	@RequestMapping(value="/order/insert")
	public String insert(@ModelAttribute OrderVO order, @ModelAttribute CartVO cart, @RequestParam int[] mgNum,
			@RequestParam String[] orderProductName, @RequestParam String[] orderAmount, 
			@RequestParam String[] orderPrice, @RequestParam int[] cartId) throws Exception{
		
		logger.info("주문");
		
		for(int i = 0; i < mgNum.length; i++) {
			System.out.println(mgNum[i]);
			order.setMgNum(mgNum[i]);
			order.setOrderProductName(orderProductName[i]);
			order.setOrderAmount(orderAmount[i]);
			order.setOrderPrice(orderPrice[i]);
			
			service.insert(order);
			cartService.delete(cartId[i]);
		}
		
		return "/order/orderList";
		
	}
	
	@RequestMapping(value="/order/orderList")
	public ModelAndView orderList(ModelAndView mv) throws Exception {
		logger.info("결제내역");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String mId = user.getUsername();
		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderVO> list = service.orderList(mId);
		map.put("list", list);
		mv.addObject("map", map);
		mv.setViewName("/order/orderList");
		return mv;
	}
}
