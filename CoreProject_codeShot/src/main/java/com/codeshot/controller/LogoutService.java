package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;

public class LogoutService implements Command 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("[LogoutService]");
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("info");
		System.out.println("로그아웃 성공!");
		
		return "Main.jsp";
	}

}
