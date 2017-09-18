$(document).ready(function(){
	formId = $("form").attr("id");
	if ($("#taskDocId").val() != "") {
		f_customerLogbookDtl_select();
	}
	
});


function f_customerLogbookDtl_select() {
	
	var param = {
			taskDocId : $("#taskDocId").val()
	};
	$.ajax({
		  url : "/estate/selectLogbookDtl.do",
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
	$("#taskCont").val(result.taskCont);
	$("#tomoAdver").val(result.tomoAdver);
	$("#tomoSaleObj").val(result.tomoSaleObj);
	$("#tomoBuyer").val(result.tomoBuyer);
	$("#tomoEtc").val(result.tomoEtc);
	$("#prob").val(result.prob);
	$("#sugg").val(result.sugg);
}

function f_customer_save() {	
	var param = $("#newLogbook").serialize();
	var taskDocId = $("#taskDocId").val();
	var urlStr = "";
	if (taskDocId != "" ) {
		urlStr = "modifyLogbook.do";
	} else {
		urlStr = "insertLogbook.do";
	}
	$.ajax({
	  url : "/estate/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  if ( urlStr == "insertLogbook.do" ) {
			  alert (responseData.message);
			  location.href="./logbookListView.do";
		  } else {
			  alert ("수정에 성공하였습니다.");
			  location.href="./viewLogbook.do?taskDocId="+taskDocId;
		  }
	  }
	});
}


