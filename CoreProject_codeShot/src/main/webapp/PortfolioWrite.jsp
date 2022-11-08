<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.UserDTO"%>
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
		UserDTO info = (UserDTO)session.getAttribute("info");
		String memEmail = info.getEmail();
		
		List<PortfolioDTO> portfolioList = new PortfolioDAO().showPortfolio(memEmail);
	%>
	
	<h1> <a href="Main.jsp">DDock</a> </h1>
	<!-- 포트폴리오 등록  -->
	<form action="PortfolioService.do" method="post" enctype="multipart/form-data">
		<h2> 포트폴리오 관리</h2>
		<input type="file" name="pf_file" multiple>
		<input type ="submit">
	</form>
	
	<!-- 포트폴리오 출력 -->
	<% if(portfolioList.size()!=0){
			for(PortfolioDTO dto : portfolioList){ %>
				<img src="file/<%= dto.getPf_file()%>">
		<% } 
		}%>
</body>
</html>