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
	
	$("#searchObjtTp").val($("#indexSearch input[type='radio'][name=search_obTp]:checked").val());
	$("#searchSaleTp").val($("#indexSearch input[type='radio'][name=search_slTp]:checked").val());
	f_setting_search_form($("#indexSearch input[type='radio'][name=search_obTp]:checked").val());
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
	임대 - 하늘 - #3486CF
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
				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
				"|<a href='#cate' onclick='f_orderBy(\"bargainAmt\");return false'>매매가순</a>" +
				"|<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
				"|<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>";

		 } else {
			 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
				"|<a href='#cate' onclick='f_orderBy(\"bargainAmt\");return false'>매매가격순</a>";
		 }
		 
	 } else if(saleTp == "ST002") {	// 전세

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>";
	 
	 } else if(saleTp == "ST003") {	// 월세

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>";

	 } else if(saleTp == "ST004") {	// 렌트

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>렌트비순</a>";
		 
	 } else if(saleTp == "ST006" || saleTp == "ST007") {	// 분양권, 전매

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"parcelAmt\");return false'>분양가순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"premiumAmt\");return false'>프리미엄순</a>";
		 
	 }  else if(saleTp == "ST005") {	// 임대

		 orderMenu = "<a href='#cate' onclick='f_orderBy(\"frstRegDt\");return false'>등록일자순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"area\");return false;'>면적순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"depositAmt\");return false'>보증금순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"monthlyAmt\");return false'>월세순</a>" +
		 				"|<a href='#cate' onclick='f_orderBy(\"rightAmt\");return false'>권리금순</a>";
		 
	 }
	 $("#order_menu").empty();
	 $("#order_menu").append(orderMenu);
	 	 
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

function f_search() {
	
	var selectedSaleTp = $("input[name='search_slTp']:checked").val(); // 매매. 전세. ...
	var selectedObjtTp = $("input[name='search_obTp']:checked").val(); // 아파트, 상가, 사무실...
	var arr = ["bargain", "deposit", "monthly", "right", "manage", "parcel", "priminum"];
	
	var arrMin = new Array(7);
	var arrMax = new Array(7);

	var area_min, area_max;
	
	
	if($("#search_area option:selected").val() == "self"){
		area_min = $("#search_area_min_input").val();
		area_max = $("#search_area_max_input").val();
	} else if($("#search_area option:selected").val() == "all") {
		area_min = "";
		area_max = "";
	} else {
		var value = $("#search_area option:selected").val().split("/");
		area_min = value[0];
		area_max = value[1];
	}
	
	var logText = selectedSaleTp + "/" + selectedObjtTp + "/";
	
	
	for(var i = 0; i < 7; i++){

		var frmName = arr[i];
		var selected = $("#search_"+frmName + " option:selected").val();
	
		if(typeof selected != "undefined"){
			if(selected == "self") {
				arrMin[i] = $("#search_" + frmName + "_min_input").val();
				arrMax[i] = $("#search_" + frmName + "_max_input").val();
			} else {
				var value = selected.split("/");
				arrMin[i] = value[0];
				arrMax[i] = value[1];
			}			
		} else {
			arrMin[i] = "";
			arrMax[i] = "";
		}		
		
		logText += frmName + "[" + arrMin[i] + "/" + arrMax[i] + "] / ";
	}
	
	logText += "area[" + area_min + "/" + area_max + "]";

//	alert(logText);
	
	
	var param = {
			currentPage : 1 //Number(currPage)
			  , orderByColumn : orderByColumn == "" ? "frstRegDt" : orderByColumn
			  , saleTp : selectedSaleTp
			  , objtTp : selectedObjtTp
			  , bargain_min : arrMin[0]
			  , bargain_max : arrMax[0]
			  , deposit_min : arrMin[1]
			  , deposit_max : arrMax[1]
			  , monthly_min : arrMin[2]
			  , monthly_max : arrMax[2]
			  , right_min : arrMin[3]
			  , right_max : arrMax[3]
			  , manage_min : arrMin[4]
			  , manage_max : arrMax[4]
			  , parcel_min : arrMin[5]
			  , parcel_max : arrMax[5]
			  , priminum_min : arrMin[6]
			  , priminum_max : arrMax[6]
			  , areaMin : area_min
			  , areaMax : area_max
			  , pagePerRow : 10
			  , pageSize : 10
	};
	
	$.ajax({
		  url : "/searchMainObjtList.go",
		  type: "post",
		  data : param,
		  dataType : "json",
		  success : function(result){
			  console.log(result);
			  f_category_combo (param.objtTp);

			  $("#objtTbody").empty();
			  $("#saleTpTr").empty();
			  $("#objtListTr").empty();
			  var saleTpColor = f_saleTp_color (param.saleTp) ;
			  var objtTr = ""
			  var tmplNm = "";
			  var tmplTr = "";
			  switch ( param.objtTp ) {
			  	case "OT001" : // 아파트
			  		objtTr = "objtTrTemplte1";
			  		tmplTr = "saleTpTrTmpl1_"+param.saleTp;
					tmplNm = "objtListTemplte1_"+param.saleTp;
			  		break; 
			  	case "OT002" : // 상가
			  		objtTr = "objtTrTemplte2";
			  		tmplTr = "saleTpTrTmpl2_"+param.saleTp;
					tmplNm = "objtListTemplte2_"+param.saleTp;
			  		break;
			  	case "OT003" : //사무실.빌딩
			  		objtTr = "objtTrTemplte3";
			  		tmplTr = "saleTpTrTmpl3_"+param.saleTp;
					tmplNm = "objtListTemplte3_"+param.saleTp;
					break;
			  	case "OT004" : // 오피스텔
			  		objtTr = "objtTrTemplte4";
			  		tmplTr = "saleTpTrTmpl4_"+param.saleTp;
					tmplNm = "objtListTemplte4_"+param.saleTp;
					break;
			  	case "OT005" : //주상복합
			  		objtTr = "objtTrTemplte5";
			  		tmplTr = "saleTpTrTmpl5_"+param.saleTp;
					tmplNm = "objtListTemplte5_"+param.saleTp;
			  		break;
			  	case "OT006" : //분양권
			  		objtTr = "objtTrTemplte6";
			  		tmplTr = "saleTpTrTmpl6";
					tmplNm = "objtListTemplte6";
					break;
			  }
			  $("#"+objtTr).tmpl().appendTo("#saleTpTr");
			  $("#"+tmplTr).tmpl().appendTo("#objtListTr");
			  $(".tab_on_txt").each (function(){
					$(this).css("color", "#989898");
			  });
			  $("#li_"+param.objtTp).css("color", "#2573BB");
			  $(".tab_bg").each (function(){
					$(this).css("background-color", "#6C6C6C");
			  });
			  $("#li_"+param.saleTp).css("background-color", saleTpColor);
			  $("#objtListTr td").css("background-color", saleTpColor);
			  $("#objtListTr td").css("color", "#fff");
				
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
				  console.log (result.objtList);
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

function f_setting_search_form(obType){
	
	var htmlText = "";	
	
	switch(obType){
		case "OT002" :
		case "OT003" :{
			htmlText += '<input type="radio" onclick="f_setting_search_form_price(\'ST001\')" id="search_ST001" name="search_slTp" value="ST001" checked /><label for="search_ST001">매매</label>' +
					'<input type="radio" onclick="f_setting_search_form_price(\'ST005\')" id="search_ST005" name="search_slTp" value="ST005"/><label for="search_ST005">임대</label>';
			break;
		}
		case "OT006" : {
			htmlText += '<input type="radio" onclick="f_setting_search_form_price(\'ST006\')" id="search_ST006" name="search_slTp" value="ST006" checked /><label for="search_ST006">분양권</label>' +
					'<input type="radio" onclick="f_setting_search_form_price(\'ST007\')" id="search_ST007" name="search_slTp" value="ST007"/><label for="search_ST007">전매</label>';
			break;
		}
		default :{
			htmlText += '<input type="radio" onclick="f_setting_search_form_price(\'ST001\')" id="search_ST001" name="search_slTp" value="ST001" checked /><label for="search_ST001">매매</label>' +
					'<input type="radio" onclick="f_setting_search_form_price(\'ST002\')" id="search_ST002" name="search_slTp" value="ST002"/><label for="search_ST002">전세</label>' +
					'<input type="radio" onclick="f_setting_search_form_price(\'ST003\')" id="search_ST003" name="search_slTp" value="ST003"/><label for="search_ST003">월세</label>' +
					'<input type="radio" onclick="f_setting_search_form_price(\'ST004\')" id="search_ST004" name="search_slTp" value="ST004"/><label for="search_ST004">렌트</label>';
			break;
		}			
	}	
	
	$("#search_st_form").empty();
	$("#search_st_form").append(htmlText);	
	
	$("#searchObjtTp").val(obType);
	
	if(obType == "OT006"){
		f_setting_search_form_price("ST006");
	} else {
		f_setting_search_form_price("ST001");
	}
}

function f_setting_search_form_price(slType) {
	
	htmlText = '<table style="width:100%;border:0;border-collapse:collapse;border: 1px solid #b2b2b2;">';
	
	var obType = $("#searchObjtTp").val();
	
	var spacingText = '<tr><td colspan="2" height="5px"></td></tr>';
	
	var optionBoxText = '<option value="/">전체</option>' +
						'<option value="0/10000">1억이하</option>' +
						'<option value="10000/30000">1억 ~ 3억</option>' +
						'<option value="30000/60000">3억 ~ 6억</option>' +
						'<option value="60000/90000">6억 ~ 9억</option>' +
						'<option value="90000/">9억 이상</option>' +
						'<option value="self">직접입력</option>';
	
	var optionBoxText2 = '<option value="/">전체</option>' +
						'<option value="self">직접입력</option>';
	
	var bargainText = '<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">매매가</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select id="search_bargain" name="search_bargain" onchange="f_enabled_value_form(\'bargain\');" style="width:90px;height:30px;">' +
								optionBoxText +
							'</select>' +
							'&nbsp;<input type="text" id="search_bargain_min_input" name="search_bargain_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_bargain_max_input" name="search_bargain_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>';
	
	var depositText = '<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">보증금</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select  id="search_deposit" name="search_deposit" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'deposit\');">' +
							optionBoxText2 +
							'</select>' +
							'&nbsp;<input type="text" id="search_deposit_min_input" name="search_deposit_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_deposit_max_input" name="search_deposit_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>';
	
	var monthlyText = '<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">월세</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select  id="search_monthly" name="search_monthly" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'monthly\');" >' +
							optionBoxText2 +
							'</select>' +
							'&nbsp;<input type="text" id="search_monthly_min_input" name="search_monthly_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_monthly_max_input" name="search_monthly_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>';
	
	var rightText = '<tr>' +
					'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">권리금</td>' +
					'<td style="width:75%;padding-left:10px;">' +
						'<select  id="search_right" name="search_right" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'right\');" >' +
							optionBoxText +
						'</select>' +
						'&nbsp;<input type="text" id="search_right_min_input" name="search_right_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_right_max_input" name="search_right_max_input" style="width:80px;height:30px;" disabled> 만원' +
					'</td>' +
				'</tr>';
	
	var manageText = '<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">관리비</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select  id="search_manage" name="search_manage" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'manage\');" >' +
								optionBoxText +
							'</select>' +
							'&nbsp;<input type="text" id="search_manage_min_input" name="search_manage_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_manage_max_input" name="search_manage_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>';
	
	var ticketText = '<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">분양가</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select  id="search_parcel" name="search_parcel" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'parcel\');" >' +
								optionBoxText +
							'</select>' +
							'&nbsp;<input type="text" id="search_parcel_min_input" name="search_parcel_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_parcel_max_input" name="search_parcel_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>' +
					spacingText +
					'<tr>' +
						'<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">프리미엄</td>' +
						'<td style="width:75%;padding-left:10px;">' +
							'<select  id="search_primium" name="search_primium" style="width:90px;height:30px;" onchange="f_enabled_value_form(\'premium\');" >' +
								optionBoxText +
							'</select>' +
							'&nbsp;<input type="text" id="search_premium_min_input" name="search_premium_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_premium_max_input" name="search_premium_max_input" style="width:80px;height:30px;" disabled> 만원' +
						'</td>' +
					'</tr>';
					
						
	switch(slType){
		case "ST001":{	// 매매
			if(obType == "OT002" || obType == "OT003"){
				htmlText += bargainText + spacingText + depositText + spacingText + monthlyText;				
			} else {
				htmlText += bargainText;
			}
			break;
		}
		
		case "ST002":{ // 전세 
			htmlText += depositText;
			break;
		}
		
		case "ST003": { // 월세
			htmlText += depositText + spacingText + monthlyText;
			break;
		}
		
		case "ST004": { // 렌트
			htmlText += monthlyText;
			break;
		}
		
		case "ST005": {	// 임대
			if(obType == "OT002"){
				htmlText += depositText + spacingText + monthlyText + spacingText + rightText;
			} else {
				htmlText += depositText + spacingText + monthlyText + spacingText + manageText;
			}
			break;
		}
		
		case "ST006": 	// 분양권
		case "ST007": {	// 전매
			
			htmlText += ticketText;
			break;
		}
	}
	
	htmlText += '</table>'
	
	$("#search_detail").empty();
	$("#search_detail").append(htmlText);
	
	$("#searchSaleTp").val(slType);
}

function f_enabled_value_form(frmName) {
	
	
	var minNmInput = "#search_" + frmName + "_min_input";
	var maxNmInput = "#search_" + frmName + "_max_input";	
	
	var minNmHidden = "#search_" + frmName + "_min";
	var maxNmHidden = "#search_" + frmName + "_max";
	
	var selected = $("#search_"+frmName + " option:selected").val();
	
	if(selected == 'self'){
		$(minNmInput).prop('disabled', false);
		$(maxNmInput).prop('disabled', false);		
	} else {
		var value = selected.split("/");
		var min = value[0];
		var max = value[1];
		
		$(minNmHidden).val(min);
		$(maxNmHidden).val(max);

		$(minNmInput).prop('disabled', true);
		$(maxNmInput).prop('disabled', true);
	}
	
	console.log($(minNmHidden).val() + "/" + $(maxNmHidden).val());
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