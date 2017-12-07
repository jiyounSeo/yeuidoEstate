 //옵션 없이 지도 객체를 생성하면 서울시청을 중심으로 하는 11레벨의 지도가 생성됩니다.
$( document ).ready(function() {
	
});
//document.domain = "여의도닷컴.com";

function f_map_setting(myaddress) {
	var pointX = 0;
	var pointY = 0;
	naver.maps.Service.geocode({address: myaddress}, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
        }
        var result = response.result;
        console.log (result);
        pointX = result.items[0].point.x;
        pointY = result.items[0].point.y;
        f_map_draw( pointX, pointY);
	});
	
}
function f_map_draw(x, y) {

	//지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
	var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(x, y),
		    zoom: 10
	});
	// marker1
	var myaddr = new naver.maps.Point(x, y);
    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
    var marker = new naver.maps.Marker({
	    position: myaddr,
	    map: map
	});
	
    // marker2
    var myaddr2 = new naver.maps.Point(127.3891702, 36.3425441);
    var marker = new naver.maps.Marker({
	    position: myaddr2,
	    map: map
	});
		
}

function resizeWindow(win)    {

	var wid = win.document.body.offsetWidth + 30;

	var hei = win.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

	win.resizeTo(wid,hei);

}

function estatePopup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/popup/newEstate.jsp","_blank","width=850,height=520, scrollbars='no', resizable='yes'");  
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){    
	$("#estateAddr").val(roadAddrPart1);
	$("#estateAddrDtl").val(addrDetail);
}


function goPopup(){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	window.document.domain = "여의도닷컴.com";
	var pop = window.open("jusoPopup.jsp","pop","width=580,height=580, scrollbars='no', resizable='yes'"); 
}

function f_estate_save() {
	var param = $("#estatePopup").serialize();

	if ( $("#estateNm").val() == "") {
		alert ("부동산명은 필수입력 값입니다.");
		$("#estateNm").focus();
		return;
	}
	if ( $("#tel1").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == "") {
		alert ("부동산 전화번호는 필수입력 값입니다.");
		$("#tel1").focus();
		return;
	}
	
	if ( $("#rprsnNm").val() == "") {
		alert ("대표자명은 필수입력 값입니다.");
		$("#rprsnNm").focus();
		return;
	}
	if ( $("#rprsnTel1").val() == "" || $("rprsnTel2").val() == "" || $("#rprsnTel3").val() == "") {
		alert ("대표자 전화번호는 필수입력 값입니다.");
		$("#rprsnTel1").focus();
		return;
	}
	
	if ( $("#estateAddr").val() == "") {
		alert ("주소는 필수입력 값입니다.");
		$("#estateAddr").focus();
		return;
	}
	
	if ( $("#estateAddrDtl").val() == "") {
		alert ("상세주소는 필수입력 값입니다.");
		$("#estateAddrDtl").focus();
		return;
	}
	
	var param = {
			estateNm : $("#estateNm").val()
		,	tel1 : $("#tel1").val()
		,	tel2 : $("#tel2").val()
		,	tel3 : $("#tel3").val()
		,	rprsnNm : $("#rprsnNm").val()
		,	rprsnTel1 : $("#rprsnTel1").val()
		,	rprsnTel2 : $("#rprsnTel2").val()
		,	rprsnTel3 : $("#rprsnTel3").val()
		, estateAddr : $("#estateAddr").val()
		, estateAddrDtl : $("#estateAddrDtl").val()
	}
	
	var urlStr = "";
	if ($("#estateCd").val() != "" ) {
		param.estateCd = $("#estateCd").val();
		urlStr = "modifyEstate.do";
	} else {
		urlStr = "insertEstate.do";
	}
	
	$.ajax({
		  url : "/" + urlStr,
		  type: "post",
		  data : param,
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  window.opener.location. reload() ; //부모창 refresh
			  window.close() ; // 팝업창 닫기
		  },
		  error: function(data){
			  alert("로그인 도중 문제가 발생하였습니다. 관리자에게 문의하세요.");
		  }
	});
	
}

var currPage = 1;
var caList;

$(document).on('click', '.pagingBtn', function() {
	var div = $(this).closest('div').attr('id');
	var currPageStr = $(this).attr("id").substr(4);
	if ( gfn_isNull(currPageStr) == "") {
		currPage = Number(currPageStr);
		f_estate_list();
	}
});


function f_estate_list() {
	var param = { currentPage : Number(currPage)
			   , pagePerRow : 10
			   , pageSize : 10
	};
	$.ajax({
	url : "/selectEstateList.do",
	type: "post",
	data : param,
	dataType : "json",
	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	success : function(result){
		  $("#caTbody").empty();
		  if (result.caList.length != 0) {
			  caList = result.caList;
			  $("#caListTemplte").tmpl(result).appendTo("#caTbody");
			  $("#pagingDiv").html(groupPaging(result.startPage, result.pageSize, result.endPage, result.lastPage));
			  $("#page" + currPage).addClass("active");
	
		  } else {
			  $("#pagingDiv").empty();
			  $("#caListEmptyTemplte").tmpl(result).appendTo("#caTbody");
		  }
	}
	});
}


function f_estate_del(index, delEstateCd) {
	if (confirm ("["+caList[index].estateNm+"] 삭제처리 하시겠습니까?")) {
		$.ajax({
		  url : "/deleteEstate.do",
		  type: "post",
		  data : {estateCd: delEstateCd},
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  f_estate_list();
		  }
		});
	}
}



function f_estate_modify(index, estateCd){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 
	var pop = window.open("./resources/popup/editEstate.jsp?estateCd="+estateCd,"_blank","width=850,height=520, scrollbars='no', resizable='yes'");  
}

function getHttpParam(name) {
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.href);
    if (results == null) {
        return "";
    } else {
        return results[1];
    }
}



function f_estate_dtl(idx) {
	var param = { estateCd : idx	};
	$.ajax({
		url : "/selectEstateInfo.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			
			  var caInfo = result.caInfo;
			  
			  $("#estateNm").val(caInfo.estateNm);
			  $("#tel1").val(caInfo.tel1);
			  $("#tel2").val(caInfo.tel2);
			  $("#tel3").val(caInfo.tel3);
			  $("#rprsnNm").val(caInfo.rprsnNm);
			  $("#rprsnTel1").val(caInfo.rprsnTel1);
			  $("#rprsnTel2").val(caInfo.rprsnTel2);
			  $("#rprsnTel3").val(caInfo.rprsnTel3);	
			  $("#estateAddr").val(caInfo.estateAddr);
			  $("#estateAddrDtl").val(caInfo.estateAddrDtl);	  
			  $("#estateCd").val(caInfo.estateCd);	  
		}
	});
}


