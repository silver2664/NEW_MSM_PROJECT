package com.project.member.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.stereotype.Service;

import com.project.member.dao.UserLoginDAO;
import com.project.member.vo.MemberVO;

@Service
public class UserLoginService implements UserDetailsService {
	
	@Autowired
	private UserLoginDAO dao;
	
		
	
	@Override
	public UserDetails loadUserByUsername(String mId) throws UsernameNotFoundException {
		System.out.println("UserLoginService mId : " + mId);
		
		MemberVO vo = dao.getUserById(mId);
		GrantedAuthority authority = new SimpleGrantedAuthority(vo.getAuthority());
		UserDetails userDetails = (UserDetails)new User(vo.getUsername(), vo.getmPw(), Arrays.asList(authority));
		System.out.println("Password : " + vo.getmPw());
		
		return userDetails;
	} 

}
