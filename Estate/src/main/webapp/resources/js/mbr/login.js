$(document).ready(function(){
	
});
function f_essentialCheck(){
	var obj = $('.essential');
	
	for(var i=0;i<obj.length;i++){
		if(obj[i].value == null || obj[i].value == ''){
			alert(obj[i].name+" 은(는) 필수항목입니다.");
			$('#'+obj[i].id).focus();
			return false;
		}
	}
	return true;
}

function f_loginByEnterKey(event){
	
	if(event.keyCode == '13'){
		if(!f_essentialCheck()) return;
		
		f_login();
	}
		
}

function f_login() {
	$.ajax({
	  url : "/loginMember.go",
	  type: "post",
	  data : {loginId:$('#loginId').val(), pw:$('#pw').val()},
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  if(data.message == "success"){
			  	alert("로그인 되었습니다.");
			  	var frm = $('#formId')[0];
			    if ( data.user.mbrTp == "MT001") {
			  		alert("승인되지 않은 사용자입니다. 승인 후 이용가능 합니다.");
			  		frm.action = "/logout.go";
			  	    frm.method = 'post';
			    } else {
			  		frm.action = "/adminMainView.do";
				    frm.method = 'get';
				}
			    frm.submit();
			  	
			    
		  }
		  else
			  alert("등록되지 않은 아이디이거나 비밀번호가 일치하지 않습니다.");
	  },
	  error: function(data){
		  alert("로그인 도중 문제가 발생하였습니다. 관리자에게 문의하세요.");
	  }
	});
}
