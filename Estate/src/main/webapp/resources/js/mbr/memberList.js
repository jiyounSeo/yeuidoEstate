$(document).ready(function(){
	f_member_list();
});

function f_member_list() {
	$("#mbrTbody").empty();
	$.ajax({
	  url : "/estate/memberList.do",
	  type: "post",
	  data : {param:1},
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  console.log(JSON.stringify(data));
		$("#mbrListTemplte").tmpl(data).appendTo("#mbrTbody");
	  }
	});
}

function f_member_insert() {
   var comSubmit = new ComSubmit("memberList");
     comSubmit.setUrl("/estate/joinMemberView.do");
     comSubmit.submit();
}

 /*	function f_member_list() {
 	   var comSubmit = new ComSubmit("joinMember");
       comSubmit.setUrl("/estate/memberListView.do");
       comSubmit.submit();
       c]
 	}*/