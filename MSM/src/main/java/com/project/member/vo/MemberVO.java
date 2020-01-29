package com.project.member.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class MemberVO implements UserDetails {
	
	/* Oracle DB Member TABLE
	
	CREATE  TABLE MSM_MEMBER(
    MID VARCHAR2(20) NOT NULL,
    MPW VARCHAR2(100) NOT NULL,
    MNAME VARCHAR2(50) NOT NULL,
    MEMAIL VARCHAR2(100) NOT NULL,
    MPHONE VARCHAR2(20),
    MZIP_CODE VARCHAR2(10),
    M_FIRST_ADDR VARCHAR2(200),
    M_SECOND_ADDR VARCHAR2(200),
    AUTHORITY VARCHAR2(50) DEFAULT 'ROLE_USER' NOT NULL,
    ENABLED NUMBER(3) DEFAULT 1,
    REGDATE DATE FEFAULT SYSDATE,
    CONSTRAINT PK_MSM_MEMBER PRIMARY KEY (MID)    
	); 
	 
	*/
	
	private static final long serialVersionUID = 6581852293808906741L;
	
	private String mId;
	private String mPw;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String mZip_Code;
	private String mFirst_Addr;
	private String mSecond_Addr;
	private String authority;
	private boolean enabled;
	private Date regDate;
	
	@Override
	public Collection <? extends GrantedAuthority> getAuthorities(){
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(authority));
		return auth;
	}
	
	@Override
	public String getPassword() {
		return this.mPw;
	}
	
	@Override
	public String getUsername() {
		return this.mId;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmZip_Code() {
		return mZip_Code;
	}

	public void setmZip_Code(String mZip_Code) {
		this.mZip_Code = mZip_Code;
	}

	public String getmFirst_Addr() {
		return mFirst_Addr;
	}

	public void setmFirst_Addr(String mFirst_Addr) {
		this.mFirst_Addr = mFirst_Addr;
	}

	public String getmSecond_Addr() {
		return mSecond_Addr;
	}

	public void setmSecond_Addr(String mSecond_Addr) {
		this.mSecond_Addr = mSecond_Addr;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
