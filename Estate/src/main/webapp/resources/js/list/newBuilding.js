function resizeWindow(win)    {

	var wid = win.document.body.offsetWidth + 30;

	var hei = win.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

	win.resizeTo(wid,hei);

}

function buildingPopup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/popup/newBuilding.jsp","_blank","width=570,height=420, scrollbars=yes, resizable=yes");  
}


function goPopup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
}
//INF/views
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/ 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서  
// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.  
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");  } 

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){    
	$("#roadAddrPart1").val(roadAddrPart1);
	$("#jibunAddr").val(jibunAddr);
	$("#zipNo").val(zipNo);
	$("#addrDetail").val(addrDetail);
}

function f_building_save() {
	var param = $("#buildingPopup").serialize();
	if (  $("input[name=objtTp]:checked").val() == undefined ) {
		alert ("건물 유형은 필수입력 값입니다.");
		return;
	} else {
		
	}
	
	if ( $("#buildNm").val() == "") {
		alert ("건물명은 필수입력 값입니다.");
		return;
	}
	
	if ( $("#roadAddrPart1").val() == "") {
		alert ("도로명 주소는 필수입력 값입니다.");
		return;
	}
	
	if ( $("#jibunAddr").val() == "") {
		alert ("도로명 주소는 필수입력 값입니다.");
		return;
	}
	
	var param = {
		objtTp : $("input[name=objtTp]:checked").val()
		, buildNm : $("#buildNm").val()
		, roadAddrPart1 : $("#roadAddrPart1").val()
		, jibunAddr : $("#jibunAddr").val()
		, zipNo : $("#zipNo").val()
		, addrDetail : $("#addrDetail").val()
	}
	
	var urlStr = "";
	if ($("#buildCd").val() != "" ) {
		urlStr = "modifyBuilding.do";
	} else {
		urlStr = "insertBuilding.do";
	}
	
	$.ajax({
		  url : "/estate/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
		  }
	});
	
}

function f_building_list() {
	var param = { currentPage : Number(currPage)
			   , pagePerRow : 10
			   , pageSize : 10
	};
	$.ajax({
	url : "/estate/selectBuildingList.do",
	type: "post",
	data : param,
	dataType : "json",
	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	success : function(result){
		  $("#custTbody").empty();
		  if (result.custList.length != 0) {
			  $("#custListTemplte").tmpl(result).appendTo("#custTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");
	
		  } else {
			  $("#pagingDiv").empty();
			  $("#custListEmptyTemplte").tmpl(result).appendTo("#custTbody");
		  }
	}
	});
}
