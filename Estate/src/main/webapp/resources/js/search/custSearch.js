$(document).ready(function(){
	f_custList_select();
});

var custList = {};
//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( currPageStr != "") {
		currPage = Number(currPageStr);
		f_custList_select();
	}
});


function f_show_searchbox(){
	$("#searchbox").toggle();
}


function f_search_custName(){	
	var keyword = $("#keyname").val();
	
	if(keyword == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면
	
	var frm = $('#commClList')[0];
	frm.action = '/custSearchNamePage.do';
	frm.method = 'POST';
	frm.keyword.value = keyword;
	frm.submit();	
	
}

function f_enter(val) {
	if(event.keyCode == 13){ //눌렀다 땐 키값이 13(엔터키)라면
		if(val == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면

		f_search_custName();
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


function f_custList_select() {
	var activeTpChk= "";
	var activTp1 = $("input[name='activeTp1']:checked").val();
	var activTp2 = $("input[name='activeTp2']:checked").val();
	if ( !gfn_isNull(activTp1) && gfn_isNull(activTp2)) {
		 activeTpChk = "AT001";
	} else if ( gfn_isNull(activTp1) && !gfn_isNull(activTp2)) {
		 activeTpChk = "AT002";
	} else if  ( !gfn_isNull(activTp1) && !gfn_isNull(activTp2)) {
		 activeTpChk = "";
	}
	/* 
	 * custPublic : 공동
	 * custActiveY : 활성카드
	 * custActiveN : 보류카드
	 */
	var param = {
	    publicYn : $("#publicYn").val()
	   , activeTp : activeTpChk //  $("#publicYn").val() == "Y" ?  activeTpChk : $("#activeTp").val()
	   , myCust : gfn_isNull($("input[name='activeTp3']:checked").val()) ? "" : $("input[name='activeTp3']:checked").val()
	   , pageNm : $("#pageNm").val()
	   , currentPage : Number(currPage)
	   , pagePerRow : 10
	   , pageSize : 10
	   , keyname : $("#keyname").val()
	};
	
	$.ajax({
	  url : "/custSearchName.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  $("#pagingDiv").empty();
		  if (result.custList.length != 0) {
			  custList = result.custList;
			  $("#custListTemplte").tmpl(result).appendTo("#custTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
			  $("#custListEmptyTemplte").tmpl(result).appendTo("#custTbody");
		  }
	  }
	});
	
}




function f_mbrDtl_view (index) {
	$("#custId").val(custList[index].custId);
	var frm = $('#commClList')[0];
	frm.action = '/viewClient.do';
	frm.method = 'POST';
	frm.submit();

}