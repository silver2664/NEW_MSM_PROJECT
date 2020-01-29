package com.project.msm.controller;


import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.service.UserService;
import com.project.member.vo.MemberVO;

@Controller // bean 인스턴스 생성
@RequestMapping("/member/*") // Class Level Mapping 'member'로 들어오는 모든 요청에 대한 처리.
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name = "userService")
	UserService userService;
	
	@Autowired	
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/member/step1", method = RequestMethod.GET)
	// Handler Level Mapping : 요청 url에 대해 해당 메서드가 함. (* member/step1의 GET 요청에 대한 처리를 함. )
	// value : 요청 url로 요청이 들어오면 이 메서드가 수행함. method : 요청 method 명시.
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
		logger.info("이메일발송");
		System.out.println("RanCode : " + random);
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(random);
		System.out.println("AuthCode : " + authCode);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = ("회원가입 인증 코드 발급 안내입니다.");
		StringBuilder sb = new StringBuilder();
		sb.append("회원님의 인증 코드는 " + authCode + "입니다.");		
		return userService.send(subject, sb.toString(), "msmproject2020", Email, null);
	}
	
	@RequestMapping(value = "/member/emailAuth")
	public @ResponseBody ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam int random, HttpSession session){
		logger.info("이메일인증");
		String originalJoinCode = authCode;
		String originalRandom = Integer.toString(random);	
		System.out.println("유저입력인증코드 : " + originalJoinCode + "인증코드 : " + originalRandom);
		if(originalJoinCode.equals(originalRandom)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
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
			errors.rejectValue("mEmail", "duplicate", "이미 가입된 이메일입니다.");
			mv.setViewName("/member/step2");
			return mv;
		}
		catch (AlreadyExistingIdException e) {
			errors.rejectValue("mId", "duplicate", "이미 가입된 ID입니다.");
			mv.setViewName("/member/step2");
			return mv;
		}
		mv.setViewName("/member/step3");
		return mv;
	}
	*/
}
