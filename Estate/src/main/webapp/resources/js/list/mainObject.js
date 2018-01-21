$(document).ready(function(){
	var address = unescape(location.href);	
	var parmStr = address.split("?");
	
	if(parmStr.length > 1) {
		var parm = parmStr[1].split("&");
		
		var getObjtTp = parm[0].split("=");
		var getSaleTp = parm[1].split("=");
		
		if(!gfn_isNull(getObjtTp[1])){
			$("#objtTp").val(getObjtTp[1]);
		}

		if(!gfn_isNull(getSaleTp[1])){
			$("#saleTp").val(getSaleTp[1]);
		}
	}

	
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

function f_select_menu_bar(objtTp,saleTp) {

	f_objt_select(objtTp,saleTp);		
}


/*
 * 물건 선택 콤보
 */
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
	$("#saleTpTr").empty();
	$("#objtListTr").empty();
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

	tmplTr = "saleTpTrTmpl";
	$("#"+tmplNm).tmpl().appendTo("#saleTpTr");
	$("#"+tmplTr).tmpl().appendTo("#objtListTr");
	

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

function f_orderBy(order){
	orderByColumn = order;
	f_objectList_select('','');	
}

var orderByColumn  = "";


function f_objectList_select(objtTp, saleTp){
	
	 if (!gfn_isNull(objtTpChk)) {
		 objtTp = objtTpChk;
	 }
	 if (!gfn_isNull(saleTpChk)) {
		 saleTp = saleTpChk;
	 }
	 
	 var orderMenu = "";
	 if(saleTp == "ST001" ){	// 매매
		 if(objtTp == "OT002" || objtTp == "OT003") {
			 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"bargainAmt\");return false'>매매가순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>";

		 } else {
			 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"bargainAmt\");return false'>매매가격순</a>";
		 }
		 
	 } else if(saleTp == "ST002") {	// 전세

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>";
	 
	 } else if(saleTp == "ST003") {	// 월세

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>";

	 } else if(saleTp == "ST004") {	// 렌트

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>렌트비순</a>";
		 
	 } else if(saleTp == "ST006" || saleTp == "ST007") {	// 분양권, 전매

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"parcelAmt\");return false'>분양가순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"premiumAmt\");return false'>프리미엄순</a>";
		 
	 }  else if(saleTp == "ST005") {	// 임대

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>" +
		 				"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='#cate' onclick='f_orderBy(\"rightAmt\");return false'>권리금순</a>";
		 
	 }
	 $("#order_menu").empty();
	 $("#order_menu").append(orderMenu);
	 	 
	 var param = {
			 currentPage : Number(currPage)
			   , orderByColumn : orderByColumn == "" ? "frstRegDt" : orderByColumn
			   , saleTp : saleTp
			   , objtTp : objtTp
			   , buildCd : category
			   , pagePerRow : 20
			   , pageSize : 20
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
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#pagingDiv #page" + currPage).addClass("active");
			  
		  } else {
			  var colCnt = $("#objtListTr td").length;
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }

		  $("div.obPrice").number(true);
		  $("span.obPrice").number(true);
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

function numberWithCommas(x) {

    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

}
