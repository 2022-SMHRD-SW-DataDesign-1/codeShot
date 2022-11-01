<%@page import="com.codeshot.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SerchMain</title>
</head>
<body>
<%
	String userInput = request.getParameter("userInput");

	PostDAO dao = new PostDAO();
	dao.serchPost(userInput);
%>
<div>
	<h3>검색</h3>
		<form action="SerchMain.jsp" method="get">
			<input type="text" name="userInput"><br>
			<input type="submit" value="검색">
		</form>
	<h3>비회원</h3>
	<button>로그인</button>
	<a href="JoinSelect.jsp"><button>회원가입</button></a>
</div>
<div>
	<h3>회원</h3>
	<a href="PostWrite.jsp">판매하기</a> <a href="MyPage.jsp">마이페이지</a>
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
	<a href="PostMain.jsp?postType=outsourcingPost">외주</a> <a
		href="PostMain.jsp?postType=codePost">소스코드</a> <a
		href="SiteIntroduce.jsp">사이트소개</a> <a href="FAQ.jsp">FAQ</a>
</div>
<section><%=userInput%>에 대한 결과입니다.
</section>
<div>서비스 결과 갯수 출력</div>
<section>
	<div>
		<article>
			<a>제목</a>
		</article>
	</div>
</section>

</body>
</html>