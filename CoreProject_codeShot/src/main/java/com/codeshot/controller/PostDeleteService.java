package com.codeshot.controller;

import java.io.File;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.PostDAO;
import com.codeshot.model.PostDTO;

public class PostDeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
		PostDTO post = new PostDAO().showPostDetail(postNum);
		
		String savePath = request.getServletContext().getRealPath("file");
		System.out.println(savePath);
		
		if(post.getPost_file()!= null) {
			new File(savePath+"/"+post.getPost_file()).delete();
		}
		
		int row = new PostDAO().deletePost(postNum);
		
		if(row>0) {
			System.out.println("삭제 성공");
		}else {			
			System.out.println("삭제 실패");
		}
		
		return "EditPost.jsp";
	}

}
