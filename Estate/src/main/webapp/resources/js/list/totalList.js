$(document).ready(function(){
	if ( $("#viewMode").val() == "2") {
		$("#objtList").show();
		$("#custList").hide();
		f_objt_select('','');
	} else if ($("#viewMode").val() == "3" ) {
		$("#objtList").hide();
		$("#custList").show();
		f_custList_select();
	} else {
		f_objt_select('','');
		f_custList_select();
		$("#objtList").show();
		$("#custList").show();
	}
});

function f_objt_select (objtTp, saleTp) {
	if (objtTp == '' ) {
		objtTp = "OT001";
	} 
	if (saleTp == '' ) {
		saleTp = "ST001";
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

function f_objectList_select(objtTp, saleTp){
	
	//saleTpTr
	var param = {
		objtTp : objtTp
	   , saleTp : saleTp
	   , currentPage : Number(currObjtPage)
	   , pagePerRow : $("#viewMode").val() == "1"  ? 5 : 10  
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
	var param = { currentPage : Number(currCustPage)
				   , pagePerRow : $("#viewMode").val() == "1" ? 5 : 10 
				   , pageSize : 10
				   , publicYn : $("#publicYn").val()
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