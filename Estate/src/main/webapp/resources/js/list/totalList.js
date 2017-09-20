$(document).ready(function(){
	$('input:checkbox[id="objt_activeTp1"]').attr("checked", true); //단일건
	$('input:checkbox[id="cust_activeTp1"]').attr("checked", true); //단일건
	f_objt_select('','');
	f_custList_select();
	$("#objtList").show();
	$("#custList").show();
	
});
var objtTp = "OT001";
var saleTp = "ST001";

function f_objt_select (objtTpChk, saleTpChk) {
	if (objtTpChk != '' ) {
		objtTp = objtTpChk;
	} 
	if (saleTpChk != '' ) {
		saleTpChk = saleTpChk;
	}
	var saleTpColor = f_saleTp_color (saleTp) ;
	
	$("#saleTpTr").empty();
	$("#objtListTr").empty();
	switch ( objtTp ) {
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
	$("#li_"+objtTp).css("color", "#2573BB");

	$(".tab_bg").each (function(){
		$(this).css("background-color", "#6C6C6C");
	});
	$("#li_"+saleTp).css("background-color", saleTpColor);
	$("#objtListTr td").css("background-color", saleTpColor);
	$("#objtListTr td").css("color", "#fff");
	
	f_objectList_select(objtTp, saleTp);
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
	var activeTpChk = "";
	 if ( !gfn_isNull($("input[name='objt_activeTp1']:checked").val()) ) {
		 activeTpChk = "AT001";
	 } else if ( !gfn_isNull($("input[name='objt_activeTp2']:checked").val()) ) {
		 activeTpChk = "AT002";
	 }
	 
	//saleTpTr
	var param = {
		objtTp : objtTp
	   , saleTp : saleTp
	   , publicYn : "Y" 
	   , activeTp : gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
	   , myObjt : gfn_isNull($("input[name='objt_activeTp3']:checked").val()) ? "" : $("input[name='objt_activeTp3']:checked").val()
	   , currentPage : Number(currObjtPage)
	   , pagePerRow : $("#viewMode").val() == "1"  ? 5 : 20
	   , pageSize : 10
	   , publicYn : $("#publicYn").val()
	};
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
			  $("#objtPagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#objtPagingDiv #page" + currObjtPage).addClass("active");

		  } else {
			  $("#objtPagingDiv").empty();
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }
		  

	  }
	});
	
}


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
	
	var frm = $('#totalList')[0];
	frm.action = '/estate/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/estate/objtDtlView.do");
   
   comSubmit.submit();
*/
}


function f_mbrDtl_view (index) {
	console.log (custList[index]);
	$("#custId").val(custList[index].custId);
	var frm = $('#totalList')[0];
	frm.action = '/estate/viewClient.do';
	frm.method = 'POST';
	frm.submit();
	/*
   var comSubmit = new ComSubmit($('form').attr('id'));
   comSubmit.setUrl("/estate/objtDtlView.do");
   
   comSubmit.submit();
*/
}



function f_custList_select() {
	var activeTpChk = "";
	 if ( !gfn_isNull($("input[name='cust_activeTp1']:checked").val()) ) {
		 activeTpChk = "AT001";
	 } else if ( !gfn_isNull($("input[name='cust_activeTp2']:checked").val()) ) {
		 activeTpChk = "AT002";
	 }
	 
	var param = { currentPage : Number(currCustPage)
				   , pagePerRow : $("#viewMode").val() == "1" ? 5 : 20 
				   , pageSize : 10
				   , publicYn : "Y" 
				   , activeTp : gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
				   , myCust : gfn_isNull($("input[name='cust_activeTp3']:checked").val()) ? "" : $("input[name='cust_activeTp3']:checked").val()
	};
	$.ajax({
	  url : "/estate/selectCustomerList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  if (result.custList.length != 0) {
			  custList = result.custList;
			  $("#custListTemplte").tmpl(result).appendTo("#custTbody");
			  $("#custPagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#custPagingDiv #page" + currCustPage).addClass("active");

		  } else {
			  $("#custPagingDiv").empty();
			  $("#custListEmptyTemplte").tmpl(result).appendTo("#custTbody");
		  }
	  }
	});
	
}

function f_add_objt() {
	var frm = $('#totalList')[0];
	frm.action = '/estate/addObject.do';
	frm.method = 'POST';
	frm.submit();
	
}

//페이징 버튼 클릭이벤트
currObjtPage = 1;
currCustPage = 1;

$(document).on('click', '.pagingBtn', function() {
	var divId = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		if ( divId == "objtPagingDiv") {
			currObjtPage = Number(currPageStr);
			f_objectList_select();
		} else {
			currCustPage = Number(currPageStr);
			f_custList_select();
		}
	}
});

function f_view_change(view) {
	$("#viewMode").val(view);
	switch (view) {
		case "1" : 
			f_objt_select('','');
			f_custList_select() ;
			$("#heightDiv").show();
			$("#objtList").show();
			$("#custList").show();
			break;
		case "2" : 
			$("#heightDiv").hide();
			$("#objtList").show();
			$("#custList").hide();
			f_objt_select('','');
			break;
		case "3" :

			$("#heightDiv").hide();
			$("#objtList").hide();
			$("#custList").show();
			f_custList_select();
			break;
	
	}
	
}