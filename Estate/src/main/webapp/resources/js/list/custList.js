$(document).ready(function(){
	if ($("#publicYn").val() != "Y" ) {
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
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
	var param = {
	    publicYn : $("#publicYn").val()
	   , activeTp : activeTpChk //  $("#publicYn").val() == "Y" ?  activeTpChk : $("#activeTp").val()
	   , myCust : gfn_isNull($("input[name='activeTp3']:checked").val()) ? "" : $("input[name='activeTp3']:checked").val()
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
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/objtDtlView.do");
   
   comSubmit.submit();
*/
}

