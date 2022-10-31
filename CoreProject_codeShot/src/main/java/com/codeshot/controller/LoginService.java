package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.UserDAO;
import com.codeshot.model.UserDTO;

public class LoginService implements Command 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("[LoginService]");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		System.out.println("email : "+email);
		System.out.println("pw : "+pw);
		
		UserDTO dto = new UserDTO(email, pw);  
		UserDTO info = new UserDAO().login(dto);
		
		if(info != null) 
		{
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		}
		else 
		{
			System.out.println("로그인 실패!");
		}
		
		return "Main.jsp";
	}

}
