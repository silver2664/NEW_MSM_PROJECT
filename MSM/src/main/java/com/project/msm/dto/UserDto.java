package com.project.msm.dto;

public class UserDto {
	
	private String mId;
	private String mPw;
	private String mEmail;
	
	public UserDto () {
		
	}
	
	public UserDto(String mId, String mPw, String mEmail) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mEmail = mEmail;
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
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	
	

}
