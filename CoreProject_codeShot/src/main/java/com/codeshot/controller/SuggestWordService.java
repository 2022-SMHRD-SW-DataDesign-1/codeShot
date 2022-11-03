package com.codeshot.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.PostDAO;
import com.codeshot.model.PostDTO;
import com.google.gson.Gson;

public class SuggestWordService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out;
		
		System.out.println("[검색부가기능]");
		String userInput = request.getParameter("userInput");
		System.out.println(userInput);
		
		Gson gson = new Gson();
		
		List<PostDTO> postList = new PostDAO().searchPost(userInput);
		System.out.println(postList.size());
		
		String jsonArry = gson.toJson(postList);
	
		try {
			out = response.getWriter();
			out.print(jsonArry);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
