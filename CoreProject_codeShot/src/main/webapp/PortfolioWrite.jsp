<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> DDock </h1>
	<form action="PortfolioService.do" method="post" enctype="multipart/form-data">
		<h2> 포트폴리오 관리</h2>
		<input type="file" name="pf_file" multiple>
		<input type ="submit">
	</form>
</body>
</html>