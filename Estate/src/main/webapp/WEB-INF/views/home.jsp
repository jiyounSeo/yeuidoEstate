<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
    <%@ page contentType="text/html; charset=utf-8" %>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>
<script>
var resultX = [];
var resultY = [];
$( document ).ready(function() {
	var arr = new Array();
	arr.push('탄방동 670');// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
	arr.push('탄방동 648');// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
	
	var bool = true;
	for (var index=0; index< arr.length; index++) {
		naver.maps.Service.geocode({address: arr[index]}, function(status, response) {
			console.log (response.result);
			if (status !== naver.maps.Service.Status.OK) {
		        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		    	bool = false;
			}
		    var result = response.result;
		    resultX[index] = (result.items[0].point.x);
		    console.log (resultX[index]);
		    resultY.push (result.items[0].point.y);
		});
	}
	
	if (bool) {
		f_setting_map();
		
	}
	console.log (resultX.length);
});

function f_setting_map() {
	var HOME_PATH = window.HOME_PATH || '.';
	var map = new naver.maps.Map(document.getElementById('map'), {
	    zoom: 11,
	    center: new naver.maps.LatLng(37.3614483, 129.1114883)
	});
	console.log (resultX[0]);
	var latlngs = [
	    new naver.maps.LatLng(resultX[0], resultY[0]),
	    new naver.maps.LatLng(37.3632916, 129.1085015),
	    new naver.maps.LatLng(37.3632507, 129.1115043),
	    new naver.maps.LatLng(37.3632097, 129.114507),
	    new naver.maps.LatLng(37.3631687, 129.1175097),
	    new naver.maps.LatLng(37.3597282, 129.105422),
	    new naver.maps.LatLng(37.3596874, 129.1084246),
	    new naver.maps.LatLng(37.3596465, 129.1114272),
	    new naver.maps.LatLng(37.3596056, 129.1144298),
	    new naver.maps.LatLng(37.3595646, 129.1174323)
	];

	
	/*	
	var latlngs = new Array();
	for (var jj=0; jj < resultX.length; jj++) {
		console.log(addressArr[jj]);
		latlngs.push (new naver.maps.LatLng(resultX[jj], resultY[jj]));
	}
	
	var map = new naver.maps.Map(document.getElementById('map'), {
	    zoom: 11,
	    center: new naver.maps.LatLng(127.3857838, 36.3439689)
	});*/
	/*
	var latlngs = [
	    new naver.maps.LatLng(37.3633324, 129.1054988),
	    new naver.maps.LatLng(37.3632916, 129.1085015),
	    new naver.maps.LatLng(37.3632507, 129.1115043),
	    new naver.maps.LatLng(37.3632097, 129.114507),
	    new naver.maps.LatLng(37.3631687, 129.1175097),
	    new naver.maps.LatLng(37.3597282, 129.105422),
	    new naver.maps.LatLng(37.3596874, 129.1084246),
	    new naver.maps.LatLng(37.3596465, 129.1114272),
	    new naver.maps.LatLng(37.3596056, 129.1144298),
	    new naver.maps.LatLng(37.3595646, 129.1174323)
	];*/

	var markerList = [];
	console.log (latlngs);

	for (var i=0, ii=latlngs.length; i<ii; i++) {
	    var icon = {
	            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	            size: new naver.maps.Size(24, 37),
	            anchor: new naver.maps.Point(12, 37),
	            origin: new naver.maps.Point(i * 29, 0)
	        },
	        marker = new naver.maps.Marker({
	            position: latlngs[i],
	            map: map,
	            icon: icon
	        });

	    marker.set('seq', i);

	    markerList.push(marker);

	    marker.addListener('mouseover', onMouseOver);
	    marker.addListener('mouseout', onMouseOut);

	    icon = null;
	    marker = null;
	}
}


	function onMouseOver(e) {
	    var marker = e.overlay,
	        seq = marker.get('seq');

	    marker.setIcon({
	        url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
	        size: new naver.maps.Size(24, 37),
	        anchor: new naver.maps.Point(12, 37),
	        origin: new naver.maps.Point(seq * 29, 50)
	    });
	}

	function onMouseOut(e) {
	    var marker = e.overlay,
	        seq = marker.get('seq');

	    marker.setIcon({
	        url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	        size: new naver.maps.Size(24, 37),
	        anchor: new naver.maps.Point(12, 37),
	        origin: new naver.maps.Point(seq * 29, 0)
	    });
	}	
</script>
<!-- 
<script>
var map = new naver.maps.Map('map');
var addressArr = new Array();

var myaddress = '탄방동 670';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
naver.maps.Service.geocode({address: "권선동 952-13"}, function(status, response) {
    if (status !== naver.maps.Service.Status.OK) {
        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
    }
    var result = response.result;
    addressArr.push (result);
});
   
naver.maps.Service.geocode({address: myaddress}, function(status, response) {
    if (status !== naver.maps.Service.Status.OK) {
        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
    }
    var result = response.result;
   
    // 검색 결과 갯수: result.total
    // 첫번째 결과 결과 주소: result.items[0].address
    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
    // 마커 표시
    var marker = new naver.maps.Marker({
      position: myaddr,
      map: map
    });
    // 마커 클릭 이벤트 처리
    naver.maps.Event.addListener(marker, "click", function(e) {
      if (infowindow.getMap()) {
          infowindow.close();
      } else {
          infowindow.open(map, marker);
      }
    });
    // 마크 클릭시 인포윈도우 오픈
    var infowindow = new naver.maps.InfoWindow({
        content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
    });
});


</script>
 -->
</body>
</html>