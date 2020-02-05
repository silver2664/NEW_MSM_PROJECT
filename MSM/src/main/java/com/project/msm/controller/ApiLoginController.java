package com.project.msm.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.naverLogin.NaverLoginBO;

@Controller
public class ApiLoginController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/member/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(Model model, HttpSession session) throws Exception {
		/*네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버 : " + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "/member/loginForm";
	}
	
	//네이버 로그인 성공 시 callback호출 메소드
	@RequestMapping("callback")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("Naver Login CallBack");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//01. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String 형식의 JSON 데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//02. String 형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//03. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		
		System.out.println("데이터파싱 : " + nickname);
		
		//04. 파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname);
		model.addAttribute("result", apiResult);
		
		return "/apiLogin";
	}
	
	//로그아웃
	@RequestMapping(value = "/apiLogout", method = {RequestMethod.GET, RequestMethod.POST})
	public String apiLogout(HttpSession session) throws IOException {
		System.out.println("API LOGOUT");
		session.invalidate();
		
		return "redirect:/home";
	}

}
