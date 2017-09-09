$(document).ready(function() {
	$(".onlyNum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/gi,"") );} );
	$(".onlyEng").keyup(function(){$(this).val( $(this).val().replace(/[^a-z0-9]/gi,"") );} );
	// 콤보
	f_estate_select() ;
});

function f_member_save() {
	if (!f_essentialCheck())
		return;

	var param = $('#joinMember').serialize();

	console.log(JSON.stringify(param));
	$.ajax({
		url : '/estate/joinMember.go',
		type : 'post',
		data : param,
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			if (data.message == 'success') {
				alert('회원가입에 성공하였습니다.\n로그인 페이지로 이동합니다.');
				f_backToLogin();
			} else {
				alert('회원가입에 실패하였습니다.');
			}
		},
		error : function(data) {
			alert('회원가입 도중 문제가 발생하였습니다. 관리자에게 문의하세요.');
		}
	});

}


function f_estate_select() {

	$.ajax({
		url : '/estate/selectEstate.go',
		type : 'post',
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			console.log (data);
			if (!gfn_isNull (data.estateList)) {
				$.each(data.estateList , function(index) {
					$("#estateCd").append("<option value='"+data.estateList[index].estateCd+"'>"+data.estateList[index].estateNm+"</option>");
				});
			}
		}
	});
}
function f_loginIdDupChk() {
	if ($('#loginId').val() == '' || $('#loginId').val() == null)
		return;

	var param = $('#joinMember').serialize();
	$.ajax({
		url : '/estate/loginIdDupChk.go',
		type : 'post',
		data : param,
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			if (data.count != "0") {
				alert("중복된 아이디입니다. 다시 입력해주세요.");
				$('#loginId').focus();
				dupChk = "N";
			} else {
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

