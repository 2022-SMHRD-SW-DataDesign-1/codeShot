<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="./assets/css/join-client.css">


<style type="text/css">
	.check-btn{
		background-color: rgb(189, 244, 236);
		border: 0;
		width: 100px;
		font-size: 13px;
		padding-left: 10px;
    	padding-right: 10px;
    	box-sizing: border-box;
    	border-radius: 6px;
	}
	
	textarea {
	    width: 100%;
	    height: 200px;
	    border: none;
	    resize: none;
	    overflow:auto;
	}
	
	.carrer-box{
		height: 220px;
	}
</style>

</head>
<body>
	<%
		session.setAttribute("isExpert", "Y");
	%>
	<main class="main">
    	<!-- 로고 -->
	    <a class="link" href="Main.jsp" target="_blank"><img class="logo" src="./assets/cssImg/logo.png" alt=""></a>
    	
    	<section class="home">
      		<form action="JoinService.do">
      		
      			<!-- 이메일 -->
        		<div class="text1">
          			<div class="email">이메일</div>
          			<div class="email-box">
            			<input type="text" id="joinInputEmail" class="input" name="email" placeholder="이메일을 입력해주세요">
            			<input type="button" value="email중복체크" onclick="checkEmail()" class="check-btn">
          			</div>
          			<div class="email-error">
		            	<div class="error-box">
		            		<span id="resultCheckEmail" class="error"></span>
		            	</div>
		        	</div>
       			</div>
        		
        		<!-- 비밀번호 -->
        		<div class="text2">
          			<div class="pw">비밀번호</div>
          			<div class="pw-box">
            			<input type="password" class="input" name="pw" placeholder="비밀번호를 입력해주세요(6자리이상)">
         			 </div>
        		</div>
        		<br>
        		
        		<!-- 이름 -->
        		<div class="text1">
		        	<div class="email">이름</div>
		        	<div class="email-box">
		        		<input type="text" class="input" name="name" placeholder="이름을 입력해주세요">
		        	</div>
		        </div>
		        
		        <!-- 휴대전화 -->
		        <div class="text1">
		        	<div class="email">휴대전화</div>
		        	<div class="email-box">
		        		<input type="text" class="input" name="phone" placeholder="휴대전화 번호를 입력해주세요">
		        	</div>
		        </div>
        		 
        		<!-- 경력사항 -->
          		<div class="text1">
          			<div class="email">경력사항</div>
         			<div class="email-box carrer-box">
            			<textarea type="text" name="career" placeholder=""></textarea>
          			</div>
        		</div>    
          		
          		<button class="btn-box" type="submit">
		        	<span class="btn">버튼만 누르면 가입완료</span>
		        </button> 
   
     		</form>
    	</section>
	</main>
	
	
	
	
	
<!-- 기능만 구현 ------------------------------------ -->
<!-- 	<form action="JoinService.do">
		이메일 : <input type="text"  placeholder="Email을 입력하세요" name="email" id="joinInputEmail">
		<input type="button" value="email중복체크" onclick="checkEmail()"><span id="resultCheckEmail"></span><br>
		패스워드 : <input type="password"  placeholder="Password를 입력하세요" name="pw"><br>
		이름 : <input type="text"  placeholder="이름을 입력하세요" name="name"><br>
		전화번호 : <input type="text"  placeholder="전화번호를 입력하세요" name="phone"><br>
		경력<br>
		<textarea name="career"></textarea><br>
		<input type="submit" value="회원가입">	
	</form> -->
	

	 
	<!-- script -->
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