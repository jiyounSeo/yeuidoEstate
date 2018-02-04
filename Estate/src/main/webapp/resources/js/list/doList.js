$(document).ready(function(){

	f_workList_select();
	
	$( ".datepicker" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	 });
	
});

function f_addWork() {
	$("#workNo").val("");
	$("#workTitle").val("");
	$("#workContent").val("");
	$("#divAddWorkPopup").lightbox_me({centered: true});
	$("#endDt").val('');
	$("#endDateYn").attr("checked", false);
	$("#endDt").attr('disabled', true);
}

function f_modifyWork(index) {
	$("#workNo").val(workList[index].workNo);
	$("#workTitle").val(workList[index].workTitle);
	$("#workContent").val(workList[index].workContent);
	
	if(workList[index].endDateYn == 'Y'){
		$("#endDt").val(workList[index].endDt);
		$("#endDateYn").attr("checked", "checked");
		$("#endDt").attr('disabled', false);
	} else {
		  $("#endDt").val('');
		  $("#endDateYn").attr("checked", false);
		  $("#endDt").attr('disabled', true);
	}
	$("#divAddWorkPopup").lightbox_me({centered: true});
}


function f_workList_select() {
	var param = {};
	param.objtNo = $("#objtNo").val();
	param.custId = $("#custId").val();
	
	$.ajax({
		url : "/selectWorkList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#workTbody").empty();
			if (result.workList.length != 0) {
				workList = result.workList;
				$("#workListTemplte").tmpl(result).appendTo("#workTbody");
				// 삭제버튼은 글쓴이 본인만 가능함.
				$.each (workList, function(index) {
					if (workList[index].deleteBtnYn == "N") {
						$("#workTbody tr:eq("+index+") #btnDel").hide();
					}
					
				});
			} else {
				$("#workListEmptyTemplte").tmpl(result).appendTo("#workTbody");
			}
			
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
/*
	if ($("#workContent").val() == "") {
		alert ("작업내역을 입력하세요.");
		$("#workContent").focus();
		return;
	} 
*/	
	var endDt = $("#endDt").val();
	var endDtYn = $("#endDateYn").is(":checked")? 'Y' : 'N';

	
	var scheduledDt = '';
	if(endDtYn == 'Y'){
		
		var now = new Date(); 
		var year= now.getFullYear(); 
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1); 
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate(); 
		var todayDt = year + '-' + mon + '-' + day;
		
		console.log(todayDt + "/" + endDt);
		if(endDt == '') {
			alert("종료일을 선택해 주세요");
			$("#endDt").focus();
			return;
		}
		else if(endDt < todayDt) {
			alert("종료일은 오늘보다 이전 날짜로 선택할 수 없습니다");
			$("#endDt").focus();
			return;
		}
		scheduledDt = endDt;
	} 
	
	var param = {
		workNo : $("#workNo").val()
		, workContent : $("#workContent").val()
		, workTitle : $("#workTitle").val()
		, objtNo : $("#objtNo").val()
		, custId : $("#custId").val()
		, endDateYn : endDtYn
		, endDt : endDt
		, scheduledDt :scheduledDt
	}
	
	$.ajax({
		  url : "/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#divAddWorkPopup").trigger('close');
				  alert (data.message);
				  $("#divAddWorkPopup").trigger('close');
				  f_workList_select();
				  
				  $("#endDt").val('');
				  $("#endDateYn").attr("checked", false);
				  $("#endDt").attr('disabled', true);
		  }
		});
}

function f_delete_work(index)
{
	var isDel = confirm("작업내역을 삭제하시겠습니까?");
	var param = {workNo : workList[index].workNo};	
	
	if(isDel){
		$.ajax({
			  url : "/deleteWork.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  alert (data.message);
				  $("#divAddWorkPopup").trigger('close');
				  f_workList_select();
			  }
		});
	}
	f_closeAll();
}

function f_closeAll(){
	$("#divAddWorkPopup").trigger('close');  	
	  $("#endDt").val('');
	  $("#endDateYn").attr("checked", false);
	  $("#endDt").attr('disabled', true);
}

function f_active_date() {
	
	var isChecked = $("#endDateYn").is(":checked");
	if(isChecked){
		$("#endDt").attr('disabled', false);
	} else {
		$("#endDt").attr('disabled', true);
		$("#endDt").val('');
	}
	
}
