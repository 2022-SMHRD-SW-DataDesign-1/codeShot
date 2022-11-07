package com.codeshot.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.ChattingDTO;
import com.codeshot.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ChattingService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[ChattingService]");
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		String savePath = request.getServletContext().getRealPath("./file/chatfile");
		System.out.println(savePath);
		
		// 사이즈
		int maxSize = 100*1024*1024;
		
		// 인코딩방식
		String encoding = "UTF-8";
		
		// 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		try 
		{
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			String email = info.getEmail();
			String chat = multi.getParameter("chat");
			BigDecimal roomNum = new BigDecimal(multi.getParameter("roomNum"));

			System.out.println("email :"+email);
			System.out.println("inputChat : "+chat);
			System.out.println("roomNum : "+roomNum);
			
			ChattingDTO dto = new ChattingDTO(null, email, chat, null, roomNum);
			int row = new ChatDAO().inputChat(dto);
			
			if(row > 0) 
			{
				System.out.println("채팅 업로드 성공");
			}
			else 
			{
				System.out.println("채팅 업로드 실패");
			}
			
		} 
		catch (IOException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
