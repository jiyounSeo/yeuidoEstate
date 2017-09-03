$(document).ready(function(){
	f_custList_select();
});


function f_custList_select() {
	var param = { currentPage : Number(currPage)
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
