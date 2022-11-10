<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
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
	UserDTO info = (UserDTO) session.getAttribute("info");	
	
	ReviewDAO r_dao = new ReviewDAO();
	ReviewDTO showReview;
	
%>
<h1>후기</h1>	 
	<!-- frontcontroller 작성하기 -->
	<form  action="ReviewUpdateService.do" class="reviewform" method="post">
	    <input type="hidden" name="post_num" id="rate" value=""/>
	    <p class="title_star">별점과 리뷰를 남겨주세요.</p>
	
	    <div class="review_rating">
	        <div class="warning_msg">별점을 선택해 주세요.</div>
	        <div class="rating">
	       
	            <input type="checkbox" name="review_starrating" id="rating1" value="1" class="rate_radio" title="1점">
	            <label for="rating1"></label>
	            <input type="checkbox" name="review_starrating" id="rating2" value="2" class="rate_radio" title="2점">
	            <label for="rating2"></label>
	            <input type="checkbox" name="review_starrating" id="rating3" value="3" class="rate_radio" title="3점" >
	            <label for="rating3"></label>
	            <input type="checkbox" name="review_starrating" id="rating4" value="4" class="rate_radio" title="4점">
	            <label for="rating4"></label>
	            <input type="checkbox" name="review_starrating" id="rating5" value="5" class="rate_radio" title="5점">
	            <label for="rating5"></label>
	        </div>
	    </div>
	    <div class="review_contents">
	        <div class="warning_msg"></div>
	        <textarea rows="10" class="review_textarea" value="" name="review_content"></textarea>
	    </div>   
	    <div class="cmd">
	        <input type="submit" name="save" id="save" value="수정하기">
	        
	    </div>
	</form>
	
</body>
</html>