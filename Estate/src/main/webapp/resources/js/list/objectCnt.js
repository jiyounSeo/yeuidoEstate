$(document).ready(function(){
	f_objectCnt_select();
});

function f_add_objectView (objtTp, saleTp) {
	// form nm : addObject
	// action : commObList.do
	$("#objtTp").val(objtTp);
	$("#saleTp").val(saleTp);
	
	var frm = $('#addObject')[0];
	frm.action = '/estate/commObListPostView.do';
	frm.method = 'POST';
	frm.submit();
}

function f_objectCnt_select() {
	var param = $("#addObject").serialize();
	console.log (param);
	$.ajax({
	  url : "/estate/selectObjectCnt.do",
	  type: "post",
	  data : param,
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


function f_objt_dtl_view() {
	var comSubmit = new ComSubmit($("#addObject").attr('id'));
	comSubmit.setUrl("/estate/commObListPostView.do");
	comSubmit.submit();
}

