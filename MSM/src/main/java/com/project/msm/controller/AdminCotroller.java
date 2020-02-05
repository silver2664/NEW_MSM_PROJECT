package com.project.msm.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
			mv.setViewName("/member/memberList");
			return mv;
		}

}
