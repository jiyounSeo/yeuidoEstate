$(document).ready(function(){
	if ($("#pageNm").val() == "custActiveY") {

		$("input[name='activeTp2']").attr("checked",false);	
		$("input[name='activeTp3']").attr("checked",false);	
		
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
	}
	else if ($("#pageNm").val() == "custActiveN") {

		$("input[name='activeTp1']").attr("checked",false);	
		$("input[name='activeTp3']").attr("checked",false);	
		
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
	}
	else if($("#pageNm").val() == "custPublic"){
		$("input[name='activeTp3']").attr("checked",false);	
		$("label[for='activeTp3']").css("display","none");	
	}
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


function f_custCkbox_check(box){
	
	var cnt = 0;
	
	if(gfn_isNull($("input[name='activeTp1']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp2']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp3']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp4']:checked").val()) == false){ cnt++; }
	
	if(cnt > 0) {
		f_custList_select();		
	} else {
		alert("목록을 구성하기위해서는 한개 이상 체크되어야 합니다");
		$("#"+box.name).attr("checked", "checked");
		return;
	}
}

function f_custList_select() {
	var activeTpChk = "";
	var activTp1 = $("input[name='activeTp1']:checked").val();
	var activTp2 = $("input[name='activeTp2']:checked").val();
	var activTp3 = $("input[name='activeTp3']:checked").val();
	
	/* 
	 * custPublic : 공동
	 * custActiveY : 활성카드
	 * custActiveN : 보류카드
	 */
	var param = {
	    publicYn : $("#publicYn").val()		
		, activeTp : activTp1+activTp2+activTp3//gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
	   	, activeTp1 : activTp1
	   	, activeTp2 : activTp2
	   	, activeTp3 : activTp3
	   , myCust : gfn_isNull($("input[name='activeTp4']:checked").val()) ? "" : $("input[name='activeTp4']:checked").val()
	   , pageNm : $("#pageNm").val()
	   , currentPage : Number(currPage)
	   , pagePerRow : 10
	   , pageSize : 10
	};
	
	$.ajax({
	  url : "/selectCustomerList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  $("#pagingDiv").empty();
		  if (result.custList.length != 0) {
			  custList = result.custList;
			  
			  if( $("#pageNm").val() == 'custActiveY' || $("#pageNm").val() == 'custActiveN' ){
				  $("#custListTemplte").tmpl(result).appendTo("#custTbody");
			  } else {
				  $("#custPublicListTemplte").tmpl(result).appendTo("#custTbody");				  
			  }
			  
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
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/objtDtlView.do");
   
   comSubmit.submit();
*/
}

