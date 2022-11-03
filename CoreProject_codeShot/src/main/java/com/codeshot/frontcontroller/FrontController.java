package com.codeshot.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.controller.CheckEmailService;
import com.codeshot.controller.EditInfoService;
import com.codeshot.controller.JoinService;
import com.codeshot.controller.LoginService;
import com.codeshot.controller.LogoutService;
import com.codeshot.controller.ShowChattingService;
import com.codeshot.controller.SuggestWordService;
import com.codeshot.controller.WithdrawalService;

public class FrontController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		
		// 어디서 요청이 들어왔는지 확인
		String reqURI = request.getRequestURI();
		System.out.println(reqURI);
		
		// 프로젝트 이름 확인
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		
		String result = reqURI.substring(contextPath.length() + 1);
		System.out.println(result);
		
		String moveURL = null;
		Command service = null;
		boolean checkUpdate = false;
		
		// 회원가입
		if(result.equals("JoinService.do")) 
		{
			checkUpdate = true;
			service = new JoinService();
			moveURL = service.execute(request, response);
		}
		
		// 로그인
		else if(result.equals("LoginService.do")) 
		{
			service = new LoginService();
			moveURL = service.execute(request, response);
		}
		
		// 회원정보 수정
		else if(result.equals("EditInfoService.do")) 
		{
			service = new EditInfoService();
			moveURL = service.execute(request, response);
			if(moveURL.equals("Main.jsp"))
				checkUpdate = true;
		}
		
		// 이메일 중복 체크
		else if(result.equals("CheckEmailService.do")) 
		{
			service = new CheckEmailService();
			moveURL = service.execute(request, response);
		}
		
		// 로그아웃
		else if(result.equals("LogoutService.do")) 
		{
			service = new LogoutService();
			moveURL = service.execute(request, response);
		}

		// 회원 탈퇴
		else if(result.equals("WithdrawalService.do")) 
		{
			service = new WithdrawalService();
			moveURL = service.execute(request, response);
			if(moveURL.equals("Main.jsp"))
				checkUpdate = true;
		}
		
		// 검색 부가 기능
		else if(result.equals("SuggestWordService.do"))
		{
			service = new SuggestWordService();
			service.execute(request, response);
		}
		
		// 체팅 불러오기
		else if(result.equals("ShowChattingService.do")) 
		{
			service = new ShowChattingService();
			moveURL = service.execute(request, response);
		}
		
		if(moveURL != null) 
		{
			if(checkUpdate) 
			{
				response.sendRedirect(moveURL);
			}
			else 
			{
				System.out.println("실행");
				RequestDispatcher rd = request.getRequestDispatcher(moveURL);
				rd.forward(request, response);
			}
		}
		
		
	}// service 끝

}// class 끝
