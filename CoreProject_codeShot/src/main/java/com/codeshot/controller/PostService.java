package com.codeshot.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.PostDAO;
import com.codeshot.model.PostDTO;
import com.codeshot.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[PostService]");
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		// 저장경로
		String savePath = request.getServletContext().getRealPath("file");
		System.out.println(savePath);
		
		int maxSize = 50*1024*1024;
		
		// 인코딩
		String encoding = "UTF-8";
		
		// 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		// MultipartRequest
		MultipartRequest multi= null;
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String memEmail = info.getEmail();
		String postCategory = multi.getParameter("post_category");
		String postTitle = multi.getParameter("post_title");
		String postExplain = multi.getParameter("post_explain");
		String postStandard = multi.getParameter("post_standard");
		String postPrecautions = multi.getParameter("post_precautions");
		BigDecimal postPrice = new BigDecimal(multi.getParameter("post_price"));
		String postFile = multi.getFilesystemName("post_file");
		try {
			postFile = URLEncoder.encode(postFile, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		System.out.println("memEmail : " + memEmail);
		System.out.println("postCategory : " + postCategory);
		System.out.println("postTitle : " + postTitle);
		System.out.println("postExplain : " + postExplain);
		System.out.println("postStandard : " + postStandard);
		System.out.println("postPrecautions : " + postPrecautions);
		System.out.println("postPrice : " + postPrice);
		System.out.println("postFile : " + postFile);
		
		PostDTO dto = new PostDTO(postCategory, memEmail, postTitle, postExplain, postStandard, postPrecautions, postPrice, postFile);
		
		int row = new PostDAO().uploadPost(dto);
		
		if(row>0) {
			System.out.println("업로드 성공");
		}else {			
			System.out.println("업로드 실패");
		}
		
		return "PostDetail.jsp";
	}

}
