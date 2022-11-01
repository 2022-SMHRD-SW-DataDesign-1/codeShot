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
	<div>
		<form action="EditInfoService.do" method="post"></form>
		이름 : <input name="name" type="text"><br>
		이메일 : <span><%= ((UserDTO)session.getAttribute("info")).getEmail() %></span><br>
		전화번호 : <input name="phone" type="text"><br>
		현재비밀번호 : <input name="nowpw" type="text"><br>
		변결할 비밀번호 : <input name="editPw" type="text"><br>
		비밀번호 확인 : <input name="editPwConfirm" type="text"><br>
		경력 : <input name="career" type="text"><br>
		<input type="submit" value="변경하기">
	</div>
</body>
</html>