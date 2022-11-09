<%@page import="com.codeshot.model.PostDAO"%>
<%@page import="com.codeshot.model.PostDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
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
		BigDecimal postNum = new BigDecimal(request.getParameter("post_num"));
		PostDTO post = new PostDAO().showPostDetail(postNum);
	%>
	<h1> <a href="Main.jsp">DDock</a> </h1>
	<form action="EditDetailService.do" method="post" enctype="multipart/form-data">
		<input type="submit" value="제출하기">
		<table>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="post_title" value="<%= post.getPost_title() %>" placeholder="제목을 입력해주세요."> </td>
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
				<td> <input type="text" value="<%= post.getPost_price() %>" name="post_price">원 </td>
			</tr>
			<tr>
				<td> 소스코드 파일 </td>
				<td> <input type="file" value="<%= post.getPost_file() %>" name="post_file"> </td>	
			</tr>
			<tr>
				<td> 서비스 설명 </td>
				<td> <textarea name="post_explain" placeholder="내용을 입력해주세요"> <%= post.getPost_explain() %> </textarea> </td>
			</tr>
			<tr>
				<td> 의뢰인 주의사항 </td>
				<td> <textarea name="post_precautions" placeholder="내용을 입력해주세요"> <%= post.getPost_precautions() %> </textarea> </td>
			</tr>
			<tr>
				<td> 사용 툴(버전) </td>
				<td> <textarea name="post_standard" placeholder="내용을 입력해주세요"> <%= post.getPost_standard() %> </textarea> </td>
			</tr>
		</table>
	</form>
</body>
</html>