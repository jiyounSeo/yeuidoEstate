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
  	  url : "/estate/selectWorkListAtMonth.do",
  	  type: "post",
	  data : param,
  	  dataType : "json",
  	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
  	  success : function(result){
  		  
		var workList = result.workListAtMonth;
		var eventArray= new Array();
		
		console.log (workList);
		  
		for(var i =0; i<workList.length; i++)
		{
			var item = new Object();
			item.title = workList[i].workTitle;
			item.date = workList[i].frstRegDt;  			  
			eventArray.push(item);
		}
		calendars.setEvents(eventArray);
		
  	  }
  	});
}


function selectWorkListAtdate(date){
	var selectedDate = date;
	var param = {
			selectedDate : selectedDate
	};
	$.ajax({
		  url : "/estate/selectWorkListAtDate.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.workList;
			  console.log ("search success");
			  console.log (data);
			  
			  $("#workList").empty();
			  
			  var htmlText = '<table cellpadding="0" cellspacing="0">';
			  for(var i=0; i<result.length; i++){
				  var item = result[i];
				  htmlText = htmlText + '<tr><td>[' + item.mbrNm + '] ' + item.workTitle + '</td></tr>';
			  }
			  htmlText += '</table>';
			  console.log(htmlText);
			  $("#workList").append(htmlText);
		  }
	});
}