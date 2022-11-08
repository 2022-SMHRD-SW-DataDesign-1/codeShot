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
<title>Insert title here</title>
</head>
<body>
<%	
	System.out.println("[찜목록 페이지]");

	// 로그인 정보
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = w_dao.wishList(info.getEmail());
	
	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();
	
	System.out.println("찜 게시글 리스트: "+wishList.size());
	System.out.println("별점 리스트: "+starratingList.size());
%>
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