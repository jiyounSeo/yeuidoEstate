$(document).ready(function(){
	//f_objectDtl_select();
	formId = $("form").attr("id");
	if ($("custId") != "") {
		f_customerDtl_select();
	}
	
});


function f_customerDtl_select() {
	var param = {
		custId : $("#custId").val()
	};
	$.ajax({
		  url : "/estate/selectCustomerDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.custInfo;
			  console.log ("search success");
			  console.log (data);
			  f_setting_text(result);
		  }
	});
}

function f_setting_text(result) {
	$("#custNm").val(result.custNm);
	$("#custTel1").val(result.custTel1);
	$("#custTel2").val(result.custTel2);
	$("#custTel3").val(result.custTel3);
	$("#homeTel1").val(result.homeTel1);
	$("#homeTel2").val(result.homeTel2);
	$("#homeTel3").val(result.homeTel3);
	$("#orgnTel1").val(result.orgnTel1);
	$("#orgnTel2").val(result.orgnTel2);
	$("#orgnTel3").val(result.orgnTel3);
	$("#faxTel1").val(result.faxTel1);
	$("#faxTel2").val(result.faxTel2);
	$("#faxTel3").val(result.faxTel3);
	$("#budAmt").val(result.budAmt);
	$("#reqContent").val(result.reqContent);
	$("#feature").val(result.feature);
	$("#dtlContent").val(result.dtlContent);
	$("#buyCond").val(result.buyCond);
	$('input[name="gradeTp"]:radio:input[value="' + result.gradeTp + '"]').attr('checked', 'checked');
	$('input[name="activeTp"]:radio:input[value="' + result.activeTp + '"]').attr('checked', 'checked');
	if (result.publicYn  == "Y") {
		$('input:checkbox[id="publicYn"]').attr("checked", true); //단일건
	}
}


function f_customer_save() {
	
	var param = $("#"+formId).serialize();
	
	if ( $("#custNm").val() == "") {
		alert ("고객명은 필수입력 값입니다.");
		return;
	}
	if ( ($("#custTel1").val() == "") || ($("#custTel2").val() == "") || ($("#custTel3").val() == "")) {
		alert ("고객 휴대폰번호는 필수입력 값입니다.");
		return;
	}
	
	if (  $("input[name=activeTp]:checked").val() == undefined ) {
		alert ("분류 [활성 or 분류]은 필수입력 값입니다.");
		return;
	} else {
		param.activeTp = $("input[name=activeTp]:checked").val();
	}

	var urlStr = "";
	if ($("#custId").val() != "" ) {
		urlStr = "modifyCustomer.do";
	} else {
		urlStr = "insertCustomer.do";
	}
	$.ajax({
	  url : "/estate/" + urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  if ( urlStr == "insertCustomer.do" ) {
			  alert (responseData.message);
		  } else {
			  alert ("고객수정에 성공하였습니다.");
					  
		  }
	  }
	});
}

function f_customer_delete() {
	if (confirm ("고객을 삭제하시겠습니까?")) {
	   var comSubmit = new ComSubmit($('form').attr('id'));
	   comSubmit.setUrl("/estate/deleteCustomer.do");
	   comSubmit.submit();
	     
	}
}

function f_srchObjt_popup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/popup/srchInterObjt.jsp","_blank","width=870,height=670, scrollbars=yes, resizable=yes");  
}


