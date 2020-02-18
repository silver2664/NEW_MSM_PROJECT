package com.project.msm.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.cart.service.CartService;
import com.project.cart.vo.CartVO;


@Controller
@RequestMapping(value = "/cart/*")
public class CartController {
	
	@Inject
	CartService service;	
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	// 01. ��ٱ��� �߰�
	@RequestMapping(value = "/cart/insert")
	public String insert(@ModelAttribute CartVO vo) throws Exception {
		
		logger.info("��ٱ��� �߰�");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String userId = user.getUsername();
		System.out.println("userId : " + userId);
		System.out.println("mgNum : " + vo.getMgNum());
		vo.setUserId(userId);
		
		// ��ٱ��Ͽ� ���� ��ǰ�� �ִ��� �˻�
		int count = service.countCart(vo.getMgNum(), userId);
		System.out.println("COUNT�� : " + count);
		
		if(count == 0) {
			// ������ insert
			service.insert(vo);
		} else {
			// ������ update
			service.updateCart(vo);
		}
		return "redirect:/cart/cartView";
	}
	
	// 02. ��ٱ��� ���
	@RequestMapping(value = "/cart/cartView")
	public ModelAndView list (HttpSession session, ModelAndView mv) throws Exception {
		logger.info("��ٱ��� ���");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String userId = user.getUsername();
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = service.listCart(userId);
		int sumMoney = service.sumMoney(userId);
		int fee = sumMoney >= 100000 ? 0 : 2500;
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allsum", sumMoney + fee);
		mv.setViewName("/cart/cartView");
		mv.addObject("map", map);
		return mv;		
	}
	
	// 03. ��ٱ��� ����
	@RequestMapping(value = "/cart/delete")
	public String delete(@RequestParam int cartId) throws Exception {
		service.delete(cartId);
		return "redirect:/cart/cartView";
	}
	
	// 04. ��ٱ��� ����
	@RequestMapping("/cart/update")
	public String update(@RequestParam int[] amount, @RequestParam int[] mgNum) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String userId = user.getUsername();
		for(int i = 0; i<mgNum.length; i++) {
			CartVO vo = new CartVO();
			vo.setUserId(userId);
			vo.setAmount(amount[i]);
			vo.setMgNum(mgNum[i]);
			service.modifyCart(vo);
		}
		return "redirect:/cart/cartView";
	}
	
	//�ֹ�
	@RequestMapping(value="cart/order")
	public String order(Model model,HttpSession session)throws Exception{
		logger.info("order");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String userId = user.getUsername();
			
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = service.listCart(userId);
			
			
			
		int sumMoney = service.sumMoney(userId);
		int fee = sumMoney >= 10000 ? 0 : 2500;
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("allsum", sumMoney + fee);
		model.addAttribute("map",map);
			
			
			
		model.addAttribute("member",service.member(userId));	
			
		return "order/orderInfo";
			
	}
	
	// 04. ��ٱ��� ����
	@RequestMapping("/cart/update2")
	public String orederupdate(@RequestParam int[] orderAmount, @RequestParam int[] mgNum) throws Exception {
		logger.info("��ٱ��� ����");
		for(int i = 0; i<mgNum.length; i++) {
			System.out.println(orderAmount[i]);
			System.out.println(mgNum[i]);
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		String userId = user.getUsername();
		for(int i = 0; i<mgNum.length; i++) {
			CartVO vo = new CartVO();
			vo.setUserId(userId);
			vo.setAmount(orderAmount[i]);
			vo.setMgNum(mgNum[i]);
			service.modifyCart(vo);
		}
		return "redirect:/cart/order";
	}
			
	@RequestMapping(value = "/cart/delete2")
	public String oredrcartdelete(@RequestParam int cartId) throws Exception {
		service.delete(cartId);
		return "redirect:/cart/order";
	}

}
