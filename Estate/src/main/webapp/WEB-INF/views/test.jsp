<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/report/rollingNotice.js"></script>
<script>
function fn_article3(containerID, buttonID, autoStart){
	var $element = $('#'+containerID).find('.notice-list');
	var $prev = $('#'+buttonID).find('.prev');
	var $next = $('#'+buttonID).find('.next');
	var $play = $('#'+containerID).find('.control > a.play');
	var $stop = $('#'+containerID).find('.control > a.stop');
	var autoPlay = autoStart;
	var auto = null;
	var speed = 2000;
	var timer = null;
	var move = $element.children().outerHeight();
	var first = false;
	var lastChild;

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

	$prev.bind({
		'click': function(){
			movePrevSlide();
			return false;	
		},
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

	$next.bind({
		'click': function(){
			moveNextSlide();
			return false;
		},
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
</script>

<style type="text/css">
	#rollingText .viewArea{height:20px;position:relative;overflow:hidden;}
	#rollingText ul{position:absolute; top:0px;}
	#rollingText .control a.on {color:red;}
</style>


<div id="rollingText">
	<div class="viewArea">
		<ul class="notice-list" id="newReportNt" name="newReportNt">
			<li>1. '보코' 손승연, 美 버클리 음대 합격 "버클리도 반했다"</li>
			<li><a href="#">2. K팝스타 러브라인, 이승훈 두고 백아연·이미쉘 신경전?</a></li>
			<li><a href="#">3. '내 아내의 모든 것', '어벤져스' 제쳤다..예매율 1위...</a></li>
			<li><a href="#">4. '사랑비' 이미숙-정진영, 아름다운 이별…</a></li>
			<li><a href="#">5. 최효종, 다시 한 번 강용석 의원이 고소한다면?</a></li>
		</ul>
	</div>
	<div class="control fl">
		<a href="#" class="play">재생</a>
		<a href="#" class="stop">정지</a>
	</div>
  		<span id="bt5">
			<a href="#" class="prev">이전</a>
			<a href="#" class="next">다음</a>
		</span>
</div>
	<script type="text/javascript">fn_article3('rollingText','bt5',true);</script>
