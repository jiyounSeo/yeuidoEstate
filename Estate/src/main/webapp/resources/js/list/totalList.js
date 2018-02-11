$(document).ready(function(){
	//$('input:checkbox[id="objt_activeTp1"]').attr("checked", true); //단일건
	//$('input:checkbox[id="cust_activeTp1"]').attr("checked", true); //단일건
	f_objt_select('','');
	f_custList_select();
	$("#objtList").show();
	$("#custList").show();
	
});
var objtTp = "OT001";
var saleTp = "ST001";

var category = "";
function f_category_select (cate) {
	category = cate;
	f_objt_select (objtTp,'');
}

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

function f_objt_select (objtTpChk, saleTpChk) {
	f_category_combo(objtTpChk== '' ? objtTp : objtTpChk);
	if (objtTpChk != '' ) {
		objtTp = objtTpChk;
	} 
	if (saleTpChk != '' ) {
		saleTp = saleTpChk;
	}
	var saleTpColor = f_saleTp_color (saleTp) ;
	
	$("#saleTpTr").empty();
	$("#objtListTr").empty();
	switch ( objtTp ) {
		case "OT001":
			tmplTr = "saleTpTrTmpl1_"+saleTp;
			tmplNm = "objtTrTemplte1"; 
			break;
		case "OT002":
			tmplTr = "saleTpTrTmpl2_"+saleTp;
			tmplNm = "objtTrTemplte2"; 
			break;
		case "OT003":
			tmplTr = "saleTpTrTmpl3_"+saleTp;
			tmplNm = "objtTrTemplte3"; 
			break;
		case "OT004":
			tmplTr = "saleTpTrTmpl4_"+saleTp;
			tmplNm = "objtTrTemplte4"; 
			break;
		case "OT005":
			tmplTr = "saleTpTrTmpl5_"+saleTp;
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

function f_objtCkbox_check(box){
	
	var cnt = 0;
	
	if(gfn_isNull($("input[name='objt_activeTp1']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='objt_activeTp2']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='objt_activeTp3']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='objt_activeTp4']:checked").val()) == false){ cnt++; }
	
	if(cnt > 0) {
		f_objectList_select('', '');		
	} else {
		alert("목록을 구성하기위해서는 한개 이상 체크되어야 합니다");
		$("#"+box.name).attr("checked", "checked");
		return;
	}
}


function f_objectList_select(objtTpChk, saleTpChk){
	var activeTpChk = "";
	var activTp1 = $("input[name='objt_activeTp1']:checked").val();
	var activTp2 = $("input[name='objt_activeTp2']:checked").val();
	var activTp3 = $("input[name='objt_activeTp3']:checked").val();
	
	 if (!gfn_isNull(objtTpChk)) {
		 objtTp = objtTpChk;
	 }
	 if (!gfn_isNull(saleTpChk)) {
		 saleTp = saleTpChk;
	 }
	 console.log ("activeTpChk: "+activeTpChk);
	//saleTpTr
	var param = {
		objtTp : objtTp
	   , saleTp : saleTp
	   , pageNm : "total"
	   , activeTp : activTp1+activTp2+activTp3//gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
	   , activeTp1 : activTp1
	   , activeTp2 : activTp2
	   , activeTp3 : activTp3
	   , myObjt : gfn_isNull($("input[name='objt_activeTp4']:checked").val()) ? "" : $("input[name='objt_activeTp4']:checked").val()
	   , currentPage : Number(currObjtPage)
	   , category : category
	   , pagePerRow : $("#viewMode").val() == "1"  ? 5 : 20
	   , pageSize : 10
	};
	$.ajax({
	  url : "/selectObjectList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  
		  $("#objtTbody").empty();
		  $("#objtPagingDiv").empty();
		  var tmplNm = "";
		  switch ( objtTp ) {
		  	case "OT001" : // 아파트
		  		tmplNm = "objtListTemplte1_"+saleTp;
		  		break; 
		  	case "OT002" : // 상가
		  		tmplNm = "objtListTemplte2_"+saleTp;
		  		break;
		  	case "OT003" : //사무실.빌딩
		  		tmplNm = "objtListTemplte3_"+saleTp;
				break;
		  	case "OT004" : // 오피스텔
		  		tmplNm = "objtListTemplte4_"+saleTp;
				break;
		  	case "OT005" : //주상복합
		  		tmplNm = "objtListTemplte5_"+saleTp;
		  		break;
		  	case "OT006" : //분양권
		  		tmplNm = "objtListTemplte6";
				break;
		  }
		  
		  if (result.objtList.length != 0) {
			  objtList = result.objtList;
			  $.each (result.objtList, function(index) {
				  var bargainAmt = result.objtList[index].bargainAmt;
				  result.objtList[index].bargainAmt = comma(uncomma(bargainAmt)); 
				  var depositAmt = result.objtList[index].depositAmt;
				  result.objtList[index].depositAmt = comma(uncomma(depositAmt)); 
				  var monthlyAmt = result.objtList[index].monthlyAmt;
				  result.objtList[index].monthlyAmt = comma(uncomma(monthlyAmt)); 
				  var rightAmt = result.objtList[index].rightAmt;
				  result.objtList[index].rightAmt = comma(uncomma(rightAmt)); 
			  });
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
			  console.log (result);
			  $("#objtPagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#objtPagingDiv #page" + currObjtPage).addClass("active");

		  } else {
			  $("#objtPagingDiv").empty();
			  var colCnt = $("#objtListTr td").length;
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }
		  

	  }
	});
	
}


function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 

function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}


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
	
	var frm = $('#totalList')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
}


function f_mbrDtl_view (index) {
	$("#custId").val(custList[index].custId);
	var frm = $('#totalList')[0];
	frm.action = '/viewClient.do';
	frm.method = 'POST';
	frm.submit();
}

function f_custCkbox_check(box){
	
	var cnt = 0;
	
	if(gfn_isNull($("input[name='cust_activeTp1']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='cust_activeTp2']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='cust_activeTp3']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='cust_activeTp4']:checked").val()) == false){ cnt++; }
	
	if(cnt > 0) {
		f_custList_select();		
	} else {
		alert("목록을 구성하기위해서는 한개 이상 체크되어야 합니다");
		$("#"+box.name).attr("checked", "checked");
		return;
	}
}

function f_custList_select() {
	
	var activeTpChk = "";
	var activTp1 = $("input[name='cust_activeTp1']:checked").val();
	var activTp2 = $("input[name='cust_activeTp2']:checked").val();
	var activTp3 = $("input[name='cust_activeTp3']:checked").val();
	
	var param = { currentPage : Number(currCustPage)
				   , pagePerRow : $("#viewMode").val() == "1" ? 5 : 20 
				   , pageSize : 10
				   , pageNm : "total"
				   , activeTp : activTp1+activTp2+activTp3//gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
				   , activeTp1 : activTp1
				   , activeTp2 : activTp2
				   , activeTp3 : activTp3
				   , myCust : gfn_isNull($("input[name='cust_activeTp4']:checked").val()) ? "" : $("input[name='cust_activeTp4']:checked").val()
	};
	$.ajax({
	  url : "/selectCustomerList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#custTbody").empty();
		  $("#custPagingDiv").empty();
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
	frm.action = '/addObject.do';
	frm.method = 'POST';
	frm.submit();
	
}

//페이징 버튼 클릭이벤트
currObjtPage = 1;
currCustPage = 1;

$(document).on('click', '.pagingBtn', function() {
	var divId = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	console.log (currPageStr);
	if ( !gfn_isNull(currPageStr) ) {
		if ( divId == "objtPagingDiv") {
			currObjtPage = Number(currPageStr);
			f_objectList_select('','');
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
			currObjtPage = 1;
			currCustPage = 1;
			f_objt_select('','');
			f_custList_select() ;
			$("#heightDiv").show();
			$("#objtList").show();
			$("#custList").show();
			break;
		case "2" : 
			currObjtPage = 1;
			$("#heightDiv").hide();
			$("#objtList").show();
			$("#custList").hide();
			f_objt_select('','');
			break;
		case "3" :
			currCustPage = 1;
			$("#heightDiv").hide();
			$("#objtList").hide();
			$("#custList").show();
			f_custList_select();
			break;
	
	}
	
}