<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//게시물 번호 가져오기
		BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
		System.out.print(postNum);
		PostDTO post = new PostDAO().showPostDetail(postNum);
		
		//글쓴이 이메일, 포트폴리오 가져오기
		List<PortfolioDTO> portfolioList = new PortfolioDAO().showPortfolio(post.getMem_email());
	%>
	<div>
		<h1><%= post.getPost_title() %></h1>
		<fieldset>
			<%= post.getPost_price() %>원
			<br>
			<button> <a href="#"> 구매하기 </a> </button>
		</fieldset>
		<fieldset>
			<button> <a href="#"> 문의하기 </a> </button>
		</fieldset>
	</div>
	
	<div>
		<img src="file/<%= portfolioList.get(0).getPf_file() %>">
		<ul>
			<li> 포트폴리오 </li>
			<li> 서비스 설명 </li>
			<li> 의뢰인 주의사항 </li>
			<li> 사용툴(버전) </li>
			<li> 리뷰 </li>
		</ul>
		<h3> 포트폴리오</h3>
		<% for(PortfolioDTO dto : portfolioList){ %>
			<img src="file/<%= dto.getPf_file()%>">
		<% } %>
		<h3> 서비스 설명 </h3>
		<%= post.getPost_explain() %>
		<h3> 의뢰인 주의사항 </h3>
		<%= post.getPost_precautions() %>
		<h3> 사용툴(버전) </h3>
		<%= post.getPost_standard() %>
		<h3> 리뷰 </h3>
	</div>
</body>
</html>