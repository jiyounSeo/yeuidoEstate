var oEditors = [];

$(document).ready(function(){
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "memo",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors_today.getById["memo"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
	
	f_objtCombo_select();
	if ( $("#objtNo").val() != "") {
		f_objectDtl_select();
	}
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
/*
 * 물건 선택 콤보
 */
function f_objtCombo_select() {
	if ($("#objtTp").val() == "OT002") {
		return;
	}
	var param = {
			objtTp : $("#objtTp").val()
	};
	
	$.ajax({
		  url : "/selectBuildingCombo.go",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.buildCombo;
			  $.each (result, function(index) {
				  $("#buildCd").append("<option value='" + result[index].buildCd + "'>"+ result[index].buildNm + "</option>");
			  });
		  }
	});	
}

function f_objectDtl_select() {
	var param = {
		objtNo : $("#objtNo").val()
		, objtTp : $("#objtTp").val()
	};

	var objtForm = "";
	switch (objtTp) {
		case "OT001":
			objtForm = "newObApt";
			break;
		case "OT002":
			objtForm = "newObStore";
			break;
		case "OT003":
			objtForm = "newObOffice";
			break;
		case "OT004":
			objtForm = "newObOps";
			break;
		case "OT005":
			objtForm = "newObHrapt";
			break;
		case "OT006":
			objtForm = "newObTicket";
			break;
			
	}
	var serial = $("#"+objtForm).serialize();
	$.ajax({
		  url : "/selectObjectDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  objtInfo = data.objtInfo;
			  f_setting_text(objtInfo);
			  if ( $("#publicYn").val() == "Y") {
				  if ( objtInfo.modifyYn == "Y") {
					  $("#viewObjBot").hide();
				  }
			  }  
		  }
	});
}

function f_setting_text(result) {
	console.log ("!!!");
	console.log (result);
	
	$("#objtNm").val(result.objtNm);
	$("#custNm").val(result.custNm);
	$("#custTel1").val(result.custTel1);
	$("#custTel2").val(result.custTel2);
	$("#custTel3").val(result.custTel3);
	$("#buildCd").val(result.buildCd);
	$("#buildNm").val(result.buildNm);
	$("#area").val(result.area);
	$("#businessNm").val(result.businessNm);
	$("#bargainAmt").val(result.bargainAmt );
	$("#depositAmt").val(result.depositAmt);
	$("#monthlyAmt").val(result.monthlyAmt);
	$("#rightAmt").val(result.rightAmt);
	$("#manageAmt").val(result.manageAmt);
	$("#parcelAmt").val(result.parcelAmt);
	$("#premiumAmt").val(result.premiumAmt);
	$("#dong").val(result.dong);
	$("input[name='floor']").val(result.floor);
	$("#directionTp").val(result.directionTp);
	$("#dueDt").val(result.dueDt);
	$("#availableDt").val(result.availableDt);
	$("#roomCnt").val(result.roomCnt);
	$("#bathCnt").val(result.bathCnt);
	$('input[name="saleTp"]:radio:input[value="' + result.saleTp + '"]').attr('checked', 'checked');
	$('input[name="availableTp"]:radio:input[value="' + result.availableTp + '"]').attr('checked', 'checked');
	$('input[name="conditionTp"]:radio:input[value="' + result.conditionTp + '"]').attr('checked', 'checked');
	$('input[name="ondolYn"]:radio:input[value="' + result.ondolYn + '"]').attr('checked', 'checked');
	$('input[name="activeTp"]:radio:input[value="' + result.activeTp + '"]').attr('checked', 'checked');
	$('input[name="interiorYn"]:radio:input[value="' + result.interiorYn + '"]').attr('checked', 'checked');
	$("#activeTp").val(result.activeTp);
	if ( result.advertiseYn == "Y") {
		$('input:checkbox[id="advertiseYn"]').attr("checked", true); //단일건
	}
	if (result.publicYn  == "Y") {
		$('input:checkbox[id="publicYn"]').attr("checked", true); //단일건
	}
	$("#memo").val(result.memo);
	$("#custId").val(result.custId);
	$("#saleTp").val(result.saleTp);
}

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

$(document).on("keyup", "input[id*='Tel']", function() {
	$(this).val( $(this).val().replace(/[^0-9]/gi, '')); 
	
});

function f_saleobject_save() {
	var objtForm = "";
	switch ($("#objtTp").val()) {
		case "OT001":
			objtForm = "newObApt";
			break;
		case "OT002":
			objtForm = "newObStore";
			break;
		case "OT003":
			objtForm = "newObOffice";
			break;
		case "OT004":
			objtForm = "newObOps";
			break;
		case "OT005":
			objtForm = "newObHrapt";
			break;
		case "OT006":
			objtForm = "newObTicket";
			break;
			
	}

	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	
	var param = $("#"+objtForm).serialize();
	
	/*
	 * 필수입력
	 * 1. 물건명
	 * 2. 유형 (매매/전세/월세/렌트..)
	 * 3. 매매가 or 보증금 or 월세
	 * 4. 명도
	 * 5. 상태
	 * 6. 분류
	 */
	
	// 1. 물건명
	if ( $("#objtNm").val() == "") {
		alert ("물건명은 필수입력 값입니다.");
		$("#objtNm").focus();
		return;
	} 
	
	// 2. 유형
	if (  $("input[name=saleTp]:checked").val() == undefined ) {
		alert ("유형은 필수입력 값입니다.");
		return;
	} else {
		param.saleTp = $("input[name=saleTp]:checked").val();
		var selectSaleTp = $("input[name=saleTp]:checked").val();
		
		/*
		 * ST001 : 매매 
		 * ST002 : 전세
		 * ST003 : 월세
		 * ST004 : 렌트
		 * ST005 : 임대
		 */ 
		// 3. 매매가  or 보증금 or 월세
		if ( selectSaleTp == "ST001") { //매매
			if ( $("#bargainAmt").val() == "" ) {
				alert ("매매는 필수입력 값입니다.");
				$("#bargainAmt").focus();
				return; 
			}
		} else if ( selectSaleTp == "ST002") { //전세
			if ( $("#depositAmt").val() == "") {
				alert ("보증금은 필수입력 값입니다.");
				$("#depositAmt").focus();
				return; 
			}
				
		} else if (selectSaleTp == "ST003" || selectSaleTp == "ST004"  || selectSaleTp == "ST005") { //월세, 렌트, 임대
			if ( $("#depositAmt").val() == "") {
				alert ("보증금은 필수입력 값입니다.");
				$("#depositAmt").focus();
				return; 
			} else if ( $("#monthlyAmt").val() == "") {
				alert ("월세는 필수입력 값입니다.");
				$("#monthlyAmt").focus();
				return; 
			}
		}	
	}
	
	if ($("#objtTp").val() == "OT006" ) {
		if ( $("#parcelAmt").val() == "") {
			alert ("분양가는 필수입력 값입니다.");
			$("#parcelAmt").focus();
			return; 
		} else if ( $("#premiumAmt").val() == "") {
			alert ("프리미엄가는 필수입력 값입니다.");
			$("#premiumAmt").focus();
			return; 
		}
	}
	
	// 4.명도
	if ( $("#objtTp").val() != "OT006" && $("input[name=availableTp]:checked").val() == undefined ) {
		alert ("명도는 필수입력 값입니다.");
		return;
	} else {
		param.availableTp = $("input[name=availableTp]:checked").val();
	}
	
	// 5.상태
	if ($("#objtTp").val() == "OT001" ) {
		if (  $("input[name=conditionTp]:checked").val() == undefined ) {
			alert ("상태는 필수입력 값입니다.");
			return;
		} else {
			param.conditionTp = $("input[name=conditionTp]:checked").val();
		}
	}
	
	// 6. 분류
	if (  $("input[name=activeTp]:checked").val() == undefined ) {
		alert ("분류 [활성 or 분류]은 필수입력 값입니다.");
		return;
	} else {
		param.activeTp = $("input[name=activeTp]:checked").val();
	}
	
	// pageName (menuBar 에서 등록하는경우 --> 분류에 따라 활성물건카드 / 보류물건카드로 이동)
	if($("#pageNm").val() == ""){
		if( $("input[name=activeTp]:").val() == "AT001" ){
			$("#pageNm").val("objtActiveY");
		} else if($("input[name=activeTp]:").val() == "AT002") {
			$("#pageNm").val("objtActiveN");
		}
	}

	var urlStr = "";
	if ($("#objtNo").val() != "" ) {
		urlStr = "modifyObject.do";
	} else {
		urlStr = "insertObject.do";
	}
	
	$.ajax({
	  url : "/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  alert (data.message);
		  if (data.messageCd == 1) {
			  f_objt_dtl_view();
		  }
	  }
	});
}

function f_objt_delete() {
	var objtForm = "";
	switch ( $("#objtTp").val()) {
		case "OT001"	:
			objtForm = "viewObApt";
			break;
		case "OT002"	:
			objtForm = "viewObStore";
			break;
		case "OT003"	:
			objtForm = "viewObOffice";
			break;
		case "OT004"	:
			objtForm = "viewObOps";
			break;
		case "OT005"	:
			objtForm = "viewObHrapt";
			break;
		case "OT006"	:
			objtForm = "viewObTicket";
			break;
		
	}
	if (confirm ("물건을 삭제하시겠습니까?")) {
	   var comSubmit = new ComSubmit(objtForm);
	   comSubmit.setUrl("/deleteObject.do");
	   comSubmit.submit();
	}
}

function f_objt_dtl_view() {
	var objtForm = "";
	switch ($("#objtTp").val()) {
		case "OT001":
			objtForm = "newObApt";
			break;
		case "OT002":
			objtForm = "newObStore";
			break;
		case "OT003":
			objtForm = "newObOffice";
			break;
		case "OT004":
			objtForm = "newObOps";
			break;
		case "OT005":
			objtForm = "newObHrapt";
			break;
		case "OT006":
			objtForm = "newObTicket";
			break;
	}
	$("#publicYn").val("");
	var comSubmit = new ComSubmit($("#"+objtForm).attr('id'));
	comSubmit.setUrl("/commObListPostView.do");
	comSubmit.submit();
}

function f_list_view_change() {
	var objtForm = "";
	switch ( $("#objtTp").val()) {
		case "OT001"	:
			objtForm = "viewObApt";
			break;
		case "OT002"	:
			objtForm = "viewObStore";
			break;
		case "OT003"	:
			objtForm = "viewObOffice";
			break;
		case "OT004"	:
			objtForm = "viewObOps";
			break;
		case "OT005"	:
			objtForm = "viewObHrapt";
			break;
		case "OT006"	:
			objtForm = "viewObTicket";
			break;
		
	}
	 var comSubmit = new ComSubmit(objtForm);
	 comSubmit.setUrl("/commObListPostView.do");
	 comSubmit.submit();
	 
    
}

