package com.codeshot.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeshot.command.Command;
import com.codeshot.controller.ChattingService;
import com.codeshot.controller.CheckEmailService;
import com.codeshot.controller.CreateChatRoomService;
import com.codeshot.controller.EditDetailService;
import com.codeshot.controller.EditInfoService;
import com.codeshot.controller.JoinService;
import com.codeshot.controller.LoginService;
import com.codeshot.controller.LogoutService;
import com.codeshot.controller.PortfolioDeleteService;
import com.codeshot.controller.PortfolioService;
import com.codeshot.controller.PostDeleteService;
import com.codeshot.controller.PostService;
import com.codeshot.controller.ReviewAddService;
import com.codeshot.controller.ShowChattingService;
import com.codeshot.controller.SuggestWordService;
import com.codeshot.controller.WishAddService;
import com.codeshot.controller.WishPostDeleteServic;
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
		
		// 채팅 불러오기
		else if(result.equals("ShowChattingService.do")) 
		{
			service = new ShowChattingService();
			moveURL = service.execute(request, response);
		}
		
		// 게시물 작성
		else if(result.equals("PostService.do"))
		{
			service = new PostService();
			moveURL = service.execute(request, response);
		}
		
		// 포트폴리오 등록
		else if(result.equals("PortfolioService.do"))
		{
			service = new PortfolioService();
			moveURL = service.execute(request, response);
		}
		
		// 채팅 서버에 보내기
		else if(result.equals("ChattingService.do"))
		{
			service = new ChattingService();
			moveURL = service.execute(request, response);
		}
		
		// 게시물을 찜 테이블에 추가
		else if(result.equals("WishAddService.do")) {
			service = new WishAddService();
			service.execute(request, response);
		}
		
		// 찜목록에서 찜한 게시물 삭제
		else if(result.equals("WishPostDeleteService.do")) {
			service = new WishPostDeleteServic();
			service.execute(request, response);
		}
		
		//게시물 수정
		else if(result.equals("EditDetailService.do")) {
			service = new EditDetailService();
			moveURL = service.execute(request, response);
		}		
		
		//게시물 삭제
		else if(result.equals("PostDeleteService.do")) {
			service = new PostDeleteService();
			moveURL = service.execute(request, response);
		}		

		//포트폴리오 삭제
		else if(result.equals("PortfolioDeleteService.do")) {
			service = new PortfolioDeleteService();
			moveURL = service.execute(request, response);
		}
		
		// 채팅방 생성
		else if(result.equals("CreateChatRoomService.do")) {
			service = new CreateChatRoomService();
			moveURL = service.execute(request, response);
		}
		
		// 리뷰작성
		else if(result.equals("ReviewAddService.do")) {
			service = new ReviewAddService();
			moveURL = service.execute(request, response);
		}

		// 페이지 이동
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
