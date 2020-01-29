package com.project.board.vo;

import java.util.Date;

//Q&A DBÄÃ·³
public class BoardVO {
	private int qid;
	private String qtitle;
	private Date qdate;
	private String qcontent;
	private String qreply;
	private String qpw;
	private String mid;
	private String qwriter;
	private int qview;
	
	public int getQview() {
		return qview;
	}
	public void setQview(int qview) {
		this.qview = qview;
	}
	public String getQwriter() {
		return qwriter;
	}
	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQreply() {
		return qreply;
	}
	public void setQreply(String qreply) {
		this.qreply = qreply;
	}
	public String getQpw() {
		return qpw;
	}
	public void setQpw(String qpw) {
		this.qpw = qpw;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	
	
	
}
