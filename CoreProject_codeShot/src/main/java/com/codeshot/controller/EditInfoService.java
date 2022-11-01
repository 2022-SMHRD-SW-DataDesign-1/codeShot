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
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		String email = info.getEmail();
		String name = request.getParameter("name");
		String nowPw = request.getParameter("nowPw");
		
		System.out.println("email : "+email);
		System.out.println("name : "+name);
		System.out.println("nowPw : "+nowPw);
		
		if(nowPw.equals(info.getPw())) 
		{
			String editPw = request.getParameter("editPw");
			String editPwConfirm = request.getParameter("editPwConfirm");
			String career = request.getParameter("career");
			String isExpert = info.getIsExpert();
			String phone = request.getParameter("phone");
			Timestamp joinDate = info.getJoindate();
			String userType = info.getType();
			
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
		else 
		{
			request.setAttribute("checkPW", "fail");
			System.out.println("비밀번호 틀림");
		}
		
		return "EditInfo.jsp";
	}

}
