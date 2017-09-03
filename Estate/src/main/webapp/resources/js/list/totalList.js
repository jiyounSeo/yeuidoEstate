$(document).ready(function(){
	if ( $("#viewMode").val() == "2") {
		$("#objtList").show();
		$("#custList").hide();
		f_objectList_select();
	} else if ($("#viewMode").val() == "3" ) {
		$("#objtList").hide();
		$("#custList").show();
		f_custList_select();
	} else {
		f_objectList_select();
		f_custList_select();
		$("#objtList").show();
		$("#custList").show();
	}
});


function f_objectList_select() {
	var param = {
		objtTp : $("#objtTp").val()
	   , saleTp : $("#saleTp").val() 
	   , currentPage : Number(currObjtPage)
	   , pagePerRow : $("#viewMode").val() == "1"  ? 5 : 10  
	   , pageSize : 10
	};
	$.ajax({
	  url : "/estate/selectObjectList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#objtTbody").empty();
		  
		  var tmplNm = "";
		  var colCnt;
		  switch ( $("#objtTp").val() ) {
		  	case "OT001" : // 아파트
		  		tmplNm = "objtListTemplte1";
		  		colCnt = 12;
		  		break; 
		  	case "OT002" : // 상가
		  		tmplNm = "objtListTemplte2";
		  		colCnt = 9;
		  		break;
		  	case "OT003" : //사무실.빌딩
		  		tmplNm = "objtListTemplte3";
		  		colCnt = 8;
				break;
		  	case "OT004" : // 오피스텔
		  		tmplNm = "objtListTemplte4";
		  		colCnt = 11;
				break;
		  	case "OT005" : //주상복합
		  		tmplNm = "objtListTemplte5";
		  		colCnt = 10;
		  		break;
		  	case "OT006" : //분양권
		  		tmplNm = "objtListTemplte6";
		  		colCnt = 12;
				break;
		  }
		  if (result.objtList.length != 0) {
			  $.each (result.objtList, function(index) {
				  result.objtList[index].viewUrl = $("#viewUrl").val();
			  })
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
			  $("#objtPagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#objtPagingDiv #page" + currObjtPage).addClass("active");

		  } else {
			  $("#objtPagingDiv").empty();
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }

	  }
	});
}


function f_custList_select() {
	var param = { currentPage : Number(currCustPage)
				   , pagePerRow : $("#viewMode").val() == "1" ? 5 : 10 
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
			  $("#custListTemplte").tmpl(result).appendTo("#custTbody");
			  $("#custPagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#custPagingDiv #page" + currCustPage).addClass("active");

		  } else {
			  $("#custPagingDiv").empty();
			  $("#custListEmptyTemplte").tmpl(result).appendTo("#custTbody");
		  }
	  }
	});
	
}


//페이징 버튼 클릭이벤트
currObjtPage = 1;
currCustPage = 1;

$(document).on('click', '.pagingBtn', function() {
	var divId = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		if ( divId == "objtPagingDiv") {
			currObjtPage = Number(currPageStr);
			f_objectList_select();
		} else {
			currCustPage = Number(currPageStr);
			f_custList_select();
		}
	}
});