$(document).ready(function(){
});

function f_member_save() {
	var param = $("#joinMember").serialize();
	console.log(JSON.stringify(param));
	
	$.ajax({
	  url : "/estate/joinMember.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(responseData){
		  alert ("회원가입에 성공하였습니다.");
// 			 $(sampleTmpl).tmpl(tmplVal).appendTo("#tmplView");
// 			$("#listTemplte").tmpl(data).appendTo("#target");
	  }
	});
	
}

function f_member_list() {
   var comSubmit = new ComSubmit("joinMember");
   comSubmit.setUrl("/estate/memberListView.do");
   comSubmit.submit();
}