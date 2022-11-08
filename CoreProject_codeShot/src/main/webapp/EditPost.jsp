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
<title>Insert title here</title>
</head>
<body>
	<%
		UserDTO info = (UserDTO) session.getAttribute("info"); 
		
		List<PostDTO> postList = new PostDAO().showMyPost(info.getEmail());
		
		List<PortfolioDTO> portfolioList = new PortfolioDAO().showPortfolio(info.getEmail());
	%>
	<!-- 페이지 상단 -->
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a>
		<a href="MyPage.jsp">마이페이지</a>
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
		<a href="PostMain.jsp?postType=outsourcingPost" id="outsourcingPost">외주</a>
		<a href="PostMain.jsp?postType=codePost" id="codePost">소스코드</a>
		<a href="SiteIntroduce.jsp">사이트소개</a>
		<a href="FAQ.jsp">FAQ</a>
	</div>
	
	<!-- 게시물 목록 -->
	<div>
		<ul>
			<%	for(PostDTO dto : postList) { %>
					<a href="PostDetail.jsp?post_num=<%=dto.getPost_num()%>">
						<ol>
							<li> 
								<% if(portfolioList.size()!=0){ %>
										<img src="file/<%= portfolioList.get(0).getPf_file() %>">
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
</body>
</html>