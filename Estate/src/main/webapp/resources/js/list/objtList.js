$(document).ready(function(){
	
	if ($("#pageNm").val() == "objtActiveY") {

		$("input[name='activeTp2']").attr("checked",false);	
		$("input[name='activeTp3']").attr("checked",false);	
		
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
	}
	else if ($("#pageNm").val() == "objtActiveN") {

		$("input[name='activeTp1']").attr("checked",false);	
		$("input[name='activeTp3']").attr("checked",false);	
		
		$("label[for='activeTp1']").css("display","none");
		$("label[for='activeTp2']").css("display","none");
	}
	else if($("#pageNm").val() == "objtPublic"){
		$("input[name='activeTp3']").attr("checked",false);	
		$("label[for='activeTp3']").css("display","none");	
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


function f_show_searchbox(){
	$("#searchbox").toggle();
}

function f_search_obName(){	
	
	var keyword = $("#keyname").val();
	
	if(keyword == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면
	
	var frm = $('#commObjtList')[0];
	frm.action = '/objtSearchNamePage.do';
	frm.method = 'POST';
	frm.keyword.value = keyword;
	frm.submit();	

}

function f_enter(val) {
	if(event.keyCode == 13){ //눌렀다 땐 키값이 13(엔터키)라면
		if(val == ""){ alert('검색어를 입력하세요.'); return false; } //입력폼에 값이 있으면

		f_search_obName();
	}	
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


function f_objtCkbox_check(box){
	
	var cnt = 0;
	
	if(gfn_isNull($("input[name='activeTp1']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp2']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp3']:checked").val()) == false){ cnt++; }
	if(gfn_isNull($("input[name='activeTp4']:checked").val()) == false){ cnt++; }
	
	if(cnt > 0) {
		f_objectList_select('', '');		
	} else {
		alert("목록을 구성하기위해서는 한개 이상 체크되어야 합니다");
		$("#"+box.name).attr("checked", "checked");
		return;
	}
}


function f_objectList_select(objtTp, saleTp){
	var activeTpChk = "";
	var activTp1 = $("input[name='activeTp1']:checked").val();
	var activTp2 = $("input[name='activeTp2']:checked").val();
	var activTp3 = $("input[name='activeTp3']:checked").val();
	
	 if (!gfn_isNull(objtTpChk)) {
		 objtTp = objtTpChk;
	 }
	 if (!gfn_isNull(saleTpChk)) {
		 saleTp = saleTpChk;
	 }
	 
	 	 
	 var param = {
		objtTp : objtTp
	   , saleTp : saleTp
	   , pageNm : $("#pageNm").val()
	   , activeTp : activTp1+activTp2+activTp3//gfn_isNull (activeTpChk) ? "AT001" : activeTpChk
	   , activeTp1 : activTp1
	   , activeTp2 : activTp2
	   , activeTp3 : activTp3
	   , myObjt : gfn_isNull($("input[name='activeTp4']:checked").val()) ? "" : $("input[name='activeTp4']:checked").val()
	   , currentPage : Number(currPage)
	   , category : category
	   , pagePerRow : 10
	   , pageSize : 10
	};
	
	console.log (param);
	$.ajax({
	  url : "/selectObjectList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
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
			  //console.log (objtList);
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
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");

		  } else {
			  $("#pagingDiv").empty();
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