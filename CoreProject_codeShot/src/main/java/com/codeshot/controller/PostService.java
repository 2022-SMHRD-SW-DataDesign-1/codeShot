package com.codeshot.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList pfFiles = new ArrayList();
		
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
		
		String postTitle = multi.getParameter("post_title");
		int postPrice = Integer.parseInt(multi.getParameter("post_price"));
		String codeFile = multi.getFilesystemName("post_file");
		try {
			codeFile = URLEncoder.encode(codeFile, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String postExplain = multi.getParameter("post_explain");
		String postPrecautions = multi.getParameter("post_precautions");
		String postStandard = multi.getParameter("post_standard");
		
		System.out.println("post_title : " + postTitle);
		System.out.println("postPrice : " + postPrice);
		System.out.println("codeFile : " + codeFile);
		System.out.println("postExplain : " + postExplain);
		System.out.println("postPrecautions : " + postPrecautions);
		System.out.println("postStandard : " + postStandard);
		
		return null;
	}

}
