$(document).ready(function(){
	f_objectCnt_select();
});
$(function() {
  $( ".datepicker" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });
});

function inputNumberFormat(obj) { 
    obj.value = comma(uncomma(obj.value)); 
} 

function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 

function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}

function goPopup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/js/comm/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
}
//INF/views
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/ 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서  
// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.  
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");  } 

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){    
	// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.    
		document.form.roadFullAddr.value = roadFullAddr;    
		document.form.roadAddrPart1.value = roadAddrPart1;    
		document.form.roadAddrPart2.value = roadAddrPart2;   
		documentform.addrDetail.value = addrDetail;    
		document.form.zipNo.value = zipNo; 
}
	

function f_saleobject_save() {
	
	var formId = $("form").attr("id");
	var param = $("#"+formId).serialize();
	
	if ( $("#objtNm").val() == "") {
		alert ("물건명은 필수입력 값입니다.");
		return;
	}
	
	if ( $("#custNm").val() == "") {
		alert ("고객명은 필수입력 값입니다.");
		return;
	}
	
	
	if (  $("input[name=saleTp]:checked").val() == undefined ) {
		alert ("유형은 필수입력 값입니다.");
		return;
	} else {
		param.saleTp = $("input[name=saleTp]:checked").val();
	}
	
	if ( $("#dueDt").val() == "") {
		alert ("만기일은 필수입력 값입니다.");
		return;
	}
	console.log ("activeTp : " + $("input[name=activeTp]:checked").val());
	if (  $("input[name=activeTp]:checked").val() == undefined ) {
		alert ("분류 [활성 or 분류]은 필수입력 값입니다.");
		return;
	} else {
		param.activeTp = $("input[name=activeTp]:checked").val();
	}
	
	console.log (param);

	$.ajax({
	  url : "/estate/insertObject.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  alert ("물건 등록에 성공하였습니다.");
//	 			 $(sampleTmpl).tmpl(tmplVal).appendTo("#tmplView");
//	 			$("#listTemplte").tmpl(data).appendTo("#target");
	  }
	});
}

function f_member_list() {
   var comSubmit = new ComSubmit("joinMember");
   comSubmit.setUrl("/estate/memberListView.do");
   comSubmit.submit();
}

function f_objectCnt_select() {
	
	$.ajax({
	  url : "/estate/selectObjectCnt.do",
	  type: "post",
	  data : '',
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  var list =result.objCntList; 
		  $.each (list, function (index){
			  $("#"+ list[index].objtTp + list[index].saleTp).text (list[index].cntSaleTp);
		  });
		
	  }
	});
	
}
