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
	
	<!-- 페이지 상단 -->
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a>
		<a href="MyPage.jsp">마이페이지</a>
		<ul>
			<li><a href="EditInfo.jsp">내정보 수정</a></li>
			<li><a href="EditPost.jsp">게시글 관리</a></li>
			<li><a href="ChatMain.jsp">채팅</a></li>
			<li><a href="WishList.jsp">찜 목록</a></li>
			<li><a href="ReviewList.jsp">리뷰목록</a></li>
			<li><a href="LogoutService.do">로그아웃</a></li>
		</ul>
	</div>
	<div>
		<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">외주</a>
		<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a>
		<a href="SiteIntroduce.jsp">사이트소개</a>
		<a href="FAQ.jsp">FAQ</a>
	</div>
	
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