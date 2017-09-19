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
	if ( gfn_isNull(currPageStr) == "") {
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
	if ( $("#publicYn").val() == "Y") {
		 if ( !gfn_isNull($("input[name='activeTp1']:checked").val()) ) {
			 activeTpChk = "AT001";
		 } else if ( !gfn_isNull($("input[name='activeTp2']:checked").val()) ) {
			 activeTpChk = "AT002";
		 }
	} 
	
	//saleTpTr
	var param = {
	    publicYn : $("#publicYn").val()
	   , activeTp :  $("#publicYn").val() == "Y" ?  activeTpChk : $("#activeTp").val()
	   , myCust : gfn_isNull($("input[name='activeTp3']:checked").val()) ? "" : $("input[name='activeTp3']:checked").val()
	   , currentPage : Number(currPage)
	   , pagePerRow : 10
	   , pageSize : 10
	};
	
	$.ajax({
	  url : "/estate/selectCustomerList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  if (result.custList.length != 0) {
			  custList = result.custList;
			  console.log (custList);
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
	console.log (custList[index]);
	$("#custId").val(custList[index].custId);
	var frm = $('#commClList')[0];
	frm.action = '/estate/viewClient.do';
	frm.method = 'POST';
	frm.submit();
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/estate/objtDtlView.do");
   
   comSubmit.submit();
*/
}

