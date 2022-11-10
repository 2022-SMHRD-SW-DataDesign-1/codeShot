<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DDock</title>


<!-- header css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">


<!-- a태그 밑줄 없애기 위한 style 적용 -->
<style type="text/css">
	a:hover{
		text-decoration: none;
	}
	a{
		text-decoration: none;
	}
</style>


</head>
<body>
	<!-- Header -->
	<header class="container-menu-desktop">
		<section class="top-bar">
			<div class="content-topbar flex-sb-m h-full container codeShot-topbar">
				<div class="left-top-bar">
					<!-- 로고 이미지 -->
					<a href="index.html" class="logo">
						<img src="./assets/cssImg/logo.png" alt="IMG-LOGO" width="250px" height="100%">
					</a>
				</div>
				
				<!-- 검색창 -->
				<div class="search-box">
				    <form action="SerchMain.jsp" method="get"  class="codeShot-serchBox">
				        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput" class="search-txt" type="text" placeholder="검색어를 입력해주세요" maxlength="15">
				        <!-- <input type="submit" value="검색" class="search-btn"> -->
				        <button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
					    <div id="codeShot-recommend" class="codeShot-invisible">
					    	<ul id="suggest-list" class="codeShot-suggestList">
					    		<!-- 추천 검색어 자리 -->
					    	</ul>
					    </div>
				    </form>
				</div>
				
				<!-- 로그인, 회원가입 -->
				<!-- 비회원 -->
				
				<div class="codeShot-logAndJonin">
					<div class="right-top-bar flex-w h-full">
						<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25">
							<b>로그인</b>
						</a>
						<a href="JoinSelect.jsp" class="flex-c-m trans-04 p-lr-25">
							<b>회원가입</b>
						</a>
						<a href="PostWrite.jsp"class="flex-c-m trans-04 p-lr-25">
							<b>판매하기</b>
						</a>
						
						<a href="LogoutService.do" class="flex-c-m trans-04 p-lr-25">
							<b>로그아웃</b>
						</a>
						
						<ul class="main-menu">
							<li class="codeShot-ots-menu">
								<a href="MyPage.jsp" class="flex-c-m trans-04 p-lr-25">		
									<b>마이페이지</b>
								</a>
								<ul class="sub-menu codeShot-subMenu">
									<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">내정보 수정</a></li>
									<li class="codeShot-subMenu-li"><a href="EditPost.jsp">게시글 관리</a></li>
									<li class="codeShot-subMenu-li"><a href="PortfolioWrite.jsp">포트폴리오 관리</a></li>
									<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">채팅</a></li>
									<li class="codeShot-subMenu-li"><a href="WishList.jsp">찜 목록</a></li>
									<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">리뷰목록</a></li>
								</ul>
							</li>
						</ul>
						
					</div>
				</div>

				<!-- 외뢰인 -->
				
				
				<!-- 전문가 -->
				
<!-- 				<div>
					<h3>회원</h3>
					<a href="PostWrite.jsp">판매하기</a>
					<a href="MyPage.jsp">마이페이지</a>
					<a href="LogoutService.do">로그아웃</a>
					<ul>
						<li><a href="EditInfo.jsp">내정보 수정</a></li>
						<li><a href="EditPost.jsp">게시글 관리</a></li>
						<li><a href="PortfolioWrite.jsp">포트폴리오 관리</a></li>
						<li><a href="ChatMain.jsp">채팅</a></li>
						<li><a href="WishList.jsp">찜 목록</a></li>
						<li><a href="ReviewList.jsp">리뷰목록</a></li>
					</ul>
				</div> -->
			</div>
		</section>
		
		<section class="wrap-menu-desktop">
		
<!-- 			<div>
				<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">외주</a>
				<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a>
				<a href="SiteIntroduce.jsp">사이트소개</a>
				<a href="FAQ.jsp">FAQ</a>
			</div> -->
			
			<nav class="limiter-menu-desktop container codeShot-nav">
				<!-- Menu -->
				<div class="menu-desktop">
				<ul class="main-menu">
					<li class="codeShot-ots-menu">
						<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost" class="codeShot-menuBarBottom">외주</a>
						<ul class="sub-menu codeShot-subMenu">
							<li class="codeShot-subMenu-li"><a href="SellWeb.html">웹</a></li>
							<li class="codeShot-subMenu-li"><a href="SellApp.html">앱</a></li>
						</ul>
					</li>
					
					<li class="codeShot-code-menu">
						<a href="PostMain.jsp?postType=codePost" id="codePost" class="codeShot-menuBarBottom">소스코드</a>
						<ul class="sub-menu codeShot-subMenu">
							<li class="codeShot-subMenu-li"><a href="SellWeb.html">웹</a></li>
							<li class="codeShot-subMenu-li"><a href="SellApp.html">앱</a></li>
						</ul>
					</li>
					<li>
						<a href="FAQ.jsp" class="codeShot-menuBarBottom">FAQ</a>
					</li>
					
					<li>
						<a href="SiteIntroduce.jsp" class="codeShot-menuBarBottom">서비스 소개글</a>
					</li>
					
				</ul>
				</div>
			</nav>

		</section>
		
		
	</header>
	
	<main>비회원</main>
	<main>의뢰자 회원</main>
	<main>전문가 회원</main>
	
	
	<footer></footer>
	<!-- script -->
		
	<!-- 2022-11-02 / 김지수 / 검색 제안어 기능 추가 -->
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="./assets/js/SuggestWord.js"></script>

</body>
</html>