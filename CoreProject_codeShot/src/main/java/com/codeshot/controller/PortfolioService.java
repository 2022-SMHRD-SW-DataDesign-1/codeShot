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
import com.codeshot.model.PortfolioDAO;
import com.codeshot.model.PortfolioDTO;
import com.codeshot.model.PostDTO;
import com.codeshot.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PortfolioService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[PortfolioService]");
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO) session.getAttribute("info");
		
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
		
		// 사용자 이메일
		String memEmail = info.getEmail();
		System.out.println("memEmail : "+ memEmail);
		
		//파일 이름 담기
		Enumeration pf = multi.getFileNames();
		while(pf.hasMoreElements()) {
			String pfFileName = (String) pf.nextElement();
			String pfFile = multi.getFilesystemName(pfFileName);
			pfFiles.add(pfFile);
		}
		
		int row = 0;
		
		for(int i = 0; i<pfFiles.size();i++) {
			System.out.println(pfFiles.get(i));
//			PortfolioDTO dto = new PortfolioDTO(memEmail, (String)pfFiles.get(i));
//			row = new PortfolioDAO().uploadPortfolio(dto);
		};
		
		if(row>0) {
			System.out.println("업로드 성공");
		}else {			
			System.out.println("업로드 실패");
		}
		
		return "PortfolioWrite.jsp";
	}

}
