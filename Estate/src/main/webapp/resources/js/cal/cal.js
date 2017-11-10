// Call this from the developer console and you can control both instances
var calendars = {};

var startYear = moment().format('YYYY');
var startMonth = moment().format('M');
var currentYear;
var currentMonth;
var thisMonth;
var workList;

var icon_done = "./resources/images/icon_done.gif";
var icon_n_done = "./resources/images/icon_n_done.gif";
	
$(document).ready( function() {
	
	currentYear = Number(startYear);
	currentMonth = Number(startMonth);
	thisMonth = moment().format('YYYY-MM')+"%";		
	
	selectWorkListAtdate(moment().format('YYYY-MM-DD'));
	
    calendars = $('.cal1').clndr({
    	//events: eventArray,
        clickEvents: {
        	click: function (target) {
        		selectWorkListAtdate(target.date._i);
	        },
	        today: function () {
	        	currentYear = Number(moment().format('YYYY'));
	        	currentMonth = Number(moment().format('M'));
	        	selectCurrentEvent();
	            console.log('Cal-1 today');
	        },
	        nextMonth: function () {
	        	
	        	if(currentMonth+1 > 12){
	        		currentYear++;
	        		currentMonth = 1;
	        	} else{
	        		currentMonth++;
	        	}  	            	
	            console.log('Cal-1 next month');
	        },
	        previousMonth: function () {
	        	
	        	if(currentMonth-1 < 1){
	        		currentYear--;
	        		currentMonth = 12;
	        	} else {
	        		currentMonth--;
	        	}  	            	
	        	console.log('Cal-1 previous month');
	        },
	        onMonthChange: function () {
	        	if(currentMonth < 10){
	        		thisMonth = String(currentYear)+"-0"+String(currentMonth)+"%"
	        	}else{
	            	thisMonth = String(currentYear)+"-"+String(currentMonth)+"%"
	        	}
	        	selectCurrentEvent();
	            console.log('Cal-1 month changed -->'+thisMonth);
	        },
            nextYear: function () {
                console.log('Cal-1 next year');
            },
            previousYear: function () {
                console.log('Cal-1 previous year');
            },
            onYearChange: function () {
                console.log('Cal-1 year changed');
            },
            nextInterval: function () {
                console.log('Cal-1 next interval');
            },
            previousInterval: function () {
                console.log('Cal-1 previous interval');
            },
            onIntervalChange: function () {
                console.log('Cal-1 interval changed');
            }
        },
        multiDayEvents: {
            singleDay: 'date',
            endDate: 'endDate',
            startDate: 'startDate'
        },
        showAdjacentMonths: true,
        adjacentDaysChangeMonth: false,
        forceSixRows: true
    });

	selectCurrentEvent();     
});

function selectCurrentEvent(){
	
    var param = {
    		selectedMonth : thisMonth
    	};
    console.log(param)
    $.ajax({
  	  url : "/selectWorkListAtMonth.do",
  	  type: "post",
	  data : param,
  	  dataType : "json",
  	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
  	  success : function(result){
  		  
		var workList = result.workListAtMonth;
		var eventArray= new Array();
		
		console.log (workList);
		console.log (workList.length);
		  
		for(var i =0; i<workList.length; i++)
		{
			var item = new Object();
			item.title = workList[i].workTitle;
			item.date = workList[i].frstRegDt;  			  
			eventArray.push(item);
		}
		calendars.setEvents(eventArray);
		
		for(var i =0; i<workList.length; i++)
		{
			var day = workList[i].frstRegDt;
			var dayArray = day.split('-');
			var itemDivId = '#eventCnt'+parseInt(dayArray[2],10);
			
			$(itemDivId).empty();
			var htmlText = "";
			
			if(workList[i].objCnt > 0){
				htmlText = htmlText + "물건(" + workList[i].objCnt + "건)<br>";				
			}
			if(workList[i].custCnt > 0){
				htmlText = htmlText + "고객(" + workList[i].custCnt + "건)";				
			}
			$(itemDivId).append(htmlText);
			console.log(itemDivId + "/" + htmlText);
		}
		
  	  }
  	});
}


function selectWorkListAtdate(date){
	var selectedDate = date;
	var param = {
			selectedDate : selectedDate
	};
	$.ajax({
		  url : "/selectWorkListAtDate.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  workList = data.workList;
			  console.log ("search success");
			  console.log (data);
			  
			  $("#workList").empty();
			  
			  var htmlText = '<table cellpadding="0" cellspacing="0">';
			  for(var i=0; i<workList.length; i++){
				  var item = workList[i];
				  htmlText = htmlText + '<tr onclick="f_modifyWork(' + i + ');return false;" style="cursor:pointer;"><td><a href="#">[' + item.mbrNm + '] ' + item.workTitle + '</a></td></tr>';
			  }
			  htmlText += '</table>';
			  console.log(htmlText);
			  $("#workList").append(htmlText);
		  }
	});
}

function f_work_detail() {
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
	frm.submit();

}

function f_modifyWork(index) {
	
	$("#curSelectedItemIdx").val(index);
	$("#workNo").val(workList[index].workNo);
	$("#objtNo").val(workList[index].objtNo);
	$("#objtTp").val(workList[index].objtTp);
	console.log (workList[index]);
	$("#saleTp").val(workList[index].saleTp);
	$("#custId").val(workList[index].custId);
	
	$("#workTitle").val(workList[index].workTitle);
	$("#workContent").val(workList[index].workContent);
	
	var workTitle = "[" + workList[index].mbrNm + "] " + workList[index].workTitle + " ( " + workList[index].frstRegDt + " )";
	var workContent = "  →  " + workList[index].workContent;
	$("#workTitleForAdmin").empty();
	$("#workContentForAdmin").empty();
	$("#workTitleForAdmin").append(workTitle);
	$("#workContentForAdmin").append(workContent);
	
	f_selectDirListAtWork(workList[index].workNo);
	
	$("#divAddWorkPopup").lightbox_me({centered: true});
	
	
}


function f_modifyWorkAtTodoList(workNo) {
	
	console.log(workNo);
	f_selectWorkItem(workNo);
	f_selectDirListAtWork(workNo);
	
	$("#divAddWorkPopup").lightbox_me({centered: true});
	
	
}

function f_selectWorkItem(workNo){
	var selectedWorkNo = workNo;
	var param = {
			selectedWorkNo : selectedWorkNo
	};
	$.ajax({
		  url : "/selectWorkItem.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){

			  console.log ("search success");
			  console.log (data.workItem);
			  
			  var Item = data.workItem;
			  console.log (Item);
			  $("#workNo").val(Item.workNo);
//			  $("#custId").val(Item.custId);
//			  $("#objtNo").val(Item.objtNo);
//			  
			  $("#workTitle").val(Item.workTitle);
			  $("#workContent").val(Item.workContent);
			
			  var workTitle = "[" + Item.mbrNm + "] " + Item.workTitle + " (" + Item.frstRegDt + " )";
			  var workContent = "  →  " + Item.workContent;
			  $("#workTitleForAdmin").empty();
			  $("#workContentForAdmin").empty();
			  $("#workTitleForAdmin").append(workTitle);
			  $("#workContentForAdmin").append(workContent);
				
		  }
	});
	
	
	
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
			  console.log ("search success");
			  console.log (data);
			  
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
				  htmlText += "</td><td colspan='2' class='todoCont'> " + item.dirContent + "</td></tr>";
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
					if(curState=="N"){	// N --> Y
						location.href='./selectALLDirListPage.do';
					} else {
						location.href='./adminMainView.do';
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
					f_modifyWork($("#curSelectedItemIdx").val());
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
				f_modifyWork($("#curSelectedItemIdx").val());
			  }
		});
	}
}

function f_closePopup(){
	$("#divAddWorkPopup").trigger('close');  	
}
