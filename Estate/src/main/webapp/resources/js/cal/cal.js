// Call this from the developer console and you can control both instances
var calendars = {};

var startYear = moment().format('YYYY');
var startMonth = moment().format('M');
var currentYear;
var currentMonth;
var thisMonth;
var workList;

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
			var itemDivId = '#eventCnt'+dayArray[2];
			
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
				  htmlText = htmlText + '<tr><td><a href="#" onclick="f_modifyWork(' + i + ');return false;">[' + item.mbrNm + '] ' + item.workTitle + '</a></td></tr>';
			  }
			  htmlText += '</table>';
			  console.log(htmlText);
			  $("#workList").append(htmlText);
		  }
	});
}


function f_modifyWork(index) {
	$("#workNo").val(workList[index].workNo);
	$("#workTitle").val(workList[index].workTitle);
	$("#workContent").val(workList[index].workContent);
	$("#divAddWorkPopup").lightbox_me({centered: true});
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

function f_closePopup(){
	$("#divAddWorkPopup").trigger('close');  	
}
