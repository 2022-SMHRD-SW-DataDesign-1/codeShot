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
		session.setAttribute("isExpert", "N");
	%>
	<form action="JoinService.do">
		이메일 : <input type="text"  placeholder="Email을 입력하세요" name="email">
		<input type="button" value="email중복체크" onclick=""><br>
		패스워드 : <input type="password"  placeholder="Password를 입력하세요" name="pw"><br>
		이름 : <input type="text"  placeholder="이름을 입력하세요" name="name"><br>
		전화번호 : <input type="text"  placeholder="전화번호를 입력하세요" name="phone"><br>
		<input type="submit" value="회원가입">	
	</form>
</body>
</html>