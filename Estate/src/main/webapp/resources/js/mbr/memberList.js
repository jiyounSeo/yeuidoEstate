var mbrList;
var currPage = 1;

$(document).ready(function(){
	f_member_list();
});

$(document).on('click', '.pagingBtn', function() {
	var div = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_member_list();
	}
});

function f_member_list() {
	var param = {
			param : 1
			, currentPage : Number(currPage)
			, pagePerRow : 10
			, pageSize : 10
	}
	$("#mbrTbody").empty();
	$.ajax({
	  url : "/memberList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  mbrList = data.mbrList;
		  if (mbrList.length != 0) {
			  $("#mbrListTemplte").tmpl(data).appendTo("#mbrTbody");
			  $("#pagingDiv").html(groupPaging(data.startPage, data.pageSize, data.endPage, data.lastPage));
			  $("#page" + currPage).addClass("active");
			  
		  } else {
			  $("#mbrListEmptyTemplte").tmpl(data).appendTo("#mbrTbody");
			  $("#pagingDiv").empty();
		  }
		
	  }
	});
}

function f_member_insert() {
   var comSubmit = new ComSubmit("memberList");
     comSubmit.setUrl("/joinMemberView.do");
     comSubmit.submit();
}

function f_memeber_accept(index) {
	if (confirm ("["+mbrList[index].mbrNm+"] 회원을 승인처리 하시겠습니까?")) {
		$.ajax({
			  url : "/updateMemberAccept.do",
			  type: "post",
			  data : {mbrId: mbrList[index].mbrId, mbrTp : "MT002"},
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  alert (data.message);
				  f_member_list();
			  }
		});		
	} 
}

function f_changeMbrTp(index, mbrTpValue) {
	
	if(mbrTpValue != $("#mbrTp").val()){
		if (confirm ("["+mbrList[index].mbrNm+"] 회원의 등급을 변경하시겠습니까?")) {
			$.ajax({
				  url : "/updateMemberTp.do",
				  type: "post",
				  data : {mbrId: mbrList[index].mbrId, mbrTp : mbrTpValue},
				  dataType : "json",
				  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				  success : function(data){
					  alert (data.message);
					  f_member_list();
				  }
			});		
		} 
	}
}

function f_memeber_reject(index) {
	if (confirm ("["+mbrList[index].mbrNm+"] 회원을 삭제처리 하시겠습니까?")) {
		$.ajax({
		  url : "/deleteMember.do",
		  type: "post",
		  data : {mbrId: mbrList[index].mbrId},
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  f_member_list();
		  }
		});
	}
}

 /*	function f_member_list() {
 	   var comSubmit = new ComSubmit("joinMember");
       comSubmit.setUrl("/memberListView.do");
       comSubmit.submit();
       c]
 	}*/