package com.project.member.service;


import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.board.vo.SearchCriteria;
import com.project.member.dao.UserDAO;
import com.project.member.vo.MemberVO;
import com.project.msm.exception.AlreadyExistingEmailException;
import com.project.msm.exception.AlreadyExistingIdException;
import com.project.msm.util.RegisterRequest;

@Service("userService")
public class UserServiceImpl implements UserService {	
	
	@Resource(name="userDAO")
	private UserDAO userDAO;

	@Override
	public void insertUser(RegisterRequest regReq) throws Exception {
		
		MemberVO mEmail = userDAO.selectByEmail(regReq.getmEmail());
		
		if(mEmail != null) {
			throw new AlreadyExistingEmailException(regReq.getmEmail() + "is duplicate email.");
		}
		
		MemberVO mId = userDAO.selectById(regReq.getmId());
		
		if(mId != null) {
			throw new AlreadyExistingIdException(regReq.getmId() + "is duplicate email.");
		}
		
		userDAO.insertUser(regReq);
		
	}
	
	@Override
	public void insertUser2(MemberVO memberVO) throws Exception {
		userDAO.insertUser2(memberVO);
	}
	
	/*
	@Override
	public int idCheck(Map<String, Object> map) throws Exception {
		System.out.println("Service idCheck");
		return userDAO.idCheck(map);
		
	}
	*/
	
	@Override
	public int idCheck2(String mId) throws Exception {		
		System.out.println("idCheck2 method(service) mId : " + mId);
		int result = userDAO.idCheck2(mId);
		return result;
	}
	
	// 인증메일 전송 구현
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		//javax.mail.internet.MimeMessage
		MimeMessage message = javaMailSender.createMimeMessage();
		
		
		try {
			//org.springframework.mail.javamail.MimeMessageHelper
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			
			//첨부파일 처리
			if(filePath != null) {
				File file = new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			
			// 첨부 파일 처리 다른방법(이건 확인함)
			// FileSystemResource file = new FileSystemResource(new File("D:/load.gif"));
			// helper.addAttachment("load.gif", file);
			
			
			// 메일에 이미지 심어서 보낸는 방법(한글파일은 안됨)
			// String contents = text + "<br><br><img src=\"cid:emailPic.png \">";
			// helper.setText(contents, true);
			// FileSystemResource file = new FileSystemResource(new File("D:/emailPic.png"));
			// helper.addInline("emailPic.png", file);
			
			javaMailSender.send(message);
			
			return true;
		}
		catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return false;
			
	}
	
	// 6. 전체 회원 조회
		public List<MemberVO> getMemberList(SearchCriteria scri) throws Exception{
			return userDAO.getMemberList(scri);
		}
		
	// 7. 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception {
		return userDAO.listCount(scri);
	}
	
	// 8. 회원 상세 보기
	public MemberVO memberDetail(String mId) throws Exception {
		return userDAO.memberDetail(mId);
	}
	
	// 9. 회원정보 수정
	public void update(MemberVO memberVO) throws Exception {
		userDAO.update(memberVO);
	}
	
	//10. 회원권한 변경
	public void updateAuth(MemberVO vo) throws Exception{
		
		//System.out.println("updateAuth SERVICE : " + vo.getAuthority() + " " + vo.getmId());
		userDAO.updateAuth(vo);
	}
	
	//11. 회원비밀번호 변경
	public void updatePw(MemberVO memberVO) throws Exception {
		userDAO.updatePw(memberVO);
	}
	
	//12. 유저 이메일 셀렉.
	public String checkEmail(String mId) throws Exception {
		return userDAO.emailCheck(mId);
	}
	
	//13. 아이디, 권한 select
	public List<HashMap<String, Object>> selectIdAuth() throws Exception {
		return userDAO.selectIdAuth();
	}
	
	//14. member 탈퇴
	public void delete(String mId) throws Exception {
		userDAO.delete(mId);
	}
	
	
	

}
