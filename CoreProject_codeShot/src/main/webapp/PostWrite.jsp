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
	<form>
		<h1> DDock </h1>
		<button> 제출하기 </button>
		<table>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" placeholder="제목을 입력해주세요."> </td>
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
					<select>
						<option> 웹 </option>
						<option> 앱 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 가격 </td>
				<td> <input type="text">원 </td>
			</tr>
			<tr>
				<td> 소스코드 파일 </td>
				<td> <input type="file"> </td>
			</tr>
			<tr>
				<td> 포트폴리오 </td>
				<td> <input type="file"> </td>
			</tr>
			<tr>
				<td> 서비스 설명 </td>
				<td> <textarea placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
			<tr>
				<td> 의뢰인 주의사항 </td>
				<td> <textarea placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
			<tr>
				<td> 사용 툴(버전) </td>
				<td> <textarea placeholder="내용을 입력해주세요"></textarea> </td>
			</tr>
			<tr>
				<td> 수정옵션(소스코드) </td>
				<td> 
					<input type="text" placeholder="내용을 입력해주세요">
					<button>+</button>
					<button>-</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>