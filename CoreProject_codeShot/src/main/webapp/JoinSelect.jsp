<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- HTML link 태그를 활용한 BootStrap 연동 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->
		
<!-- <link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous"> -->
		
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>

<!-- csss -->
<link rel="stylesheet" type="text/css" href="./assets/css/join.css">


</head>

<body>
	
<main class="main">
	<a class="link" href="Main.jsp" target="_blank">
		<img class="logo" src="./assets/cssImg/logo.png" alt="">
	</a>
	
	<section class="home">
		<h1>원하는 회원가입 유형을 선택하세요.</h1>
		<a href="JoinClient.jsp"><button id="sign-up" class="btn">고객으로 회원가입</button></a>
		<a href="JoinExpert.jsp"><button id="sign-in" class="btn">전문가로 회원가입</button></a> 
	</section>
</main>

<!-- script -->	
<script src="./assets/js/join.js"></script>	

<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script> -->

</body>
</html>