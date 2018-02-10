
$(document).ready(function(){
	$("#objtTable").hide();
	$("#btnSave").hide();
	openCustId = opener.document.getElementById("custId").value;
	$("#custId").val( openCustId);
});

function f_objt_search() {
	var param = $("#srchObjtPop").serialize();
	param.objtTp1 = $("input[name=objtTp1]:checked").val();
	param.objtTp2 = $("input[name=objtTp2]:checked").val();
	param.objtTp3 = $("input[name=objtTp3]:checked").val();
	param.objtTp4 = $("input[name=objtTp4]:checked").val();
	param.objtTp5 = $("input[name=objtTp5]:checked").val();
	param.objtTp6 = $("input[name=objtTp6]:checked").val();
	
	param.saleTp1 = $("input[name=saleTp1]:checked").val();
	param.saleTp2 = $("input[name=saleTp2]:checked").val();
	param.saleTp3 = $("input[name=saleTp3]:checked").val();
	param.saleTp4 = $("input[name=saleTp4]:checked").val();
	
	/*var param1 = param;
	param1.custId = custId;
	*/
	if ( ($("#fromArea").val() != '' && $("#toArea").val() == '') 
			|| 	($("#fromArea").val() == '' && $("#toArea").val() != '') 
			) {
			alert ("검색할 평수의 범위를 정확히 입력하세요.");
			return;
		}
	if ( ($("#fromBargainAmt").val() != '' && $("#toBargainAmt").val() == '') 
		|| 	($("#fromBargainAmt").val() == '' && $("#toBargainAmt").val() != '') 
		) {
		alert ("검색할 매매가의 범위를 정확히 입력하세요.");
		return;
	}
	// fromDepositAmt - 보증금
	if ( ($("#fromDepositAmt").val() != '' && $("#toDepositAmt").val() == '') 
			|| 	($("#fromDepositAmt").val() == '' && $("#toDepositAmt").val() != '') 
			) {
			alert ("검색할 보증금의 범위를 정확히 입력하세요.");
			return;
		}
	// fromMonthlyAmt - 월세
	if ( ($("#fromMonthlyAmt").val() != '' && $("#toMonthlyAmt").val() == '') 
			|| 	($("#fromMonthlyAmt").val() == '' && $("#toMonthlyAmt").val() != '') 
			) {
			alert ("검색할 월세의 범위를 정확히 입력하세요.");
			return;
		}
	$.ajax({
		  url : "/searchObjtList.do",
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#objtTbody").empty();
			  $("#objtTable").show();
				
			  if (data.srchObjt.length != 0) {
				 $("#objtTable").show();
				 $("#btnSave").show();
				 $.each (data.srchObjt, function(index) {
					  var bargainAmt = data.srchObjt[index].bargainAmt;
					  data.srchObjt[index].bargainAmt = comma(uncomma(bargainAmt)); 
					  var depositAmt = data.srchObjt[index].depositAmt;
					  data.srchObjt[index].depositAmt = comma(uncomma(depositAmt)); 
					  var monthlyAmt = data.srchObjt[index].monthlyAmt;
					  data.srchObjt[index].monthlyAmt = comma(uncomma(monthlyAmt)); 
				 });
				  
				 $("#objtListTemplte").tmpl(data).appendTo("#objtTbody");
			  } else {
				  $("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
			  }
			
		  }
	});
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

function f_interObjt_insert() {	
	var objtArr = new Array();
	$("input[name=chk]:checked").each(function (index) {
		objtArr.push ($(this).val())
	});
	if ( objtArr.length == 0) {
		alert ("물건 선택 후 저장하세요.");
		return;	
	}
	var param = {
			custId : openCustId
	}
	$.each (objtArr, function(index) {
		param.objtNo = objtArr[index];
		$.ajax({
			  url : "/insertInterObject.do" ,
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  
					
			  }
		});
	});
	
	$("#objtTbody").empty();
	$("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
	// 부모창 페이지 새로고침
	opener.location.reload();
	
}

function f_controlTypeBox(){
	if($("#addr").val() != ''){
		$("#addrType").css("visibility","visible"); 
	} else {
		$("#addrType").css("visibility","hidden");
		$("input[name=rdoAddr]:checked").each(function(){
		     $(this).attr("checked",false);
		    });
	}
}
