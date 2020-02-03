package com.project.member.vo;

import java.sql.Date;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MemberDTO extends User {
	
	private static final long serialVersionUID = 6581852293808906741L;
	
	private String mId;
	private String mPw;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String mZip_Code;
	private String mFirst_Addr;
	private String mSecond_Addr;
	private boolean enabled;
	private Date regDate;
	private String authority;
	
		
	public MemberDTO (String mId, String mPw, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(mId, mPw, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	public MemberDTO (Collection<? extends GrantedAuthority> authorities, String mId, String mPw, String mName, String mEmail, String mPhone,
			String mZip_Code, String mFirst_Addr, String mSecond_Addr, boolean enabled, Date regDate, String authority) {
		super(mId, mPw, authorities);
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mZip_Code = mZip_Code;
		this.mFirst_Addr = mFirst_Addr;
		this.mSecond_Addr = mSecond_Addr;
		this.enabled = enabled;
		this.regDate = regDate;
		this.authority = authority;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mId=" + mId + ",mPw=" + mPw + ",mName=" + mName + ",mEmail=" + mEmail + ",mPhone=" + mPhone + ",mZip_Code=" + mZip_Code +
				",mFirst_Addr=" + mFirst_Addr + ",mSecond_Addr=" + mSecond_Addr + ",enabled=" + enabled + ",regDate=" + regDate + ",authority=" + authority + "]"; 
	}
	
	

}
