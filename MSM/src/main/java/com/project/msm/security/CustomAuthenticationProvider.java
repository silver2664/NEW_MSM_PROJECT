package com.project.msm.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.project.member.service.UserLoginService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Override 
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		System.out.println("AuthenticationProvider method");
		
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; // 로그인한 유저정보를 담는다.
		
		UserDetails userInfo = userLoginService.loadUserByUsername(authToken.getName()); // UserDetailService에서 유저정보를 불러온다.
				
		if(userInfo == null) {
			throw new UsernameNotFoundException(authToken.getName());
		}
		
		if(!matchPassword(userInfo.getPassword(), authToken.getCredentials())) {
			throw new BadCredentialsException("Not Matching UserID and UserPassword");
		}
		 
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();
		
		return new UsernamePasswordAuthenticationToken(userInfo, null, authorities);
	}
	
	private boolean matchPassword(String password, Object credentials) {
		return password.equals(credentials);
	}
	
	@Override
	public boolean supports (Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
