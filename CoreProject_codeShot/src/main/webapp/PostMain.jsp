<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
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
	String postType = request.getParameter("postType");

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.showPost(); 
%>
	<div>
		<h3>비회원</h3>
		<button>로그인</button>
		<a href="JoinSelect.jsp"><button>회원가입</button></a>
	</div>
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
		<a href="PostMain.jsp?postType=outsourcingPost">외주</a>
		<a href="PostMain.jsp?postType=codePost">소스코드</a>
		<a href="SiteIntroduce.jsp">사이트소개</a>
		<a href="FAQ.jsp">FAQ</a>
	</div>
<!-- 게시물 출력 부분 -->
	<div>
		<h3><%= postType %></h3>
		<ul>
		<%	for(PostDTO dto : postList) { %>
			<a href="PostDetail.jsp?post_num=<%=dto.getPost_num()%>">
			<li>게시물1</li>
			<ol>
				<li>이미지</li>
				<li><%= dto.getPost_title() %></li> <!-- 제목 -->
				<li><%= dto.getMem_email() %></li> <!-- 글쓴이 -->
			</ol>
			</a>
		<%	} %>
		</ul>
	</div>
<%
	if(postType.contains("outsourcingPost"))
		postType = "outsourcingPost";
	else if(postType.contains("codePost"))
		postType = "codePost";
%>
	<div>
		<ul>
			<li><a href="PostMain.jsp?postType=<%=postType%>/Web">Web</a></li>
			<li><a href="PostMain.jsp?postType=<%=postType%>/App">App</a></li>
		</ul>
	</div>
</body>
</html>