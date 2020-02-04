package com.project.msm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.project.board.service.BoardService;
import com.project.board.service.ReplyService;
import com.project.board.vo.BoardVO;
import com.project.board.vo.PageMaker;
import com.project.board.vo.ReplyVO;
import com.project.board.vo.SearchCriteria;
import com.project.msm.command.BCommand;
import com.project.msm.command.BContentCommand;
import com.project.msm.command.BDeleteCommand;
import com.project.msm.command.BListCommand;
import com.project.msm.command.BModifyCommand;
import com.project.msm.command.BWriteCommand;
import com.project.msm.util.Constant;


@Controller
@RequestMapping("/board/**")
public class BoardController {	
	
	BCommand command =null;
	private JdbcTemplate template;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
			
	@Inject
	BoardService service;	
	
	@Inject
	ReplyService replyService;	
	
	/*
	@Inject
	GoodsService productService;
	*/
	
	
	
	
	
	    //게시판 글 작성 화면 
		@RequestMapping(value="/board/qna/writeView", method = RequestMethod.GET)
		public void writeView(Principal principal,Model model) throws	Exception {
			logger.info("writeView");		
			System.out.println(principal.getName());
			String name= principal.getName();
			model.addAttribute("user", name);
				
		}
		
		//게시판 글 작성
		@RequestMapping(value="/board/write", method = RequestMethod.POST)
		public String write(BoardVO boardVO )throws Exception{
			logger.info("write");			
			service.write(boardVO);			
			return "redirect:/board/qna/qnaList";
		}
		
		//게시물 목록 조회
		@RequestMapping(value="/board/qna/qnaList", method = RequestMethod.GET)
		public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("qnalist");			
			model.addAttribute("list",service.list(scri));	
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker",pageMaker);
			return "/board/qna/qnaList";
		}
		
		//게시물 상세 보기
		@RequestMapping(value="/board/qna/content_view", method= RequestMethod.GET)
		public String content_view(BoardVO boardVO,@ModelAttribute("scri") SearchCriteria scri, Model model,Principal principal) throws Exception{
			logger.info("content_view");	
			
			model.addAttribute("content_view",service.content_view(boardVO.getQid()));		
			model.addAttribute("scri",scri);
			
			System.out.println(principal.getName());
			String name= principal.getName();
			model.addAttribute("user", name);
			
			List<ReplyVO> replyList = replyService.readReply(boardVO.getQid());
			model.addAttribute("replyList",replyList);
			
			return "/board/qna/content_view";
		}
		
		// 게시판 수정뷰
		@RequestMapping(value = "/board/qna/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.content_view(boardVO.getQid()));
			model.addAttribute("scri",scri);
			
			return "/board/qna/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/board/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception{
			logger.info("update");			
			service.update(boardVO);			
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/qna/qnaList";
		}

		// 게시판 삭제
		@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception{
			logger.info("delete");			
			service.delete(boardVO.getQid());		
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/qna/qnaList";
		}
		//댓글 작성
		@RequestMapping(value="/board/qna/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("qid", vo.getQid());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/qna/content_view";
		}
		
		
		
		
		
		@Autowired
		public void setTemplate(JdbcTemplate template) {
			this.template = template;
			Constant.template = this.template;
		}
		
		@RequestMapping("/board/notice/noticeList")
		public String list(Model model) {
			System.out.println("list()");
			command = new BListCommand();
			command.execute(model);
			
			return "/board/notice/noticeList";
		}
		
		@RequestMapping(value = "/board/notice/write", method = RequestMethod.POST)
		public String write(HttpServletRequest request,Model model) {
			System.out.println("write()");
			model.addAttribute("request",request);
			command = new BWriteCommand();
			command.execute(model);			
			return "redirect:/board/notice/noticeList";		
		}
		
		@RequestMapping("/board/notice/boardForm")
		public String boardForm(Model model, Principal principal) {
			System.out.println(principal.getName());
			String name= principal.getName();
			model.addAttribute("user", name);
			return "/board/notice/boardForm";
			
		}
		
		@RequestMapping("/board/notice/faq")
		public String FAQ() {
			return "/notice/faq";
		}
		
		@RequestMapping("delivery")
		public String delivery() {
			return "delivery";
		}
		@RequestMapping("signup")
		public String signup() {
			return "signup";
		}
		
		@RequestMapping(value="/board/notice/content_view", method=RequestMethod.GET)
		public String content_view(HttpServletRequest request,Model model) {
			System.out.println("content_view()");
			
			model.addAttribute("request",request);
			command = new BContentCommand();
			command.execute(model);
			
			return "/board/notice/content_view";
		}
		@RequestMapping(value="/board/notice/delete")
		public String delete(HttpServletRequest request,Model model) {
			System.out.println("Delete()");
			
			model.addAttribute("request",request);
			command = new BDeleteCommand();
			command.execute(model);
			
			return "redirect:/board/notice/noticeList";
		}
		@RequestMapping(value="/board/notice/modify_view")
		public String modify_view(HttpServletRequest request,Model model) {
			System.out.println("modify_view()");
			
			model.addAttribute("request",request);
			command = new BContentCommand();
			command.execute(model);		
			
			return "/board/notice/modify_view";
		}
		
		@RequestMapping(value="/notice/modify")
		public String modify(HttpServletRequest request,Model model) {
			System.out.println("modify()");
			
			model.addAttribute("request",request);
			command = new BModifyCommand();
			command.execute(model);
			
			return "redirect:/board/notice/noticeList";
		}
		
		
		
		
	
	}
		

