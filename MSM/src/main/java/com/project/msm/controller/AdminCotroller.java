package com.project.msm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "/admin/admin", method = {RequestMethod.GET, RequestMethod.POST})
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
	public int updateAuth(HttpSession session, @RequestParam(value="id[]") List<String> tdArr, 
			@RequestParam(value="auth[]") List<String> tdArr2, MemberVO vo) throws Exception {
		
		System.out.println("Admin Controller");
		System.out.println(tdArr);
		System.out.println(tdArr2);
		MemberVO member = new MemberVO();
		for(String i : tdArr) {
			for(String k : tdArr2) {
				member.setmId(i);
				member.setAuthority(k);
				System.out.println("mId = " + member.getmId() + "//" + "authority = " + member.getAuthority());
				userService.updateAuth(member);
			}
		}
		return 0;
		/*
		System.out.println(map.values());
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("mId", map.get("mId"));
		resultMap.put("authority", map.get("authority"));
		list.add(resultMap);
		*/
		
		/*
		System.out.println(map);
		System.out.println("mId : " + map.get("mId"));
		System.out.println("authority : " + map.get("authority"));
		
		
		
		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(data);
		*/
		
		/*
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()) {
			String key = keyIterator.next();
			String mId = map.get(key).toString(); 
			System.out.println("key : " + key + " " + "value : " + mId);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.putAll(map);
		System.out.println("resultMap : " + resultMap);
		
		resultMap.put("mId", map.get("mId"));
		resultMap.put("authority", map.get("authority"));
		System.out.println("resultMap2 : " + resultMap);
		*/
		
		//userService.updateAuth(resultMap);
		
		//MemberVO memberVO = new MemberVO();
		//memberVO.setmId(resultMap.get("mId").toString());
		//memberVO.setAuthority(resultMap.get("authority").toString());
		//userService.updateAuth(memberVO);
		/*
		System.out.println(map);
		System.out.println("userId : " + map.get("mId"));
		System.out.println("authority : " + map.get("authority"));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		for(int i = 0; i<resultMap.size(); i++) {
			MemberVO vo = new MemberVO();
			vo.setmId((String)map.get("mId"));
		}
		resultMap.put("mId", map.get("mId"));
		resultMap.put("authority", map.get("authority"));
		System.out.println(resultMap.size());
		userService.updateAuth((HashMap<String, Object>) resultMap);
		*/
	}
	

}
