$(document).ready(function(){
	  $("#pagingDiv").empty();
	  $("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
	  $("#objtNm").focus();
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
	var frm = $('#totalSearch')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
}


function f_objectList_select(srch){
	currPage = (srch == "pageBtn" ? Number(currPage) : 1);
	 var param = {
				tel1 : $("#tel1").val()
			   , tel2 : $("#tel2").val()
			   , tel3 : $("#tel3").val()
			   , addr : $("#addr").val()
			   , objtNm : $("#objtNm").val()
			   , mbrNm : $("#mbrNm").val()
			   , currentPage : currPage
			   , pageNm :  'total'
			   //, pageNm : $("#pageNm").val()
			   , activeTp :  "" //$("#publicYn").val() == "Y" ?  activeTpChk : $("#activeTp").val()
			   , pagePerRow : 10
			   , pageSize : 10
			};
	 console.log (param);
				
	if ( gfn_isNull($("#tel1").val()) && gfn_isNull($("#tel2").val()) && gfn_isNull($("#tel3").val()) 
			&& gfn_isNull($("#addr").val()) && gfn_isNull($("#objtNm").val()) && gfn_isNull($("#mbrNm").val()) 
	) {
		alert ("검색조건은 무조건 1개이상 작성해야 합니다.");
		return;
	}
		
	
	$.ajax({
	  url : "/selectTotalSearch.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#objtTbody").empty();
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  $("#objtListTemplte").tmpl(result).appendTo("#objtTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
			  $("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
		  }
		  
	  }
	});
	
}


//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var div = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_objectList_select("pageBtn");
	}
	
});

