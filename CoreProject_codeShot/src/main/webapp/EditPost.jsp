<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="./assets/cssImg/title-icon.png">
<title>DDock</title>

<!-- header css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">

<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">

<!-- a태그 밑줄 없애기 위한 style 적용 -->
<style type="text/css">
* {
	color: #666666;
}

a:hover {
	text-decoration: none;
}

a {
	text-decoration: none;
}

#mypage-btn-expert {
	display: inline;
	height: 45px;
	margin: 8px 0px 0px 0px;
}

#mypage-btn-expert:hover {
	background-color: rgb(189, 244, 236);
	border-radius: 5px 5px 5px 5px;
}

#mypage-btn {
	display: inline;
	height: 45px;
	margin: 8px 0px 0px 180px;
}

#mypage-btn:hover {
	background-color: rgb(189, 244, 236);
	border-radius: 5px 5px 5px 5px;
}

#p-lr-25abc123 {
	margin: 5px 0px 0px 0px;
}

.search-box {
	margin-left: 0px;
}

.block-txt-title {
	word-break: break-all;
	overflow: hidden;
	-webkit-line-clamp: 2;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	font-weight: bold;
	margin: 8px 0px 3px 0px;
	font-size: 15px;
	height: 40px;
	text-align: start;
}

.block-img {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 5px;
	border: 1px;
	object-fit: cover;
}

.block-img-radius {
	border-radius: 5px;
}

.portfolio-img{
	width: 150px;
	height: 150px;
}
</style>
</head>
<body>
	<%
		UserDTO info = (UserDTO) session.getAttribute("info"); 
		String isExpert = "";
		
		List<PostDTO> postList = new PostDAO().showMyPost(info.getEmail());
		
		List<PortfolioDTO> portfolioList = new PortfolioDAO().showWriterPortfolio(info.getEmail());
	%>
	
	<!-- Header -->
	<header class="container-menu-desktop">
		<section class="top-bar">
			<div
				class="content-topbar flex-sb-m h-full container codeShot-topbar">
				<div class="left-top-bar">
					<!-- 로고 이미지 -->
					<a href="Main.jsp" class="logo"> <img
						src="./assets/cssImg/logo.png" alt="IMG-LOGO" width="290px"
						height="100%">
					</a>
				</div>

				<!-- 검색창 -->
				<div class="search-box">
					<form action="SerchMain.jsp" method="get" class="codeShot-serchBox">
						<input id="search-input-box" onkeyup="addList(this)" type="text"
							name="userInput" class="search-txt" type="text"
							placeholder="검색어를 입력해주세요" maxlength="15">
						<!-- <input type="submit" value="검색" class="search-btn"> -->
						<button class="search-btn" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<br>
						<div id="codeShot-recommend" class="codeShot-invisible">
							<ul id="suggest-list" class="codeShot-suggestList">
								<!-- 추천 검색어 자리 -->
							</ul>
						</div>
					</form>
				</div>

				<!-- 로그인, 회원가입, 판매하기, 마이페이지 -->
				<div class="codeShot-logAndJonin">
					<div class="right-top-bar flex-w h-full">

						<!-- 회원 -->
						<%
						if (info != null) {
						%>

						<!-- 전문가 -->
							<%
							if ((isExpert = info.getIsExpert()).equals("Y")) {
							%>
							<a href="PostWrite.jsp" class="flex-c-m trans-04 p-lr-25"> <b>판매하기</b>
							</a>
							<ul id="mypage-btn-expert" class="main-menu">
								<li class="codeShot-ots-menu"><a href="MyPage.jsp"
									id="p-lr-25abc123" class="flex-c-m trans-04"> <b>마이페이지</b>
								</a>
									<ul class="sub-menu codeShot-subMenu">
										<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">내정보
												수정</a></li>
										<li class="codeShot-subMenu-li"><a href="EditPost.jsp">게시글
												관리</a></li>
										<li class="codeShot-subMenu-li"><a
											href="PortfolioWrite.jsp">포트폴리오 관리</a></li>
										<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">채팅</a></li>
										<li class="codeShot-subMenu-li"><a href="WishList.jsp">찜
												목록</a></li>
										<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">리뷰목록</a></li>
										<li class="codeShot-subMenu-li"><a href="LogoutService.do">로그아웃</a></li>
									</ul></li>
							</ul>
							<%
							}
						}
						%>
					</div>
				</div>
			</div>
		</section>

		<section class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container codeShot-nav">
				<!-- Menu -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="codeShot-ots-menu"><a
							href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost"
							class="codeShot-menuBarBottom">외주</a>
							<ul class="sub-menu codeShot-subMenu">
								<li class="codeShot-subMenu-li"><a href="#">웹</a></li>
								<li class="codeShot-subMenu-li"><a href="#">앱</a></li>
							</ul></li>

						<li class="codeShot-code-menu"><a
							href="PostMain.jsp?postType=codePost" id="codePost"
							class="codeShot-menuBarBottom">소스코드</a>
							<ul class="sub-menu codeShot-subMenu">
								<li class="codeShot-subMenu-li"><a href="#">웹</a></li>
								<li class="codeShot-subMenu-li"><a href="#">앱</a></li>
							</ul></li>
						<li><a href="FAQ.jsp" class="codeShot-menuBarBottom">FAQ</a>
						</li>

						<li><a href="SiteIntroduce.jsp"
							class="codeShot-menuBarBottom">서비스 소개글</a></li>

					</ul>
				</div>
			</nav>

		</section>
	</header>
	<!-- /////////////////////////////////////////////////////  -->
	<!-- main  -->
	<main>
	<!-- 회원 -->
		<%
	if (info != null) {
	%>

		<!-- 전문가 -->
		<%
		if ((isExpert = info.getIsExpert()).equals("Y")) {
		%>
			<div class="flex margin-top-60 margin-left-20">
				<div class="side-menu-wrapper">
					<div data-v-17364d77="" id="side_menu_wrapper"
						class="MyPageSideMenu isSellerMinHeight">
						<div data-v-17364d77="" class="side-menu-title-wrapper NGB">
							마이페이지</div>
						<div data-v-17364d77="" class="guide-line"></div>
						<div data-v-17364d77="" class="menu-list-wrapper">
							<ul data-v-17364d77="" id="side_menu_main_group"
								class="main-menu-wrapper">
								<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
									href="EditInfo.jsp" target="_self"
									class="flex-left-center flex-align-baseline">
										<div data-v-17364d77="" class="new-label-wrapper">
											내 정보 수정
											<!---->
											<!---->
										</div>
								</a></li>
								<li data-v-17364d77="" class="panel">
									<div data-v-17364d77=""
										class="collapse-title flex-between-center new-label-wrapper">
										<a data-v-17364d77="" href="MyPage.jsp" class="active">
											거래내역 </a> <a data-v-17364d77="" href="#sellerSellingHistory"
											aria-controls="sellerSellingHistory" aria-expanded="true"
											data-toggle="collapse" data-parent="#side_menu_main_group"
											class="active">
											<div data-v-17364d77="" role="tab">
												<div data-v-17364d77="" class="flex">
													<i data-v-17364d77="" class="kf kf-arrow"> </i>
												</div>
											</div>
										</a>
									</div>
									<div data-v-17364d77="" id="sellerSellingHistory"
										class="collapse in">
										<div data-v-17364d77="" class="panel-body">
											<div data-v-17364d77="" class="new-label-wrapper active">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														전체 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														요청사항 미작성 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														진행중 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														수정요청 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														발송중 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														늦은 발송 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														완료 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														취소 </span>
												</a>
											</div>
										</div>
									</div>
								</li>
								<li data-v-17364d77="" class="panel">
									<div data-v-17364d77=""
										class="collapse-title flex-between-center new-label-wrapper">
										<a data-v-17364d77="" href="EditPost.jsp" class=""> 게시물 관리
										</a> <a data-v-17364d77="" href="#sellerProposals"
											aria-controls="sellerProposals" data-toggle="collapse"
											data-parent="#side_menu_main_group" class="">
											<div data-v-17364d77="" role="tab">
												<div data-v-17364d77="" class="flex">
													<i data-v-17364d77="" class="kf kf-arrow"> </i>
												</div>
											</div>
										</a>
									</div>
									<div data-v-17364d77="" id="sellerProposals" class="collapse">
										<div data-v-17364d77="" class="panel-body">
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														전체 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														대기중 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														채택 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														마감 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														철회 </span>
												</a>
											</div>
										</div>
									</div>
								</li>
								<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
									href="PortfolioWrite.jsp" target="_self"
									class="flex-left-center flex-align-baseline">
										<div data-v-17364d77="" class="new-label-wrapper">
											포트폴리오 관리
											<!---->
											<!---->
										</div>
								</a></li>
								<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
									href="ChatMain.jsp" target="_self"
									class="flex-left-center flex-align-baseline">
										<div data-v-17364d77="" class="new-label-wrapper">
											채팅
											<!---->
											<!---->
										</div>
								</a></li>
								<li data-v-17364d77="" class="panel">
									<div data-v-17364d77=""
										class="collapse-title flex-between-center new-label-wrapper">
										<a data-v-17364d77="" href="WishList.jsp" class=""> 찜 목록 </a>
										<a data-v-17364d77="" href="#myGigs" aria-controls="myGigs"
											data-toggle="collapse" data-parent="#side_menu_main_group"
											class="">
											<div data-v-17364d77="" role="tab">
												<div data-v-17364d77="" class="flex">
													<i data-v-17364d77="" class="kf kf-arrow"> </i>
												</div>
											</div>
										</a>
									</div>
									<div data-v-17364d77="" id="myGigs" class="collapse">
										<div data-v-17364d77="" class="panel-body">
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														전체 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														외주 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														소스코드 </span>
												</a>
											</div>
										</div>
									</div>
								</li>
								<li data-v-17364d77="" class="panel">
									<div data-v-17364d77=""
										class="collapse-title flex-between-center new-label-wrapper">
										<a data-v-17364d77="" href="ReviewList.jsp" class=""> 리뷰목록
										</a> <a data-v-17364d77="" href="#advertisement"
											aria-controls="advertisement" data-toggle="collapse"
											data-parent="#side_menu_main_group" class="">
											<div data-v-17364d77="" role="tab">
												<div data-v-17364d77="" class="flex">
													<i data-v-17364d77="" class="kf kf-arrow"> </i>
												</div>
											</div>
										</a>
									</div>
									<div data-v-17364d77="" id="advertisement" class="collapse">
										<div data-v-17364d77="" class="panel-body">
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														전체 </span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														작성 가능한 리뷰 <!----> <!---->
												</span>
												</a>
											</div>
											<div data-v-17364d77="" class="new-label-wrapper">
												<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
														내가 작성한 리뷰 <!----> <!---->
												</span>
												</a>
											</div>
										</div>
									</div>
								</li>
								<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
									href="LogoutService.do" target="_self"
									class="flex-left-center flex-align-baseline">
										<div data-v-17364d77="" class="new-label-wrapper">
											로그아웃
											<!---->
											<!---->
										</div>
								</a></li>
							</ul>
					<%
		}
		}
	%>
						</div>
					</div>
				</div>
				<div>
	
	
	<!-- 게시물 목록 -->
	<div>
		<h2> 게시물 관리</h2>
		<br>
		<ul>
			<%	for(PostDTO dto : postList) { %>
					<a href="PostDetail.jsp?post_num=<%=dto.getPost_num()%>">
						<ol>
							<li> 
								<% if(portfolioList.size()!=0){ %>
										<img class="portfolio-img" src="file/<%= portfolioList.get(0).getPf_file() %>">
								<% 	} %>
							</li>
							<li><%= dto.getPost_title() %></li> <!-- 제목 -->
							<button> <a href="EditDetail.jsp?post_num=<%= dto.getPost_num()%>"> 수정 </a> </button>
							<button> <a href="PostDeleteService.do?post_num=<%= dto.getPost_num()%>"> 삭제 </a> </button>
						</ol>
					</a>
			<%	} %>
		</ul>
	</div>
	</main>
	<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->
		<!-- footer -->

		<footer class="footer">
			<div class="footer-inner">
				<ol style="width: 40%">
					<b>DDock</b> | 광주광역시 동구 예술길 31-15, 7층 |
				</ol>
				<ol>
					<a href=#>공지사항</a>
				</ol>
				<ol>
					<a href=#>FAQ</a>
				</ol>
				<ol>
					<a href=#>이용약관</a>
				</ol>
				<ol>
					<a href=#><b>개인정보처리방침</b></a>
				</ol>
			</div>
		</footer>
</body>
</html>