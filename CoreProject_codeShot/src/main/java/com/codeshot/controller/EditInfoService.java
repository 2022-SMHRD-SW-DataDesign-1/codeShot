package com.codeshot.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codeshot.command.Command;
import com.codeshot.model.UserDAO;
import com.codeshot.model.UserDTO;

public class EditInfoService implements Command 
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("[EditInfoService]");
		
		HttpSession session = request.getSession();
		String email = ((UserDTO)session.getAttribute("info")).getEmail();
		String name = request.getParameter("name");
		String nowPw = request.getParameter("nowPw");
		String editPw = request.getParameter("editPw");
		String editPwConfirm = request.getParameter("editPwConfirm");
		String career = request.getParameter("career");
		String isExpert = ((UserDTO)session.getAttribute("info")).getIsExpert();
		String phone = request.getParameter("phone");
		Timestamp joinDate = ((UserDTO)session.getAttribute("info")).getJoindate();
		String userType = ((UserDTO)session.getAttribute("info")).getType();
		
		System.out.println("email : "+email);
		System.out.println("name : "+name);
		System.out.println("nowPw : "+nowPw);
		System.out.println("editPw : "+editPw);
		System.out.println("editPwConfirm : "+editPwConfirm);
		System.out.println("career : "+career);
		System.out.println("isExpert : "+isExpert);
		System.out.println("phone : "+phone);
		System.out.println("joinDate : "+joinDate);
		System.out.println("userType : "+userType);
		
		UserDTO dto = new UserDTO(email, editPw, name, career, isExpert, phone, joinDate, userType);
		int row = new UserDAO().updateInfo(dto);
		
		if(row > 0) 
		{
			System.out.println("회원정보 수정 완료");
			session.setAttribute("info", dto);
		}
		else 
		{
			System.out.println("회원정보 수정 실패");
		}
		
		return "Main.jsp";
	}

}
