package com.project.msm.controller;

import java.util.ArrayList;
import java.util.List;

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

@Controller
@RequestMapping(value = "/admin/*")
public class AdminCotroller {
	
	
	@Inject
	UserService userService;
	
	@Inject
	GoodsService goodsService;
	
	// ������ ������ �̵�. (Admin.jsp)
	@RequestMapping(value = "/admin/admin", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminPage(@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		//������ ȸ�� ����
		ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)userService.getMemberList(scri);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(userService.listCount(scri));
		mv.addObject("pageMaker", pageMaker);
		
		//������ ��ǰ ����
		ArrayList<GoodsViewVO> goodsList = (ArrayList<GoodsViewVO>)goodsService.getGoodsList(scri);
		mv.addObject("goodsList", goodsList);
		PageMaker pageMaker2 = new PageMaker();
		pageMaker2.setCri(scri);
		pageMaker2.setTotalCount(goodsService.listCount(scri));
		mv.addObject("pageMaker2", pageMaker2);		
		
		mv.setViewName("/admin/admin");		
		return mv;		
	}
		
	// ȸ����� ��ȸ.
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
	
	// ȸ�� ���� ����
	@RequestMapping(value = "/admin/updateAuth", method = RequestMethod.POST)
	@ResponseBody
	public void updateAuth(HttpSession session, @RequestParam(value="id[]") List<String> tdArr, 
			@RequestParam(value="auth[]") List<String> tdArr2) throws Exception {
		
		// admin page���� �޾ƿ� ���̵�� ���� ��������� ArrayList�� ����
		List<String> mId = new ArrayList<String>();
		mId.addAll(tdArr);
		
		List<String> authority = new ArrayList<String>();
		authority.addAll(tdArr2);
		
		MemberVO vo = new MemberVO();		
		
		for(int i = 0; i < mId.size(); i++) {
			System.out.println("���Ѻ���ID : " + mId.get(i) + "  ����Ǵ±��� : " + authority.get(i));
			vo.setmId(mId.get(i));
			vo.setAuthority(authority.get(i));
			userService.updateAuth(vo);
		}
	}
	
	// ��ǰ��� ��ȸ.
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
	
	//��ǰ ����
	@RequestMapping(value="/admin/productDelete", method=RequestMethod.POST)
	@ResponseBody
	public void productDelete(@RequestParam(value="mgNum[]") List<Integer> mgNum) {
	
		List<Integer> mgNum1 = new ArrayList<Integer>();
		mgNum1.addAll(mgNum);
		for(int i = 0; i < mgNum1.size(); i++) {
			System.out.println("���� mgNum : " + mgNum1.get(i));
			goodsService.productDelete(mgNum1.get(i));
		}
	}
	

}
