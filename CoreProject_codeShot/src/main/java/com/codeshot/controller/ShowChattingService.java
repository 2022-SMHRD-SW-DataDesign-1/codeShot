package com.codeshot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.ChattingDTO;

public class ShowChattingService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[ShowChattingService]");
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		List<ChattingDTO> chattingList = new ChatDAO().showChatting(roomNum);
		
		return null;
	}

}
