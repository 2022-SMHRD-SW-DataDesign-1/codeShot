package com.codeshot.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.ChatDAO;
import com.codeshot.model.ChattingDTO;
import com.google.gson.Gson;

public class ShowChattingService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("[ShowChattingService]");
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		System.out.println(roomNum);
		
		List<ChattingDTO> chattingList = new ChatDAO().showChatting(roomNum);
		
		System.out.println("채팅 가져옴");
		
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			
			String jsonChattingList = gson.toJson(chattingList);
			
			System.out.println("json 변환 완료");
			
			out.print(jsonChattingList);
		} catch (IOException e) {
			System.out.println("예외 발생");
			e.printStackTrace();
		}
		return null;
	}

}
