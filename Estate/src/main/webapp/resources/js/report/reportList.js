$(document).ready(function()
{
	f_reportList_select();
});

function f_reportList_select()
{
	var param = { currentPage : 1
				   , pagePerRow : 10
				   , pageSize : 10
	};
	console.log (param);
	$.ajax({
	  url : "/estate/selectReportList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  var htmlText = "";
		  for (var i = 0; i < result.reportList.length; i++) {
			  var data = result.reportList[i];
			  htmlText = htmlText + '<tr><td><a href="./viewReport?contractId='+ data.contractId + '">' + data.dueDt + '</a></td>' +
			  '<td>' + convertContTpToText(data.contTp) + '</td>' +
			  '<td>' + data.addr + '</td>' +
			  '<td>' + data.contDt + '</td>' +
			  '<td>' + data.midContDt + '</td>' +
			  '<td>' + data.remainDt + '</td>' +
			  '<td>' + data.manager + '</td>' +
			  '<td>' + data.chkContent + '</td></tr>';
		  }
		  $("#reportList").append(htmlText);
	  }
	});
}

function convertContTpToText(contTp)
{
	var conTpArray = contTp.split("'");
	
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
	return conTpArray[0] + conTpArray[1];
}