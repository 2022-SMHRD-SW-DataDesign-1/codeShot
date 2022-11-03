/**
	날짜 : 2022-11-02
	작성자 : 김지수
	내용 : 검색어 제안 기능
 */


const searchInputBox = document.getElementById("search-input-box");
const suggestList = document.getElementById("suggest-list");

// 유저가 키보드를 눌렀을 때 동작하는 이벤트 정의
function addList(target){
    let userInput = target.value;
    console.log(userInput);
    
	if(userInput==""){
		console.log("공백");
		userInput ="공백까지서치되는것을막기위한변수대입"
		suggestList.innerHTML="";
	}
    // start ajax
    $.ajax({
        url:'SuggestWordService.do',
        data:{'userInput':userInput},
        type:'get',
        success : suggestWord,
        error :function(){
            console.log("실패!");
        }
    }); // end ajax end
    
}; //addList end

    
function suggestWord(list){
   let resultHTML ="";
	console.log("길이"+list.length);
	
	for(let i=0; i<list.length; i++){
		resultHTML += `<li style="list-style: none;"><a href="SerchMain.jsp?userInput=${list[i].post_title}">${list[i].post_title}</a></li>`;
	}
	
	suggestList.innerHTML = resultHTML;
} //endsuggestWord end