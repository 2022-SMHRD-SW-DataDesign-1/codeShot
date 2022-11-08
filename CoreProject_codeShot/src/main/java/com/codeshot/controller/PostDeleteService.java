package com.codeshot.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.PostDAO;

public class PostDeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
		
		int row = new PostDAO().deletePost(postNum);
		
		if(row>0) {
			System.out.println("삭제 성공");
		}else {			
			System.out.println("삭제 실패");
		}
		
		return "EditPost.jsp";
	}

}
