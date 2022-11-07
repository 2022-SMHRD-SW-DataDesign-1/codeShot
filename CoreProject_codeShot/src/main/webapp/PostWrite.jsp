<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 2022-11-01-고정연/게시글 작성 페이지 html -->
<body> 
	<h1> DDock </h1>
	<form action="PostService.do" method="post" enctype="multipart/form-data">
		<input type="submit" value="다음">
		<table>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="post_title" placeholder="제목을 입력해주세요."> </td>
			</tr>
			<tr>
				<td rowspan="2"> 카테고리 </td>
				<td> 상위 카테고리
					<select>
						<option> IT </option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 하위 카테고리
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
				<td> <input type="text" name="post_price">원 </td>
			</tr>
			<tr>
				<td> 소스코드 파일 </td>
				<td> <input type="file" name="post_file"> </td>	
			</tr>
			<tr>
				<td> 서비스 설명 </td>
				<td> <textarea name="post_explain" placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
			<tr>
				<td> 의뢰인 주의사항 </td>
				<td> <textarea name="post_precautions" placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
			<tr>
				<td> 사용 툴(버전) </td>
				<td> <textarea name="post_standard" placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
		</table>
	</form>
</body>
</html>