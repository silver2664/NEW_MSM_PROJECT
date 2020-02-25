package com.project.msm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.vo.PageMaker;
import com.project.board.vo.SearchCriteria;
import com.project.goods.service.GoodsService;
import com.project.goods.vo.GoodsViewVO;
import com.project.member.service.UserService;
import com.project.member.vo.MemberVO;
import com.project.order.service.OrderService;
import com.project.order.vo.OrderVO;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminCotroller {
	
	
	@Inject
	UserService userService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	OrderService orderService;
	
	// 관리자 페이지 이동. (Admin.jsp)
	@RequestMapping(value = "/admin/admin", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPage() throws Exception {
		
		return "/admin/admin";
		
	}
		
	// 회원목록 조회.
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memberList(@ModelAttribute("scri") SearchCriteria scri) throws Exception {		
		ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)userService.getMemberList(scri);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(userService.listCount(scri));
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/memberList");
		return mv;
	}
	
	// 회원 권한 변경
	@RequestMapping(value = "/admin/updateAuth", method = RequestMethod.POST)
	@ResponseBody
	public void updateAuth(HttpSession session, @RequestParam(value="id[]") List<String> tdArr, 
			@RequestParam(value="auth[]") List<String> tdArr2) throws Exception {
		
		// admin page에서 받아온 아이디와 권한 변경사항을 ArrayList로 저장
		List<String> mId = new ArrayList<String>();
		mId.addAll(tdArr);
		
		List<String> authority = new ArrayList<String>();
		authority.addAll(tdArr2);
		
		MemberVO vo = new MemberVO();		
		
		for(int i = 0; i < mId.size(); i++) {
			System.out.println("권한변경ID : " + mId.get(i) + "  변경되는권한 : " + authority.get(i));
			vo.setmId(mId.get(i));
			vo.setAuthority(authority.get(i));
			userService.updateAuth(vo);
		}
	}
	
	// 상품목록 조회.
	@RequestMapping(value = "/admin/goodsList")
	public ModelAndView goodsList(@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		ArrayList<GoodsViewVO> goodsList = (ArrayList<GoodsViewVO>)goodsService.getGoodsList(scri);
		ModelAndView mv = new ModelAndView();
		mv.addObject("goodsList", goodsList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(goodsService.listCount(scri));
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/goodsList");
		return mv;
	}
	
	// 재고 변경
	@RequestMapping(value = "/admin/updateAmount", method = RequestMethod.POST)
	@ResponseBody
	public void updateAmount(@RequestParam(value="mgNum[]") List<Integer> mgNum,
			@RequestParam(value="mgAmount[]") List<Integer> mgStock) throws Exception {
		List<Integer> mgNum1 = new ArrayList<Integer>();
		List<Integer> mgStock1 = new ArrayList<Integer>();
		GoodsViewVO vo = new GoodsViewVO();
		mgNum1.addAll(mgNum);
		mgStock1.addAll(mgStock);
		for(int i = 0; i < mgNum1.size(); i++) {
			System.out.println("상품NUMBER : " + mgNum1.get(i) + " " + "해당상품재고 : " + mgStock1.get(i));
			vo.setMgNum(mgNum1.get(i));
			vo.setMgStock(mgStock1.get(i));
			goodsService.updateAmount(vo);
		}
	}
	
	// 가격 변경
	@RequestMapping(value = "/admin/updatePrice", method = RequestMethod.POST)
	@ResponseBody
	public void updatePrice(@RequestParam(value="mgNum[]") List<Integer> mgNum,
			@RequestParam(value="mgPrice[]") List<Integer> mgPrice) throws Exception {
		List<Integer> mgNum1 = new ArrayList<Integer>();
		List<Integer> mgPrice1 = new ArrayList<Integer>();
		GoodsViewVO vo = new GoodsViewVO();
		mgNum1.addAll(mgNum);
		mgPrice1.addAll(mgPrice);
		for(int i = 0; i < mgNum1.size(); i++) {
			System.out.println("상품NUMBER : " + mgNum1.get(i) + " " + "해당상품가격 : " + mgPrice1.get(i));
			vo.setMgNum(mgNum1.get(i));
			vo.setMgPrice(mgPrice1.get(i));
			goodsService.updatePrice(vo);
		}
	}
	//상품 삭제
	@RequestMapping(value="/admin/productDelete", method=RequestMethod.POST)
	@ResponseBody
	public void productDelete(@RequestParam(value="mgNum[]") List<Integer> mgNum) {
	
		List<Integer> mgNum1 = new ArrayList<Integer>();
		mgNum1.addAll(mgNum);
		for(int i = 0; i < mgNum1.size(); i++) {
			System.out.println("삭제 mgNum : " + mgNum1.get(i));
			goodsService.productDelete(mgNum1.get(i));
		}
	}
	
	// Delivery Info
	@RequestMapping(value = "/admin/delivery")
	public ModelAndView deliveryInfo(@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		ArrayList<OrderVO> orderInfo = (ArrayList<OrderVO>) orderService.orderInfo2(scri);
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderInfo", orderInfo);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(orderService.listCount(scri));
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/deliveryInfo");
		return mv;
	}
	
	// Delivery 처리 (ADMIN)
	@RequestMapping(value = "/admin/updateDeliveryInfo", method = RequestMethod.POST)
	@ResponseBody
	public void updateDeliveryInfo(@RequestParam(value="orderNum[]") List<String> orderNum,
			@RequestParam(value="orderState[]") List<String> orderState) throws Exception {
		List<String> orderNum1 = new ArrayList<String>();
		List<String> orderState1 = new ArrayList<String>();
		OrderVO vo = new OrderVO();
		orderNum1.addAll(orderNum);
		orderState1.addAll(orderState);
		for(int i = 0; i < orderNum1.size(); i++) {
			System.out.println("주문번호 : " + orderNum1.get(i) + " " + " : " + orderState1.get(i));
			vo.setOrderNum(orderNum1.get(i));
			vo.setOrderState(orderState1.get(i));
			orderService.updateDeliveryInfo(vo);
		}
	}
	
	// 매출관리 PAGE 매핑
	@RequestMapping(value = "/admin/chart")
	public ModelAndView chart(ModelAndView mv) throws Exception {
		List<Object> amountRing = new ArrayList<Object>();
		List<Object> amountEarring = new ArrayList<Object>();
		List<Object> amountBracelet = new ArrayList<Object>();
		List<Object> amountNecklace = new ArrayList<Object>();
		OrderVO vo = new OrderVO();
		OrderVO vo2 = new OrderVO();
		OrderVO vo3 = new OrderVO();
		OrderVO vo4 = new OrderVO();
		amountRing.addAll(orderService.amountRing());
		amountEarring.addAll(orderService.amountEarring());
		amountBracelet.addAll(orderService.amountBracelet());
		amountNecklace.addAll(orderService.amountNecklace());
		int ring = 0;
		int earring = 0;
		int bracelet = 0;
		int necklace = 0;
		for (int i = 0; i < amountRing.size(); i++) {
			System.out.println(amountRing.get(i));
			vo = (OrderVO)amountRing.get(i);
			System.out.println(vo.getOrderAmount());
			ring += Integer.parseInt(vo.getOrderAmount());			
		}
		for (int i = 0; i <amountEarring.size(); i++) {
			vo2 = (OrderVO)amountEarring.get(i);
			earring += Integer.parseInt(vo2.getOrderAmount()); 
		}
		for (int i = 0; i < amountBracelet.size(); i++) {
			vo3 = (OrderVO)amountBracelet.get(i);
			bracelet += Integer.parseInt(vo3.getOrderAmount());
		}
		for (int i = 0; i < amountNecklace.size(); i++) {
			vo4 = (OrderVO)amountNecklace.get(i);
			necklace += Integer.parseInt(vo4.getOrderAmount());
		}
		System.out.println("total ring : " + ring);
		int order = orderService.counterOrder();
		int price = orderService.sumPrice();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ring", ring);
		map.put("earring", earring);
		map.put("bracelet", bracelet);
		map.put("necklace", necklace);
		map.put("order", order);
		map.putIfAbsent("price", price);
		mv.addObject("map", map);
		mv.setViewName("/admin/chart");
		return mv;
	}
	

}
