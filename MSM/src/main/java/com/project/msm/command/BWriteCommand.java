package com.project.msm.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.msm.dao.BDao;

public class BWriteCommand implements BCommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String btitle = request.getParameter("btitle");
		String mid = request.getParameter("mid");
		String bcontent = request.getParameter("bcontent");
		
		BDao dao = new BDao();
		dao.write(btitle,mid,bcontent);
		
	}

}
