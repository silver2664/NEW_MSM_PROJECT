package com.project.board.vo;

import java.util.Date;

public class ReplyVO {
	
	private int qid;
	private int rid;
	private String content;
	private String writer;
	private Date rdate;
	
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [qid=" + qid + ", rid=" + rid + ", content=" + content + ", writer=" + writer + ", rdate="
				+ rdate + "]";
	}
	
	
	

}
