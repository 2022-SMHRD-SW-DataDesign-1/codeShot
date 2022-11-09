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
	UserDTO info = (UserDTO) session.getAttribute("info");
	ChatDAO dao = new ChatDAO();
	List<ChatRoomDTO> chatRoomList = dao.showChatRoom(info.getEmail());
	int count = 0;
	%>
	<div>
		<ul>
			<%
			for (ChatRoomDTO chatroom : chatRoomList) {
			%>
			<li id="chatRoom<%=count%>"
				onclick="selectChatRoom(<%=chatroom.getRoom_num()%>, this.id)">
				<span>채팅창 번호 : <%=chatroom.getRoom_num()%></span>
				<ol>
					<li>채팅창 제목 : <span id="roomTitle"><%=chatroom.getRoom_title()%></span></li>
					<li>채팅창 설명 : <%=chatroom.getRoom_description()%></li>
					<li>채팅창 개설일자 : <%=chatroom.getRoom_opendate()%></li>
				</ol>
			</li>
			<%
				count++;
			}
			%>
		</ul>
	</div>
	<div>
		<fieldset id="chatBox">
			<legend id="chatTitle"></legend>
		</fieldset>
		<form id="chatForm" enctype="multipart/form-data">
			<input id="inputChat" name="inputChat" type="text"><br>
			<input id="chatFilename" name="chatFilename" type="file"><br>
			<button type="button" onclick="sendMassage()">채팅 전송</button>
		</form>
	</div>
	<script src="./assets/jquery/jquery-3.6.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.0.1/socket.io.js" integrity="sha512-q/dWJ3kcmjBLU4Qc47E4A9kTB4m3wuTY7vkFJDTZKjTs8jhyGQnaUrxa0Ytd0ssMZhbNua9hE+E7Qv1j+DyZwA==" crossorigin="anonymous"></script>
	<script type="text/javascript">
		let roomNum = 0;
		if(<%= chatRoomList.size() %> != 0)
		{
			roomNum = <%=chatRoomList.get(chatRoomList.size() - 1).getRoom_num()%>;	
		}
		let chatBox = document.getElementById('chatBox');
		let socket = io.connect('http://localhost:5000');
		
		function selectChatRoom(selectRoomNum, clicked_id)
		{
			roomNum = selectRoomNum;
			let roomTitle = document.querySelector("#"+clicked_id+" #roomTitle");
			console.log(selectRoomNum);
			console.log('#'+clicked_id+' #roomTitle');
			
			sessionStorage.setItem('roomNum', selectRoomNum);
			
			$.ajax({
				url : 'ShowChattingService.do',
				data : {'roomNum':selectRoomNum},
				type : 'post',
				dataType : 'json',
				success : function(chattingList){
					
					console.log(roomTitle.textContent);
					
					// 초기화
					chatBox.innerHTML = "<legend id='chatTitle'></legend>";
					
					console.log(roomTitle.textContent);
					let chatTitle = document.getElementById('chatTitle');
					chatTitle.innerText = roomTitle.textContent;
					
					for(let i = 0; i < chattingList.length; i++)
					{
						chatBox.innerHTML += chattingList[i].chat_content;
					}
					
				},
				error : function(){
					console.log("selectChatRoom통신실패");	
				}
			})
		}
		
		function sendMassage() 
		{
			let form = $('#chatForm')[0];
			let formData = new FormData(form);
			let inputVal = document.getElementById("inputChat").value;
			let inputFileVal = document.getElementById("chatFilename").value;
			let chat = "";
			
			console.log(inputVal);
			console.log(inputFileVal);
			 
			if(inputVal != "" || inputFileVal != "")
			{
				chat += '<p><b>'+'<%= info.getName() %>'+'</b></p>'
			}
			if(inputVal != "")
			{
				inputVal = '<p>'+inputVal+'</p>';
				chat += inputVal;
			}
			if(inputFileVal != "")
			{
				inputFileVal = '<p><a href="./file/chatfile/'+inputFileVal.substr(12)+'" download>'+inputFileVal.substr(12)+'</a></p>';
				chat += inputFileVal;
			}
			
			formData.append('chatFile',document.getElementById('chatFilename').files[0]);
			formData.append('chat',chat);
			formData.append('roomNum',roomNum);

			console.log(chat);
			
			if(chat != "")
			{
				$.ajax({
					url : 'ChattingService.do',
					processData : false,
					contentType : false,
					data : formData,
					enctype:'multipart/form-data',
					type : 'post',
					success : function(){
						if(chat != "")
						{
							socket.emit('sendChat', {'user_name':'<%=info.getName()%>',
							 						 'chat':chat});
							console.log('소켓 보내기 성공');
						}
					},
					error : function(){
						console.log("sendMassage통신실패");	
					}
				})
				
			}
			
		}
		
		$(function(){
			socket.on('connect', function(){
				console.log("연결");
			})
			socket.on('disconnect', function(){
				console.log("연결실패")
			})
			socket.on('error', function(){
				console.log("error")
			})
			socket.on('receiveChat', function(msg) {
				console.log(msg);
				chatBox.innerHTML += msg.chat;
			});
		});
		
		
	</script>
</body>
</html>