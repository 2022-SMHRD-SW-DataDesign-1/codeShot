package com.codeshot.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.controller.JoinService;

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
		
		if(result.equals("JoinService.do")) 
		{
			service = new JoinService();
			moveURL = service.execute(request, response);
		}
		
		if(moveURL != null) 
		{
			RequestDispatcher rd = request.getRequestDispatcher(moveURL);
			rd.forward(request, response);
		}
	}

}