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


var icon_done = "./resources/images/icon_done.gif";
var icon_n_done = "./resources/images/icon_n_done.gif";

function f_addWork() {
	$("#workNo").val("");
	$("#workTitleNew").val("");
	$("#workContentNew").val("");
	$("#divAddWorkPopup").lightbox_me({centered: true});
	$("#endDtNew").val('');
	$("#endDateYnNew").attr("checked", false);
	$("#endDtNew").attr('disabled', true);
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

	$("#editBtnDiv").empty();
	if(workList[index].deleteBtnYn == "Y"){
		
		$("#editForm").css({"display":"block"});
		
		var htmlText = "";
		htmlText += '<a href="#" onClick="f_closeAll()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		htmlText += '<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		
		$("#editBtnDiv").append(htmlText);		
		
	} else {
		$("#viewForm").css({"display":"block"});
		$("#workTitleView").empty();
		$("#workContentView").empty();
		
		var workTitle = "";
		if(workList[index].endDateYn == "Y"){
			workTitle += "[종료일 : " + workList[index].endDt + "]";
		} 
		workTitle += "[" + workList[index].mbrNm + "] " + workList[index].workTitle + " ( " + workList[index].frstRegDt + " )";

		var tmp = workList[index].workContent;
		var chContent = tmp.replace(/\n/g, '<br>&nbsp;&nbsp;&nbsp;&nbsp;'); 
		var workContent = "  →  " + chContent;
		
		$("#workTitleView").append(workTitle);
		if(workList[index].workContent != ''){
			$("#workContentView").append(workContent);
		}
	}

	f_selectDirListAtWork(workList[index].workNo);
	
	$("#divViewWorkPopup").lightbox_me({centered: true});
}

function f_selectDirListAtWork(workNo){
	var selectedWorkNo = workNo;
	var param = {
			selectedWorkNo : selectedWorkNo
	};
	$.ajax({
		  url : "/selectDirListAtWork.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  dirList = data.dirList;
//			  console.log ("search success");
//			  console.log (data);
			  
			  $("#todoItemList").empty();
			  var htmlText = "";
			  for(var i=0; i<dirList.length; i++){
				  var item = dirList[i];
				  htmlText += "<div class='directionBox'><table width='100%' cellpadding='0' cellspacing='0' border='0'>";

				  htmlText += '<tr><td rowspan="2" class="isDo" align="center">';
				  
				  if(item.doneBtnYn == 'Y'){
					  htmlText += '<a href="#" onclick="f_changeDone_state(' + item.dirNo + ',\'' + item.isDone +'\');return false;">';
				  }
				  
				  if(item.isDone == "Y"){
					  htmlText += "<img src='" + icon_done  +"'>";
				  } else {
					  htmlText += "<img src='" + icon_n_done  +"'>";
				  }
				  
				  if(item.doneBtnYn == 'Y'){
					  htmlText += '</a>';
				  }
				  
				  
				  if(item.endDateYn == "Y" && item.isDone == "N"){
					  var color = "";
					  var tmp = (item.intvDay.toString()).split('-');
					  var sign;
					  var interv;	
					  if(tmp.length == 1){
						  sign = '+';
						  interv = item.intvDay;
					  } else {
						  sign = '-';
						  interv = item.intvDay * -1;
					  }
					  if((interv <= 7 && sign == '-') || sign == '+') { color = "red"; }
					  else { color = "#009e04"; }

					  htmlText += "<br><span style='margin-top:10px;font-size:12px;'><b><font color='"+ color +"'> D" + item.intvDay;
				  }
				  htmlText += "</font></b></span></td><td colspan='2' class='todoCont'> " + item.dirContent + "</td></tr>";
				  htmlText += "<tr><td align='right'>From : <b>" + item.regUserNm + "</b> 님 [ "+ item.regDate +"]</td>";
				  htmlText += "<td align='right'>";
				  
				  if($("#memberType").val() == 'MT003' || $("#memberType").val() == 'MT004'){
					  htmlText += "<a href='#' onclick='f_delete_direction(" + item.dirNo + "," + i + ");return false;'><img src='./resources/images/bnt_del.png'></a>";					  
				  }
				  htmlText += "</td></tr>";
				  htmlText += "</table></div>"
			  }
			  console.log(htmlText);
			  $("#todoItemList").append(htmlText);
		  }
	});
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
	
	if ($("#workTitle").val() == "") {
		alert ("작업내역 제목을 입력하세요.");
		$("#workTitle").focus();
		return;
	} 

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
		  url : "/modifyWork.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  f_finish();
		  }
		});
}

function f_work_save_new() {	
	
	var workContent = $("#workContentNew").val();
	
	if ($("#workTitleNew").val() == "") {
		alert ("작업내역 제목을 입력하세요.");
		$("#workTitleNew").focus();
		return;
	} 

	var endDt = $("#endDtNew").val();
	var endDtYn = $("#endDateYnNew").is(":checked")? 'Y' : 'N';

	
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
	
	var param = { workContent : $("#workContentNew").val()
		, workTitle : $("#workTitleNew").val()
		, objtNo : $("#objtNo").val()
		, custId : $("#custId").val()
		, endDateYn : endDtYn
		, endDt : endDt
		, scheduledDt :scheduledDt
	}
	
	$.ajax({
		  url : "/insertWork.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  f_finish();
			  
		  }
		});
}

function f_todo_save() {
	

	var endDt = $("#endDtAdmin").val();
	var endDtChecked = $("#endDateYnAdmin").is(":checked")? 'Y' : 'N';
	
	if(endDtChecked == 'Y'){
		
		var now = new Date(); 
		var year= now.getFullYear(); 
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1); 
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate(); 
		var todayDt = year + '-' + mon + '-' + day;
		
		if(endDt == '') {
			alert("종료일을 선택해 주세요");
			$("#endDtAdmin").focus();
			return;
		}
		else if(endDt < todayDt) {
			alert("종료일은 오늘보다 이전 날짜로 선택할 수 없습니다");
			$("#endDtAdmin").focus();
			return;
		}
	} 
	
	var param = {
			workNo : $("#workNo").val()
			, dirContent : $("#dirContent").val()
			, endDt: endDt
			, endDateYn : endDtChecked
		}
		
		$.ajax({
			  url : "/insertDirection.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  	alert (data.message);					
					f_finish();
					
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
				  f_finish();
			  }
		});
	}
	f_closeAll();
}

function f_delete_direction(dirNo, i)
{
	var isDel = confirm("해당 지시사항을 삭제하시겠습니까?");
	var param = {dirNo : dirNo};	
	if(isDel){
		$.ajax({
			  url : "/deleteDirection.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
					alert (data.message);
					f_finish();
			  }
		});
	}
}

function f_finish(){
	
	f_closeAll();
	f_workList_select();	  
}

function f_closeAll(){
	
	$("#divAddWorkPopup").trigger('close');
	$("#divViewWorkPopup").trigger('close');
	
	f_init_frm();
}

function f_init_frm(){
	
	$("#workNo").val("");
	$("#workTitleNew").val("");
	$("#workContentNew").val("");
	$("#workTitle").val("");
	$("#workContent").val("");
	$("#dirContent").val("");
	
	$("#endDt").val('');
	$("#endDateYn").attr("checked", false);
	$("#endDt").attr('disabled', true);	
	
	
	$("#endDtAdmin").val('');
	$("#endDateYnAdmin").attr("checked", false);
	$("#endDtAdmin").attr('disabled', false);
	
	$("#endDtNew").val('');
	$("#endDateYnNew").attr("checked", false);
	$("#endDtNew").attr('disabled', true);
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
function f_active_date_new() {
	
	var isChecked = $("#endDateYnNew").is(":checked");
	if(isChecked){
		$("#endDtNew").attr('disabled', false);
	} else {
		$("#endDtNew").attr('disabled', true);
		$("#endDtNew").val('');
	}
	
}


function f_active_frm_admin() {
	var isChecked = $("#endDateYnAdmin").is(":checked");
	if(isChecked){
		$("#endDtAdmin").attr('disabled', false);
	} else {
		$("#endDtAdmin").attr('disabled', true);
		$("#endDtAdmin").val('');
	}
}

function f_changeDone_state(dirNo, curState){
	
	var changingState = "";
//	console.log(curState);
	if(curState == "Y"){
		changingState = "N";
	} else {
		changingState = "Y";		
	}
	
	var param = {
			isDone : changingState,
			dirNo : dirNo
		}
		
		$.ajax({
			  url : "/changeDoneState.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  
				  	$("#divAddWorkPopup").trigger('close');
					alert (data.message);
					
			  }
			});
}
