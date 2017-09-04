$(document).ready(function(){
	formId = $("form").attr("id");
	if ($("#memoDocId").val() != "") {
		f_memoDtl_select();
	}
	
});

function f_memoDtl_select() {
	
	var param = {
			memoDocId : $("#memoDocId").val()
	};
	$.ajax({
		  url : "/estate/selectMemoDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.logbookInfo;
			  console.log ("search success");
			  console.log (data);
			  f_setting_text(result);
		  }
	});
}

function f_setting_text(result) {
	$("#memoSbj").val(result.memoSbj);
	$("#memoCont").val(result.memoCont);
	$("#frstRegDt").val(result.frstRegDt);
}

function f_customer_save() {	
	var param = $("#"+formId).serialize();
	var taskDocId = $("#memoDocId").val();
	var urlStr = "";
	if (taskDocId != "" ) {
		urlStr = "modifyMemo.do";
	} else {
		urlStr = "insertMemo.do";
	}
	$.ajax({
	  url : "/estate/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  if ( urlStr == "insertMemo.do" ) {
			  alert (responseData.message);
		  } else {
			  alert ("수정에 성공하였습니다.");
		  }
	  }
	});
}
