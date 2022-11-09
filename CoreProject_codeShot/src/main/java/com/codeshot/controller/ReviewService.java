package com.codeshot.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.ReviewDAO;
import com.codeshot.model.ReviewDTO;
import com.codeshot.model.UserDTO;

public class ReviewService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
System.out.println("[ReviewService]");
		
		//post방식 인코딩
		String encoding = "UTF-8";
		
		HttpSession session = request.getSession();
		UserDTO u_dto = (UserDTO) session.getAttribute("info");
		String mem_email =  u_dto.getEmail();
		
		//데이터받아오기(리뷰내용, 별점, 회원이메일)
		String review_content = request.getParameter("review_content");
		BigDecimal review_starrating = new BigDecimal(request.getParameter("review_starrating")); 
		
		System.out.println("리뷰내용 : "+review_content);
		System.out.println("별점 : "+review_starrating);
		System.out.println("사용자이메일 : "+mem_email);
		

		return null;
	}

}
