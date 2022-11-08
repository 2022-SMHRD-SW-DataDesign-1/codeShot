<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeshot.model.UserDTO"%>
<%@page import="com.codeshot.model.WishListDTO"%>
<%@page import="com.codeshot.model.WishListDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchMain</title>
</head>
<body>
<%
	UserDTO info = (UserDTO)session.getAttribute("info");

	String userInput = request.getParameter("userInput");
	System.out.println(userInput);

	PostDAO dao = new PostDAO();
	List<PostDTO> postList = dao.searchPost(userInput);
	
	WishListDAO w_dao = new WishListDAO();
	List<WishListDTO> wishList = w_dao.wishList(info.getEmail());
	
	ReviewDAO r_dao = new ReviewDAO();
	List<ReviewDTO> starratingList = r_dao.starratingList();
	
	ArrayList<BigDecimal> whishPostNumList = new ArrayList<>();
	
	
	System.out.print("찜 된 게시글 번호");
	for(int i = 0; i<wishList.size(); i++){
		whishPostNumList.add(wishList.get(i).getPost_num());
		System.out.print(whishPostNumList.get(i)+" ");
	}
	System.out.println();
	
	System.out.println("찜목록 길이"+whishPostNumList.size());
	
	
%>
<div>
	<div>
	    <h3>검색</h3>
	    <form action="SerchMain.jsp" method="get">
	        <input id="search-input-box" onkeyup="addList(this)" type="text" name="userInput">
	        <input type="submit" value="검색">
		    <ul id="suggest-list"></ul> 
	    </form>
	</div>
	<div>
		<h3>비회원</h3>
		<button>로그인</button>
		<a href="JoinSelect.jsp"><button>회원가입</button></a>
	</div>
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a> <a href="MyPage.jsp">마이페이지</a>
		<ul>
			<li><a href="EditInfo.jsp">내정보 수정</a></li>
			<li><a href="EditPost.jsp">게시글 관리</a></li>
			<li><a href="ChatMain.jsp">채팅</a></li>
			<li><a href="WishList.jsp">찜 목록</a></li>
			<li><a href="ReviewList.jsp">리뷰목록</a></li>
			<li><a href="LogoutService.do">로그아웃</a></li>
		</ul>
	</div>
	<div>
		<a href="PostMain.jsp?postType=outsourcingPost">외주</a> <a
			href="PostMain.jsp?postType=codePost">소스코드</a> <a
			href="SiteIntroduce.jsp">사이트소개</a> <a href="FAQ.jsp">FAQ</a>
	</div>
	<section>
		<%=userInput%>에 대한 결과입니다.
		<%System.out.print("post size : "+postList.size()); %>
	</section>

	<%if(postList.size()<1){%>
		<div>검색 결과가 없습니다.</div>
	<%} else {%>
		<div><%=postList.size() %>개의 서비스 결과</div>
	<%} %>
	
	
	<div>
		<div>
			<div id="article-group">
				<%for(int i=0; i<postList.size();i++){%>
					<article id="article-tag<%=postList.get(i).getPost_num()%>">
							<div>사진: <%=postList.get(i).getPost_file() %></div>
							<div>
								<button id="wish-btn<%=postList.get(i).getPost_num()%>" onclick="wishPostClick('<%=postList.get(i).getPost_num() %>', this.id)">
									<span>
										<svg>
											<%for(int j = 0; j < whishPostNumList.size(); j++) {%>
												<%int compareResult = whishPostNumList.get(j).compareTo(postList.get(i).getPost_num()); %>
												<%if(compareResult == 0) {%>
													<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red"/>
												<%} else{%>
													<circle id="btn-color" cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="none"/>												
												<%} %>
											<%} %>
										</svg>
									</span>
								</button>
							</div>
						<a href="PostDetail.jsp?post_num=<%=postList.get(i).getPost_num()%>">
							<div>
								<div>작성자 : <%=postList.get(i).getMem_email() %></div>
								<div>제목 : <%=postList.get(i).getPost_title() %></div>
								<div>가격 : <%=postList.get(i).getPost_price() %></div>
								<div>
									<%
										double avg_strt = 0;
										for(int j = 0; j < starratingList.size(); j++) {
											if(postList.get(i).getPost_num().intValue() == starratingList.get(j).getPost_num().intValue()){
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


<!-- script -->
<!-- 2022-11-02 / 김지수 / 검색 제안어 기능 추가 -->
<script src="./assets/jquery/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="./assets/js/SuggestWord.js"></script>

<!-- 2022-11-07 / 김지수 / 찜 버튼 기능 추가 -->
<script src="./assets/js/WishBtn.js"></script>
</body>
</html>