package com.project.member.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.stereotype.Service;

import com.project.member.dao.UserLoginDAO;
import com.project.member.vo.MemberAuthorityDTO;
import com.project.member.vo.MemberDTO;
import com.project.member.vo.MemberVO;

@Service
public class UserLoginService implements UserDetailsService {
	
	@Autowired
	private UserLoginDAO dao;	
	
	@Override
	public UserDetails loadUserByUsername(String mId) throws UsernameNotFoundException {
		System.out.println("UserLoginService mId : " + mId);
		//로그인 사용자 조회		
		MemberVO vo = dao.getUserById(mId);
		System.out.println("UserLoginService vo :" + vo);
		UserDetails loginUser = null;
		
		List<MemberAuthorityDTO> authorityList = dao.getUserAuthority(mId);
		System.out.println("LoginService authorityList : " + authorityList);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for(int i = 0; i < authorityList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authorityList.get(i).getAuthority()));
		}
		System.out.println("UserLoginService authority : " + authorities);
		
		loginUser = new MemberDTO(authorities, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmPhone(), vo.getmZip_Code()
				, vo.getmFirst_Addr(), vo.getmSecond_Addr(), vo.isEnabled(), vo.getRegDate());
		
		System.out.println("loginUser : " + authorities + loginUser);
		
		return loginUser;
	} 

}
