$(document).ready(function(){
	f_objectList_select();
});


function f_objectList_select() {
	var param = {
		objtTp : $("#objtTp").val()
	   , saleTp : $("#saleTp").val() 
	};
	$.ajax({
	  url : "/estate/selectObjectList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  $("#objtTbody").empty();
		  console.log (result);
		  
		  var tmplNm = "";
		  var colCnt;
		  switch ( $("#objtTp").val() ) {
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
			  $.each (result.objtList, function(index) {
				  result.objtList[index].viewUrl = $("#viewUrl").val();
			  })
			  $("#"+tmplNm).tmpl(result).appendTo("#objtTbody");
		  } else {
			  $("#objtListEmptyTemplte").tmpl({col : colCnt}).appendTo("#objtTbody");
		  }
	  }
	});
	
}
