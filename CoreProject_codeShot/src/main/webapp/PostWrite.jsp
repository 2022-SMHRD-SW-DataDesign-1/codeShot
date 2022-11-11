<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매하기</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="assets/css/PostWrite.css">
<link rel="stylesheet" type="text/css" href="assets/css/FAQ.css">
</head>
<!-- 2022-11-01-고정연/게시글 작성 페이지 html -->
<body> 
	<!-- Header  -->
	<header>
		<!-- 로고 이미지 -->
		<a href="Main.jsp" class="logo"> 
		<img src="./assets/cssImg/logo.png" alt="IMG-LOGO" width="150px" height="50px">
		</a>
	</header>
	
	<!-- Main -->
	<main>
		<div class="post-write-table">
			<form action="PostService.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>  제목 </td>
						<td colspan="2"> <input type="text" name="post_title" placeholder="제목을 입력해주세요."> </td>
					</tr>
					<tr>
						<td rowspan="2"> 카테고리 </td>
						<td> 상위 카테고리 </td>
						<td>
							<select>
								<option> IT </option>
							</select>
						</td>
					</tr>
					<tr>
						<td> 하위 카테고리 </td>
						<td>
							<select name="post_category">
								<option value="ots_web"> 외주(WEB) </option>
								<option value="ots_app"> 외주(APP) </option>
								<option value="code_web"> 소스코드(WEB) </option>
								<option value="code_app"> 소스코드(APP) </option>
							</select>
						</td>
					</tr>
					<tr>
						<td> 가격 </td>
						<td> <input type="text" name="post_price"> </td>
						<td> 원 </td>
					</tr>
					<tr>
						<td> 소스코드 파일 </td>
						<td> <input type="file" name="post_file"> </td>	
					</tr>
					<tr>
						<td> 서비스 설명 </td>
						<td colspan="2"> <textarea name="post_explain" placeholder="내용을 입력해주세요"></textarea> </td>
					</tr>
					<tr>
						<td> 의뢰인 주의사항 </td>
						<td colspan="2"> <textarea name="post_precautions" placeholder="내용을 입력해주세요"></textarea> </td>
					</tr>
					<tr>
						<td> 사용 툴(버전) </td>
						<td colspan="2"> <textarea name="post_standard" placeholder="내용을 입력해주세요"></textarea> </td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td> <input type="submit" value="제출하기"></td>
					</tr>
				</table>
				
			</form>
		</div>
	</main>
</body>
</html>