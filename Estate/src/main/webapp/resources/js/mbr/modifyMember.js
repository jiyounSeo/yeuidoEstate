$(document).ready(function() {
	$(".onlyNum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/gi,"") );} );
	$(".onlyEng").keyup(function(){$(this).val( $(this).val().replace(/[^a-z0-9]/gi,"") );} );
	// 콤보
	f_estate_select();
	
});

function f_estate_select() {
	$.ajax({
		url : '/selectEstate.go',
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
			$("#estateCd").val($("#estate").val());
			
		}
	});
}


function f_member_save() {
	if (!f_essentialCheck())
		return;

	var param = $('#joinMember').serialize();
	param.loginId = $("#loginId").val();
	
	console.log(JSON.stringify(param));
	$.ajax({
		url : '/updateMemberInfo.do',
		type : 'post',
		data : param,
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data) {
			alert (data.message);
			f_backToLogin();
		},
		error : function(data) {
			alert('회원가입 도중 문제가 발생하였습니다. 관리자에게 문의하세요.');
		}
	});

}


function f_backToLogin() {
	var frm = $('#formId')[0];
	frm.action = '/loginView.go';
	frm.method = 'get';
	frm.submit();
}

