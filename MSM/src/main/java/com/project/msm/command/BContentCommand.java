package com.project.msm.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.msm.dao.BDao;
import com.project.msm.dto.BDto;

public class BContentCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String bid = request.getParameter("bid");
		
		BDao dao = new BDao();
		BDto dto = dao.contentView(bid);
		
		
		model.addAttribute("content_view",dto);

	}

}
