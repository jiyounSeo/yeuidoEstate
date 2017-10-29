
var oEditors = [];

$(document).ready(function(){
	formId = $("form").attr("id");
	if($("#memoDocId").val() == '' || $("#memoDocId").val() == null){
		f_memoList_select();
	} else {
		f_memoDtl_select();
	}	
	
	
});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_memoList_select();
	}
	
});

function f_memoList_select() {

	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
		url : "/selectMemoList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#memoTbody").empty();
		  	$("#memoDocId").val('');
			
			if (result.memoList.length != 0) {
				$("#memoListTemplte").tmpl(result).appendTo("#memoTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#memoListEmptyTemplte").tmpl(result).appendTo("#memoTbody");
		  }
		}
	});
	
}

function f_memoDtl_select(){
	
	var param = { memoDocId : $("#memoDocId").val() };
	$.ajax({
		url : "/selectMemoDtl.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			var result = data.MemoInfo;
			console.log ("search success");
			console.log (data);
			$("#memoDocId").val(result.memoDocId);
			$("#memoSubject").append("&nbsp;&nbsp;"+result.memoSbj);
			$("#memoContent").append(result.memoCont);
			$("#frstRegDt").append("등록일 : "+result.frstRegDt);
			
			$("#memoSbj").val(result.memoSbj);
			$("#memoCont").val(result.memoCont);
		}
	});
	
}

function f_memo_save() {	
	oEditors.getById["memoCont"].exec("UPDATE_CONTENTS_FIELD", []);	
	var param = $("#newMemo").serialize();
	var memoDocId = $("#memoDocId").val();
	var urlStr = "";
	if (memoDocId != "" ) {
		urlStr = "modifyMemo.do";
	} else {
		urlStr = "insertMemo.do";
	}
	
	$.ajax({
		  url : "/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(responseData){
			  $("#divAddMemoPopup").trigger('close');
			  if ( urlStr == "insertMemo.do" ) {
				  alert (responseData.message);
				  location.href="./memoList.do";
			  } else {
				  alert ("수정에 성공하였습니다.");
				  location.href="./viewMemoItem.do?memoDocId="+memoDocId;
			  }
		  }
		});
}

function f_del_memo()
{
	var isDel = confirm("메모를 삭제하시겠습니까?");
	var param = {memoDocId : $("#memoDocId").val()};	
	if(isDel){
		$.ajax({
			  url : "/deleteMemo.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(responseData){
				  location.href="./memoList.do";
			  }
		});
	}
}
