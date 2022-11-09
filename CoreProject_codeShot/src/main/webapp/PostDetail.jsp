<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
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
		//게시물 번호 가져오기
		BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
		System.out.print(postNum);
		PostDTO post = new PostDAO().showPostDetail(postNum);
		
		//글쓴이 이메일, 포트폴리오 가져오기
		List<PortfolioDTO> portfolioList = new PortfolioDAO().showWriterPortfolio(post.getMem_email());
	%>
	<!-- 페이지 상단 -->
	<div>
		<h3>비회원</h3>
		<button>로그인</button>
		<a href="JoinSelect.jsp"><button>회원가입</button></a>
	</div>
	<div>
		<h3>회원</h3>
		<a href="PostWrite.jsp">판매하기</a>
		<a href="MyPage.jsp">마이페이지</a>
		<ul>
			<li><a href="EditInfo.jsp">내정보 수정</a></li>
			<li><a href="EditPost.jsp">게시글 관리</a></li>
			<li><a href="PortfolioWrite.jsp">포트폴리오 관리</a></li>
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
	
	<!-- 게시물 상세페이지  -->
	<div>
		<h1><%= post.getPost_title() %></h1>
		<fieldset>
			<%= post.getPost_price() %>원
			<br>
			<a href="Payment.jsp?postNum=<%=postNum%>"><button>구매하기</button></a>
		</fieldset>
		<fieldset>
			<a href="CreateChatRoomService.do?sellerEmail=<%=post.getMem_email()%>&postTitle=<%=post.getPost_title()%>"><button>문의하기</button></a>
		</fieldset>
	</div>
	
	<div>
		<% if(portfolioList.size()!=0){ %>
				<img src="file/<%= portfolioList.get(0).getPf_file() %>">
		<% 	} %>
		<ul>
			<li> 포트폴리오 </li>
			<li> 서비스 설명 </li>
			<li> 의뢰인 주의사항 </li>
			<li> 사용툴(버전) </li>
			<li> 리뷰 </li>
		</ul>
		<h3> 포트폴리오</h3>
		
		<% if(portfolioList.size()!=0){
				for(PortfolioDTO dto : portfolioList){ %>
					<img src="file/<%= dto.getPf_file()%>">
				<% } 
			}%>
		<h3> 서비스 설명 </h3>
		<%= post.getPost_explain() %>
		<h3> 의뢰인 주의사항 </h3>
		<%= post.getPost_precautions() %>
		<h3> 사용툴(버전) </h3>
		<%= post.getPost_standard() %>
		<h3> 리뷰 </h3>
	</div>
</body>
</html>