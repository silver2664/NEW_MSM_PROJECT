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
	
	//�α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "/member/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(Model model, HttpSession session) throws Exception {
		/*���̹� ���̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("���̹� : " + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "/member/loginForm";
	}
	
	//���̹� �α��� ���� �� callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/naverLoginSuccess", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("Naver Login CallBack");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//01. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String ������ JSON ������
		
		/** apiResult json ����
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//02. String ������ apiResult�� json���·� �ٲ�
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//03. ������ �Ľ�
		//Top���� �ܰ� _response �Ľ�
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response�� nickname�� �Ľ�
		String nickname = (String)response_obj.get("nickname");
		
		System.out.println("�������Ľ� : " + nickname);
		
		//04. �Ľ� �г��� �������� ����
		session.setAttribute("sessionId", nickname);
		model.addAttribute("result", apiResult);
		
		return "redirect:/home";
	}
	
	//�α׾ƿ�
	@RequestMapping(value = "/apiLogout", method = {RequestMethod.GET, RequestMethod.POST})
	public String apiLogout(HttpSession session) throws IOException {
		System.out.println("API LOGOUT");
		session.invalidate();
		
		return "redirect:/home";
	}

}
