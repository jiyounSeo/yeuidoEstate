$(document).ready(function(){
	f_map_setting($("#jibunAddr").val());
	f_objt_select($("#objtTp").val(),$("#saleTp").val());
});

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

function f_select_menu_bar(objtTp,saleTp) {

	var address = unescape(location.href);	
	var parmStr = address.split("indexObjectDtl");
	
	console.log(parmStr.length + "///");

	if(parmStr.length > 1) {
		var url = "./?objtTp="+objtTp+"&saleTp="+saleTp;
		location.href=url;
	}
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

function f_category_combo(objtTpVal) {
	$("#trCategory").empty();
	if ( objtTpVal == "OT003" || objtTpVal == "OT002") {
		$("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a>&nbsp;&nbsp;|");
		return;
	}
	var param = {
			objtTp : objtTpVal
	};
	
	$.ajax({
		  url : "/selectBuildingCombo.go",
		  type: "post",
		  data : param,
		  async : false,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.buildCombo;
			  $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a>&nbsp;&nbsp;|&nbsp;&nbsp;");
			  $.each (result, function(index) {
				  $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'"+result[index].buildCd+"\')\">"+result[index].buildNm+"</a>&nbsp;&nbsp;|&nbsp;&nbsp;");
			  });
		  }
	});	
}

var category = "";
function f_category_select (cate) {
	category = cate;
	f_objt_select (objtTpChk,'');
}


var objtTpChk = "OT001";
var saleTpChk = "ST001";

function f_objt_select (objtTp, saleTp) {
	f_category_combo(objtTp== '' ? objtTpChk : objtTp);
	if (objtTp != '' ) {
		objtTpChk = objtTp;
	}
	if (saleTp != '' ) {
		saleTpChk = saleTp;
	}
	$("#saleTpTr").empty();
	
	switch ( objtTpChk ) {
		case "OT001"://saleTpTrTmpl1_ST001
			tmplNm = "objtTrTemplte1"; 
			break;
		case "OT002":
			tmplNm = "objtTrTemplte2";
			break;
		case "OT003":
			tmplNm = "objtTrTemplte3"; 
			break;
		case "OT004":
			tmplNm = "objtTrTemplte4"; 
			break;
		case "OT005":
			tmplNm = "objtTrTemplte5";
			break;
		case "OT006":
			tmplNm = "objtTrTemplte6"; 
			break;
			
	}

	$("#"+tmplNm).tmpl().appendTo("#saleTpTr");
	
	
	var index_ob_num = objtTpChk.substr(4,1);	
	var index_sale_num = saleTpChk.substr(4,1);	
	
	for(var i=1; i<=6; i++){
		$("#tab_OT00"+i).attr('src', './resources/images/tab'+i+'_off.png');
	}	
	$("#tab_"+objtTpChk).attr('src', './resources/images/tab'+index_ob_num+'_on.png');
	
	for(var i=1; i<=7; i++){
		$("#li_ST00"+i).attr('src', './resources/images/s_tab'+i+'_off.png');
	}	
	$("#li_"+saleTpChk).attr('src', './resources/images/s_tab'+index_sale_num+'_on.png');
	
	
	f_objectList_select(objtTpChk, saleTpChk);
}

function f_objectList_select(objtTp, saleTp){
	
	 if (!gfn_isNull(objtTpChk)) {
		 objtTp = objtTpChk;
	 }
	 if (!gfn_isNull(saleTpChk)) {
		 saleTp = saleTpChk;
	 }
	 
	
}

