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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.project.board.vo.SearchCriteria;
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
	
	// 회원가입 STEP1 (이용약관 페이지) 이동
	@RequestMapping(value = "/member/step1", method = RequestMethod.GET)
	// Handler Level Mapping : 요청 url에 대해 해당 메서드가 함. (* member/step1의 GET 요청에 대한 처리를 함. )
	// value : 요청 url로 요청이 들어오면 이 메서드가 수행함. method : 요청 method 명시.
	public void step1() throws Exception {		
		logger.info("signUp step1");
	}
	
	// 회원가입 STEP2 (EMAIL인증코드생성)
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
	
	// 회원가입 완료(STEP3)
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
	
	// 회원가입 시 ID 중복체크
	@RequestMapping(value = "/member/idCheck")	
	public @ResponseBody int idCheck(String mId) throws Exception {
		
		logger.info("controller idCheck");		
		int cnt = userService.idCheck2(mId);
		System.out.println("Controller Cnt : " + cnt);
		return cnt;
	}	
	
	//Email 인증메일 발송
	@RequestMapping(value="/member/email", method = RequestMethod.GET)
	public @ResponseBody boolean createEmailCheck(@RequestParam String Email, @RequestParam int random, HttpServletRequest request) {
		logger.info("이메일발송");
		System.out.println("RanCode : " + random);
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(random);
		System.out.println("AuthCode : " + authCode);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = ("MSM 인증 코드 발급 안내입니다.");
		StringBuilder sb = new StringBuilder();
		sb.append("회원님의 인증 코드는 " + authCode + "입니다.");		
		return userService.send(subject, sb.toString(), "msmproject2020", Email, null);
	}
	
	//Email 인증코드 확인
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
	
	// 회원정보상세보기.
	@RequestMapping(value = "/member/memberDetail")
	public ModelAndView memberDetail(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, ModelAndView mv) throws Exception {
		mv.addObject("memberDetail", userService.memberDetail(memberVO.getmId()));
		mv.addObject("scri", scri);
		mv.setViewName("/member/memberDetail");
		return mv;
	}
	
	// 회원정보수정VIEW.
	@RequestMapping(value = "/member/updateView", method = RequestMethod.GET)
	public String updateView(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("update", userService.memberDetail(memberVO.getmId()));
		model.addAttribute("scri", scri);
		int ran = new Random().nextInt(900000) + 100000;
		model.addAttribute("random", ran);
		
		return "/member/updateView";
	}
	
	// 회원정보수정
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
	
	// 회원 비밀번호 변경 시, 기존 비밀번호와 비교
	@RequestMapping(value = "/member/pwCheck")	
	public @ResponseBody int pwCheck(@RequestParam String mPw, @RequestParam String originalPw) throws Exception {
		
		logger.info("controller pwCheck");
		
		System.out.println("mPw : " + mPw);
		System.out.println("originalPw : " +originalPw);
		boolean state = passwordEncoder.matches(originalPw, mPw);
		System.out.println(state);
		if(state) {
			return 1;
		} else {
			return 0;
		}		
	}
	
	// 회원 비밀번호 변경하기.
	@RequestMapping(value = "/member/updatePw", method = RequestMethod.POST)
	public @ResponseBody void updatePw(MemberVO memberVO, @RequestParam String mPw3) throws Exception {
		
		logger.info("update MemberPassWord");
		System.out.println(mPw3);
		String mPw = passwordEncoder.encode(mPw3);
		memberVO.setmPw(mPw);
		userService.updatePw(memberVO);
		
	}
	
	// 회원 인증 EMAIL 확인하기
	@RequestMapping(value = "/member/emailCheck")	
	public @ResponseBody int emailCheck(@RequestParam String mEmail, @RequestParam String mId) throws Exception {
		
		logger.info("controller emailCheck");
		System.out.println("input Email : " + mEmail);
		String email = userService.checkEmail(mId);
		System.out.println("Controller email : " + email);
		if(mEmail.equals(email)) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 임시 비밀번호 발송
	@RequestMapping(value="/member/sendEmail", method = RequestMethod.GET)
	public @ResponseBody boolean createEmailCheck2(@RequestParam String mEmail, @RequestParam String mId, HttpServletRequest request, MemberVO memberVO) throws Exception {
		logger.info("이메일발송");
		int ran = new Random().nextInt(900000) + 100000; // 임시비밀번호랜덤숫자생성.
		System.out.println("RanCode : " + ran);
		String mPw = Integer.toString(ran);
		mPw = passwordEncoder.encode(mPw);
		memberVO.setmId(mId);
		memberVO.setmPw(mPw);
		userService.updatePw(memberVO); // 랜덤숫자암호화하여 업데이트
		String authCode = String.valueOf(ran);
		System.out.println("AuthCode : " + authCode);
		String subject = ("MSM 임시비밀번호 안내입니다.");
		StringBuilder sb = new StringBuilder();
		sb.append(mId + "님의 임시비밀번호는 " + authCode + "입니다.");		
		return userService.send(subject, sb.toString(), "msmproject2020", mEmail, null);
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public void delete(@RequestParam String mId, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
		logger.info("회원탈퇴");
		
		userService.delete(mId);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
	}
	
}
