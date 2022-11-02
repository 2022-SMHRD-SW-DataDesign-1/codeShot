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
		session.setAttribute("isExpert", "Y");
	%>
	<form action="JoinService.do">
		이메일 : <input type="text"  placeholder="Email을 입력하세요" name="email" id="joinInputEmail">
		<input type="button" value="email중복체크" onclick="checkEmail()"><span id="resultCheckEmail"></span><br>
		패스워드 : <input type="password"  placeholder="Password를 입력하세요" name="pw"><br>
		이름 : <input type="text"  placeholder="이름을 입력하세요" name="name"><br>
		전화번호 : <input type="text"  placeholder="전화번호를 입력하세요" name="phone"><br>
		경력<br>
		<textarea name="career"></textarea><br>
		<input type="submit" value="회원가입">	
	</form>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
	function checkEmail()
	{
		let inputE = $("#joinInputEmail").val();
		console.log(inputE);
		
		$.ajax({
			url : 'CheckEmailService.do', 		  // 요청 서버 url
			data : {'joinInputEmail':inputE}, // 요청할 때 같이 보내줄 데이터
			type : 'get',					  // 요청 타입(method)
			success : function(data){		  // 통신성공 (function(넘겨준데이터)))
				console.log(data);
				if(data == "true")
				{
					$("#resultCheckEmail").text("중복된 이메일 입니다.");
				}
				else
				{
					$("#resultCheckEmail").text("사용 가능한 이메일 입니다.");
				}
			},
			error : function(){ 			  // 통신실패
				console.log("통신실패");	
			}
		})
	}
	</script>
</body>
</html>