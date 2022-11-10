<%@page import="com.codeshot.model.ReviewDAO"%>
<%@page import="com.codeshot.model.ReviewDTO"%>
<%@page import="com.codeshot.model.PrchsDTO"%>
<%@page import="com.codeshot.model.PrchsDAO"%>
<%@page import="java.util.List"%>
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
	System.out.println("[리뷰목록 페이지]");

	UserDTO info = (UserDTO) session.getAttribute("info");

	//구매한 게시글 내역
	PrchsDAO p_dao = new PrchsDAO();
	List<PrchsDTO> prchList = p_dao.showPrchsList(info.getEmail());

	//리뷰작성한게시글 내역
	ReviewDAO r_dao = new ReviewDAO();
	ReviewDTO showReview;

	System.out.println("거래전체내역 : " + prchList.size());
	//System.out.println("리뷰작성한 게시글 내역 : " + showReviewList.size());
	%>
	<!-- 페이지 상단 -->
	<%
	if (info == null) {
	%>
	<p>로그인 해주세요</p>
	<%
	} else {
	%>
		<p>로그인 페이지</p>
	
		<h1>DDock</h1>
		<div>
			<h3>검색</h3>
			<form action="SerchMain.jsp" method="get">
				<input id="search-input-box" onkeyup="addList(this)" type="text"
					name="userInput"> <input type="submit" value="검색">
				<ul id="suggest-list"></ul>
			</form>
		</div>
		<div>
			<h3>회원</h3>
			<a href="PostWrite.jsp">판매하기</a> <a href="MyPage.jsp">마이페이지</a> <a
				href="LogoutService.do">로그아웃</a>
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
			<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a> <a
				href="SiteIntroduce.jsp">사이트소개</a> <a href="FAQ.jsp">FAQ</a>
		</div>
	
		<!-- 리뷰 작성안한 게시글 목록 -->
		<div>
			<nav>
				<ul>
					<li>작성가능한 리뷰</li>
					<li>작성한 리뷰</li>
				</ul>
			</nav>
		</div>
		<%
		for (int i = 0; i < prchList.size(); i++) {
			if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) == 0) {
		%>
			<div><%=prchList.get(i).getPost_num()%></div>
			<div><%=prchList.get(i).getMem_email()%></div>
			<div><%=prchList.get(i).getPrch_price()%></div>
			<div><%=prchList.get(i).getPrch_date()%></div>
			<a href="./ReviewWrite.jsp?post_num=<%=prchList.get(i).getPost_num()%>">리뷰작성하기</a>
			<%
			}
		}
		%>
	
		<!-- 리뷰 작성한 게시글 목록+ 리뷰내용 -->
		<h1>리뷰 작성한 게시글 목록</h1>
		
		<%
		for (int i = 0; i < prchList.size(); i++) {
			if (r_dao.checkReview(new ReviewDTO(prchList.get(i).getPost_num(), prchList.get(i).getMem_email())) > 0) {
			%>
			<fieldset>
			<div><%=prchList.get(i).getPost_num()%></div>
			<div><%=prchList.get(i).getMem_email()%></div>
			<div><%=prchList.get(i).getPrch_price()%></div>
			<div><%=prchList.get(i).getPrch_date()%></div>
				<%
				showReview = r_dao.showReview(new ReviewDTO(prchList.get(i).getPost_num(),info.getEmail()));
				%>
				<div><%=showReview.getReview_content()%></div>
				<div><%=showReview.getReview_starrating()%></div>
				<a href="./ReviewList.jsp">수정하기</a>
				<a href="./ReviewList.jsp>">삭제하기</a>
				</fieldset>
			<%
			}
			%>
		<%	
		}
		%>
	<%
	}
	%>
	
</body>
</html>