package com.codeshot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.model.UserDAO;

public class CheckEmailService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("[CheckEmailService]");
		
		String inputE = request.getParameter("joinInputEmail");
		boolean checkEmail = new UserDAO().checkSameEmail(inputE);
		
		System.out.println(checkEmail);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(checkEmail);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
