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
	ChatDAO dao = new ChatDAO();
	List<ChatRoomDTO> chatRoomList = dao.showChatRoom(info.getEmail());
	int count = 0;
	String chatRoomTitle = "";
	if(chatRoomList != null)
	{
		chatRoomTitle = chatRoomList.get(0).getRoom_title();
	}
%>
	<div>
		<ul>
	<% 	for(ChatRoomDTO chatroom : chatRoomList) {	%>
			<li  id="chatRoom<%= count %>" onclick="selectChatRoom(<%= chatroom.getRoom_num() %>, this.id)">채팅창 번호 : <%= chatroom.getRoom_num() %>
				<ol>
					<li>채팅창 제목 : <span id="roomTitle"><%= chatroom.getRoom_title() %></span></li>
					<li>채팅창 설명 : <%= chatroom.getRoom_description() %></li>
					<li>채팅창 개설일자 : <%= chatroom.getRoom_opendate() %></li>
				</ol>
			</li>		
	<% 		count++;
		} %>
		</ul>
	</div>
	<div>
		<fieldset id="chatBox">
			<legend id="chatTitle"><%= chatRoomTitle %></legend>
		</fieldset>
		<form action="ChattingService.do" method="post" enctype="multipart/form-data">
			<input name="inputChat" type="text">
			<input name="chatFilename" type="file">
			<input type="submit" value="전송">
		</form>
	</div>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script type="text/javascript">
		function selectChatRoom(selectRoomNum, clicked_id)
		{
			let roomNum = selectRoomNum
			console.log(roomNum);
			
			$.ajax({
				url : 'ShowChattingService.do',
				data : {'roomNum':roomNum},
				type : 'post',
				dataType : json,
				success : function(chattingList){
					let chatTitle = document.getElementById('chatTitle');
					let chatBox = document.getElementById('chatBox');
					
					chatTitle.innerText(document.querySelector('#'+clicked_id+' #roomTitle').textContent);
					
					for(let i = 0; i < chattingList.length; i++)
					{
						chatBox.innerHTML(chattingList[i].chat_content);
					}
				},
				error : function(){
					console.log("통신실패");	
				}
			})
		}
	</script>
</body>
</html>