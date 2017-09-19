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
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_objectList_select();
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
		case "OT001":
			tmplTr = "saleTpTrTmpl1";
			tmplNm = "objtTrTemplte1"; 
			break;
		case "OT002":
			tmplTr = "saleTpTrTmpl2";
			tmplNm = "objtTrTemplte2"; 
			break;
		case "OT003":
			tmplTr = "saleTpTrTmpl3";
			tmplNm = "objtTrTemplte3"; 
			break;
		case "OT004":
			tmplTr = "saleTpTrTmpl4";
			tmplNm = "objtTrTemplte4"; 
			break;
		case "OT005":
			tmplTr = "saleTpTrTmpl5";
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
	console.log (saleTp);
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

function f_objectList_select(objtTp, saleTp){
	var activeTpChk= "";
	if ( $("#publicYn").val() == "Y") {
		 if ( !gfn_isNull($("input[name='activeTp1']:checked").val()) ) {
			 activeTpChk = "AT001";
		 } else if ( !gfn_isNull($("input[name='activeTp2']:checked").val()) ) {
			 activeTpChk = "AT002";
		 }
	} 
	//saleTpTr
	var param = {
		objtTp : objtTp
	   , saleTp : saleTp
	   , publicYn : $("#publicYn").val()
	   , activeTp :  $("#publicYn").val() == "Y" ?  activeTpChk : $("#activeTp").val()
	   , estateRange : $("#estateRange").val()
	   , myObjt : gfn_isNull($("input[name='activeTp3']:checked").val()) ? "" : $("input[name='activeTp3']:checked").val()
	   , currentPage : Number(currPage)
	   , pagePerRow : 10
	   , pageSize : 10
	};
	
	console.log (param);
	$.ajax({
	  url : "/estate/selectObjectList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  
		  $("#objtTbody").empty();
		  
		  var tmplNm = "";
		  var colCnt;
		  switch ( objtTp ) {
		  	case "OT001" : // 아파트
		  		
		  		tmplNm = "objtListTemplte1";
		  		colCnt = 12;
		  		break; 
		  	case "OT002" : // 상가
		  		tmplNm = "objtListTemplte2";
		  		colCnt = 9;
		  		break;
		  	case "OT003" : //사무실.빌딩
		  		tmplNm = "objtListTemplte3";
		  		colCnt = 8;
				break;
		  	case "OT004" : // 오피스텔
		  		tmplNm = "objtListTemplte4";
		  		colCnt = 11;
				break;
		  	case "OT005" : //주상복합
		  		tmplNm = "objtListTemplte5";
		  		colCnt = 10;
		  		break;
		  	case "OT006" : //분양권
		  		tmplNm = "objtListTemplte6";
		  		colCnt = 12;
				break;
		  }
		 
		  
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
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

function f_objtDtl_view (index) {
	console.log (objtList[index]);
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
	frm.action = '/estate/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/estate/objtDtlView.do");
   
   comSubmit.submit();
*/
}

function f_add_objt() {
	var frm = $('#commObjtList')[0];
	frm.action = '/estate/addObject.do';
	frm.method = 'POST';
	frm.submit();
}