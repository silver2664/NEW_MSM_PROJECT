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
import com.project.member.vo.MemberDTO;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{
// AuthenticationProvider Interface ����� CustomAuthenticationprovider ���� : ������ ó����.
	
	@Autowired
	private UserLoginService userLoginService;
	
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
		
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; // �α����� ���������� ��´�.
		
		System.out.println("authToken : " + authToken);
		
		//UserDetails userInfo = userLoginService.loadUserByUsername(authToken.getName()); // UserDetailService���� ���������� �ҷ��´�.
		MemberDTO user = (MemberDTO) userLoginService.loadUserByUsername(authToken.getName()); // DB���� ��ȸ�� ����� ����
		
		System.out.println("userInfo : " + user);
		
		if(user == null) {
			throw new UsernameNotFoundException(authToken.getName());
		}
		
		if(!matchPassword(user.getPassword(), authToken.getCredentials())) {
			throw new BadCredentialsException("Not Matching UserID and UserPassword");
		}
		 
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) user.getAuthorities();
		
		System.out.println("authorities : " + user.getAuthorities());		
		
		authToken = new UsernamePasswordAuthenticationToken(user, null, authorities);
		System.out.println("authToken : " + authToken);
		
		return authToken;
	}
	
	private boolean matchPassword(String password, Object credentials) {
		return password.equals(credentials);
	}

}
