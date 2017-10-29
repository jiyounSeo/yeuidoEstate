
var oEditors_today = [];
var oEditors_issue = [];
var oEditors_sugg = [];

$(document).ready(function(){
	formId = $("form").attr("id");
	if ($("#taskDocId").val() != "") {
		f_customerLogbookDtl_select();
	}
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors_today,
		elPlaceHolder : "taskCont",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors_today.getById["taskCont"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors_issue,
		elPlaceHolder : "prob",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors_issue.getById["prob"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors_sugg,
		elPlaceHolder : "sugg",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors_sugg.getById["sugg"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
});


function f_customerLogbookDtl_select() {
	
	var param = {
			taskDocId : $("#taskDocId").val()
	};
	$.ajax({
		  url : "/selectLogbookDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.logbookInfo;
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
	oEditors_today.getById["taskCont"].exec("UPDATE_CONTENTS_FIELD", []);	
	oEditors_issue.getById["prob"].exec("UPDATE_CONTENTS_FIELD", []);	
	oEditors_sugg.getById["sugg"].exec("UPDATE_CONTENTS_FIELD", []);
	
	if($("#sugg").val() == "<p>&nbsp;</p>") {
		$("#sugg").val("");
	}
	
	var param = $("#newLogbook").serialize();
	var taskDocId = $("#taskDocId").val();
	var urlStr = "";
	if (taskDocId != "" ) {
		urlStr = "modifyLogbook.do";
	} else {
		urlStr = "insertLogbook.do";
	}
	$.ajax({
	  url : "/" + urlStr,
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


function f_del_logbook()
{
	var isDel = confirm("업무일지를 삭제하시겠습니까?");
	var param = {taskDocId : $("#taskDocId").val()};	
	if(isDel){
		$.ajax({
			url : "/deleteLogbook.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(responseData){
				  alert (responseData.message);
				  location.href="./logbookListView.do";
			  }
		});
	}
}