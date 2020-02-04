package com.project.msm.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.board.vo.PageMaker;
import com.project.board.vo.SearchCriteria;
import com.project.member.service.UserService;
import com.project.member.vo.MemberDTO;
import com.project.member.vo.MemberVO;

@Controller // bean �ν��Ͻ� ����
@RequestMapping("/member/*") // Class Level Mapping 'member'�� ������ ��� ��û�� ���� ó��.
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name = "userService")
	UserService userService;
	
	@Autowired	
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/member/step1", method = RequestMethod.GET)
	// Handler Level Mapping : ��û url�� ���� �ش� �޼��尡 ��. (* member/step1�� GET ��û�� ���� ó���� ��. )
	// value : ��û url�� ��û�� ������ �� �޼��尡 ������. method : ��û method ���.
	public void step1() throws Exception {		
		logger.info("signUp step1");
	}
	
	/*
	@RequestMapping("/member/step2")
	public ModelAndView step2(@RequestParam(value="agree", defaultValue="false") Boolean agree) throws Exception {
		logger.info("signUp step2.jsp");
		if(!agree) {
			ModelAndView mv = new ModelAndView("/member/step1");
			return mv;
		}
		ModelAndView mv = new ModelAndView("/member/step2");
		mv.addObject("registerRequest", new RegisterRequest());
		return mv;
	}
	*/
	
	@RequestMapping(value = "/member/step2", method = RequestMethod.POST)
	public ModelAndView step2(@RequestParam(value="agree", defaultValue="false") Boolean agree) throws Exception {
		
		logger.info("signUp step2");
		
		ModelAndView mv = new ModelAndView();
		
		if(!agree) {
			mv.setViewName("/member/step1");
			return mv;
			
		}		
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("/member/step2");
		mv.addObject("random", ran);
		return mv;	
	}
	
	@RequestMapping(value = "/member/step3", method = RequestMethod.POST)
	public ModelAndView step3(ModelAndView mv, MemberVO memberVO) throws Exception {
		logger.info("signUp step3");
		String inputPass = memberVO.getmPw();
		String mPw = passwordEncoder.encode(inputPass);
		memberVO.setmPw(mPw);
		userService.insertUser2(memberVO);
		mv.setViewName("redirect:/home");
		return mv;
	}
	
	@RequestMapping(value = "/member/idCheck")	
	public @ResponseBody int idCheck(String mId) throws Exception {
		
		logger.info("controller idCheck");		
		int cnt = userService.idCheck2(mId);
		System.out.println("Controller Cnt : " + cnt);
		return cnt;
	}	
	
	@RequestMapping(value="/member/email", method = RequestMethod.GET)
	public @ResponseBody boolean createEmailCheck(@RequestParam String Email, @RequestParam int random, HttpServletRequest request) {
		logger.info("�̸��Ϲ߼�");
		System.out.println("RanCode : " + random);
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(random);
		System.out.println("AuthCode : " + authCode);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = ("MSM ���� �ڵ� �߱� �ȳ��Դϴ�.");
		StringBuilder sb = new StringBuilder();
		sb.append("ȸ������ ���� �ڵ�� " + authCode + "�Դϴ�.");		
		return userService.send(subject, sb.toString(), "msmproject2020", Email, null);
	}
	
	@RequestMapping(value = "/member/emailAuth")
	public @ResponseBody ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam int random, HttpSession session){
		logger.info("�̸�������");
		String originalJoinCode = authCode;
		String originalRandom = Integer.toString(random);	
		System.out.println("�����Է������ڵ� : " + originalJoinCode + "�����ڵ� : " + originalRandom);
		if(originalJoinCode.equals(originalRandom)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/member/loginForm")
	public String loginForm() throws Exception {
		logger.info("Login Form Connect!");
		return "/member/loginForm";
	}
	
	/*
	@RequestMapping(value = "/member/step3", method=RequestMethod.POST)
	public ModelAndView step3(RegisterRequest regReq, Errors errors) throws Exception {
		
		new RegisterRequestValidator().validate(regReq, errors);
		ModelAndView mv = new ModelAndView();
		
		if(errors.hasErrors()) {
			mv.setViewName("/member/step2");
			return mv;
		}
		
		try {
			userService.insertUser(regReq);
		}
		catch (AlreadyExistingEmailException e) {
			errors.rejectValue("mEmail", "duplicate", "�̹� ���Ե� �̸����Դϴ�.");
			mv.setViewName("/member/step2");
			return mv;
		}
		catch (AlreadyExistingIdException e) {
			errors.rejectValue("mId", "duplicate", "�̹� ���Ե� ID�Դϴ�.");
			mv.setViewName("/member/step2");
			return mv;
		}
		mv.setViewName("/member/step3");
		return mv;
	}
	*/
	
	// ȸ����� ��ȸ.
	@RequestMapping(value = "/member/memberList")
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
	
	// ȸ�������󼼺���.
	@RequestMapping(value = "/member/memberDetail")
	public ModelAndView memberDetail(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, ModelAndView mv) throws Exception {
		mv.addObject("memberDetail", userService.memberDetail(memberVO.getmId()));
		mv.addObject("scri", scri);
		mv.setViewName("/member/memberDetail");
		return mv;
	}
	
	// ȸ����������VIEW.
	@RequestMapping(value = "/member/updateView", method = RequestMethod.GET)
	public String updateView(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("update", userService.memberDetail(memberVO.getmId()));
		model.addAttribute("scri", scri);
		int ran = new Random().nextInt(900000) + 100000;
		model.addAttribute("random", ran);
		
		return "/member/updateView";
	}
	
	// ȸ����������
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String update(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		logger.info("update MemberInfo");
		
		userService.update(memberVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/member/updateAuth", method = RequestMethod.POST)
	public String updateAuth(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		logger.info("update MemberAuth");
		
		userService.updateAuth(memberVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/home";
	}
	
}
