$(document).ready(function(){
	f_custList_select();
});

function f_custList_select() {
	console.log ("!!!!");
	console.log ("currPage : " + currPage);
	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	console.log (param);
	$.ajax({
	  url : "/estate/selectCustomerList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  if (result.custList.length != 0) {
			  console.log ("????");
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
