package com.project.msm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.vo.PageMaker;
import com.project.board.vo.SearchCriteria;
import com.project.member.service.UserService;
import com.project.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminCotroller {
	
	
	@Inject
	UserService userService;
	
	// 관리자 페이지 이동. (Admin.jsp)
	@RequestMapping(value = "/admin/admin")
	public ModelAndView adminPage(@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)userService.getMemberList(scri);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberList", memberList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(userService.listCount(scri));
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/admin");		
		return mv;		
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
	public Map<String, Object> updateAuth(@RequestBody Map<String, Object> map) throws Exception {
		System.out.println(map);
		System.out.println("userId : " + map.get("mId"));
		System.out.println("authority : " + map.get("authority"));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		map.put("AA", "1");
		return resultMap;
	}
	

}
