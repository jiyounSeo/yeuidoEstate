$(document).ready(function()
{
	$("#type_rb" + $("#contSttSe").val()).attr('checked', 'checked');
	
	init_conTp();
	init_boss();

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
});

function init_boss()
{
	$.ajax({
	  url : "/estate/bossListReport.do",
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

function init_conTp()
{
	var option1 = '<option value="0">선택</option>';
	var option2 = '<option value="0">선택</option><option value="1">전세</option><option value="2">월세</option><option value="3">매매</option>';
	var option3 = '<option value="0">선택</option><option value="3">매매</option><option value="4">임대</option>';
	var option4 = '<option value="0">선택</option><option value="3">매매</option>';
	$("#contTpSelect1").change(function ()
	{
		switch(($("#contTpSelect1 option").index($("#contTpSelect1 option:selected"))))
		{
		case 0:	$("#contTpSelect2").html(option1);	break;
		case 1:
		case 2:
		case 3:	$("#contTpSelect2").html(option2);	break;
		case 4:
		case 5:	$("#contTpSelect2").html(option3);	break;
		case 6:	$("#contTpSelect2").html(option4);	break;
		}
	})
	
	if($("#btn_add").val() == undefined)	//view, edit page
	{
		var conTpArray = $("#contTp").val().split("'");
		$("#contTpSelect1").val(conTpArray[0]).attr("selected", "selected");
		$("#contTpSelect1").change();
		$("#contTpSelect2").val(conTpArray[1]).attr("selected", "selected");
		switch(conTpArray[0])
		{
		case "0": conTpArray[0] = ""; break;
		case "1": conTpArray[0] = "아파트"; break;
		case "2": conTpArray[0] = "오피스텔"; break;
		case "3": conTpArray[0] = "주상복합"; break;
		case "4": conTpArray[0] = "상가"; break;
		case "5": conTpArray[0] = "사무실"; break;
		case "6": conTpArray[0] = "분양권"; break;
		}
		switch(conTpArray[1])
		{
		case "0":
			conTpArray[1] = "";
			break;
		case "1":
			conTpArray[1] = " 전세";
			break;
		case "2":
			conTpArray[1] = " 월세";
			break;
		case "3":
			conTpArray[1] = " 매매";
			break;
		}
		$("#contTpTd").append(conTpArray[0] + conTpArray[1]);
	}
}

function f_report_save()
{
	if($("#writer").val() == "")
	{
		alert ("작성자는 필수입력 값입니다.");
		return;
	}
	
	if($("#dueDt").val() == "")
	{
		alert ("만기일은 필수입력 값입니다.");
		return;
	}
	
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
		alert("양타는 필수입력 값입니다.");
		return;
	}
	
	if($("#addr").val() == "")
	{
		alert("소재지는 필수입력 값입니다.");
		return;
	}
	
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
	
	if($("#contDt").val() == "")
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
	}

	var obj = document.getElementsByName('type_rb');
	for( var i = 0; i < obj.length; i++)
	{
		if(obj[i].checked)
		{
			$("#contSttSe").val(i + 1);
			break;
		}
	}
	var param = $("#report").serialize();
	var urlStr;
	if($("#btn_add").val() == undefined)
		urlStr = "modifyReport.do";
	else
		urlStr = "insertReport.do";
	$.ajax({
	  url : "/estate/"+urlStr,
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  $(location).attr('href', './commRepList.do')
	  }
	});
}

function f_report_delete() {
	var param = $("#report").serialize();
	$.ajax({
	  url : "/estate/deleteReport.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(data){
		  $(location).attr('href', './commRepList.do')
	  }
	});
}
