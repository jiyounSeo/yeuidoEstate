$(document).ready(function()
{
	f_reportList_select();

});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_reportList_select();
	}
	
});
	
function f_reportList_select()
{
	var param = { currentPage : Number(currPage)
			   , pagePerRow : 10
			   , pageSize : 10
	};
	console.log (param);
	$.ajax({
	  url : "/selectReportList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#repotTbody").empty();
		  $("#pagingDiv").empty();
		  
		  if (result.reportList.length != 0) {
			  
			  $("#reportListTemplte").tmpl(result).appendTo("#repotTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");
			  
		  } else {
			  $("#reportListEmptyTemplte").tmpl(result).appendTo("#repotTbody");			  
		  }
	  }
	});
}

function f_repoDtl_view( contId ) {
	location.href= "./viewReport.do?contractId=" + contId;
}
