$(document).ready(function(){
	f_suggList_select();
});


function f_suggList_select() {
	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
	  url : "/estate/selectSuggBoardList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#suggTbody").empty();
		  if (result.sbList.length != 0) {
			  $("#suggListTemplte").tmpl(result).appendTo("#suggTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
			  $("#suggListEmptyTemplte").tmpl(result).appendTo("#suggTbody");
		  }
	  }
	});
	
}

function textLengthOverCut(txt, len, lastTxt) {
    if (len == "" || len == null) { // 기본값
        len = 20;
    }
    if (lastTxt == "" || lastTxt == null) { // 기본값
        lastTxt = "...";
    }
    if (txt.length > len) {
        txt = txt.substr(0, len) + lastTxt;
    }
    return txt;
}
