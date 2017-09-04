$(document).ready(function(){

	formId = $("form").attr("id");
	f_memoList_select();
});


currMemoPage = 1;
function f_memoList_select() {

	var param = { currentPage : Number(currMemoPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
		url : "/estate/selectMemoList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#memoTbody").empty();
			
			if (result.memoList.length != 0) {
				$("#memoListTemplte").tmpl(result).appendTo("#memoTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currMemoPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#memoListEmptyTemplte").tmpl(result).appendTo("#memoTbody");
		  }
			$("#memoDocId").val('');
		}
	});
	
}

function f_memoView_select(memoId) {
	$("#divListMemoPopup").trigger('close');
	$("#divViewMemoPopup").lightbox_me({centered: true, onLoad: function() {	
		var param = { memoDocId : memoId };
		$.ajax({
			url : "/estate/selectMemoDtl.do",
			type: "post",
			data : param,
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				var result = data.MemoInfo;
				console.log ("search success");
				console.log (data);
				$("#memoDocId").val(result.memoDocId);
			}
		});
	}});
	
}

function f_setting_text(result) {
	$("#memoDocId").val(result.memoDocId);
	$("#memoSbj").val(result.memoSbj);
	$("#memoCont").val(result.memoCont);
	$("#frstRegDt").val(result.frstRegDt);
}


function f_memo_save() {	
	var param = $("#addMemo").serialize();
	var memoDocId = $("#memoDocId").val();
	var urlStr = "";
	if (memoDocId != "" ) {
		urlStr = "modifyMemo.do";
	} else {
		urlStr = "insertMemo.do";
	}
	
	alert($("#memoDocId").val());
	alert($("#memoSbj").val());
	
	$.ajax({
	  url : "/estate/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  
		  $("#divAddMemoPopup").trigger('close');
		  
		  if ( urlStr == "insertMemo.do" ) {
			  	alert (responseData.message);
			  	f_memoList_select();
			  	$("#memoDocId").val('');
			  	$('#divListMemoPopup').lightbox_me({centered: true});
		  } else {
			  	alert ("수정에 성공하였습니다.");
			  	f_memoView_select(memoDocId);
		  }
	  }
	});
}

