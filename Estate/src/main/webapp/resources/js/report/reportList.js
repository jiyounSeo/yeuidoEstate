$(document).ready(function()
{
	f_reportList_select();

});

//페이징 버튼 클릭이벤트
currPage = 1;
$(document).on('click', '.pagingBtn', function() {
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_noticeList_select();
	}
	
});
	
function f_reportList_select()
{
	var param = { currentPage : Number(currPage)
			   , pagePerRow : 10
			   , pageSize : 10
	};
	console.log (param);
	$.ajax({
	  url : "/selectReportList.do",
	  type: "post",
	  data : param,
	  dataType : "json",
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  success : function(result){
		  var htmlText = "";
		  if(result.reportList.length == 0){
			  htmlText = htmlText + '<tr><td colspan=8>게시글이 존재하지 않습니다.</td></tr>';
		  } else {
			  for (var i = 0; i < result.reportList.length; i++) {
				  var data = result.reportList[i];
				  htmlText = htmlText + '<tr onClick="location.href=\'./viewReport.do?contractId='+ data.contractId + '\'" style="cursor:pointer;">' +
				  '<td>' + data.dueDt + '</td>' +
				  '<td>' + convertContTpToText(data.contTp1, data.contTp2) + '</td>' +
				  '<td>' + data.addr + '</td>' +
				  '<td>' + data.contDt + '</td>' +
				  '<td>' + data.midContDt + '</td>' +
				  '<td>' + data.remainDt + '</td>' +
				  '<td>' + data.managerNm + '</td>';
				  
				  if(data.contSttSe == "1"){
					  htmlText += '<td>진행</td>';
				  } else if(data.contSttSe == "2") {
					  htmlText += '<td>완료</td>';
				  } else if(data.contSttSe == "3") {
					  htmlText += '<td>해지</td>';
				  } else {
					  htmlText += '<td>-</td>';					  
				  }
			  }
			  htmlText = htmlText + '</tr>';
		  }
		  $("#reportList").append(htmlText);
		  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
		  $("#page" + currPage).addClass("active");
	  }
	});
}

function convertContTpToText(contTp1, contTp2)
{
	switch(contTp1)
	{
		case "OT001": contTp1 = "아파트"; break;
		case "OT002": contTp1 = "상가"; break;
		case "OT003": contTp1 = "사무실/빌딩"; break;
		case "OT004": contTp1 = "오피스텔"; break;
		case "OT005": contTp1 = "주상복합"; break;
		case "OT006": contTp1 = "분양권"; break;
		default: contTp1 = ""; break;
	}
	switch(contTp2)
	{
		case "ST001": contTp2 = "매매"; break;
		case "ST002": contTp2 = "전세"; break;
		case "ST003": contTp2 = "월세"; break;
		case "ST004": contTp2 = "렌트"; break;
		case "ST005": contTp2 = "임대"; break;;
		case "ST006": contTp2 = "분양권"; break;
		case "ST007": contTp2 = "전매"; break;
		default: contTp2 = ""; break;
	}

	return contTp1 + " / " + contTp2;
}