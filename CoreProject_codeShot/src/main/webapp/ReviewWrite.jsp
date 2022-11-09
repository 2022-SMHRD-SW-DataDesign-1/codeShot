<%@page import="java.math.BigDecimal"%>
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
/* 	System.out.println("[리뷰 작성 페이지]");

	UserDTO info = (UserDTO)session.getAttribute("info");
	
	BigDecimal post_num = new BigDecimal(request.getParameter("post_num"));
	System.out.print("게시글 번호:"+post_num); */

%>

<!-- 리뷰작성 -->
<!-- 
	<h1>후기</h1>	 
 -->	
	<!-- frontcontroller 작성하기, 대문자를 소문자로 바꿔주기 -->
<!-- 
	<form  action="reviewService.do" class="reviewform" method="post">
	    <input type="hidden" name="rate" id="rate" value="0"/>
	    <p class="title_star">별점과 리뷰를 남겨주세요.</p>
	
	    <div class="review_rating">
	        <div class="warning_msg">별점을 선택해 주세요.</div>
	        <div class="rating">
	       
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
 -->
  
</body>
</html>