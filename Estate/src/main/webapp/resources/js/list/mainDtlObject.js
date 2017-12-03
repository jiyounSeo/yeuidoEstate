$(document).ready(function(){
	f_map_setting($("#jibunAddr").val());
});


function f_map_setting(myaddress) {
	var pointX = 0;
	var pointY = 0;
	naver.maps.Service.geocode({address: myaddress}, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
        }
        var result = response.result;
        console.log (result);
        pointX = result.items[0].point.x;
        pointY = result.items[0].point.y;
        f_map_draw( pointX, pointY);
	});
}

function f_map_draw(x, y) {
	// marker1

	//지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
	var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(x, y),
		    minZoom: 7,
		    zoom: 11,
		    mapTypeControl: true,
		    scrollWheel: false,
		    mapTypeControlOptions: {
		        style: naver.maps.MapTypeControlStyle.BUTTON,
		        position: naver.maps.Position.TOP_RIGHT
		    },
		    zoomControl: true,
		    zoomControlOptions: {
		        style: naver.maps.ZoomControlStyle.LARGE,
		        position: naver.maps.Position.RIGHT_CENTER
		    },
		    scaleControl: true,
		    scaleControlOptions: {
		        position: naver.maps.Position.BOTTOM_RIGHT
		    },
		    logoControl: true,
		    logoControlOptions: {
		        position: naver.maps.Position.TOP_LEFT
		    },
		    mapDataControl: true,
		    mapDataControlOptions: {
		        position: naver.maps.Position.BOTTOM_LEFT
		    }
	});
	
	var myaddr = new naver.maps.Point(x, y);
    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
    var marker = new naver.maps.Marker({
	    position: myaddr,
	    icon: {
        	url: 'http://여의도닷컴.com/images/marker.png',
	        size: new naver.maps.Size(25, 33)
	    },
	    map: map
	});
		
}

