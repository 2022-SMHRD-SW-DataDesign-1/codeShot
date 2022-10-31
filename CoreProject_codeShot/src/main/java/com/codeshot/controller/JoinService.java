package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.UserDAO;
import com.codeshot.model.UserDTO;

public class JoinService implements Command
{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("[JoinService]");
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String isExpert = (String)session.getAttribute("isExpert");
		String career = request.getParameter("career");
		
		System.out.println("email : "+email);
		System.out.println("pw : "+pw);
		System.out.println("name : "+name);
		System.out.println("phone : "+phone);
		System.out.println("isExpert : "+isExpert);
		System.out.println("career : "+career);
		
		
		if(isExpert.equals("N")) 
		{
			UserDTO dto = new UserDTO(email,pw,name,null,isExpert,phone,null,null);
			int row = new UserDAO().joinClient(dto);
			
			if(row > 0) 
			{
				System.out.println("Client 회원가입 성공!");
			}
			else 
			{
				System.out.println("Client 회원가입 실패!");
			}
		}
		else if(isExpert.equals("Y")) 
		{
			UserDTO dto = new UserDTO(email,pw,name,career,isExpert,phone,null,null);
			int row = new UserDAO().joinExpert(dto);
			
			if(row > 0) 
			{
				System.out.println("Expert 회원가입 성공!");
			}
			else 
			{
				System.out.println("Expert 회원가입 실패!");
			}
		}
		
		return "Main.jsp";
	}

}
