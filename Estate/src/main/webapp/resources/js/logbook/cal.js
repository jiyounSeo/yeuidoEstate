// Call this from the developer console and you can control both instances
var calendars = {};

$(document).ready( function() {
    console.info(
        'Welcome to the CLNDR demo. Click around on the calendars and' +
        'the console will log different events that fire.');

    var thisMonth = moment().format('YYYY-MM')+"%";
    
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
  			  
  	    calendars.clndr1 = $('.cal1').clndr({
  	    	events: eventArray,
  	        clickEvents: {
  	            click: function (target) {
  	                console.log('Cal-1 clicked: ', target);
  	                if(target.events != '') {
  	                	location.href="./viewLogbook.do?taskDocId="+target.events[0].title;
  	                }
  	            },
  	            today: function () {
  	                console.log('Cal-1 today');
  	            },
  	            nextMonth: function () {
  	                console.log('Cal-1 next month');
  	            },
  	            previousMonth: function () {
  	                console.log('Cal-1 previous month');
  	            },
  	            onMonthChange: function () {
  	                console.log('Cal-1 month changed');
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

  	  }
  	});
    
});