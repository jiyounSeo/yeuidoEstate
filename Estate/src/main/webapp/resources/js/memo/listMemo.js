
var oEditors_memo = [];

$(document).ready(function(){
	formId = $("form").attr("id");
	f_memoList_select();
    $(function() {

   /*     nhn.husky.EZCreator.createInIFrame({
    		oAppRef : oEditors_memo,
    		elPlaceHolder : "memoCont",
    		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
    		htParams : {
    		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
    		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
    		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
    		fOnBeforeUnload : function() {
    		}
    	},
    	fOnAppLoad : function() {	
    		oEditors_memo.getById["memoCont"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
    	}
    	});
   */     
    	function launch() {
            $('#divListMemoPopup').lightbox_me({centered: true});
        	$("#divViewMemoPopup").lightbox_me({centered: true});
        	$("#divAddMemoPopup").lightbox_me({centered: true});
    	}
    	    	
    	
        $('#listMemoBtn').click(function(e) {
        	if ( gfn_isNull(userSession)) {
        		alert ("로그인 이후 이용하세요.");
        		f_closeAll();
        	} else {
        		f_closeAll();
            	f_memoList_select();
                $("#divListMemoPopup").lightbox_me({centered: true, onLoad: function() {
    			}});
                e.preventDefault();
        	}
        });
        
    });
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

function f_addMeno() {
	f_closeAll();
	if ( gfn_isNull(userSession)) {
		alert ("로그인 이후 이용하세요.");
	} else {
		$("#divAddMemoPopup").lightbox_me({centered: true});
	}
}

function f_memoList_select() {

	var param = { currentPage : Number(currPage)
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
				$("#page" + currPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#memoListEmptyTemplte").tmpl(result).appendTo("#memoTbody");
		  }
		}
	});
	
}

function f_memoView(memoId){
	
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
			$("#memoSubject").append("&nbsp;&nbsp;"+result.memoSbj);
			$("#memoContent").append(result.memoCont);
			$("#frstRegDt").append("등록일 : "+result.frstRegDt);
			
			$("#memoSbj").val(result.memoSbj);
			$("#memoCont").val(result.memoCont);
		}
	});
	
}

function f_memoView_select(memoId) {
	$("#divListMemoPopup").trigger('close');
	f_memoView(memoId);
	$("#divViewMemoPopup").lightbox_me({centered: true});
	
}

function f_memo_save() {	
//	oEditors_memo.getById["memoCont"].exec("UPDATE_CONTENTS_FIELD", []);	
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

function f_edit_memo_view(){
	var memoDocId = $("#memoDocId").val();
	f_memoView(memoDocId);
	f_closeAllDiv();
	$("#divAddMemoPopup").lightbox_me({centered: true});
	
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
	f_closeAllDiv();
}

function f_closeAllDiv(){
	$("#divListMemoPopup").trigger('close');  
	$("#divViewMemoPopup").trigger('close');  
	$("#divAddMemoPopup").trigger('close');  	
}

function f_cancel_to_list()
{
	f_closeAll();
	f_memoView();
	$('#divListMemoPopup').lightbox_me({centered: true});
}