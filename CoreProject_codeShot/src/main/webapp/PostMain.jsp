<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="icon" type="image/png" href="images/icons/favicon.png" />

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">


<link rel="stylesheet" type="text/css" href="./assets/css/header.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/util.css">
<link rel="stylesheet" type="text/css" href="./assets/css/FAQ.css">
<link rel="stylesheet" type="text/css" href="./assets/css/body.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/MyPageList.css">


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

#side_menu_wrapper .guide-line {
	background-color: rgb(189, 244, 236) !important;
}

.blocks {
	grid-template-columns: repeat(3, 0fr) !important;
}
</style>

</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	String isExpert = "";

	String postType = request.getParameter("postType");

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.showPost();
	PortfolioDTO pf;

	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();

	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = null;

	ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();
	%>
	<!-- ----------------------------------------------------------------------------------------------------------------------- -->
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

						<!-- 비회원 -->
						<%
						} else if (info == null) {
						%>
						<a href="Login.jsp" class="flex-c-m trans-04 p-lr-25"> <b>로그인</b>
						</a> <a href="JoinSelect.jsp" class="flex-c-m trans-04 p-lr-25"> <b>회원가입</b>
						</a>
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

	<!-- ----------------------------------------------------------------------------------------------------------------------- -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- ----------------------------------------------------------------------------------------------------------------------- -->




	<!-- Main -->

	<%
	System.out.println(postType);
	if (postType.equals("outsourcingPost")) {
		postType = "ots";
	} else if (postType.equals("codePost")) {
		postType = "code";
	}
	%>


	<%
	String postCategory = "";

	if (postType.contains("ots")) {
		postCategory = "외주";
	} else if (postType.contains("code")) {
		postCategory = "소스코드";
	}
	%>

	<%
	System.out.println("postType : " + postType);
	%>

	<!-- CSS 적용 전 -->

	<main>
		<!-- ///////////////////////////////////////////////////////////////////////   -->
		<!-- 사이드바 -->
		<%-- 			<!-- CSS 적용 전 -->
			<div>
				<ul>				
					<li><a href="PostMain.jsp?postType=<%=postType%>_web">Web</a></li>
					<li><a href="PostMain.jsp?postType=<%=postType%>_app">App</a></li>
				</ul>
			</div>

			<ul>
			<%
			for(PostDTO dto : postList) { 
				pf = new PortfolioDAO().showImage(dto.getMem_email());
				if(dto.getPost_category().equals(postType)){
			%>
				<a href="PostDetail.jsp?post_num=<%=dto.getPost_num()%>">
					<li>게시물1</li>
					<ol>
						<li>
							<%
							if(pf != null){
							%>
								<img src="./file/<%= pf.getPf_file()%>">
							<%
							}else if(pf == null){
							%>
								<img alt="" src="./assets/essImg/간단한웹사이트.jpg">
							<%
							}
							%>
						</li>
						<li><%= dto.getPost_title() %></li> <!-- 제목 -->
						<li><%= dto.getMem_email() %></li> <!-- 글쓴이 -->
					</ol>
				</a>
			<%
				}
			}
			%>
			</ul> --%>

		<div class="flex margin-top-60 margin-left-20">
			<div class="side-menu-wrapper">
				<div data-v-17364d77="" id="side_menu_wrapper"
					class="MyPageSideMenu isSellerMinHeight">
					<div data-v-17364d77="" class="side-menu-title-wrapper NGB">
						<%=postCategory%>
					</div>

					<div data-v-17364d77="" class="guide-line"></div>

					<div data-v-17364d77="" class="menu-list-wrapper">
						<ul data-v-17364d77="" id="side_menu_main_group"
							class="main-menu-wrapper">
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="PostMain.jsp?postType=<%=postType%>_web" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										<b>웹</b>
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="PostMain.jsp?postType=<%=postType%>_web" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										홈페이지(웹빌더·CMS)<br>홈페이지(카페24)<br>홈페이지(워드프레스)<br>랜딩페이지<br>프론트엔드·퍼블리싱<br>검색최적화·SEO<br>애널리틱스<br>홈페이지
										수정·유지보수
									</div>
							</a></li>
							<br>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="PostMain.jsp?postType=<%=postType%>_app" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										<b>앱</b>
									</div>
							</a></li>
							<li data-v-17364d77="" class="panel"><a data-v-17364d77=""
								href="PostMain.jsp?postType=<%=postType%>_app" target="_self"
								class="flex-left-center flex-align-baseline">
									<div data-v-17364d77="" class="new-label-wrapper">
										네이티브<br>하이브리드<br>크로스플랫폼<br>앱 수정·유지보수
									</div>
							</a></li>
						</ul>
					</div>
				</div>

			</div>
			<%
			if (info != null) {
			%>
			<!-- 회원 -->
			<!-- 게시물 출력 부분 -->
			<div>
				<%
				wishList = w_dao.wishList(info.getEmail());
				System.out.print("찜 된 게시글 번호");
				for (int i = 0; i < wishList.size(); i++) {
					whishPostNumList.add(wishList.get(i).getPost_num());
					System.out.print(whishPostNumList.get(i) + " ");
				}
				System.out.println();

				System.out.println("찜목록 길이" + whishPostNumList.size());
				%>

				<section class="section-view">
					<div class="blocks">
						<%
						for (int i = 0; i < postList.size(); i++) {
						%>
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						%>
						<article id="article-tag<%=postList.get(i).getPost_num()%>">
							<a
								href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>"
								class="block hov-img0"> <!-- 게시물 사진 -->
								<div class="block-img">
									<div class="block-b">
										<div class="block-c">
											<div class="block-img">
												<%
												if (pf != null) {
												%>
												<img src="./file/<%=pf.getPf_file()%>"
													class="block-img-radius">
												<%
												} else if (pf == null) {
												%>
												<img alt="사진이 없을 때" src="./assets/cssImg/간단한웹사이트.jpg"
													height=200px class="block-img-radius">
												<%
												}
												%>
											</div>
										</div>
									</div>
								</div> <!-- 찜 버튼 -->
								<div>
									<button id="wish-btn<%=postList.get(i).getPost_num()%>"
										class="block-heart flex-r p-t-3"
										onclick="wishPostClick('<%=postList.get(i).getPost_num()%>', this.id)">
										<span
											class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">

											<%
											int compareResult = 0;
											%> <%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%> <%-- <%if(compareResult == 0) {%> --%> <!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color"
											class="icon-heart2 dis-block trans-04 ab-t-l"
											src="./assets/cssImg/heart-fill.svg" /> <%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->
											<img id="btn-color" class="icon-heart1 dis-block trans-04"
											src="./assets/cssImg/heart.svg" /> <%-- <%} %> --%>

										</span>
									</button>
								</div> <!-- 작성자 -->
								<div class="block-txt">

									<!-- 제목, 작성자, 가격 -->
									<div class="block-txt-name">
										<span class="block-txt-nametxt"><%=postList.get(i).getMem_email()%></span>
									</div>
									<h3 class="block-txt-title"><%=postList.get(i).getPost_title()%></h3>
									<div class="block-txt-price">
										<span class="block-txt-pricetxt"><%=postList.get(i).getPost_price()%>원</span>
									</div>

									<!-- 평점 -->
									<div class="review">
										<span class="review-icon"> <img class="icon-star"
											alt="별" src="./assets/cssImg/star-fill.svg">
										</span>
										<%
										double avg_strt = 0;
										for (int j = 0; j < starratingList.size(); j++) {
											if (postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()) {
												avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
											}
										}
										%>
										<span class="score"><%=String.format("%.1f", avg_strt)%></span>
									</div>
								</div>
							</a>
						</article>
						<%
						}
						%>
					</div>
				</section>

				<%
				} // if 끝

				/* ////////////////////////////////////////////////////////////////////////////////////////// */

				else if (info == null) {
				%>
				<!-- 비회원 -->
				<!-- 게시글 출력 부분 -->
				<div>
					<!-- <section class="section-view"> -->
					<div class="blocks">
						<%
						for (int i = 0; i < postList.size(); i++) {
						%>
						<%
						pf = new PortfolioDAO().showImage(postList.get(i).getMem_email());
						if (postList.get(i).getPost_category().contains(postType)) {
						%>
						<article id="article-tag<%=postList.get(i).getPost_num()%>">
							<a
								href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>"
								class="block hov-img0"> <!-- 게시물 사진 -->
								<div class="block-img">
									<div class="block-b">
										<div class="block-c">
											<div class="block-img">
												<%
												if (pf != null) {
												%>
												<img src="./file/<%=pf.getPf_file()%>"
													class="block-img-radius">
												<%
												} else if (pf == null) {
												%>
												<img alt="사진이 없을 때" src="./assets/cssImg/간단한웹사이트.jpg"
													height=200px class="block-img-radius">
												<%
												}
												%>
											</div>
										</div>
									</div>
								</div> <!-- 찜 버튼 -->
								<div>
									<button id="wish-btn<%=postList.get(i).getPost_num()%>"
										class="block-heart flex-r p-t-3"
										onclick="wishPostClick('<%=postList.get(i).getPost_num()%>', this.id)">
										<span
											class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">

											<%
											int compareResult = 0;
											%> <%-- <%for(int j = 0; j < whishPostNumList.size(); j++) {%>
											<%compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
										<%} %> --%> <%-- <%if(compareResult == 0) {%> --%> <!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/> -->
											<img id="btn-color"
											class="icon-heart2 dis-block trans-04 ab-t-l"
											src="./assets/cssImg/heart-fill.svg" /> <%-- <%} else if(compareResult != 0){%> --%>
											<!-- <circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>	 -->
											<img id="btn-color" class="icon-heart1 dis-block trans-04"
											src="./assets/cssImg/heart.svg" /> <%-- <%} %> --%>

										</span>
									</button>
								</div> <!-- 작성자 -->
								<div class="block-txt">

									<!-- 제목, 작성자, 가격 -->
									<div class="block-txt-name">
										<span class="block-txt-nametxt"><%=postList.get(i).getMem_email()%></span>
									</div>
									<h3 class="block-txt-title"><%=postList.get(i).getPost_title()%></h3>
									<div class="block-txt-price">
										<span class="block-txt-pricetxt"><%=postList.get(i).getPost_price()%>원</span>
									</div>

									<!-- 평점 -->
									<div class="review">
										<span class="review-icon"> <img class="icon-star"
											alt="별" src="./assets/cssImg/star-fill.svg">
										</span>
										<%
										double avg_strt = 0;
										for (int j = 0; j < starratingList.size(); j++) {
											if (postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()) {
												avg_strt = starratingList.get(j).getReview_starrating().doubleValue();
											}
										}
										%>
										<span class="score"><%=String.format("%.1f", avg_strt)%></span>
									</div>
								</div>
							</a>
						</article>
						<%
						}
						}
						%>
					</div>
					<!-- 	</section> -->
				</div>

				<%
				if (postType.contains("ots")) {
					postType = "ots";
				} else if (postType.contains("code")) {
					postType = "code";
				}
				} //esle if 끝
				%>







			</div>
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

	<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- script -->

	<!-- 2022-11-02 / 김지수 / 검색 제안어 기능 추가 -->
	<script src="./assets/jquery/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>

	<!-- 추천어 검색 기능 시간되면 하기-디자인 적용이.... -->
	<!-- <script src="./assets/js/SuggestWord.js"></script> -->

	<!-- 찜 버튼 -->
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
	$('.js-addwish-b2').on('click', function(e){
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function(){
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		$(this).on('click', function(){
			// swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-b2');
			// $(this).off('click');
		});
	});
	
	document.querySelector('a').addEventListener("click",funtion(){
		<%if (postType.contains("ots")) {
	System.out.println("여기 실행됨1");
	postType = "ots";
} else if (postType.contains("code")) {
	System.out.println("여기 실행됨2");
	postType = "code";
}%>
	});
	
	
</script>

	<script src="assets/js/WishBtn.js"></script>

</body>
</html>