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
<% System.out.println("[리뷰목록 페이지]");

	UserDTO info = (UserDTO)session.getAttribute("info");
	
	/* ReviewDAO dao = new ReviewDAO();
	List<ReviewDTO> ReviewList = dao.reviewList(info.getEmail());
	
	System.out.println("리뷰리스트 : "+ReviewList.size()); */
	
	
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
	</div>

<!-- 찜목록 -->
	<div>
		<nav>
			<ul>
				<li>작성가능한 리뷰</li>
				<li>작성한 리뷰</li>
			</ul> 	
		</nav>
		
<!-- 리뷰작성 -->
		  <div class="wrap">
        <h1>후기</h1>	 <!-- frontcontroller 작성하기, 대문자를 소문자로 바꿔주기 -->
        <form  action="reviewService.do" class="reviewform" method="post">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <p class="title_star">별점과 리뷰를 남겨주세요.</p>
     
            <div class="review_rating">
                <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                <!-- 사용자가 입력한 별점va, 리뷰내용 Review테이블에 삽입 -->
                    <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
            </div>
            <div class="review_contents">
                <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea" name="review"></textarea>
            </div>   
            <div class="cmd">
                <input type="submit" name="save" id="save" value="등록">
            </div>
        </form>
    </div>	
		
<%} %>		
</body>
</html>