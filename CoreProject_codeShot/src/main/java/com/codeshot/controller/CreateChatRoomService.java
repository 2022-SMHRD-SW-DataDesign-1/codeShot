package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.ChatRoomDTO;
import com.codeshot.model.UserDTO;

public class CreateChatRoomService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		String sellerEmail = request.getParameter("sellerEmail");
		String postTitle = request.getParameter("postTitle");
		
		String chatRoomTitle = postTitle+"채팅방";
		String chatRoomDescription = sellerEmail+"\n"+info.getEmail()+"\n"+postTitle;
		
		ChatRoomDTO dto = new ChatRoomDTO(null, sellerEmail, info.getEmail(), chatRoomTitle, chatRoomDescription, null);
		int row = new ChatDAO().createChatRoom(dto);
		
		if(row > 0) 
		{
			System.out.println("채팅창 생성 성공!");
		}
		else 
		{
			System.out.println("채팅창 생성 실패!");
		}
		
		return "ChatMain.jsp";
	}

}
