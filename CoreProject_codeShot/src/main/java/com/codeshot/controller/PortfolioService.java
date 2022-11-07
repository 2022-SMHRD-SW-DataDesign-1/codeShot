package com.codeshot.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PortfolioService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[PortfolioService]");
		
		// 파일 이름 담을 리스트
		ArrayList pfFiles = new ArrayList();
		
		// 저장경로
		String savePath = request.getServletContext().getRealPath("file");
		System.out.println(savePath);
		
		// 파일 크기
		int maxSize = 50*1024*1024;
		
		// 인코딩
		String encoding = "UTF-8";
		
		// 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		// MutipartRequest
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//파일 이름 담기
		Enumeration pf = multi.getFileNames();
		while(pf.hasMoreElements()) {
			String pfFileName = (String) pf.nextElement();
			pfFiles.add(multi.getFilesystemName(pfFileName));
		}
		
		for(int i = 0; i<pfFiles.size();i++) {
			System.out.println(pfFiles.get(i));
		};
		
		return "PostDetail.jsp";
	}

}
