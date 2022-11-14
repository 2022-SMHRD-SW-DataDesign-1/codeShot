<%@page import="java.math.BigDecimal"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/ReviewWrite.css" />
<script type="text/javascript" src="./js/ReviewWrite.js"> </script>

<style type="text/css">
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./assets/cssImg/starrating.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
</style>

</head>
<body>
<%
 	System.out.println("[리뷰 작성 페이지]");

	UserDTO info = (UserDTO)session.getAttribute("info");
	
	BigDecimal post_num = new BigDecimal(request.getParameter("post_num"));
	
	
	System.out.print("게시글 번호:"+post_num); 

%>

<!-- 리뷰작성 -->
 <div class="wrap">
	<h1>후기</h1>	 
	
	<!-- frontcontroller 작성하기 -->

	<form  action="ReviewAddService.do" class="reviewform" method="post">
	    <input type="hidden" name="post_num" id="rate" value="<%=post_num%>"/>
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
	        <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
	        <textarea rows="10" class="review_textarea" name="review_content" style="margin: 10px 10px 10px 0px; height:300px;"></textarea>
	    </div>   
	    <button class="btn-box" type="submit" style=" border-radius: 6px; width: 90px; height: 40px; background-color : rgb(204, 232, 226); border-style: none; margin-left: 40%;">
        	<span class="btn" style=" font-weight: bold; font-size: 16px; color: #353539;">등록</span>
	    </button>  
								
	</form>
</div>
  
</body>
</html>