<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.PrchsDTO"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.WishListDTO"%>
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
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">
<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/wishlist.css">
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
	
	#side_menu_wrapper .guide-line {
	  background-color: rgb(189, 244, 236) !important;
	}
</style>
</head>
<body>
<%	
	System.out.println("[찜목록 페이지]");

	// 로그인 정보
	UserDTO info = (UserDTO)session.getAttribute("info");
	String isExpert = "";
	
	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = w_dao.wishList(info.getEmail());
	
	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();
	
	System.out.println("찜 게시글 리스트: "+wishList.size());
	System.out.println("별점 리스트: "+starratingList.size());
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
			<div class="wishlist-area">
        <div class="wishlist-ots">
            <div class="wishlist-ots-head">
                외주
            </div>
            <hr>
            <div class="wishlist-content">
            	<%
            	List<PostDTO> wishOtsPostList = new ArrayList<PostDTO>();
            	List<PostDTO> wishCodePostList = new ArrayList<PostDTO>();
            	PostDAO p_dao = new PostDAO();
            	for(WishListDTO dto : wishList){
            		PostDTO p_dto = p_dao.showPostDetail(dto.getPost_num());
            		if(p_dto.getPost_category().contains("ots"))
            			wishOtsPostList.add(p_dto);
            		else if(p_dto.getPost_category().contains("code"))
            			wishCodePostList.add(p_dto);
            	}
            	System.out.println("외주 갯수 : "+wishOtsPostList.size());
            	System.out.println("소스코드 갯수 : "+wishCodePostList.size());
            	for(int i = 0; i < wishOtsPostList.size()/3+1; i++){
            		if(i*3 != wishOtsPostList.size()){
            	%>
                <div class="wishlist-content-rows">
                	<%
            		}
            		for(int j = 0; j < 3; j++){
            			if(3*i+j == wishOtsPostList.size()){
            				break;
            			}
	            		PostDTO post = new PostDAO().showPostDetail(wishOtsPostList.get(3*i+j).getPost_num());
	            		PortfolioDTO pf = new PortfolioDAO().showImage(wishOtsPostList.get(3*i+j).getMem_email());
                	%>
                    <article id="article-tag<%=post.getPost_num()%>" class="wishlist-content-detail">
						<a href="PostDetail.jsp?post_num=<%=post.getPost_num()%>" class="block hov-img0">
							
							<!-- 게시물 사진 -->
							<div class="block-img">
								<div class="block-b">
									<div class="block-c">
										<div class="block-img">
											<%if(pf != null){%>
												<img src="./file/<%= pf.getPf_file()%>" class="block-img-radius">
											<%}else if(pf == null){%>
												<img alt="사진이 없을 때" src="./assets/cssImg/간단한웹사이트.jpg" height=200px class="block-img-radius">	
											<%}%>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 찜 버튼 -->
							<div>
								<button id="wish-btn<%=post.getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishClick('<%=post.getPost_num() %>', this.id, <%=post.getPost_category()%>)">
									<span class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										
										<%int compareResult=0; %>
										
										<%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%>
										
										<%-- <%if(compareResult == 0) {%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color" class="icon-heart2 dis-block trans-04 ab-t-l" src="./assets/cssImg/heart-fill.svg"/>
										<%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->										
											<img id="btn-color" class="icon-heart1 dis-block trans-04" src="./assets/cssImg/heart.svg"/>
										<%-- <%} %> --%>
										
									</span>
								</button>
							</div>
							
							<!-- 작성자 -->
							<div class="block-txt">
								
								<!-- 제목, 작성자, 가격 -->
								<div class="block-txt-name">
									<span class="block-txt-nametxt"><%=post.getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=post.getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=post.getPost_price()%>원</span>
								</div>
								
								<!-- 평점 -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="별" src="./assets/cssImg/star-fill.svg">
									</span>
									<%
										double avg_strt = 0;
										for(int k = 0; k < starratingList.size(); k++) {
											if(post.getPost_num().intValue() == starratingList.get(k).getPost_num().intValue()){
												avg_strt = starratingList.get(k).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
				<%
            		}
					if(i * 3 != wishOtsPostList.size()){
				%>
                </div>
                <%
					}
           		}
				%>
            </div>
        </div>
        <div class="wishlist-code">
            <div class="wishlist-code-head">
                소스코드
            </div>
            <hr>
            <div class="wishlist-content">
            	<%
            	for(int i = 0; i < wishCodePostList.size()/3+1; i++){
            		if(i*3 != wishCodePostList.size()){
            	%>
                <div class="wishlist-content-rows">
                	<%
            		}
            		for(int j = 0; j < 3; j++){
            			if(3*i+j == wishCodePostList.size()){
            				break;
            			}
	            		PostDTO post = new PostDAO().showPostDetail(wishCodePostList.get(3*i+j).getPost_num());
	            		PortfolioDTO pf = new PortfolioDAO().showImage(wishCodePostList.get(3*i+j).getMem_email());
                	%>
                    <article id="article-tag<%=post.getPost_num()%>" class="wishlist-content-detail">
						<a href="PostDetail.jsp?post_num=<%=post.getPost_num()%>" class="block hov-img0">
							
							<!-- 게시물 사진 -->
							<div class="block-img">
								<div class="block-b">
									<div class="block-c">
										<div class="block-img">
											<%if(pf != null){%>
												<img src="./file/<%= pf.getPf_file()%>" class="block-img-radius">
											<%}else if(pf == null){%>
												<img alt="사진이 없을 때" src="./assets/cssImg/간단한웹사이트.jpg" height=200px class="block-img-radius">	
											<%}%>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 찜 버튼 -->
							<div>
								<button id="wish-btn<%=post.getPost_num()%>" class="block-heart flex-r p-t-3" onclick="wishClick('<%=post.getPost_num() %>', this.id, <%=post.getPost_category()%>)">
									<span class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										
										<%int compareResult=0; %>
										
										<%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%>
										
										<%-- <%if(compareResult == 0) {%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color" class="icon-heart2 dis-block trans-04 ab-t-l" src="./assets/cssImg/heart-fill.svg"/>
										<%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->										
											<img id="btn-color" class="icon-heart1 dis-block trans-04" src="./assets/cssImg/heart.svg"/>
										<%-- <%} %> --%>
										
									</span>
								</button>
							</div>
							
							<!-- 작성자 -->
							<div class="block-txt">
								
								<!-- 제목, 작성자, 가격 -->
								<div class="block-txt-name">
									<span class="block-txt-nametxt"><%=post.getMem_email() %></span>
								</div>
								<h3 class="block-txt-title"><%=post.getPost_title() %></h3>
								<div class="block-txt-price">
									<span class="block-txt-pricetxt"><%=post.getPost_price() %>원</span>
								</div>
								
								<!-- 평점 -->
								<div class="review">
									<span class="review-icon">
										<img class="icon-star" alt="별" src="./assets/cssImg/star-fill.svg">
									</span>
									<%
										double avg_strt = 0;
										for(int k = 0; k < starratingList.size(); k++) {
											if(post.getPost_num().intValue() == starratingList.get(k).getPost_num().intValue()){
												avg_strt = starratingList.get(k).getReview_starrating().doubleValue();
											}
										}
									%>
									<span class="score"><%=String.format("%.1f", avg_strt) %></span>
								</div>
							</div>
						</a>
					</article>
				<%
            		}
					if(i * 3 != wishCodePostList.size()){
				%>
                </div>
                <%
					}
           		}
				%>
            </div>
        </div>
    </div>
		</div>
	</main>
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
<!-- 페이지 상단 -->
<%if(info == null) {%>
	<p>로그인 해주세요</p>
<%} else{ %>
	<h1>DDock</h1>
	<div>
	    <h3>검색</h3>
	    <form action="SerchMain.jsp" method="get">
	        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput">
	        <input type="submit" value="검색">
		    <ul id="suggest-list"></ul> 
	    </form>
	</div>
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a>
		<a href="MyPage.jsp">마이페이지</a>
		<a href="LogoutService.do">로그아웃</a>
		<ul>
			<li><a href="EditInfo.jsp">내정보 수정</a></li>
			<li><a href="EditPost.jsp">게시글 관리</a></li>
			<li><a href="ChatMain.jsp">채팅</a></li>
			<li><a href="WishList.jsp">찜 목록</a></li>
			<li><a href="ReviewList.jsp">리뷰목록</a></li>
		</ul>
	</div>
	<div>
		<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">외주</a>
		<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a>
		<a href="SiteIntroduce.jsp">사이트소개</a>
		<a href="FAQ.jsp">FAQ</a>
	</div>

<!-- 찜목록 -->
	<div>
		<nav>
			<div>나의 찜목록</div>
			<div>div 높이 넓이 조정해서 선으로 만들기</div>
			<section>
				<div>서비스</div>
				<div>div 높이 넓이 조정해서 선으로 만들기</div>
			</section>
			<div>
				<div>전체(<span id="all-cont"><%=wishList.size() %></span>)</div>
				<%
					int otsCont = 0;
					int codeCont = 0;
				
					for(int i = 0; i < wishList.size(); i++) {
						if(wishList.get(i).getPost_category().equals("ots_web") || wishList.get(i).getPost_category().equals("ots_app")) {
							otsCont++;	
						} else if(wishList.get(i).getPost_category().equals("code_web") || wishList.get(i).getPost_category().equals("code_app")){
							codeCont++;							
						} else {
							
						}
					}
					out.print("<div>외주(<span id='ots-cont'>"+otsCont+"</span>)</div>");
					out.print("<div>소스코드(<span id='code-cont'>"+codeCont+"</span>)</div>");
				%>
			</div>
		</nav>
		
		<div>
			<div>
				<div id="article-group">
					<%for(int i = 0; i < wishList.size(); i++) {%>
						<article id="article-tag<%=wishList.get(i).getPost_num()%>">
								<div>사진: <%=wishList.get(i).getPost_file() %></div>
								<div>
									<button id="wish-btn<%=wishList.get(i).getPost_num()%>" onclick="wishClick('<%=wishList.get(i).getPost_num() %>', this.id, '<%=wishList.get(i).getPost_category()%>')">
										<span>
											<svg>
												<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/>
											</svg>
										</span>
									</button>
								</div>
							<a href="PostDetail.jsp?post_num=<%=wishList.get(i).getPost_num()%>">
								<div>
									<div>작성자 : <%=wishList.get(i).getMem_email() %></div>
									<div>제목 : <%=wishList.get(i).getPost_title() %></div>
									<div>가격 : <%=wishList.get(i).getPost_price() %></div>
									<div>
										<%
											double avg_strt = 0;
											for(int j = 0; j < starratingList.size(); j++) {
												if(wishList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
													avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
												}
											}
											out.print("<div>★|"+ String.format("%.1f", avg_strt)+"</div>");												
										%>
									</div>
								</div>
							</a>
						</article>
					<%} %>
				</div>
			</div>
		</div>
	</div>	
<%} %>
<!-- script -->	
	<!-- 2022-11-02 / 김지수 / 검색 제안어 기능 추가 -->
	<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="./assets/js/SuggestWord.js"></script>
	
	<!-- 2022-11-07 / 김지수 / 찜 버튼 기능 추가 -->
	<script src="./assets/js/WishBtn.js"></script>
</body>
</html>