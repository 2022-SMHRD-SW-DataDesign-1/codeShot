/**
 	날짜 : 2022-11-07
 	작성자 : 김지수
	내용 : 찜 버튼 기능
 */
 
 let btnColor = document.getElementById("btn-color");
 let btnColorAttr = btnColor.getAttribute("fill");
 let articleList = document.getElementById("article-list");
 let checkColor = true;
 
 // 유저가 찜 버튼을 눌렀을 때 동작하는 이벤트 정의
 function wishClick(num, clicked_id){
	let postNum = num;
	
	console.log("checkColor : ", checkColor);
	
	console.log("게시글 번호 : ", postNum);
	
	console.log("도형 색깔 : ", btnColorAttr);
	
	console.log("게시글 개수 : ", articleList)
	
	// 도형 색 변경
	if(!checkColor){
		document.querySelector("#"+clicked_id+" #btn-color").setAttribute('fill', 'red');
		checkColor = true;
	}
	else{
		document.querySelector("#"+clicked_id+" #btn-color").setAttribute('fill', 'none');
		checkColor = false;		
	}
	
	// sart ajax
	$.ajax({
        url:'WishPostDeleteService.do',
        data:{'postNum':postNum},
        type:'get',
        success : deletePost,
        error :function(){
            console.log("실패!");
        }
    }); // end ajax end
    
}; //end wishClick

function deletePost(){
	
}