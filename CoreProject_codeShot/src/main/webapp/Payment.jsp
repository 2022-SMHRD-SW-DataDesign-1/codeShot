<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.codeshot.model.PortfolioDAO"%>
<%@page import="com.codeshot.model.PortfolioDTO"%>
<%@page import="java.util.List"%>
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
	BigDecimal postNum = new BigDecimal(request.getParameter("postNum"));
	PostDTO post = new PostDAO().showPostDetail(postNum);
	List<PortfolioDTO> portfolioList = new PortfolioDAO().showWriterPortfolio(post.getMem_email());
	%>
	<div>
		<div>
			<p>이미지</p>
			<%
			if(portfolioList.size() != 0){
			%>
			<img src="file/<%=portfolioList.get(0).getPf_file()%>">
			<%
			}
			%>
			<p><%=post.getPost_title()%></p><!-- 게시물 제목 -->
			<P><%=post.getMem_email()%></P><!-- 게시자 이메일 -->
		</div>
		<div>
			<p>상품 설명 : <%=post.getPost_explain()%></p>
			<p>상품 규격 : <%=post.getPost_standard()%></p>
			<p>상품 주의사항 : <%=post.getPost_precautions()%></p>
			<p>가격 : <%=post.getPost_price() %></p>
		</div>
	</div>
	<div>
		<h3>결제 금액 : <%=post.getPost_price()%></h3>
		<input type="checkbox" id="paymentCheck" value="주문내용을 확인하였으며,결제에 동의합니다.(필수)">
		<button id="paymentBtn">결제하기</button>
	</div>

	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script type="text/javascript">
		let paymentMethod = "네이버 페이";
		let paymentBtn = document.getElementById("paymentBtn");
		
		paymentBtn.addEventListener("click",function(){
			let paymentCheck = document.getElementById("paymentCheck").checked;
			if(paymentCheck)
			{
				IMP.init('imp20723724');
				// IMP.request_pay(param, callback) 결제창 호출
			      IMP.request_pay({ // param
			          pg: "html5_inicis",
			          pay_method: "card",
			          merchant_uid: "ORD20180131-0000011",
			          name: "노르웨이 회전 의자",
			          amount: 100,
			          buyer_email: "gildong@gmail.com",
			          buyer_name: "홍길동",
			          buyer_tel: "010-4242-4242",
			          buyer_addr: "서울특별시 강남구 신사동",
			          buyer_postcode: "01181"
			      }, function (rsp) { // callback
			    	  console.log(rsp);
		    	    if (rsp.success) {
		    	      var msg = '결제가 완료되었습니다.';
		    	      alert(msg);
		    	    } else {
		    	      var msg = '결제에 실패하였습니다.';
		    	      msg += '에러내용 : ' + rsp.error_msg;
		    	      alert(msg);
		    	      location.href = "ReviewList.jsp"
		    	    }
			      });
			}
			else
			{
				alert("체크박스를 체크해주세요!")
			}
		});
		
	</script>
</body>
</html>