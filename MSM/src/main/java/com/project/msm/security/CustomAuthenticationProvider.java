package com.project.msm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.project.member.service.UserLoginService;
import com.project.member.vo.MemberDTO;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{
// AuthenticationProvider Interface 상속한 CustomAuthenticationprovider 생성 : 인증을 처리함.
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public boolean supports (Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
		// true를 리턴해야 autenticate Method 호출하여 진행됨.
	}
	
	@Override 
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	// autenticate Method가 호출되면, 입력 데이터가 Autentication 타입의 형태로 매개변수로 전달.
	// ID, Password 방식의 인증은 Autentication Interface의 supports 메서드가 true를 리턴해야 함.
		
		System.out.println("AuthenticationProvider method : " + authentication);		
		String userName = authentication.getName();
		String pwd = (String)authentication.getCredentials();
		Object obj = authentication.getPrincipal();
		System.out.println("CustomAuthenticationProvider userName : " + userName);
		System.out.println("CustomAuthenticationProvider pwd : " + pwd);
		System.out.println("CustomAuthenticationProvider obj : " + obj);
		
		//UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; // 로그인한 유저정보를 담는다.
		
		//System.out.println("authToken : " + authToken);
		
		//UserDetails userInfo = userLoginService.loadUserByUsername(authToken.getName()); // UserDetailService에서 유저정보를 불러온다.
		MemberDTO user = (MemberDTO) userLoginService.loadUserByUsername(userName); // DB에서 조회한 결과를 저장
		
		System.out.println("userInfo : " + user);
		
		if(user == null) {
			throw new UsernameNotFoundException(userName);
		}
		
		/*
		if(!matchPassword(user.getPassword(), authToken.getCredentials())) {
			throw new BadCredentialsException("Not Matching UserID and UserPassword");
		}
		*/
		
		boolean state = passwordEncoder.matches(pwd, user.getPassword());
		System.out.println(state);
		
		UsernamePasswordAuthenticationToken authUser = null;
		
		if(state) {
			System.out.println("로그인 성공");
			authUser = new UsernamePasswordAuthenticationToken(user, pwd, user.getAuthorities());
			System.out.println("provider ====> " + authUser.getPrincipal());
		} else {
			System.out.println("로그인 실패");
		}
		
		return authUser;
		
		/* 
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) user.getAuthorities();
		
		System.out.println("authorities : " + user.getAuthorities());		
		
		authToken = new UsernamePasswordAuthenticationToken(user, null, authorities);
		System.out.println("authToken : " + authToken);
		
		return authToken;
		*/
	}
	
	/*
	private boolean matchPassword(String password, Object credentials) {
		return password.equals(credentials);
	}
	*/
}
