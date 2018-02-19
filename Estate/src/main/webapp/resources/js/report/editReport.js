$(document).ready(function()
{
	var obj = document.getElementsByName('contSe_rb');
	$("#type_rb" + $("#contSttSe").val()).attr('checked', 'checked');
	$("#contSe_rb" + $("#contSe").val()).attr('checked', 'checked');
	
	init_conTp();
	init_boss();
	init_manager();
	
	$( ".datepicker" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	 });
	
	if($("#contSe").val() == "2"){
		$("#contSeText").attr("disabled",false);
	} else {
		$("#contSeText").attr("disabled", true); 
	}

});

function init_boss()
{
	$.ajax({
	  url : "/bossListReport.do",
	  type: "post",
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  var htmlText = "";
		  for (var i = 0; i < result.reportList.length; i++)
		  {
			  var data = result.reportList[i];
			  htmlText = htmlText + '<option value="' + data.mbrId + '">' + data.mbrNm + '</option>';
			  if(data.mbrId == $("#boss").val())
				  $("#bossTd").append(data.mbrNm);
		  }
		  $("#bossSelect").append(htmlText);
		  
		  $("#bossSelect").val($("#boss").val()).attr("selected", "selected");
	  }
	});
}

function init_manager()
{
	$.ajax({
	  url : "/managerListReport.do",
	  type: "post",
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  var htmlText = "";
		  for (var i = 0; i < result.managerList.length; i++)
		  {
			  var data = result.managerList[i];
			  htmlText = htmlText + '<option value="' + data.mbrId + '">' + data.mbrNm + '</option>';
			  if(data.mbrId == $("#manager").val()){
				  $("#managerTd").append(data.mbrNm);
			  }
		  }
		  $("#managerSelect").append(htmlText);
		  
		  $("#managerSelect").val($("#manager").val()).attr("selected", "selected");
	  }
	});
}

function init_conTp()
{
	var option1 = '<option value="0">선택</option>';
	var option2 = '<option value="0">선택</option><option value="ST001">매매</option><option value="ST002">전세</option><option value="ST003">월세</option><option value="ST004">렌트</option>';
	var option3 = '<option value="0">선택</option><option value="ST001">매매</option><option value="ST005">임대</option>';
	var option4 = '<option value="0">선택</option><option value="ST006">분양권</option><option value="ST007">전매</option>';
	
	$("#contTpSelect1").change(function ()
	{
		var selected = "OT00" + $("#contTpSelect1 option").index($("#contTpSelect1 option:selected"));
		switch(selected)
		{
		case "OT001":
		case "OT004":
		case "OT005":$("#contTpSelect2").html(option2);	break;
		case "OT002":
		case "OT003":$("#contTpSelect2").html(option3);	break;
		case "OT006":$("#contTpSelect2").html(option4);	break;
		default: $("#contTpSelect2").html(option1);	break;
		}
	});
	
	if($("#btn_add").val() == undefined)	//view, edit page
	{
		var conTp1 = $("#contTp1").val();
		var conTp2 = $("#contTp2").val();
		$("#contTpSelect1").val(conTp1).attr("selected", "selected");
		$("#contTpSelect1").change();
		$("#contTpSelect2").val(conTp2).attr("selected", "selected");
		switch(conTp1)
		{
		case "OT001": conTp1 = "아파트"; break;
		case "OT002": conTp1 = "상가"; break;
		case "OT003": conTp1 = "사무실/빌딩"; break;
		case "OT004": conTp1 = "오피스텔"; break;
		case "OT005": conTp1 = "주상복합"; break;
		case "OT006": conTp1 = "분양권"; break;
		default: conTp1=""; break;
		}
		switch(conTp2)
		{
		case "ST001": conTp2 = "매매"; break;
		case "ST002": conTp2 = "전세"; break;
		case "ST003": conTp2 = "월세"; break;
		case "ST004": conTp2 = "렌트"; break;
		case "ST005": conTp2 = "임대"; break;
		case "ST006": conTp2 = "분양권"; break;
		case "ST007": conTp2 = "전매"; break;
		default: conTp2 = ""; break;
		}
		$("#contTpTd").append(conTp1 + " / " + conTp2);
	}
}


function f_report_save()
{
	var reportType = document.getElementsByName('contSe_rb');
	
	for( var i = 0; i < reportType.length; i++)
	{
		if(reportType[i].checked)
		{
			$("#contSe").val(i + 1);
			break;
		}
	}
	
	if($("#writer").val() == "")
	{
		alert ("작성자는 필수입력 값입니다.");
		return;
	}
	
	/*if($("#dueDt").val() == "")
	{
		alert ("만기일은 필수입력 값입니다.");
		return;
	}*/
	
	if(($("#contTpSelect1 option:selected").val() == 0) || ($("#contTpSelect1 option:selected").text() == ""))
	{
		alert ("계약종류 구분1은 필수입력 값입니다.");
		return;
	}
	
	if(($("#contTpSelect2 option:selected").val() == 0) || ($("#contTpSelect2 option:selected").text() == ""))
	{
		alert ("계약종류 구분2는 필수입력 값입니다.");
		return;
	}
	
	if($("#contSe").val() == "")
	{
		alert("계약형태는 필수입력 값입니다.");
		return;
	}
	
	/*if($("#addr").val() == "")
	{
		alert("소재지는 필수입력 값입니다.");
		return;
	}
	*/
	if($("#assignee").val() == "")
	{
		alert("양수인은 필수입력 값입니다.");
		return;
	}
	
	if($("#grantor").val() == "")
	{
		alert("양도인은 필수입력 값입니다.");
		return;
	}
	
	/*if($("#contDt").val() == "")
	{
		alert("계약일은 필수입력 값입니다.");
		return;
	}
	
	if($("#contAmt").val() == "")
	{
		alert("계약금은 필수입력 값입니다.");
		return;
	}
	
	if($("#midContDt").val() == "")
	{
		alert("중도일은 필수입력 값입니다.");
		return;
	}
	
	if($("#midContAmt").val() == "")
	{
		alert("중도금은 필수입력 값입니다.");
		return;
	}
	
	if($("#remainDt").val() == "")
	{
		alert("잔금일은 필수입력 값입니다.");
		return;
	}
	
	if($("#remainAmt").val() == "")
	{
		alert("잔금은 필수입력 값입니다.");
		return;
	}
	
	if($("#chkContent").val() == "")
	{
		alert("특약 및 체크사항은 필수입력 값입니다.");
		return;
	}
	
	if($("#releaRsn").val() == "")
	{
		alert("계약해제사유는 필수입력 값입니다.");
		return;
	}
	
	if($("#preFees").val() == "")
	{
		alert("예상수수료는 필수입력 값입니다.");
		return;
	}
	
	if($("#realFees").val() == "")
	{
		alert("실제수수료는 필수입력 값입니다.");
		return;
	}
	
	if($("#chngRsn").val() == "")
	{
		alert("수수료변동사유는 필수입력 값입니다.");
		return;
	}*/

	var obj = document.getElementsByName('type_rb');

	var cur_year = Number(moment().format('YYYY'));
	var cur_month = Number(moment().format('M'));
	var cur_day = moment().format('DD');
	var today_full = cur_year+"-"+cur_month+"-"+cur_day;
	
	for( var i = 0; i < obj.length; i++)
	{
		if(obj[i].checked)
		{
			if($("#contSttSe").val() != i+1){
				$("#stateChngDt").val(today_full);
			}
			$("#contSttSe").val(i + 1);
			break;
		}
	}
	
	$("#contAmt").val( f_removeComma($("#contAmt").val()));
	$("#midContAmt").val( f_removeComma($("#midContAmt").val()));
	$("#remainAmt").val( f_removeComma($("#remainAmt").val()));
	$("#preFees").val( f_removeComma($("#preFees").val()));
	$("#realFees").val( f_removeComma($("#realFees").val()));
	
	var urlStr;
	if($("#btn_add").val() == undefined){
		urlStr = "modifyReport.do";
	} else {
		urlStr = "insertReport.do";
		$("#stateChngDt").val(today_full);
		//alert("state changed!! > " + $("#stateChngDt").val());
	}

	var param = $("#report").serialize();
	
	$.ajax({
	  url : "/"+urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  if ( urlStr == "insertReport.do" ) {
			  alert ("등록에 성공하였습니다");
			  $(location).attr('href', './commRepList.do');
		  }else{
			  alert ("수정에 성공하였습니다");
			  $(location).attr('href', './viewReport.do?contractId='+$("#contractId").val());
		  }
	  }
	});
}


function inputNumberFormat(obj) { 
    obj.value = comma(uncomma(obj.value)); 
} 

function comma(str) { 
    str = String(str); 
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
} 

function uncomma(str) { 
    str = String(str); 
    return str.replace(/[^\d]+/g, ''); 
}

function f_removeComma(str){
	return str.replace(/,/g,"");
}

function f_report_delete() {
	var param = $("#report").serialize();
	$.ajax({
	  url : "/deleteReport.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  alert("계약보고서를 삭제하였습니다");
		  $(location).attr('href', './commRepList.do')
	  }
	});
}



function f_disableFieldByRadioBtn(value){
	console.log(value);
	if(value == "2"){
		$("#contSeText").attr("disabled",false);
	} else {
		$("#contSeText").val("");
		$("#contSeText").attr("disabled", true); 
	}
}
