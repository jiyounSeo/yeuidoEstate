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
	
jQuery(document).ready( function() {
	
	jQuery( ".datepicker" ).datepicker({
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
	            //console.log('Cal-1 today');
	        },
	        nextMonth: function () {
	        	
	        	if(currentMonth+1 > 12){
	        		currentYear++;
	        		currentMonth = 1;
	        	} else{
	        		currentMonth++;
	        	}  	            	
	            //console.log('Cal-1 next month');
	        },
	        previousMonth: function () {
	        	
	        	if(currentMonth-1 < 1){
	        		currentYear--;
	        		currentMonth = 12;
	        	} else {
	        		currentMonth--;
	        	}  	            	
	        	//console.log('Cal-1 previous month');
	        },
	        onMonthChange: function () {
	        	if(currentMonth < 10){
	        		thisMonth = String(currentYear)+"-0"+String(currentMonth)+"%"
	        	}else{
	            	thisMonth = String(currentYear)+"-"+String(currentMonth)+"%"
	        	}
	        	selectCurrentEvent();
	           // console.log('Cal-1 month changed -->'+thisMonth);
	        },
            nextYear: function () {
               // console.log('Cal-1 next year');
            },
            previousYear: function () {
                //console.log('Cal-1 previous year');
            },
            onYearChange: function () {
                //console.log('Cal-1 year changed');
            },
            nextInterval: function () {
                //console.log('Cal-1 next interval');
            },
            previousInterval: function () {
                //console.log('Cal-1 previous interval');
            },
            onIntervalChange: function () {
                //console.log('Cal-1 interval changed');
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

function f_active_frm() {
	
	var isChecked = $("#endDateYn").is(":checked");
	if(isChecked){
		$("#endDt").attr('disabled', false);
	} else {
		$("#endDt").attr('disabled', true);
		$("#endDt").val('');
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

function selectCurrentEvent(){
	
    var param = {
    		selectedMonth : thisMonth
    	};
    //console.log(param)
    $.ajax({
  	  url : "/selectWorkListAtMonth.do",
  	  type: "post",
	  data : param,
  	  dataType : "json",
  	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
  	  success : function(result){
  		  
		var workList = result.workListAtMonth;
		var eventArray= new Array();
		
		//console.log (workList);
		//console.log (workList.length);
		  
		for(var i =0; i<workList.length; i++)
		{
			var item = new Object();
			item.title = workList[i].workTitle;
			item.date = workList[i].scheduledDt;  			  
			eventArray.push(item);
		}
		calendars.setEvents(eventArray);
		
		for(var i =0; i<workList.length; i++)
		{
			var day = workList[i].scheduledDt;
			var dayArray = day.split('-');
			var itemDivId = '#eventCnt'+ parseInt(dayArray[2],10);
			
			
			$(itemDivId).empty();
			var htmlText = "";
			
			if(workList[i].objCnt > 0){
				htmlText = htmlText + "물건(" + workList[i].objCnt + "건)<br>";				
			}
			if(workList[i].custCnt > 0){
				htmlText = htmlText + "고객(" + workList[i].custCnt + "건)";				
			}
			$(itemDivId).append(htmlText);
			//console.log(itemDivId + "/" + htmlText);
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
			  //console.log ("search success");
			  //console.log (data);
			  
			  $("#workList").empty();
			  
			  var htmlText = '<table cellpadding="0" cellspacing="0">';
			  for(var i=0; i<workList.length; i++){
				  var item = workList[i];
				  htmlText = htmlText + '<tr onclick="f_modifyWork(' + i + ');return false;" style="cursor:pointer;"><td><a href="#">[' + item.mbrNm + '] ' + item.workTitle + '</a></td></tr>';
			  }
			  htmlText += '</table>';
			  //console.log(htmlText);
			  $("#workList").append(htmlText);
		  }
	});
}

function f_objt_detail(workno, objtno, objttp, saletp) {
	var url = "";
		
	switch (objttp) {
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
	
	if(url == ''){
		console.log(">> go work detail : workNo(" + workno + ") / objtNo(" + objtno + ")" );
		console.log(">> objtTp(" + objttp + ") / saleTp(" + saletp + ")" );
		console.log(">> f_objt_detail() : url(" + url +")");	
		return;
	}
	
	var frm = $('#workForm')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	
	frm.workNo.value = workno;
	frm.objtNo.value = objtno;
	frm.objtTp.value = objttp;
	frm.saleTp.value = saletp;
	frm.custId.value = '';
	frm.viewUrl.value = url;
	frm.pageNm.value = 'total';
	
	frm.submit();	
	
}
function f_mbr_detail(custid) {
	
	var frm = $('#workForm')[0];
	frm.action = '/viewClient.do';
	frm.method = 'POST';

	frm.objtNo.value = '';
	frm.custId.value = custid;
	frm.pageNm = "custPublic";

	frm.submit();
}


function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}


function f_modifyWork(index) {
	
	$("#curSelectedItemIdx").val(index);
	$("#workNo").val(workList[index].workNo);
	$("#objtNo").val(workList[index].objtNo);
	$("#objtTp").val(workList[index].objtTp);
	$("#saleTp").val(workList[index].saleTp);
	$("#custId").val(workList[index].custId);
	
	$("#workTitle").empty();
	$("#workContent").empty();	
	
	var workTitle = '';
	
	if(gfn_isNull(workList[index].objtNo) == false && gfn_isNull(workList[index].custId) == true){		
		workTitle = "<a href='#' onclick='f_objt_detail(\"" + workList[index].workNo + "\", \"" + workList[index].objtNo + "\", \"" + workList[index].objtTp + "\", \"" + workList[index].saleTp + "\");return false;'>";	
		
	} else if (gfn_isNull(workList[index].objtNo) == true && gfn_isNull(workList[index].custId) == false){		
		workTitle = "<a href='#' onclick='f_mbr_detail(\"" + workList[index].custId + "\");return false;'>";	
	
	} else {		
		console.log("Link error >> " + workList[index].workNo + "/" + workList[index].objtNo + "/" + workList[index].objtTp + "/" + workList[index].saleTp + "/" + workList[index].custId);
	}
	
	if(workList[index].endDateYn == "Y"){
		workTitle += "[종료일 : " + workList[index].endDt + "]";
	} 
	workTitle += "[" + workList[index].mbrNm + "] " + workList[index].workTitle + " ( " + workList[index].frstRegDt + " )</a>";
	
	var tmp = workList[index].workContent;
	var chContent = tmp.replace(/\n/g, '<br>&nbsp;&nbsp;&nbsp;&nbsp;'); 
	var workContent = "  →  " + chContent;
	
	$("#workTitle").append(workTitle);
	if(workList[index].workContent != ''){
		$("#workContent").append(workContent);
	}
	
	
//	================================ For Admin Direction View ==================================

	$("#endDtAdmin").val('');
	$("#endDateYnAdmin").attr("checked", false);
	$("#endDtAdmin").attr('disabled', true);
	$("#dirContent").val('');
		
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
			  
			  var Item = data.workItem;
			  
				$(".workForm #curSelectedItemIdx").val(workNo);
				$(".workForm #workNo").val(Item.workNo);
				$(".workForm #objtNo").val(Item.objtNo);
				$(".workForm #objtTp").val(Item.objtTp);
				$(".workForm #saleTp").val(Item.saleTp);
				$(".workForm #custId").val(Item.custId);

				$("#workTitle").empty();
				$("#workContent").empty();	
				
				var workTitle = "";
				
				if(gfn_isNull(Item.objtNo) == false && gfn_isNull(Item.custId) == true){		
					workTitle = "<a href='#' onclick='f_objt_detail(\"" + Item.workNo + "\", \"" + Item.objtNo + "\", \"" + Item.objtTp + "\", \"" + Item.saleTp + "\");return false;'>";
					
				} else if (gfn_isNull(Item.objtNo) == true && gfn_isNull(Item.custId) == false){		
					workTitle = "<a href='#' onclick='f_mbr_detail(\"" + Item.custId + "\");return false;'>";	
				
				} else {		
					console.log("Link error >> " + Item.workNo + "/" + Item.objtNo + "/" + Item.objtTp + "/" + Item.saleTp + "/" + Item.custId);
				}
				
				
				if(Item.endDateYn == "Y"){
					workTitle += "[종료일 : " + Item.endDt + "]";
				} 
				workTitle += "[" + Item.mbrNm + "] " +Item.workTitle + " ( " + Item.frstRegDt + " )</a>";

				var tmp = Item.workContent;
				var chContent = tmp.replace(/\n/g, '<br>&nbsp;&nbsp;&nbsp;&nbsp;'); 
				var workContent = "  →  " + chContent;
				
				$("#workTitle").append(workTitle);
				if(Item.workContent != ''){
					$("#workContent").append(workContent);
				}
				
				console.log(">> open : " + $(".workForm #curSelectedItemIdx").val() + "/" + $(".workForm #workNo").val() + "/" + $(".workForm #objtNo").val() + "/" + $(".workForm #objtTp").val() + "/" + $(".workForm #saleTp").val() + "/" + $(".workForm #custId").val());
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
//			  console.log(htmlText);
			  $("#todoItemList").append(htmlText);
		  }
	});
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
		
//		console.log(todayDt + "/" + endDt);
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
		, endDt: endDt
		, endDateYn : endDtYn
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
				  //selectWorkListAtdate(moment().format('YYYY-MM-DD'));
				  location.href="./adminMainView.do";
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
				  	$("#divAddWorkPopup").trigger('close');
					alert (data.message);
					$("#dirContent").val("");
					location.href="./adminMainView.do";
					//f_modifyWork($("#curSelectedItemIdx").val());
					
					//$("#endDt").val('');
					//$("#endDateYn").attr("checked", false);
					//$("#endDt").attr('disabled', false);
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
				  //selectWorkListAtdate(moment().format('YYYY-MM-DD'));
				  location.href="./adminMainView.do";
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
				//f_modifyWork($("#curSelectedItemIdx").val());

				location.href="./adminMainView.do";
			  }
		});
	}
}

function f_closePopup(){
	$("#divAddWorkPopup").trigger('close');  	
}
