
$(document).ready(function(){
	$("#objtTable").hide();
	$("#btnSave").hide();
    custId = opener.document.getElementById("custId").value;
});

function f_objt_search() {
	var param = $("#srchObjtPop").serialize();
	param.objtTp = $("input[name=objtTp]:checked").val();
	param.saleTp = $("input[name=saleTp]:checked").val();
	var param1 = param;
	param1.custId = custId;
	
	$.ajax({
		  url : "/estate/searchObjtList.do",
		  type: "post",
		  data : param1,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  $("#objtTbody").empty();
			  if (data.srchObjt.length != 0) {
				 $("#objtTable").show();
				 $("#btnSave").show();
				 console.log (data);
				 $("#objtListTemplte").tmpl(data).appendTo("#objtTbody");
				 
			  } else {
				  $("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
			  }
			
		  }
	});
}
//

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
			custId : custId
	}
	$.each (objtArr, function(index) {
		param.objtNo = objtArr[index];
		console.log (param);
		$.ajax({
			  url : "/estate/insertInterObject.do" ,
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

