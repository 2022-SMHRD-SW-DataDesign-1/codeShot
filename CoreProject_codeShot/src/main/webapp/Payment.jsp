<%@page import="com.codeshot.model.UserDTO"%>
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
<link rel="stylesheet" type="text/css" href="./assets/css/payment.css">
<style type="text/css">
	body{
		display: flex;
		align-items: center;
		flex-direction: column;
	}
	.logoimage{
		width: 200px;
		height: 100%;
	}
	.logo-area{
		margin-bottom: 30px;
	}
</style>
</head>
<body>
	<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	BigDecimal postNum = new BigDecimal(request.getParameter("postNum"));
	PostDTO post = new PostDAO().showPostDetail(postNum);
	List<PortfolioDTO> portfolioList = new PortfolioDAO().showWriterPortfolio(post.getMem_email());
	%>
	<div class="logo-area">
		<a href="Main.jsp"><img src="./assets/cssImg/logo.png" class="logoimage"></a>
	</div>	
	<div class="outsourcing-container">
        <div class="payment-title">
            <h1>결제하기</h1>
        </div>
        <div class="pay-area">
            <div class="order-area">
                <div class="order-history">
                    <h3>주문 내역</h3>
                    <div class="order-disc">
                        <div class="order-img">
                        	<%
							if(portfolioList.size() != 0){
							%>
							<img src="file/<%=portfolioList.get(0).getPf_file()%>" class="post-image">
							<%
							}
							%>
                        </div>
                        <div class="order-detail">
                            <p class="post-name"><%=post.getPost_title()%></p>
                            <p class="seller-email"><%=post.getMem_email()%></p>
                        </div>
                    </div>
                    <div class="order-disc code-select">
                        <p class="edit-request-head-text">수정요청 선택</p>
                        <div class="edit-request">
                            <label><input type="radio" name="edit-request">네</label>
                            <label><input type="radio" name="edit-request">아니요</label>
                        </div>
                        <div class="edit-request-content">
                            <p class="edit-request-head-text">수정 가능한 내용</p>
                            <div class="edit-request-text">
                                <textarea placeholder="여기에 수정내용을 입력해주세요."></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="post-discreption">
                    <div class="post-detail">
                        <div>
                            <p class="detail-head">설명</p>
                            <p class="detail-content"><%=post.getPost_explain()%></p>
                        </div>
                        <div>
                            <p class="detail-head">규격</p>
                            <p class="detail-content"><%=post.getPost_standard()%></p>
                        </div>
                        <div>
                            <p class="detail-head">주의사항</p>
                            <p class="detail-content"><%=post.getPost_precautions()%></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="paybtn-area">
                <div class="paybtn-area-detail">
                    <div class="price-area">
                        <span>결제금액</span>
                        <span class="price"><%=post.getPost_price()%>원</span>
                    </div>
                    <div class="btn-area">
                        <label><input type="checkbox" id="paymentCheck">주문 내용을 확인하였으며, 결제에 동의합니다.(필수)</label>
                        <button id="paymentBtn" class="paybtn">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script type="text/javascript">

		let paymentBtn = document.getElementById("paymentBtn");
		
		if('<%=post.getPost_category()%>'.includes('ots'))
		{
			document.querySelector('.code-select').style.display = 'none';
		}
		
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
			          name: "<%=post.getPost_category()%>",
			          amount: "<%=post.getPost_price()%>",
			          buyer_email: "<%=info.getEmail()%>",
			          buyer_name: "<%=info.getName()%>",
			          buyer_tel: "<%=info.getPhone()%>",
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
		    	      location.href = "MyPage.jsp"
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