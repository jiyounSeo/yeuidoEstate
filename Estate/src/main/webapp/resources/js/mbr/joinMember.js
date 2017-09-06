$(document).ready(function(){
 
});

function f_member_save() {
	if(!f_essentialCheck()) return;
	
	var param = $('#joinMember').serialize();
	
	console.log(JSON.stringify(param));
	$.ajax({
	  url : '/estate/joinMember.go',
	  type: 'post',
	  data : param,
	  dataType : 'json',
	  contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	  success : function(data){
		  if(data.message == 'success'){
			  alert('회원가입에 성공하였습니다.\n로그인 페이지로 이동합니다.');
			  f_backToLogin();
		  }
		  else{
			  alert('회원가입에 실패하였습니다.');
		  }
	  },
	  error : function(data){
		  alert('회원가입 도중 문제가 발생하였습니다. 관리자에게 문의하세요.');
	  }
	});
	
}
function f_loginIdDupChk(){
	if($('#loginId').val() == '' || $('#loginId').val() == null)
		return ;
	
	var param = $('#joinMember').serialize();
	$.ajax({
		  url : '/estate/loginIdDupChk.go',
		  type: 'post',
		  data : param,
		  dataType : 'json',
		  contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		  success : function(data){
			  if(data.count != "0"){
				  alert("중복된 아이디입니다. 다시 입력해주세요.");
				  $('#loginId').focus();
				  dupChk = "N";
			  }
			  else{
				  dupChk = "Y";
			  }
		  }
		});
}

function f_backToLogin() {
	var frm = $('#formId')[0];
    frm.action = '/estate/loginView.go';
    frm.method = 'get';
    frm.submit();
}

/*
 * 작성일 : 2017-09-03
 * 작성자 : 서지연
 * 설명	: input에 onkeydown="return f_inputEngAndNum(event);" 추가
 * */
function f_inputEngAndNum(event){
	if ((event.keyCode>=48 && event.keyCode<=57 ) || (event.keyCode>=96 && event.keyCode<=105)
			||(event.keyCode>=65 && event.keyCode<=90 )
			||event.keyCode==9||event.keyCode==8||event.keyCode==46||event.keyCode==36||event.keyCode==35
			||event.keyCode==37||event.keyCode==39)
		return true;
	else
		return false;
}

/*
 * 작성일 : 2017-09-03
 * 작성자 : 서지연
 * 설명	: f_inputEngAndNum 과 동일
 * */
function f_inputOnlyNum(event){
	if ((event.keyCode>=48 && event.keyCode<=57 ) || (event.keyCode>=96 && event.keyCode<=105)
			||event.keyCode==9||event.keyCode==8||event.keyCode==46||event.keyCode==36||event.keyCode==35
			||event.keyCode==37||event.keyCode==39)
		return true;
	else
		return false;
}
/*
 * 작성일 : 2017-09-03
 * 작성자 : 서지연
 * 설명	: 필수값의 class에 essential 추가, 저장 전 함수실행
 * */
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