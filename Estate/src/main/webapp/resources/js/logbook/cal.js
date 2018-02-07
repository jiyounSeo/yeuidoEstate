// Call this from the developer console and you can control both instances
var calendars = {};

var startYear = moment().format('YYYY');
var startMonth = moment().format('M');
var currentYear;
var currentMonth;
var thisMonth;

$(document).ready( function() {
	
	currentYear = Number(startYear);
	currentMonth = Number(startMonth);
	thisMonth = moment().format('YYYY-MM')+"%";	
	
	calendars = $('.cal1').clndr({
		//events: eventArray,
	    clickEvents: {
	        click: function (target) {
	            console.log('Cal-1 clicked: ', target);
	            if(target.events != '') {
	            	
	            	var mbrTp = $("#mbrType").val();
	            	console.log(mbrTp);
	            	if (mbrTp  == "MT003" || mbrTp == "MT004") {
		            	
		            	$("#divPopup").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
		            		$("#lb_list").empty();
		            		
		            		var htmlText = "<table class='lbList'>";
		            		htmlText += "<tr><td width='50px' class='title'></td><td width='500px' class='title'>작성자</td></tr>";
		            		for(var i = 0; i<target.events.length;i++){
		            			htmlText = htmlText + "<tr>";
		            			htmlText = htmlText + "<td>" + (i+1) + "</td>";
		            			htmlText = htmlText + "<td><a href='./viewLogbook.do?taskDocId=" + target.events[i].title + "'>" 
		            			htmlText = htmlText + target.events[i].mbrNm + "님의 업무일지</a></td>";
		            			htmlText = htmlText + "</tr>";
		            		}
		            		htmlText += "</table>";
		            		$("#lb_list").append(htmlText);
		            	}});
	            	} else {
	 	            	location.href="./viewLogbook.do?taskDocId="+target.events[0].title;	            		
	            	}

	            }
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
    		currentDt : thisMonth
    	};
    $.ajax({
  	  url : "/selectLogbookList.do",
  	  type: "post",
	  data : param,
  	  dataType : "json",
  	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
  	  success : function(result){
  		  
		var LBList = result.lbList;
		var eventArray= new Array();
		  
		for(var i =0; i<LBList.length; i++)
		{
			var item = new Object();
			item.title = LBList[i].taskDocId;
			item.date = LBList[i].frstRegDt;
			item.mbrNm = LBList[i].mbrNm;
			eventArray.push(item);
		}
		calendars.setEvents(eventArray);
		
		var mbrTp = $("#mbrType").val();
    	if (mbrTp  == "MT003" || mbrTp == "MT004") {
			for(var i =0; i<LBList.length; i++)
			{
				var day = LBList[i].frstRegDt;
				var dayArray = day.split('-');
				var itemDivId = '#eventCnt'+dayArray[2];
				
				$(itemDivId).empty();
				var htmlText = "";
				
				if(LBList[i].bookCnt > 0){
					htmlText = htmlText + "업무일지(" + LBList[i].bookCnt + "건)<br>";				
				}
				$(itemDivId).append(htmlText);
				console.log(itemDivId + "/" + htmlText);
			}
    	}
  	  }
  	});
}
