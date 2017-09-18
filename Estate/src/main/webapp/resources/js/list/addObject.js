$(document).ready(function(){
	formId = $("form").attr("id");
	console.log ("!!" +formId);
	
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

function f_objtCombo_select() {
	//selectBuildingCombo
	var param = {
			objtTp : $("#objtTp").val()
	};
	
	$.ajax({
		  url : "/estate/selectBuildingCombo.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.buildCombo;
			  $.each (result, function(index) {
				  $("#buildCd").append("<option value='" + result[index].buildCd + "'>"+ result[index].buildNm + "</option>");
			  });
			  
//			 			 $(sampleTmpl).tmpl(tmplVal).appendTo("#tmplView");
//			 			$("#listTemplte").tmpl(data).appendTo("#target");
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
	console.log (serial);
	$.ajax({
		  url : "/estate/selectObjectDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.objtInfo;
			  console.log (result);
			  f_setting_text(result);
				
				
//		 			 $(sampleTmpl).tmpl(tmplVal).appendTo("#tmplView");
//		 			$("#listTemplte").tmpl(data).appendTo("#target");
		  }
	});
}

function f_setting_text(result) {
	console.log (result);
	$("#objtNm").val(result.objtNm);
	$("#custNm").val(result.custNm);
	$("#custTel1").val(result.custTel1);
	$("#custTel2").val(result.custTel2);
	$("#custTel3").val(result.custTel3);
	$("#buildCd").val(result.buildCd);
	$("#area").val(result.area);
	$("#bargainAmt").val(result.bargainAmt);
	$("#depositAmt").val(result.depositAmt);
	$("#monthlyAmt").val(result.monthlyAmt);
	$("#dong").val(result.dong);
	$("input[name='floor']").val(result.floor);
	$("#directionTp").val(result.directionTp);
	$("#dueDt").val(result.dueDt);
	$("#roomCnt").val(result.roomCnt);
	$("#bathCnt").val(result.bathCnt);
	$('input[name="saleTp"]:radio:input[value="' + result.saleTp + '"]').attr('checked', 'checked');
	$('input[name="availableTp"]:radio:input[value="' + result.availableTp + '"]').attr('checked', 'checked');
	$('input[name="conditionTp"]:radio:input[value="' + result.conditionTp + '"]').attr('checked', 'checked');
	$('input[name="ondolYn"]:radio:input[value="' + result.ondolYn + '"]').attr('checked', 'checked');
	$('input[name="activeTp"]:radio:input[value="' + result.activeTp + '"]').attr('checked', 'checked');
	$('input[name="interiorYn"]:radio:input[value="' + result.interiorYn + '"]').attr('checked', 'checked');
	
	if ( result.advertiseYn == "Y") {
		$('input:checkbox[id="advertiseYn"]').attr("checked", true); //단일건
	}
	if (result.publicYn  == "Y") {
		$('input:checkbox[id="publicYn"]').attr("checked", true); //단일건
	}
	$("#memo").val(result.memo);
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
	var param = $("#"+objtForm).serialize();
	
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
	if (  $("input[name=activeTp]:checked").val() == undefined ) {
		alert ("분류 [활성 or 분류]은 필수입력 값입니다.");
		return;
	} else {
		param.activeTp = $("input[name=activeTp]:checked").val();
	}
	


	var urlStr = "";
	console.log ("objtNo" + $("#objtNo").val());
	console.log (param);
	if ($("#objtNo").val() != "" ) {
		urlStr = "modifyObject.do";
	} else {
		urlStr = "insertObject.do";
	}
	console.log (urlStr);
	console.log (param);
	$.ajax({
	  url : "/estate/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  alert (data.message);
	  
	//			 $(sampleTmpl).tmpl(tmplVal).appendTo("#tmplView");
//	 			$("#listTemplte").tmpl(data).appendTo("#target");
	  }
	});
}

function f_objt_delete() {
	if (confirm ("물건을 삭제하시겠습니까?")) {
	   var comSubmit = new ComSubmit($('form').attr('id'));
	   comSubmit.setUrl("/estate/deleteObject.do");
	   comSubmit.submit();
	     
	}
}

function f_member_list() {
   var comSubmit = new ComSubmit("joinMember");
   comSubmit.setUrl("/estate/memberListView.do");
   
   var frm = $("#"+this.bodyt)[0];
   
   comSubmit.submit();
}
