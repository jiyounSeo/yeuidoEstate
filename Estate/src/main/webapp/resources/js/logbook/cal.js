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
	            	location.href="./viewLogbook.do?taskDocId="+target.events[0].title;
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
  	  url : "/estate/selectLogbookList.do",
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
			eventArray.push(item);
		}
		calendars.setEvents(eventArray);
		
  	  }
  	});
}
