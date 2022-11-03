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

    // start ajax
    $.ajax({
        url:'SuggestWordService.do',
        data:{'userInput':userInput},
        type:'get',
        dataType:'json',
        success : function(data){
            

        },
        error :function(){
            console.log("실패!");
        }
    }); // end ajax
};