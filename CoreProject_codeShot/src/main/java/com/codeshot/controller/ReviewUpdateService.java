package com.codeshot.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.ReviewDAO;
import com.codeshot.model.ReviewDTO;
import com.codeshot.model.UserDAO;
import com.codeshot.model.UserDTO;

public class ReviewUpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		System.out.println("[리뷰 수정]");	
		
		
		BigDecimal review_starrating = new BigDecimal(request.getParameter("review_starrating"));
		String review_content = request.getParameter("review_starrating");
		
//		ReviewDTO dto = new ReviewDTO(review_starrating, review_content);
//		int row = new ReviewDAO().updateReview(dto);
//		
//		
		
		
		return "ReviewList.jsp";
	}

}
