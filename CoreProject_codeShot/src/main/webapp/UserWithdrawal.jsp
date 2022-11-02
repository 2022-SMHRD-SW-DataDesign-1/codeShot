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
		<ul>
			<li><a href="EditInfo.jsp">개인정보 수정</a></li>
			<li><a href="UserWithdrawal.jsp">회원 탈퇴</a></li>
		</ul>
	</div>
	<div>
		<h2>이메일 확인</h2>
		<form action="WithdrawalService.do">
			이메일 : <input type="text" name="email">
			<input type="submit" value="회원 탈퇴">
		</form>
	</div>
<%
	String checkWithdrawal = (String)request.getAttribute("checkWithdrawal");
	System.out.println(checkWithdrawal);
%>
	<script type="text/javascript">
	if("<%=checkWithdrawal%>" == "fail")
	{
		alert("email이 틀리셨습니다.")
	}
	</script>
</body>
</html>