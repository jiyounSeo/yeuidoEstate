$(document).ready(function(){
	f_objt_select();
});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( currPageStr != "") {
		currPage = Number(currPageStr);
		f_objectList_select();
	}
	
});

function f_show_searchbox(){
	$("#searchbox").toggle();
}

function f_search_obName(){	
	
	var keyword = $("#keyname").val();
	
	if(keyword == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면
	
	var frm = $('#commObjtList')[0];
	frm.action = '/objtSearchNamePage.do';
	frm.method = 'POST';
	frm.keyword.value = keyword;
	frm.submit();	

}

function f_enter(val) {
	if(event.keyCode == 13){ //눌렀다 땐 키값이 13(엔터키)라면
		if(val == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면

		f_search_obName();
	}	
}


function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}


function f_objt_select() {
	
	
}
 
