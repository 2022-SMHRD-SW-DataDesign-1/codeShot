<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>



<!-- HTML link 태그를 활용한 BootStrap 연동 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- login css -->
<link rel="stylesheet" type="text/css" href="./assets/css/login.css">

<title>로그인</title>
</head>
<body>
	
	<div class="container right-panel-active">
    <!-- 로그인 -->
    <div class="container__form container--signup">
      <form action="LoginService.do" class="form" id="form1">
        <h2 class="form__title">로그인</h2>
        <input type="text" placeholder="Email을 입력하세요" name="email" class="input" />
        <input type="password" placeholder="Password을 입력하세요" name="pw" class="input" />
        <a class="find" href="">이메일/비밀번호찾기</a>
        <button class="btn" type="submit">로그인</button>
        <button class="btn" onClick="location.href='./JoinSelect.jsp';">회원가입</button>
      </form>
    </div>
  
    <!-- Overlay -->
    <div class="container__overlay">
      <a href="./Main.jsp"><img class="logo" src="./assets/cssImg/logo.png" alt="logo"></a>
    </div>
  </div>
	
	

<!-- 디자인 적용 전 코드 -->
<!-- <div>
		<form action="LoginService.do">
			Email : <input type="text"  placeholder="Email을 입력하세요" name="email"><br>
			PW : <input type="password"  placeholder="Password를 입력하세요" name="pw"><br>
			<input type="submit" value="LoginSubmit">			
		</form>
	</div> -->	
</body>
</html>