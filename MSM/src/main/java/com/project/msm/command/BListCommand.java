package com.project.msm.command;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.project.msm.dao.BDao;
import com.project.msm.dto.BDto;

public class BListCommand implements BCommand {

	@Override
	public void execute(Model model) {
		BDao dao = new BDao();
		ArrayList<BDto> dtos = dao.list();
		model.addAttribute("list",dtos);

	}

}
