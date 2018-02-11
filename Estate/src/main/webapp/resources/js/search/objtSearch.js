$(document).ready(function(){
	f_objt_select();
});

var objtList = {};
//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( currPageStr != "") {
		currPage = Number(currPageStr);
		f_objt_select();
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

function f_objtCkbox_check(box){
	
	var cnt = 0;
	
	if(gfn_isNull($("input[name='activeTp1']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp2']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp3']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp4']:checked").val()) == false){ cnt++; }
	
	if(cnt > 0) {
		f_objt_select();		
	} else {
		alert("목록을 구성하기위해서는 한개 이상 체크되어야 합니다");
		$("#"+box.name).attr("checked", "checked");
		return;
	}
}

function f_objt_select() {	
	var activeTpChk = "";
	var activTp1 = $("input[name='activeTp1']:checked").val();
	var activTp2 = $("input[name='activeTp2']:checked").val();
	var activTp3 = $("input[name='activeTp3']:checked").val();
	 
	 	 
	 var param = {
	    activeTp : activTp1+activTp2+activTp3//gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
	   , activeTp1 : activTp1
	   , activeTp2 : activTp2
	   , activeTp3 : activTp3
	   , myObjt : gfn_isNull($("input[name='activeTp4']:checked").val()) ? "" : $("input[name='activeTp4']:checked").val()
	   , keyname : $("#keyname").val()
	   , pageNm : $("#pageNm").val()
	   , currentPage : Number(currPage)
	   , pagePerRow : 10
	   , pageSize : 10
	};
	
	$.ajax({
	  url : "/objtSearchName.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#objtTbody").empty();
		  
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  
			  $.each (result.objtList, function(index) {
				  var bargainAmt = result.objtList[index].bargainAmt;
				  result.objtList[index].bargainAmt = comma(uncomma(bargainAmt)); 
				  var depositAmt = result.objtList[index].depositAmt;
				  result.objtList[index].depositAmt = comma(uncomma(depositAmt)); 
				  var monthlyAmt = result.objtList[index].monthlyAmt;
				  result.objtList[index].monthlyAmt = comma(uncomma(monthlyAmt)); 
				  var rightAmt = result.objtList[index].rightAmt;
				  result.objtList[index].rightAmt = comma(uncomma(rightAmt)); 
			  });
			  $("#objtListTemplte").tmpl(result).appendTo("#objtTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
			  var colCnt = $("#objtListTr td").length;
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }
		  
	  }
	});
}
 

function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 

function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}


function f_objtDtl_view (index) {
	$("#objtNo").val(objtList[index].objtNo);
	$("#objtTp").val(objtList[index].objtTp);
	$("#saleTp").val(objtList[index].saleTp);
	var url = "";
	switch (objtList[index].objtTp) {
		case "OT001"	:
			url = "viewObApt";
			break;
		case "OT002"	:
			url = "viewObStore";
			break;
		case "OT003"	:
			url = "viewObOffice";
			break;
		case "OT004"	:
			url = "viewObOps";
			break;
		case "OT005"	:
			url = "viewObHrapt";
			break;
		case "OT006"	:
			url = "viewObTicket";
			break;
		
	}
	$("#viewUrl").val(url);
	
	if($("#viewUrl").val() == ''){
		console.log($("#objtNo").val() + "/" + $("#objtTp").val() + "/" + $("#saleTp").val() + "/" + $("#viewUrl").val());
		return;
	}
	
	var frm = $('#commObjtList')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
}
