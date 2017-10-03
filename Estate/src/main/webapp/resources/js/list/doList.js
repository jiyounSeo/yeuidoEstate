$(document).ready(function(){
	f_workList_select();
});

function f_addWork() {
	$("#workNo").val("");
	$("#workTitle").val("");
	$("#workContent").val("");
	$("#divAddWorkPopup").lightbox_me({centered: true});
}

function f_modifyWork(index) {
	$("#workNo").val(workList[index].workNo);
	$("#workTitle").val(workList[index].workTitle);
	$("#workContent").val(workList[index].workContent);
	$("#divAddWorkPopup").lightbox_me({centered: true});
}


function f_workList_select() {
	var param = {};
	param.objtNo = $("#objtNo").val();
	param.custId = $("#custId").val();
	
	$.ajax({
		url : "/estate/selectWorkList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#workTbody").empty();
			if (result.workList.length != 0) {
				workList = result.workList;
				$("#workListTemplte").tmpl(result).appendTo("#workTbody");
			} else {
				$("#workListEmptyTemplte").tmpl(result).appendTo("#workTbody");
			}
			// 삭제버튼은 글쓴이 본인만 가능함.
			$.each (workList, function(index) {
				if (workList[index].deleteBtnYn == "N") {
					$("#workTbody tr:eq("+index+") #btnDel").hide();
				}
				
			});
		}
	});
	
}

function f_work_save() {	
	
	var workContent = $("#workContent").val();
	var urlStr = "";
	if ( $("#workNo").val() != "" ) {
		urlStr = "modifyWork.do";
	} else {
		urlStr = "insertWork.do";
	}
	
	if ($("#workTitle").val() == "") {
		alert ("작업내역 제목을 입력하세요.");
		$("#workTitle").focus();
		return;
	} 

	if ($("#workContent").val() == "") {
		alert ("작업내역을 입력하세요.");
		$("#workContent").focus();
		return;
	} 
	
	var param = {
		workNo : $("#workNo").val()
		, workContent : $("#workContent").val()
		, workTitle : $("#workTitle").val()
		, objtNo : $("#objtNo").val()
		, custId : $("#custId").val()
	}
	
	$.ajax({
		  url : "/estate/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#divAddWorkPopup").trigger('close');
				  alert (data.message);
				  $("#divAddWorkPopup").trigger('close');
				  f_workList_select();
		  }
		});
}

function f_delete_work(index)
{
	var isDel = confirm("작업내역을 삭제하시겠습니까?");
	var param = {workNo : workList[index].workNo};	
	if(isDel){
		$.ajax({
			  url : "/estate/deleteWork.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  alert (data.message);
				  f_workList_select();
			  }
		});
	}
}

function f_closeAll(){
	$("#divAddWorkPopup").trigger('close');  	
}
