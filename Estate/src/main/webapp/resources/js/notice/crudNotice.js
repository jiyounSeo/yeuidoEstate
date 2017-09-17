$(document).ready(function(){
	formId = $("form").attr("id");
	if($("#noticeId").val() == '' || $("#noticeId").val() == null){
		f_noticeList_select();		
	} else {
		f_NoticeDtl_select();
	}
});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_noticeList_select();
	}
	
});

function f_noticeList_select() {

	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
		url : "/estate/selectNoticeList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#noticeTbody").empty();
			
			if (result.ntList.length != 0) {
				$("#noticeListTemplte").tmpl(result).appendTo("#noticeTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#noticeListEmptyTemplte").tmpl(result).appendTo("#noticeTbody");
		  }
		}
	});
	
}

function f_notice_save() {	
	var param = $("#newNotice").serialize();
	var noticeId = $("#noticeId").val();
	var urlStr = "";
	if (noticeId != "" ) {
		urlStr = "modifyNotice.do";
	} else {
		urlStr = "insertNotice.do";
	}
	$.ajax({
		  url : "/estate/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(responseData){
			  if ( urlStr == "insertNotice.do" ) {
				  alert (responseData.message);
				  location.href="./noticeList.do";
			  } else {
				  alert ("수정에 성공하였습니다.");
				  location.href="./viewNoticeItem.do?noticeId="+noticeId;
			  }
		  }
		});
}

function f_NoticeDtl_select() {
	var param = {
			noticeId : $("#noticeId").val()
	};
	$.ajax({
		  url : "/estate/selectNoticeDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.item;
			  console.log ("search success");
			  console.log (data);
			  f_setting_text(result);
		  }
	});
}

function f_setting_text(result) {
	$("#noticeId").val(result.noticeId);
	$("#ntSbj").val(result.ntSbj);
	$("#ntConts").val(result.ntConts);
}
