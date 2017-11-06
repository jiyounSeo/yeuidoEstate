function f_getListForNewReportNotice(){

	var today_date = Number(moment().format('YYYY'))+"-"+Number(moment().format('M'))+"-"+moment().format('DD');
	//var today_date = "2017-11-07"; 
	console.log("start select new report!! :: "+today_date);
	 
	 var param = { todayDt : today_date}
	$.ajax({
		  url : "/selectTodayNewReport.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(result){
			  
			  console.log("select success, list size : " + result.newList.length);
			  
			 var htmlText = "";
			 $("#newReportNt").empty();
			 for (var i = 0; i < result.newList.length; i++){
				 var item = result.newList[i];
				 htmlText += "<li>" + today_date +" :: <b>" + item.regUserNm + "(" + item.estateNm + ")</b> 님이 계약을 ";
				 if(item.contSttSe == "1"){
					 htmlText += "<b><font color='#00a30f'>[ 진행 ]</font></b>";
				 } else if(item.contSttSe == "2") {
					 htmlText += "<b><font color='#0600ff'>[ 완료 ]</font></b>";					 
				 } else if(item.contSttSe == "3") {
					 htmlText += "<b><font color='#ff0000'>[ 해지 ]</font></b>";
				 }
				 htmlText += " 하였습니다.</li>"
			 }			 
			 $("#newReportNt").append(htmlText);
			 console.log(htmlText);
			 fn_article3('rollingText',true);
		  }
		});
}

function fn_article3(containerID, autoStart){
	
	var $element = $('#'+containerID).find('.notice-list');
	var $play = $('#'+containerID).find('.control > a.play');
	var $stop = $('#'+containerID).find('.control > a.stop');
	var autoPlay = autoStart;
	var auto = null;
	var speed = 3000;
	var timer = null;
	var move = 18;
	var first = false;
	var lastChild;
	
	//console.log("move : " +);

	lastChild = $element.children().eq(-1).clone(true);
	lastChild.prependTo($element);
	$element.children().eq(-1).remove();

	if($element.children().length==1){
		$element.css('top','0px');
	}else{
		$element.css('top','-'+move+'px');
	}

	if(autoPlay){
		timer = setInterval(moveNextSlide, speed);
		$play.addClass('on');
		auto = true;
	}else{
		$play.hide();
		$stop.hide();
	}

	$element.find('>li').bind({
		'mouseenter': function(){
			if(auto){
				clearInterval(timer);
			}
		},
		'mouseleave': function(){
			if(auto){
				timer = setInterval(moveNextSlide, speed);
			}
		}
	});

	$play.bind({
		'click': function(e){
			if(auto) return false;
			e.preventDefault();
			timer = setInterval(moveNextSlide, speed);
			$(this).addClass('on');
			$stop.removeClass('on');
			auto = true;
		}
	});

	$stop.bind({
		'click': function(e){
			if(!auto) return false;
			e.preventDefault();
			clearInterval(timer);
			$(this).addClass('on');
			$play.removeClass('on');
			auto = false;
		}
	});


	function movePrevSlide(){
		$element.each(function(idx){
			if(!first){
				$element.eq(idx).animate({'top': '0px'},'normal',function(){
					lastChild = $(this).children().eq(-1).clone(true);
					lastChild.prependTo($element.eq(idx));
					$(this).children().eq(-1).remove();
					$(this).css('top','-'+move+'px');
				});
				first = true;
				return false;
			}

			$element.eq(idx).animate({'top': '0px'},'normal',function(){
				lastChild = $(this).children().filter(':last-child').clone(true);
				lastChild.prependTo($element.eq(idx));
				$(this).children().filter(':last-child').remove();
				$(this).css('top','-'+move+'px');
			});
		});
	}

	function moveNextSlide(){
		$element.each(function(idx){
			var firstChild = $element.children().filter(':first-child').clone(true);
			firstChild.appendTo($element.eq(idx));
			$element.children().filter(':first-child').remove();
			$element.css('top','0px');
			$element.eq(idx).animate({'top':'-'+move+'px'},'normal');
		});
	}
}