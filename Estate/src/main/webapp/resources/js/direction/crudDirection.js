
var todoList;
var icon_done = "./resources/images/icon_done.gif";
var icon_n_done = "./resources/images/icon_n_done.gif";

$(document).ready( function() {
	
	if($("#memberType").val() == 'MT003' || $("#memberType").val() == 'MT004'){
		selectALLRegDirList();
	} else {
		selectALLDirList();
	}

});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		if($("#memberType").val() == 'MT003' || $("#memberType").val() == 'MT004'){
			selectALLRegDirList();
		} else {
			selectALLDirList();
		}
	}
	
});

// 관리자용 list
function selectALLRegDirList() {	

	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
		url : "/selectALLRegDirList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#dirTbody").empty();
			
			todoList = result.dirList;
			//console.log (todoList);
			if (result.dirList.length != 0) {
				$("#dirListTemplteAdmin").tmpl(result).appendTo("#dirTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#dirListEmptyTemplteAdmin").tmpl(result).appendTo("#dirTbody");
		  }
		}
	});
	
}


// 회원용 list
function selectALLDirList() {

	var param = { currentPage : Number(currPage)
				   , pagePerRow : 10
				   , pageSize : 10
	};
	$.ajax({
		url : "/selectALLDirList.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#dirTbody").empty();

			todoList = result.dirList;
			//console.log (todoList);
			if (result.dirList.length != 0) {
				$("#dirListTemplteMbr").tmpl(result).appendTo("#dirTbody");
				$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
				$("#page" + currPage).addClass("active");
		  } else {
			  $("#pagingDiv").empty();
			  $("#dirListEmptyTemplteMbr").tmpl(result).appendTo("#dirTbody");
		  }
		}
	});
}


function f_viewWork(index) {

	$("#curSelectedItemIdx").val(index);
	$("#workNo").val(todoList[index].workNo);
	$("#objtNo").val(todoList[index].objtNo);
	$("#objtTp").val(todoList[index].objtTp);
	$("#saleTp").val(todoList[index].saleTp);
	$("#custId").val(todoList[index].custId);

	$("#workNo").val(todoList[index].workNo);
	
	var workTitle = "[" + todoList[index].targetUserNm + "] " + todoList[index].workTitle;
	$("#workTitle").empty();
	$("#workContent").empty();
	$("#workTitle").append(workTitle);

	var chContent;
	var tmp = todoList[index].workContent;
	if(tmp != ''){
		chContent = tmp.replace(/\n/g, '<br>&nbsp;&nbsp;&nbsp;&nbsp;'); 
	}
	var workContent = "  →  " + chContent;
	
	if(todoList[index].workContent != ''){
		$("#workContent").append(workContent);		
	}
	
	f_selectDirListAtWork(todoList[index].workNo);
	
	$("#divAddWorkPopup").lightbox_me({centered: true});	
}

function f_work_detail() {
	console.log(">> go work detail : objtNo(" + $("#objtNo").val() + ") / custId(" + $("#custId").val() + ")" );
	if ($("#objtNo").val() != "") {
		f_objt_detail();
	} else if ($("#custId").val() != "") {
		f_mbr_detail();
	}
}
function f_objt_detail() {
	var url = "";
	switch ( $("#objtTp").val() ) {
		case "OT001"	:
			url = "viewObApt";
			break;
		case "OT002"	:
			url = "viewObStore";
			break;
		case "OT003"	:
			url = "viewObOffice";
			break;
		case "OT004"	:
			url = "viewObOps";
			break;
		case "OT005"	:
			url = "viewObHrapt";
			break;
		case "OT006"	:
			url = "viewObTicket";
			break;
	}
	$("#viewUrl").val(url);
	
	if($("#viewUrl").val() == ''){
		console.log(">> go work detail : objtNo(" + $("#objtNo").val() + ") / custId(" + $("#custId").val() + ")" );
		console.log(">> f_objt_detail() : url(" + url +"), form(" + frm +")");	
		return;
	}
	
	var frm = $('#workForm')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';

	frm.submit();	
	
}
function f_mbr_detail() {
	var frm = $('#workForm')[0];
	$("#pageNm").val("custPublic");
	frm.action = '/viewClient.do';
	frm.method = 'POST';	
	console.log(">> f_mbr_detail() : form(" + frm +")");
	frm.submit();

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
			  //console.log ("search success");
			  //console.log (data);
			  			  
			  $("#todoItemList").empty();
			  var htmlText = "";
			  for(var i=0; i<dirList.length; i++){
				  var item = dirList[i];
				  htmlText += "<div class='directionBox'><table width='100%' cellpadding='0' cellspacing='0' border='0'>";

				  htmlText += '<tr><td rowspan="2" class="isDo" align="center"><a href="#" onclick="f_changeDone_state(' + item.dirNo + ',\'' + item.isDone +'\');return false;">';
				  if(item.isDone == "Y"){
					  htmlText += "<img src='" + icon_done  +"'></a>";
				  } else {
					  htmlText += "<img src='" + icon_n_done  +"'></a>";
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
			  //console.log(htmlText);
			  $("#todoItemList").append(htmlText);
		  }
	});
}

function f_changeDone_state(dirNo, curState){
	
	var changingState = "";
	console.log(curState);
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
					location.href='./selectALLDirListPage.do';					
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
		  url : "/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#divAddWorkPopup").trigger('close');
				  alert (data.message);
				  $("#divAddWorkPopup").trigger('close');
				  selectWorkListAtdate(moment().format('YYYY-MM-DD'));
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
				  selectWorkListAtdate(moment().format('YYYY-MM-DD'));
			  }
		});
	}
}

function f_todo_save() {
	var param = {
			workNo : $("#workNo").val()
			, dirContent : $("#dirContent").val()
		}
		
		$.ajax({
			  url : "/insertDirection.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  	$("#divAddWorkPopup").trigger('close');
					alert (data.message);
					$("#dirContent").val("");
					f_viewWork($("#curSelectedItemIdx").val());
			  }
			});
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
					$("#divAddWorkPopup").trigger('close');  	
					f_viewWork($("#curSelectedItemIdx").val());
			  }
		});
	}
}

function f_closePopup(){
	$("#divAddWorkPopup").trigger('close');  	
}
