<%@page import="com.codeshot.controller.CheckEmailService"%>
<%@page import="com.codeshot.model.PrchsDTO"%>
<%@page import="com.codeshot.model.PrchsDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
<% System.out.println("[리뷰목록(구매내역) 페이지]");

	UserDTO info = (UserDTO)session.getAttribute("info");

	PrchsDAO dao = new PrchsDAO();
	List<PrchsDTO> prchList = dao.prchsList(info.getEmail());
	
	System.out.println("리뷰목록(거래내역) : "+prchList.size());
	
	
%>
<!-- 페이지 상단 -->
<%if(info == null) {%>
	<p>로그인 해주세요</p>
<%} else{ %>
	<p>로그인 페이지</p>
   
	<h1>DDock</h1>
	<div>
	    <h3>검색</h3>
	    <form action="SerchMain.jsp" method="get">
	        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput">
	        <input type="submit" value="검색">
		    <ul id="suggest-list"></ul> 
	    </form>
	</div>
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a>
		<a href="MyPage.jsp">마이페이지</a>
		<a href="LogoutService.do">로그아웃</a>
		<ul>
			<li><a href="EditInfo.jsp">내정보 수정</a></li>
			<li><a href="EditPost.jsp">게시글 관리</a></li>
			<li><a href="ChatMain.jsp">채팅</a></li>
			<li><a href="WishList.jsp">찜 목록</a></li>
			<li><a href="ReviewList.jsp">리뷰목록</a></li>
		</ul>
	</div>
	<div>
		<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">외주</a>
		<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a>
		<a href="SiteIntroduce.jsp">사이트소개</a>
		<a href="FAQ.jsp">FAQ</a>
	</div> --%>

<!-- 리뷰목록 -->
	<div>
		<nav>
			<ul>
				<li>작성가능한 리뷰</li>
				<li>작성한 리뷰</li>
			</ul> 	
		</nav>
	</div>
	<%for(int i = 0; i < prchList.size(); i++) {%>
		<div><%=prchList.get(i).getPost_num() %></div>
		<div><%=prchList.get(i).getMem_email() %></div>
		<div><%=prchList.get(i).getPrch_date() %></div>
		<div><%=prchList.get(i).getPrch_price() %></div>
		<a href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>">리뷰작성하기</a>
	<%} %>
	

		
<%} %>		 
</body>
</html>