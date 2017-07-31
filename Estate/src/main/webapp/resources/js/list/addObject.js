$(document).ready(function(){
	f_objectCnt_select();
});

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
