package com.project.msm.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.msm.dao.BDaoTemplate;
import com.project.msm.dto.UserDto;
import com.project.msm.util.Constant;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("customuserdetailsservice connect" + " " + username);
		BDaoTemplate dao = Constant.dao;
		UserDto dto = dao.login(username);
		if(dto == null) {
			System.out.println("dto null..");
			throw new UsernameNotFoundException("No user found with username");
		}
		else {
			System.out.println("Create dto");
		}
		String pw = dto.getmPw();
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		UserDetails user = new User(username, pw, roles);
		System.out.println("userdetail 按眉 积己 饶 府畔");
		
		return user;
	}
	
}
