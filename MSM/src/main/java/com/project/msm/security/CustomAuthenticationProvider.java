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
// AuthenticationProvider Interface ����� CustomAuthenticationprovider ���� : ������ ó����.
	
	@Autowired
	private UserLoginService userLoginService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public boolean supports (Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
		// true�� �����ؾ� autenticate Method ȣ���Ͽ� �����.
	}
	
	@Override 
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	// autenticate Method�� ȣ��Ǹ�, �Է� �����Ͱ� Autentication Ÿ���� ���·� �Ű������� ����.
	// ID, Password ����� ������ Autentication Interface�� supports �޼��尡 true�� �����ؾ� ��.
		
		System.out.println("AuthenticationProvider method : " + authentication);		
		String userName = authentication.getName();
		String pwd = (String)authentication.getCredentials();
		Object obj = authentication.getPrincipal();
		System.out.println("CustomAuthenticationProvider userName : " + userName);
		System.out.println("CustomAuthenticationProvider pwd : " + pwd);
		System.out.println("CustomAuthenticationProvider obj : " + obj);
		
		//UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; // �α����� ���������� ��´�.
		
		//System.out.println("authToken : " + authToken);
		
		//UserDetails userInfo = userLoginService.loadUserByUsername(authToken.getName()); // UserDetailService���� ���������� �ҷ��´�.
		MemberDTO user = (MemberDTO) userLoginService.loadUserByUsername(userName); // DB���� ��ȸ�� ����� ����
		
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
			System.out.println("�α��� ����");
			authUser = new UsernamePasswordAuthenticationToken(user, pwd, user.getAuthorities());
			System.out.println("provider ====> " + authUser.getPrincipal());
		} else {
			System.out.println("�α��� ����");
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
