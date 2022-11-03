package com.codeshot.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;

public class SuggestWordService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		
		
		return null;
	}

}
