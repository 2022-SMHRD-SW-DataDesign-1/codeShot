package com.codeshot.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.PortfolioDAO;
import com.codeshot.model.PortfolioDTO;
import com.codeshot.model.PostDAO;
import com.codeshot.model.PostDTO;

public class PortfolioDeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BigDecimal pfNum = new BigDecimal(request.getParameter("pf_num"));
		PortfolioDTO portfolio = new PortfolioDAO().showPortfolioOne(pfNum);
		
		String savePath = request.getServletContext().getRealPath("file");
		System.out.println(savePath);
		
		if(portfolio.getPf_file()!= null) {
			new File(savePath+"/"+portfolio.getPf_file()).delete();
		}
		
		int row = new PortfolioDAO().deletePortfolio(pfNum);
		
		if(row>0) {
			System.out.println("포트폴리오 삭제 성공");
		}else {			
			System.out.println("포트폴리오 삭제 실패");
		}
		
		return "PortfolioWrite.jsp";
		
	}

}
