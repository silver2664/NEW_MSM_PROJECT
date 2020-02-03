package com.project.member.vo;

public class MemberAuthorityDTO {
	
	private String mId;
	private String authority;
	
	public MemberAuthorityDTO () {
		
	}
	
	public MemberAuthorityDTO (String mId, String authority) {
		super();
		this.mId = mId;
		this.authority = authority;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return "MemberAuthorityDTO [id=" + mId + "authority=" + authority + "]";
	}

}
