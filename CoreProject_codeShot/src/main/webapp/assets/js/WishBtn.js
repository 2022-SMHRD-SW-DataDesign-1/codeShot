/**
 	날짜 : 2022-11-07
 	작성자 : 김지수
	내용 : 찜 버튼 기능
 */
 
 let btnColor = document.getElementById("btn-color");
 let btnColorAttr = btnColor.getAttribute("fill");
 let allCont = document.getElementById("all-cont");
 let otsCont = document.getElementById("ots-cont");
 let codeCont = document.getElementById("code-cont");
 
 let checkColor = true;
 
 // 찜 목록에서 유저가 찜 버튼을 눌렀을 때 동작하는 이벤트 정의
 function wishClick(num, clicked_id, category){
	let postNum = num;
	let postCategory = category;
	
	console.log(clicked_id); //wish-btn66
	console.log("checkColor : ", checkColor);
	console.log("게시글 번호 : ", postNum);
	console.log("도형 색깔 : ", btnColorAttr);
	console.log("찜 전체 개수 : ", allCont.textContent);
	console.log("카데고리 : ", postCategory);
	
	
	// 도형 색 변경
	if(checkColor){
		document.querySelector("#"+clicked_id+" #btn-color").setAttribute('fill', 'none');
		checkColor = false;
		// sart ajax
		$.ajax({
	        url:'WishPostDeleteService.do',
	        data:{'postNum':postNum},
	        type:'get',
	        success : deleteWishPost(postNum, postCategory),
	        error :function(){
	            console.log("실패!");
	        }
	    }); // end ajax
	}
}; //end wishClick

// deletePost : 찜 목록에서 찜한 게시글 삭제
function deleteWishPost(postNum, postCategory){
	console.log("삭제 성공!");
	
	$('#article-tag'+postNum).remove();
	
	if(postCategory=='ots_web' || postCategory=='ots_app'){
		otsCont.textContent = Number(otsCont.textContent)-1;
	} 
	else if(postCategory=='code_web' || postCategory=='code_app'){		
		codeCont.textContent = Number(codeCont.textContent)-1;
	}
	
	allCont.textContent = Number(allCont.textContent)-1;
	
}//end deletePost


// 게시글 목록에서 찜 버튼 눌렀을때 이벤트 정의
function wishPostClick(num, clicked_id){
	let postNum = num;
	
	if(checkColor){
		document.querySelector("#"+clicked_id+" #btn-color").setAttribute('fill', 'red');
		checkColor = false;
		
		$.ajax({
			url:'WishAddService.do',
			data: {'postNum':postNum},
			type:'get',
			success: function(){
				console.log('성공!');
			},
			error: function(){
				console.log('실패!');
			}
		}); // end ajax
	}
	else{
		document.querySelector("#"+clicked_id+" #btn-color").setAttribute('fill', 'none');
		checkColor = true;
		
		$.ajax({
			url:'WishPostDeleteService.do',
			data: {'postNum':postNum},
			type:'get',
			success: function(){
				console.log('성공!');
			},
			error: function(){
				console.log('실패!');
			}
		}); // end ajax
	}
}


