$(document).ready(function(){
	//f_objectDtl_select();
	if ($("#modifyYn").val() == "Y") {
		$("#modfDiv").show();
	} else {
		$("#modfDiv").hide();
	}
	
	if ( !gfn_isNull($("#custId").val())) {
		f_customerDtl_select();
	}
	
});

function f_customerDtl_select() {
	var param = {
		custId : $("#custId").val()
		, publicYn : $("#publicYn").val()
		, pageNm : $("pageNm").val()
	};
	$.ajax({
		  url : "/selectCustomerDtl.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  var result = data.custInfo;		
			  
			  var tmp = result.reqContent;
			  //console.log(tmp);
			  $("#reqContentView").empty();
			  if(tmp == null || tmp == '' || tmp == undefined){
				  $("#reqContentView").append(tmp); 
			  } else {
				  var changed = tmp.replace(/\n/g, '<br>'); 
				  $("#reqContentView").append(changed);
			  }
			  
			  $("#budAmtView").empty();
			  $("#budAmtView").append( comma(result.budAmt) + "만원");
			  f_setting_text(result);
		  }
	});
}

function f_setting_text(result) {
	$("#custNm").val(result.custNm);
	$("#custTel1").val(result.custTel1);
	$("#custTel2").val(result.custTel2);
	$("#custTel3").val(result.custTel3);
	$("#faxTel1").val(result.faxTel1);
	$("#faxTel2").val(result.faxTel2);
	$("#faxTel3").val(result.faxTel3);
	$("#budAmt").val( comma(result.budAmt) );
	$("#reqContent").val(result.reqContent);
	$("#email").val(result.email);
	
	
	$('input[name="activeTp"]:radio:input[value="' + result.activeTp + '"]').attr('checked', 'checked');
	if (result.publicYn  == "Y") {
		$('input:checkbox[id="publicYn"]').attr("checked", true); //단일건
	}

	if (result.modifyYn == "Y") {
		$("#modfDiv").show();
	} else {
		$("#modfDiv").hide();
	}
	  
}


$(document).on("keyup", "input[id*='Tel']", function() {
	$(this).val( $(this).val().replace(/[^0-9]/gi, '')); 
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

function f_customer_save() {
	 $("#budAmt").val( $("#budAmt").val().replace(/,/g, ''));
	
	var param = $("#newClient").serialize();
	
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
	  url : "/" + urlStr,
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
		  f_list_view_change();
	  }
	});
}

function f_customer_delete() {
	if (confirm ("고객을 삭제하시겠습니까?(고객에 기록된 작업내역까지 모두 삭제됩니다)")) {
	   var comSubmit = new ComSubmit("viewClient");
	   comSubmit.setUrl("/deleteCustomer.do");
	   comSubmit.submit();
	}
}

function f_srchObjt_popup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/popup/srchInterObjt.jsp","_blank","width=1100,height=670, scrollbars=yes, resizable=yes");  
}


function f_list_view_change() {
	 var comSubmit = new ComSubmit("newClient");
	 if ($("input[name=activeTp]:checked").val() == 'AT001') {
		 $("#pageNm").val('custActiveY'); 
	 } else if ($("input[name=activeTp]:checked").val() == 'AT002') {
		 $("#pageNm").val('custActiveN'); 
	 } else {
		 $("#pageNm").val('custPublic'); 
	 }
	 comSubmit.setUrl("/commClListPostView.do");
	 comSubmit.submit();
}

function f_list_view_change2() {
	 var comSubmit = new ComSubmit("viewClient");
	 comSubmit.setUrl("/commClListPostView.do");
	 comSubmit.submit();
}


function f_list_link() {

	var url = "./totalListView.do";
	var tmp = "";
	var activeTp = $("#activeTp").val();
	var beforeFullUrl = $("#beforUrl").val();
	
	if(beforeFullUrl != ""){
		tmp = beforeFullUrl.split("/");
	}
	var beforePage = tmp[tmp.length-1];
	
	if(beforePage == "custSearchNamePage.do"){
		history.back();
		return;
	} else {
		if(activeTp == "AT001"){
			url = "./commClListView.do?pageNm=custActiveY&activeTp=AT001";
		} else if (activeTp == "AT002") {
			url = "./commClListView.do?pageNm=custActiveN&activeTp=AT002";
		}
	}
	location.href = url;
	return;
}


