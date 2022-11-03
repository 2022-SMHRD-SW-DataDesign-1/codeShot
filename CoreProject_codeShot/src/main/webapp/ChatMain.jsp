<%@page import="com.codeshot.model.ChatDAO"%>
<%@page import="com.codeshot.model.ChatRoomDTO"%>
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
UserDTO info = (UserDTO)session.getAttribute("info");
	List<ChatRoomDTO> chatRoomList = new ChatDAO().showChatRoom(info.getEmail());
	int roomNum = 0;
%>
	<div>
		<ul>
	<% 	for(ChatRoomDTO chatroom : chatRoomList) { %>
			<li  onclick="selectChatRoom(<%= chatroom.getRoom_num() %>)">채팅창 번호 : <%= chatroom.getRoom_num() %>
				<ol>
					<li>채팅창 제목 : <%= chatroom.getRoom_title() %></li>
					<li>채팅창 설명 : <%= chatroom.getRoom_description() %></li>
					<li>채팅창 개설일자 : <%= chatroom.getRoom_opendate() %></li>
				</ol>
			</li>		
	<% 	} %>
		</ul>
	</div>
	<div>
		<fieldset>
			<legend></legend>
		</fieldset>
		<form action="ChattingService.do" method="post" enctype="multipart/form-data">
			<input name="inputChat" type="text">
			<input name="chatFilename" type="file">
			<input type="submit" value="전송">
		</form>
	</div>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		function selectChatRoom(selectRoomNum)
		{
			let roomNum = selectRoomNum
			console.log(roomNum);
			
			$.ajax({
				url : 'ShowChattingService.do',
				data : {'roomNum':roomNum},
				type : 'post',
				dataType : json,
				success : function(chattingList){
					
				},
				error : function(){
					console.log("통신실패");	
				}
			})
		}
	</script>
</body>
</html>