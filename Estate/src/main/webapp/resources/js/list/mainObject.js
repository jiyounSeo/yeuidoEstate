$(document).ready(function(){
	var objtTp = $("#objtTp").val();
	if ( gfn_isNull ($("#objtTp").val()) ) {
		objtTp = "";
	}
	var saleTp = $("#saleTp").val();
	if ( gfn_isNull ($("#saleTp").val()) ) {
		saleTp = "";
	}
	f_objt_select(objtTp,saleTp);
});



//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var div = $(this).closest('div').attr('id');
	
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_objectList_select();
	}
	
});


/*
 * 물건 선택 콤보
 */
function f_category_combo(objtTpVal) {
	$("#trCategory").empty();
	if ( objtTpVal == "OT003" || objtTpVal == "OT002") {
		$("#trCategory").append("<td>");
		$("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a> | ");
		$("#trCategory").append("</td>");
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
			  $("#trCategory").append("<td>");
			  $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a> | ");
			  $.each (result, function(index) {
				  $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'"+result[index].buildCd+"\')\">"+result[index].buildNm+"</a> | ");
			  });
			  $("#trCategory").append("</td>");
		  }
	});	
}

var category = "";
function f_category_select (cate) {
	category = cate;
	f_objt_select (objtTpChk,'');
}

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
 

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( currPageStr != "") {
		currPage = Number(currPageStr);
		f_objectList_select('','');
	}
	
});
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
	var saleTpColor = f_saleTp_color (saleTpChk) ;
	$("#saleTpTr").empty();
	$("#objtListTr").empty();
	switch ( objtTpChk ) {
		case "OT001"://saleTpTrTmpl1_ST001
			tmplTr = "saleTpTrTmpl1_"+saleTpChk;
			tmplNm = "objtTrTemplte1"; 
			break;
		case "OT002":
			tmplTr = "saleTpTrTmpl2_"+saleTpChk;
			tmplNm = "objtTrTemplte2";
			break;
		case "OT003":
			tmplTr = "saleTpTrTmpl3_"+saleTpChk;
			tmplNm = "objtTrTemplte3"; 
			break;
		case "OT004":
			tmplTr = "saleTpTrTmpl4_"+saleTpChk;
			tmplNm = "objtTrTemplte4"; 
			break;
		case "OT005":
			tmplTr = "saleTpTrTmpl5_"+saleTpChk;
			tmplNm = "objtTrTemplte5";
			break;
		case "OT006":
			tmplTr = "saleTpTrTmpl6";
			tmplNm = "objtTrTemplte6"; 
			break;
			
	}
	
	$("#"+tmplNm).tmpl().appendTo("#saleTpTr");
	$("#"+tmplTr).tmpl().appendTo("#objtListTr");
	
	$(".tab_on_txt").each (function(){
		$(this).css("color", "#989898");
	});
	$("#li_"+objtTpChk).css("color", "#2573BB");

	$(".tab_bg").each (function(){
		$(this).css("background-color", "#6C6C6C");
	});
	$("#li_"+saleTpChk).css("background-color", saleTpColor);
	$("#objtListTr td").css("background-color", saleTpColor);
	$("#objtListTr td").css("color", "#fff");
	f_objectList_select(objtTpChk, saleTpChk);
}


function f_saleTp_color (saleTp) {
	/*
	매매 - 오렌지 - #DF6404
	전세 - 하늘 -#3486CF
	월세 - 그린 #328A26
	렌트 - 검정 - #3D3332 
	븐양권 - 빨강 - #CA1C04
	전매 - 블루 - #0E189E
	임데 - 하늘 - #3486CF
	*/
	var color = "";
	switch (saleTp) {
		case "ST001" :
			color = "#DF6404";
			break;
		case "ST002" :
			color = "#3486CF";
			break;
		case "ST003" :
			color = "#328A26";
			break;
		case "ST004" :
			color = "#3D3332";
			break;
		case "ST005" :
			color = "#CA1C04";
			break;
		case "ST006" :
			color = "#0E189E";
			break;
		case "ST007" :
			color = "#3486CF";
			break;

	}
	return color;
	
}

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

var orderByColumn  = "";


function f_objectList_select(objtTp, saleTp){
	
	 if (!gfn_isNull(objtTpChk)) {
		 objtTp = objtTpChk;
	 }
	 if (!gfn_isNull(saleTpChk)) {
		 saleTp = saleTpChk;
	 }
	 	 
	 var param = {
			 currentPage : 1 //Number(currPage)
			   , orderByColumn : orderByColumn == "" ? "frstRegDt" : orderByColumn
			   , saleTp : saleTp
			   , objtTp : objtTp
			   , buildCd : category
			   , pagePerRow : 10
			   , pageSize : 10
	};
	
	console.log (param);
	$.ajax({
	  url : "/selectMainObjtList.go",
	  type: "post",
	  data : param,
	  dataType : "json",
	  success : function(result){
		  $("#objtTbody").empty();
		  var tmplNm = "";
		  switch ( objtTp ) {
		  	case "OT001" : // 아파트
		  		tmplNm = "objtListTemplte1_"+param.saleTp;
		  		break; 
		  	case "OT002" : // 상가
		  		tmplNm = "objtListTemplte2_"+param.saleTp;
		  		break;
		  	case "OT003" : //사무실.빌딩
		  		tmplNm = "objtListTemplte3_"+param.saleTp;
				break;
		  	case "OT004" : // 오피스텔
		  		tmplNm = "objtListTemplte4_"+param.saleTp;
				break;
		  	case "OT005" : //주상복합
		  		tmplNm = "objtListTemplte5_"+param.saleTp;
		  		break;
		  	case "OT006" : //분양권
		  		tmplNm = "objtListTemplte6";
				break;
		  }

		  
		  var map = new naver.maps.Map("main_map", {
				center: new naver.maps.LatLng(37.5249989,126.9253099),		// IFC몰
				minZoom: 7,
			    zoom: 10,
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
			
		  
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
			  f_map_make(objtList, map);
			  
		  } else {
			  var colCnt = $("#objtListTr td").length;
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }

	  }
	});
	
}

function f_map_make(list, map) {	
	
	var idx = 0;	
	var markPosX = new Array();
	var markPosY = new Array();
	
	for(var i=0; i<list.length; i++){		
				        
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(list[i].positionX, list[i].positionY),
            title: list[i].buildNm,
            icon: {
	        	url: 'http://여의도닷컴.com/images/marker.png',
		        size: new naver.maps.Size(25, 33)
		    },
            map: map,
            draggable: false
        });	       
        
        var contentString = [
            '<div style="width:260px;padding:0;margin:0">',
            '   <table style="width:100%" cellpadding="0" cellspacing="0">',
            '       <tr><td style="background:url(\'./resources/images/info_box_bg.jpg\');background-repeat:repeat-x;color:white;height:35px;padding-left:10px;"><b>' + list[i].buildNm + '</b></td></tr>',
            '       <tr><td style="padding:10px;"><b>종류</b> : ' + list[i].objtTpNm +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>매물</b> : ' + list[i].saleTpNm + '</td></tr>',
            '   </table>',
            '</div>'
        ].join('');
        
        
        var infowindow = new naver.maps.InfoWindow({
            content: contentString
        });
        
        f_marker_setting_event(map, marker, infowindow, list[i].positionX, list[i].positionY);
		
	}	
}


		
function f_marker_setting_event(map, marker, infowindow, x, y) {
	
    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
        	var myaddr = new naver.maps.LatLng(x, y);
        	map.setCenter(myaddr); // 검색된 좌표로 지도 이동
            infowindow.open(map, marker);
        }
    });	
}


/*
function f_map_make(list, map) {	
			
	var idx = 0;	
	var markPosX = new Array();
	var markPosY = new Array();
	
	for(var i=0; i<list.length; i++){

		(function(idx) {
					naver.maps.Service.geocode({address: objtList[idx].jibunAddr}, function(status, response) {
		
						if (status !== naver.maps.Service.Status.OK) {
							return alert(objtList[idx].jibunAddr + '의 검색 결과가 없거나 기타 네트워크 에러');
						}
						var result = response.result;
				        
				        var marker = new naver.maps.Marker({
				            position: new naver.maps.LatLng(result.items[0].point.y, result.items[0].point.x),
				            title: list[idx].buildNm,
				            map: map,
				            draggable: false
				        });	        
				        var infowindow = new naver.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:10px;">이름 : <b>' + list[idx].buildNm + '</b></div>'
				        });
				        
				        f_marker_setting_event(map, marker, infowindow,  result.items[0].point.x, result.items[0].point.y);
					});	
				})(i);
	}	
}
*/