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
		  
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
			  /*$("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");
			  $("#objtListTemplte").tmpl(data).appendTo("#objtTbody");
			  */
			  //지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
			  $.each (objtList, function(index){
				  f_map_setting( objtList[index].jibunAddr);
			  });
			  
		  } else {
			  //$("#pagingDiv").empty();
			  var colCnt = $("#objtListTr td").length;
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }
		    
	  }
	});
	
}


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































function f_objectList_select2(){
	 var param = {
		 currentPage : 1 //Number(currPage)
	   , orderByColumn : orderByColumn == "" ? "frstRegDt" : orderByColumn
	   , objtTp : objtTp
	   , buildCd : buildCd
	   , pagePerRow : 10
	   , pageSize : 10
	};
	 
	 $.ajax({
		  url : "/selectMainObjtList.go",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#objtTbody").empty();
			  $("#map").empty();
			  var objtList = new Array();
			  objtList = data.objtList;
			  if ( objtList.length != 0) {
				  $("#objtListTemplte").tmpl(data).appendTo("#objtTbody");
				  //지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
				  $.each (objtList, function(index){
					  f_map_setting( objtList[index].jibunAddr);
				  });
			  }  else {
				  $("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
			  }
		  },
		  error: function(data){
			  alert ("문제가 발생했습니다. 관리자에게 문의하세요.")
		  }
		});
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
function f_map_draw(x, y) {
	// marker1

	//지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
	var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(x, y),
		    zoom: 10
	});
	
	var myaddr = new naver.maps.Point(x, y);
    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
    var marker = new naver.maps.Marker({
	    position: myaddr,
	    map: map
	});
		
}

