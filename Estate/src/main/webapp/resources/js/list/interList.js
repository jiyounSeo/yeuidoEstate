$(document).ready(function(){
	f_interList_select();
});

function f_interList_select() {
	var param = {};
	param.custId = $("#custId").val();
	
	$.ajax({
		url : "/estate/selectInterObject.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			$("#objtTbody").empty();
			if (result.interList.length != 0) {
				interList = result.interList;
				$("#objtListTemplte").tmpl(result).appendTo("#objtTbody");
				$.each (interList, function(index) {
					if (interList[index].deleteBtnYn == "N") {
						$("#objtTbody tr:eq("+index+") #btnDel").hide();
					}
				});
			} else {
				$("#objtListEmptyTemplte").tmpl().appendTo("#objtTbody");
			}
		}
	});
	
}

function f_delete_inter(index)
{
	var isDel = confirm("관심물건을 삭제하시겠습니까?");
	var param = {interNo : interList[index].interNo};	
	if(isDel){
		$.ajax({
			  url : "/estate/deleteInterObject.do",
			  type: "post",
			  data : param,
			  dataType : "json",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			  success : function(data){
				  alert (data.message);
				  f_interList_select();
			  }
		});
	}
}
