// 네이버 지도 id : Z0U9uQFTmyK7bim6HrQ6
// client screet : ayyDd1KXQS

 //옵션 없이 지도 객체를 생성하면 서울시청을 중심으로 하는 11레벨의 지도가 생성됩니다.
$( document ).ready(function() {
	window.document.domain = sbuURL;
});

var sbuURL = "여의도닷컴.com";
//var sbuURL = "localhost";

function f_map_setting(myaddress) {
	var pointX = 0;
	var pointY = 0;
	naver.maps.Service.geocode({address: myaddress}, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
        }
        var result = response.result;
        console.log (result);
        pointX = result.items[0].point.y;
        pointY = result.items[0].point.x;
        f_map_draw( pointX, pointY);
	});
	
}
function f_map_draw(x, y) {

	//지도를 삽입할 HTML 엘리먼트 또는 HTML 엘리먼트의 id를 지정합니다.
	var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(x, y),
		    minZoom: 7,
		    zoom: 10,
		    mapTypeControl: true,
		    scrollWheel: false,
		    mapTypeControlOptions: {
		        style: naver.maps.MapTypeControlStyle.BUTTON,
		        position: naver.maps.Position.TOP_RIGHT
		    },
		    zoomControl: true,
		    zoomControlOptions: {
		        style: naver.maps.ZoomControlStyle.LARGE,
		        position: naver.maps.Position.RIGHT_CENTER
		    },
		    scaleControl: true,
		    scaleControlOptions: {
		        position: naver.maps.Position.BOTTOM_RIGHT
		    },
		    logoControl: true,
		    logoControlOptions: {
		        position: naver.maps.Position.TOP_LEFT
		    },
		    mapDataControl: true,
		    mapDataControlOptions: {
		        position: naver.maps.Position.BOTTOM_LEFT
		    }
	});
	
	$("#positionX").val(x);
	$("#positionY").val(y);
	
	// marker1
	var myaddr = new naver.maps.LatLng(x, y);
    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
    var marker = new naver.maps.Marker({
	    position: myaddr,
	    map: map
	});	
}

function resizeWindow(win){
	var wid = win.document.body.offsetWidth + 30;
	var hei = win.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임
	win.resizeTo(wid,hei);
}

function buildingPopup(){ 
	window.document.domain = sbuURL;
	var pop = window.open("./resources/popup/newBuilding.jsp","_blank","width=850,height=900, scrollbars='yes', resizable='yes'");  
}


function goPopup(){ 
	window.document.domain = sbuURL;
	var pop = window.open("jusoPopup.jsp","pop","width=580,height=580, scrollbars='no', resizable='yes'"); 
}
//INF/views
	//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/ 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서  
// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.  
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");  } 

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){    
	$("#roadAddrPart1").val(roadAddrPart1);
	$("#jibunAddr").val(jibunAddr);
	f_map_setting( jibunAddr );
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
	
	var finish_date = $("#finishedY > option:selected").val() + "." + $("#finishedM > option:selected").val();
	
	var param = {
		objtTp : $("input[name=objtTp]:checked").val()
		, buildNm : $("#buildNm").val()
		, roadAddrPart1 : $("#roadAddrPart1").val()
		, jibunAddr : $("#jibunAddr").val()
		, zipNo : $("#zipNo").val()
		, positionX : $("#positionX").val()
		, positionY : $("#positionY").val()
		, addrDetail : $("#addrDetail").val()
		, buildCd : $("#buildCd").val()
		, totalDongNum : $("#totalDongNum").val()
		, totalHouseholdNum : $("#totalHouseholdNum").val()
		, totalParkingNum : $("#totalParkingNum").val()
		, heatingType : $("#heatingType").val()
		, heatingFuel : $("#heatingFuel").val()
		, builderName : $("#builderName").val()
		, finishedDate : finish_date
		, minArea : $("#minArea").val()
		, maxArea : $("#maxArea").val()
		, highestFloor : $("#highestFloor").val()
	}
	
	var urlStr = "";
	if ($("#buildCd").val() != "" ) {
		urlStr = "modifyBuilding.do";
	} else {
		urlStr = "insertBuilding.do";
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
		f_category_list();
	}
});

function f_category_list() {
	var param = { currentPage : Number(currPage)
			   , pagePerRow : 10
			   , pageSize : 10
	};
	$.ajax({
	url : "/selectBuildingList.do",
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


function f_category_del(index, delBuildCd) {
	if (confirm ("["+caList[index].buildNm+"] 삭제처리 하시겠습니까?")) {
		$.ajax({
		  url : "/deletebuilding.do",
		  type: "post",
		  data : {buildCd: delBuildCd},
		  dataType : "json",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		  success : function(data){
			  alert (data.message);
			  f_category_list();
		  }
		});
	}
}



function f_category_modify(index, buildCd){ 
	//경로는 시스템에 맞게 수정하여 사용 //호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를  
	//호출하게 됩니다. 	

	window.document.domain = sbuURL;
	var pop = window.open("./resources/popup/editBuilding.jsp?buildCd="+buildCd,"_blank","width=850,height=900, scrollbars='yes', resizable='yes'");  
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



function f_category_dtl(idx) {
	var param = { buildCd : idx	};
	$.ajax({
		url : "/selectBuildingDtl.do",
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			
			  var caInfo = result.caInfo;
			  
			  //년도 selectbox만들기               
			  for(var sy = 1790 ; sy <= 2120 ; sy++) {
				  $('#finishedY').append('<option value="' + sy + '">' + sy + '년</option>');    
			  }
			  // 월별 selectbox 만들기            
			  for(var i=1; i <= 12; i++) {
				  var sm = i > 9 ? i : "0"+i ;            
				  $('#finishedM').append('<option value="' + sm + '">' + sm + '월</option>');    
			  } 
			  
			  var finish_date = caInfo.finishedDate;
			  var f_data_arr;
			  
			  if(finish_date != '' && finish_date != null){
				  f_data_arr = finish_date.split('.');
				  
				  if(f_data_arr.length > 1){
					  $("#finishedY").val(f_data_arr[0]);
					  $("#finishedM").val(f_data_arr[1]);
					  				  
					  jQuery("#finishedY  > option[value="+f_data_arr[0]+"]").attr("selected", "true");    
					  jQuery("#finishedM  > option[value="+f_data_arr[1]+"]").attr("selected", "true");   					  
				  }
			  }
			  
			  $("input:radio[name='objtTp']:radio[value='"+caInfo.objtTp+"']").prop("checked", true); 
			  $("#buildNm").val(caInfo.buildNm);
			  $("#totalDongNum").val(caInfo.totalDongNum);
			  $("#totalHouseholdNum").val(caInfo.totalHouseholdNum);
			  $("#totalParkingNum").val(caInfo.totalParkingNum);
			  $("#heatingType").val(caInfo.heatingType);
			  $("#heatingFuel").val(caInfo.heatingFuel);
			  $("#builderName").val(caInfo.builderName);
			  $("#roadAddrPart1").val(caInfo.roadAddrPart1);
			  $("#zipNo").val(caInfo.zipNo);
			  $("#jibunAddr").val(caInfo.jibunAddr);
			  if(caInfo.jibunAddr != '' & caInfo.jibunAddr != null){
				  f_map_setting( caInfo.jibunAddr );
			  }
			  $("#addrDetail").val(caInfo.addrDetail);
			  $("#positionX").val(caInfo.positionX);
			  $("#positionY").val(caInfo.positionY);
			  $("#buildCd").val(caInfo.buildCd);		
			  $("#finishedDate").val(caInfo.finishedDate);  
			  $("#minArea").val(caInfo.minArea);
			  $("#maxArea").val(caInfo.maxArea);
			  $("#highestFloor").val(caInfo.highestFloor);
		}
	});
}

function getYearSelect() {
	var now = new Date();

	for(i=1998; i < 2020; i++) {
		if(now.getYear() != i) {
			document.write('<option value="'+i+'">'+i+" 년");
		} else {
			document.write('<option value="'+i+'" selected>'+i+" 년");
		}
	}
}

// 월별 selectbox 만들기
function getMonSelect() {
	var now = new Date();  for(var i=0; i<12; i++) {
		if(now.getMonth() != i) {
			document.write('<option value="'+i+'">'+i+" 월");
		} else {
			document.write('<option value="'+i+'" selected>'+i+" 월");
		}
	}
} 