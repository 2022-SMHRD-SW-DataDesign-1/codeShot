<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>

<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">

<style type="text/css">
	* {
		color: #666666;
	}
	a:hover{
		text-decoration: none;
	}
	a{
		text-decoration: none;
	}
	
	
	#mypage-btn-expert{
		display: inline;
		height: 45px;
		margin: 8px 0px 0px 0px;
	}
	#mypage-btn-expert:hover{
		background-color:  rgb(189, 244, 236);
		border-radius: 5px 5px 5px 5px;
	}
	
	#mypage-btn{
		display: inline;
		height: 45px;
		margin: 8px 0px 0px 180px;
	}
	#mypage-btn:hover{
		background-color:  rgb(189, 244, 236);
		border-radius: 5px 5px 5px 5px;
	}
	
	#p-lr-25abc123{
		margin: 5px 0px 0px 0px;
	}

	.search-box{
		margin-left: 0px;
	}

</style>
</head>
<body>
	<!-- login 상태 -->
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	String isExpert = "";

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.showPost();
	PortfolioDTO pf;

	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();

	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = null;

	ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();
	%>

	<!-- Header -->
	<header class="container-menu-desktop">
		<section class="top-bar">
			<div
				class="content-topbar flex-sb-m h-full container codeShot-topbar">
				<div class="left-top-bar">
					<!-- 로고 이미지 -->
					<a href="index.html" class="logo"> <img
						src="./assets/cssImg/logo.jpg" alt="IMG-LOGO" width="290px"
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

						<!-- 고객 -->
						<%
						} else if ((isExpert = info.getIsExpert()).equals("N")) {
						%>

						<ul id="mypage-btn" class="main-menu">
							<li class="codeShot-ots-menu"><a href="MyPage.jsp"
								id="p-lr-25abc123" class="flex-c-m trans-04"> <b>마이페이지</b>
							</a>
								<ul class="sub-menu codeShot-subMenu">
									<li class="codeShot-subMenu-li"><a href="EditInfo.jsp">내정보
											수정</a></li>
									<li class="codeShot-subMenu-li"><a href="ChatMain.jsp">채팅</a></li>
									<li class="codeShot-subMenu-li"><a href="WishList.jsp">찜
											목록</a></li>
									<li class="codeShot-subMenu-li"><a href="ReviewList.jsp">리뷰목록</a></li>
									<li class="codeShot-subMenu-li"><a href="LogoutService.do">로그아웃</a></li>
								</ul></li>
						</ul>
						<%
						}
						%>
						<%
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

	<!-- main  -->
	<!-- 회원 -->
	<%
	if (info != null) {
	%>

	<!-- 전문가 -->
	<%
	if ((isExpert = info.getIsExpert()).equals("Y")) {
	%>
	<main>
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
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="EditInfo.jsp" target="_self"
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
										<div data-v-17364d77=""
											class="new-label-wrapper active">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													전체 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													요청사항 미작성 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													진행중 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													수정요청 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													발송중 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													늦은 발송 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													완료 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													취소 
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel">
								<div data-v-17364d77=""
									class="collapse-title flex-between-center new-label-wrapper">
									<a data-v-17364d77="" href="EditPost.jsp" class=""> 게시물 관리 </a> <a
										data-v-17364d77="" href="#sellerProposals"
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
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> 전체 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> 대기중 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> 채택 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> 마감 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#">
												<span data-v-17364d77=""> 철회 
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="PortfolioWrite.jsp" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										포트폴리오 관리
										<!---->
										<!---->
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="ChatMain.jsp" target="_self"
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
									<a data-v-17364d77="" href="WishList.jsp" class=""> 찜 목록 </a> <a
										data-v-17364d77="" href="#myGigs" aria-controls="myGigs"
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
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="LogoutService.do" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										로그아웃
										<!---->
										<!---->
									</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- 고객 -->
	<%
	} else if ((isExpert = info.getIsExpert()).equals("N")) {
	%>
	<main>
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
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="EditInfo.jsp" target="_self"
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
										<div data-v-17364d77=""
											class="new-label-wrapper active">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													전체 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													요청사항 미작성 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													진행중 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													수정요청 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													발송중 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													완료 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													평가 미작성 
											</span>
											</a>
										</div>
										<div data-v-17364d77="" class="new-label-wrapper">
											<a data-v-17364d77="" href="#"> <span data-v-17364d77="">
													취소 
											</span>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="ChatMain.jsp" target="_self"
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
									<a data-v-17364d77="" href="wishList.jsp" class=""> 찜 목록 </a> <a
										data-v-17364d77="" href="#myGigs" aria-controls="myGigs"
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
							<li data-v-17364d77="" class="panel"><a
								data-v-17364d77="" href="LogoutService.do" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										로그아웃
										<!---->
										<!---->
									</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%
	}
	%>
	<%
	}
	%>

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