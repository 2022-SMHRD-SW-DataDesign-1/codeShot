package com.codeshot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.UserDAO;
import com.codeshot.model.UserDTO;

public class WithdrawalService implements Command 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("[WithdrawalService]");
		
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO)session.getAttribute("info");
		String email = request.getParameter("email");
		
		if(email.equals(info.getEmail())) 
		{
			int row = new UserDAO().withdrawal(email);
			
			if(row > 0) 
			{
				System.out.println("회원 탈퇴 성공!");
				session.removeAttribute("info");
			}
			else 
			{
				System.out.println("회원 탈퇴 실패!");
			}
		}
		else 
		{
			request.setAttribute("checkWithdrawal", "fail");
			System.out.println("email 철자 틀림");
			return "UserWithdrawal.jsp";
		}
		return "Main.jsp";
	}

}
