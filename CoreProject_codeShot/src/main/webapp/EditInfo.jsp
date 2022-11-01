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
	UserDTO info = ((UserDTO)session.getAttribute("info"));
	String checkPW = (String)request.getAttribute("checkPW");
	System.out.println(checkPW);
%>
	<div>
		<form action="EditInfoService.do" method="post">
		이름 : <input name="name" type="text" value="<%= info.getName() %>"><br>
		이메일 : <span><%= info.getEmail() %></span><br>
		전화번호 : <input name="phone" type="text" value="<%= info.getPhone() %>"><br>
		현재비밀번호 : <input name="nowPw" type="text"><br>
		변결할 비밀번호 : <input name="editPw" type="text"><br>
		비밀번호 확인 : <input name="editPwConfirm" type="text"><br>
		경력 : <input name="career" type="text" value="<%= info.getCareer() %>"><br>
		<input type="submit" value="변경하기">
		</form>
	</div>
	<script type="text/javascript">
		if("<%=checkPW%>" == "fail")
		{
			alert("비밀번호가 틀렸습니다.");
		}
	</script>
</body>
</html>