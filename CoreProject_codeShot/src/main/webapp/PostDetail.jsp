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
	int post_num = Integer.parseInt(request.getParameter("post_num"));
	System.out.print(post_num);
%>

<h1>게시글 <%=post_num %>번 상세 페이지 입니다.</h1>
</body>
</html>