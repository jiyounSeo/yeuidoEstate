$(document).ready(function(){
	/*var objtTp = $("#objtTp").val();
	if ( gfn_isNull ($("#objtTp").val()) ) {
		objtTp = "";
	}
	var saleTp = $("#saleTp").val();
	if ( gfn_isNull ($("#saleTp").val()) ) {
		saleTp = "";
	}*/
	//alert ("hi");
	f_category_combo('OT001');
	//f_objt('');
});

/*
 * 물건 선택 콤보
 */
function f_category_combo(objtTpVal) {
	$("#trCategory").empty();
	objtTp = objtTpVal;
	buildCd = "";
	orderByColumn = "";
	f_objectList_select();
	
	if ( objtTpVal == "OT003" || objtTpVal == "OT002") {
		return;
		 $("#trCategory").append("<td>");
		 $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a> | ");
		 $("#trCategory").append("/<td>");
	}
	var param = {
			objtTp : objtTpVal
	};
	$.ajax({
		  url : "/selectBuildingCombo.go",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.buildCombo;
			  $("#trCategory").append("<td>");
			  $("#trCategory").append("<a href='#cate' onclick=\"f_category_select(\'\')\">전체</a> | ");
			  $.each (result, function(index) {
				  $("#trCategory").append("<a href='#cate' onclick=\"f_build(\'"+result[index].buildCd+"\')\">"+result[index].buildNm+"</a> | ");
			  });
			  $("#trCategory").append("</td>");
			  
		  }
	});	
}


var orderByColumn = "";
var objtTp = "";
var buildCd = "";
function f_order (order) {
	orderByColumn = order;
	f_objectList_select();
}
function f_build (build) {
	orderByColumn = "";
	buildCd = build;
	f_objectList_select();
}

function f_objectList_select(){
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


var category = "";
function f_category_select (cate) {
	category = cate;
	f_objt_select ('','');
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
	
	if ($("#publicYn").val() != "Y" ) {
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
	}
	
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

function f_objtDtl_view (index) {
	$("#objtNo").val(objtList[index].objtNo);
	$("#objtTp").val(objtList[index].objtTp);
	$("#saleTp").val(objtList[index].saleTp);
	
	var url = "";
	switch (objtList[index].objtTp) {
		case "OT001"	:
			url = "viewObApt";
			break;
		case "OT002"	:
			url = "viewObStore";
			break;
		case "OT003"	:
			url = "viewObOffice";
			break;
		case "OT004"	:
			url = "viewObOps";
			break;
		case "OT005"	:
			url = "viewObHrapt";
			break;
		case "OT006"	:
			url = "viewObTicket";
			break;
		
	}
	$("#viewUrl").val(url);
	
	var frm = $('#commObjtList')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
}

function f_add_objt() {
	var frm = $('#commObjtList')[0];
	frm.action = '/addObject.do';
	frm.method = 'POST';
	frm.submit();
}