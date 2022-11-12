<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./assets/cssImg/title-icon.png">
<title>DDock</title>
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
		 <br><br>
			<form action="PostService.do" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<th>  제목 </th>
							<td colspan="2"> <input type="text" name="post_title" placeholder=" 제목을 입력해주세요."> </td>
						</tr>
						<tr>
							<th rowspan="2"> 카테고리 </th>
							<td class="sub-category"> 상위 카테고리 </td>
							<td>
								<select>
									<option> IT </option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="sub-category"> 하위 카테고리 </td>
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
							<th> 가격 </th>
							<td> <input type="text" class="price-input" name="post_price"> </td>
							<td> 원 </td>
						</tr>
						<tr>
							<th> 소스코드<br>파일 </th>
							<td> <input type="file" name="post_file"> </td>	
						</tr>
						<tr>
							<th> 서비스<br>설명 </th>
							<td colspan="2"> <textarea name="post_explain" placeholder="내용을 입력해주세요"></textarea> </td>
						</tr>
						<tr>
							<th> 의뢰인<br>주의사항 </th>
							<td colspan="2"> <textarea name="post_precautions" placeholder="내용을 입력해주세요"></textarea> </td>
						</tr>
						<tr>
							<th> 사용 툴<br>(버전) </th>
							<td colspan="2"> <textarea name="post_standard" placeholder="내용을 입력해주세요"></textarea> </td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td class="submit-btn"> <input type="submit" class="btn btn-info" value="제출하기"></td>
						</tr>
					</table>
			</form>
		</div>
	</main>
</body>
</html>