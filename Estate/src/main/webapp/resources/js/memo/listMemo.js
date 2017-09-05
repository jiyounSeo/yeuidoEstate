$(document).ready(function(){

	formId = $("form").attr("id");
	f_memoList_select();
	
    $(function() {
    	function launch() {
            $('#divListMemoPopup').lightbox_me({centered: true});
        	$("#divViewMemoPopup").lightbox_me({centered: true});
        	$("#divAddMemoPopup").lightbox_me({centered: true});
    	}
    	    	
        $('#listMemoBtn').click(function(e) {
        	f_closeAll();
        	f_memoList_select();
            $("#divListMemoPopup").lightbox_me({centered: true, onLoad: function() {
			}});
            e.preventDefault();
        });
        
        $('#newMemoBtn').click(function(e) {
        	f_closeAll();       	
        	$("#divAddMemoPopup").lightbox_me({centered: true, onLoad: function() {	}});
            e.preventDefault();
        });
        $('#addMemoBtn').click(function(e) {
        	f_closeAll();        	
        	$("#divAddMemoPopup").lightbox_me({centered: true, onLoad: function() {	}});
            e.preventDefault();
        });
    });
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
		  	$("#memoDocId").val('');
			
			if (result.memoList.length != 0) {
				$("#memoListTemplte").tmpl(result).appendTo("#memoTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currMemoPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#memoListEmptyTemplte").tmpl(result).appendTo("#memoTbody");
		  }
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
				f_empty_field();
				$("#memoDocId").val(result.memoDocId);
				$("#memoSubject").append(result.memoSbj);
				$("#memoContent").append(result.memoCont);
				$("#frstRegDt").append(result.frstRegDt);
			}
		});
	}});
	
}

function f_memo_save() {	
	var param = $("#newMemo").serialize();
	var memoDocId = $("#memoDocId").val();
	var urlStr = "";
	if (memoDocId != "" ) {
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
			  $("#divAddMemoPopup").trigger('close');
			  if ( urlStr == "insertMemo.do" ) {
				  alert (responseData.message);
				  f_memoList_select();
				  $('#divListMemoPopup').lightbox_me({centered: true});
			  } else {
				  alert ("수정에 성공하였습니다.");
				  	f_memoView_select(memoDocId);
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
			  url : "/estate/deleteMemo.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(responseData){
				  f_cancel_to_list();
			  }
		});
	}
}

function f_empty_field()
{
	$("#memoDocId").val('');
	$("#memoSubject").empty();
	$("#memoContent").empty();
	$("#frstRegDt").empty();
}

function f_clear_form()
{
	$("#memoSbj").empty();
	$("#memoCont").empty();
	$("#memoSbj").val('');
	$("#memoCont").val('');
}

function f_closeAll(){
	f_clear_form();
	f_empty_field();
	$("#divListMemoPopup").trigger('close');  
	$("#divViewMemoPopup").trigger('close');  
	$("#divAddMemoPopup").trigger('close');  
}

function f_cancel_to_list()
{
	f_closeAll();
	f_memoList_select();
	$('#divListMemoPopup').lightbox_me({centered: true});
}