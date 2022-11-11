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
<link rel="stylesheet" type="text/css" href="./assets/css/chatmain.css">
<style type="text/css">
	.logoimage{
		width: 290px;
		height: 100%;
	}
</style>
</head>
<body>
	<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	
	ChatDAO dao = new ChatDAO();
	List<ChatRoomDTO> chatRoomList = dao.showChatRoom(info.getEmail());
	int count = 0;
	%>
	<div class="logo-area">
		<img src="./assets/cssimg/logo.jpg" class="logoimage">
	</div>
	<div class="chatmain">
        <div class="chatroom-area">
            <ul class="chatroom-list">
	            <%
				for (ChatRoomDTO chatroom : chatRoomList) {
				%>
                <li id="chatRoom<%=count%>" class="chatroom" onclick="selectChatRoom(<%=chatroom.getRoom_num()%>, this.id, '<%=chatroom.getSeller_email()%>')">
                    <span id="roomTitle"><%=chatroom.getRoom_title()%></span><br>
                    <%=chatroom.getRoom_description()%>
                </li>
	            <%
					count++;
				}
				%>
            </ul>
        </div>
        <div class="chat-area">
            <div class="chatting-area-box">
                <div class="chatting-area">
                    <div id="chatBox" class="chatting-list">
                        <div class="chat-my">
                            <p class="chat-time">시간</p>
                            <div class="chat-my-content"><p>안녕하세요</p></div>
                        </div>
                        <div class="chat-opponent">
                            <div class="chat-opponent-content"><p>안녕하세요-상대</p></div>
                            <p class="chat-time">시간</p>
                        </div>
                    </div>
                </div>
                <div class="info-area">
                    <div class="sellerinfo-area">
                        <span class="sellerinfo">판매자 정보</span>
                    </div>
                </div>
            </div>
            <div class="inputchat-area">
            	<form id="chatForm" class="chat-form" enctype="multipart/form-data">
	                <input id="inputChat" class="inputchat" type="text" placeholder="여기에 채팅을 입력해주세요!">
	                <div class="send-area">
	                    <input id="chatFilename" name="chatFilename" class="send-file" type="file">
	                    <button type="button" onclick="sendMassage()" class="send-msg">전송</button>
	                </div>
	        	</form>
            </div>
        </div>
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
		let socket = io.connect('http://172.30.1.30:5000');
		
		function selectChatRoom(selectRoomNum, clicked_id, seller_email)
		{
			roomNum = selectRoomNum;
			let roomTitle = document.querySelector("#"+clicked_id+" #roomTitle");
			let sellerInfoBox = document.querySelector(".sellerinfo")
			console.log(selectRoomNum);
			console.log('#'+clicked_id+' #roomTitle');
			
			sessionStorage.setItem('roomNum', selectRoomNum);
			
			$.ajax({
				url : 'getSellerInfoService.do',
				data : {'sellerEmail':seller_email},
				type : 'post',
				dataType : 'json',
				success : function(sellerInfo){
					sellerInfoBox.innerHTML = "";
					sellerInfoBox.innerHTML += '<p class="seller-name">' + sellerInfo.name + '</p>';
					sellerInfoBox.innerHTML += '<p class="seller-phone">' + sellerInfo.phone + '</p>';
					sellerInfoBox.innerHTML += '<p class="seller-career">' + sellerInfo.career + '</p>';
				},
				error : function(){
					console.log("sellectInfo통신실패");	
				}
			});
			
			$.ajax({
				url : 'ShowChattingService.do',
				data : {'roomNum':selectRoomNum},
				type : 'post',
				dataType : 'json',
				success : function(chattingList){
					
					// 초기화
					chatBox.innerHTML = "";
					
					for(let i = 0; i < chattingList.length; i++)
					{
						let showChatContent = chattingList[i].chat_content;
						if('<%=info.getEmail()%>' != chattingList[i].talker)
						{
							showChatContent = chattingList[i].chat_content.replaceAll("my","opponent")
						}
						chatBox.innerHTML += showChatContent;
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
			const date = new Date();
			
			console.log(inputVal);
			console.log(inputFileVal);
			 
			if(inputVal != "")
			{
				chat += '<div class="chat-my">'+
		        		'<div class="chat-my-content"><p>'+inputVal+'</p></div>'+
		    			'</div>';
			}
			if(inputFileVal != "")
			{
				chat += '<div class="chat-my">'+
		        		'<div class="chat-my-content"><p><a href="./file/chatfile/'+inputFileVal.substr(12)+'" download>'+inputFileVal.substr(12)+'</a></p></div>'+
		    			'</div>';
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
							if(chat != "")
							{
								chatBox.innerHTML += chat;
							}
							
							chat = chat.replaceAll("my","opponent")
							
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
				if('<%=info.getName()%>' != msg.user_name)
				{
					chatBox.innerHTML += msg.chat;
				}
			});
		});
		
		let allChatroom = document.querySelectorAll(".chatroom");
		
        function selectChatroom(event)
        {
            allChatroom.forEach((e) => {
                e.classList.remove("select");
            });
            event.target.classList.add("select");
        }
        
        allChatroom.forEach((e) => {
            e.addEventListener("click", selectChatroom);
        });
	</script>
</body>
</html>