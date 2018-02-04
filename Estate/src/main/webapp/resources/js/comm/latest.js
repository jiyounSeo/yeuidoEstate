$(document).ready(function(){
	latest_bbs("notice", "#notice_latest", "5");
	latest_bbs("taskdoc", "#taskdoc_latest", "5");
	makeTodoList();
});

var cur_year = Number(moment().format('YYYY'));
var cur_month = Number(moment().format('M'));
var cur_day = moment().format('DD');

var today = cur_month + "/" + cur_day;
var today_full = cur_year+"-"+cur_month+"-"+cur_day;


function latest_bbs(bbs_name, target, listSize){
	var url;
	
	switch(bbs_name){
		case "notice": url = "/selectLatestNoticeList.do"; break;
		case "taskdoc": url = "/selectLatestTaskList.do"; break;
		default: url = ""; break;
	}
	var param = {
		    endNum : listSize
		};
	
	$.ajax({
		url : url,
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
						
			if(bbs_name != "dueDt"){ // 만기일 리스트는 append 함
				htmlText = "";
				$(target).empty();
			}
			htmlText = htmlText + "<ul>";
			
			switch(bbs_name){
				case "notice": htmlText = htmlText + makeNoticeLatestList(result.list); break;
				case "taskdoc": htmlText = htmlText + makeSuggLatestList(result.list); break;
				case "direction": htmlText = htmlText + makeDirLatestList(result.dirList); break;
				case "dueDt" : htmlText = htmlText + makeDueDtLatestList(result.dueList); break;
				default: break;
			}			
			htmlText = htmlText + '</ul>';
			
			if(bbs_name == "direction"){
				latest_bbs("dueDt", "#direction_latest", "0");
			} else {
				//console.log(htmlText);
				//console.log(target);
				$(target).append(htmlText);				
			}
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			console.log("getLatest fail");
		}
	});
	
}

var new_icon = "<img src = './resources/images/icon_new.gif'>";


function makeTodoList(){

	var url = "/selectNotDoneDirList.do";
	var param = { endNum : 0 };

	$.ajax({
		url : url,
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
						
			var htmlText = "";
			$("#direction_latest").empty();
			htmlText = htmlText + "<ul>";
			htmlText = htmlText + makeDirLatestList(result.dirList);	

			var listSize = result.dirList.length;
			
			makeWorkListWithEndDt(htmlText, listSize);	
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			console.log("getLatest fail");
		}
	});

}

function makeWorkListWithEndDt(htmlText, listSize){
	var url = "/selectWorkListWithEndDate.do";
	var param = { endNum : 0 };

	$.ajax({
		url : url,
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
						
			htmlText = htmlText + makeEndDtLatestList(result.workListEndDt);	
			listSize = listSize + result.workListEndDt.length;
			
			//console.log(">> get DB : " + htmlText);

			makeDueList(htmlText, listSize);
		
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			console.log("getLatest fail");
		}
	});
	
	
}

function makeDueList(htmlText, listSize){

	var url = "/selectDueList.do"; 
	var param = { endNum : 0 };

	$.ajax({
		url : url,
		type: "post",
		data : param,
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			
			htmlText = htmlText + makeDueDtLatestList(result.dueList);	
			listSize += result.dueList.length;
			
			htmlText = htmlText + '</ul>';

			if(listSize == 0){
				htmlText = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- 지시사항이 없습니다";
			}
			
			//console.log(htmlText);
			$("#direction_latest").append(htmlText);	
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			console.log("getLatest fail");
		}
	});
	
}

function makeNoticeLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		
		list = list + "<li>";
		if(item.frstRegDt == today){
			list = list + new_icon + "&nbsp;";
		}
		list = list + '<a href="./viewNoticeItem.do?noticeId='+ item.noticeId + '">' + makeSubject(item.ntSbj,17) + '    ('+ item.frstRegDt + ')</a>';
		list = list + '</li>';				
	}
	return list;
}

function makeSuggLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		
		list = list + "<li>";
		if(item.frstRegDt == today){
			list = list + new_icon + "&nbsp;";
		}
		list = list + '<a href="./viewSuggItem.do?taskDocId='+ item.taskDocId + '">' + makeSubject(item.mbrNm + ' 님이 작성한 건의사항입니다',17) + '   ('+ item.frstRegDt +')</a>';
		list = list + '</li>';						
	}	
	return list;
}

function selectColor(intvDay){

	var color = "";
	var tmp = intvDay.split('-');
	
	var sign;
	var interv;
	
	if(tmp.length == 1){
		sign = '+';
		interv = intvDay;
	} else {
		sign = '-';
		interv = intvDay * -1;
	}
	
	if((interv <= 7 && sign == '-') || sign == '+') {
		color = "red";
	} else {
		color = "#009e04";
	}
	
	return color;
}

function makeEndDtLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + "<li>";
		if(item.regDate == today_full){
			list = list + new_icon + "&nbsp;";
		}
		list = list + '<a href="#" onclick="f_modifyWorkAtTodoList('+ item.workNo + ')">';
		
		var pColor = "";
		if(item.intvDay != null && item.intvDay != ''){
			pColor = selectColor(item.intvDay.toString());
			list = list + '[<b>작업종료 <font color="' + pColor + '">D' + item.intvDay + '</font></b>]';
		}
		list = list  + ' ' + makeSubject(item.workTitle, 29) + '   (' + item.frstRegDt + ')</a>';
		list = list + '</li>';				
	}	
	return list;
}


function makeDirLatestList(listArray){

	if($("#memberType").val() == 'MT003' || $("#memberType").val() == 'MT004'){
		return makeDirLatestListForAdmin(listArray);
	}
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + "<li>";
		if(item.regDate == today_full){
			list = list + new_icon + "&nbsp;";
		}
		list = list + '<a href="#" onclick="f_modifyWorkAtTodoList('+ item.workNo + ')">[<b>Todo</b>]';
		
		var pColor = "";
		if(item.intvDay != null && item.intvDay != ''){
			pColor = selectColor(item.intvDay.toString());
			list = list + '[<b><font color="' + pColor + '">D' + item.intvDay + '</font></b>]';
		}
		list = list + ' ' + makeSubject(item.dirContent, 29) + '   (<b>' + item.regUserNm + '</b> / ' + item.regDate +')</a>';
		list = list + '</li>';				
	}	
	return list;
	
}

function makeDirLatestListForAdmin(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + "<li>";
		if(item.regDate == today_full){
			list = list + new_icon + "&nbsp;";
		}
		list = list + '<a href="#" onclick="f_modifyWorkAtTodoList('+ item.workNo + ')"><b>[지시→' + item.targetUserNm + '</b>]';
		
		var pColor = "";
		if(item.intvDay != null && item.intvDay != ''){
			pColor = selectColor(item.intvDay.toString());
			list = list + '[<b><font color="' + pColor + '">D' + item.intvDay + '</font></b>]';
		}		
		list = list + ' ' + makeSubject(item.dirContent, 29) + '   (' + item.regDate +')</a>';
		list = list + '</li>';				
	}	
	
	return list;
	
}

function makeDueDtLatestList(listArray){

	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		
		var intvMonth = Math.floor((item.intvDay)/30);

		if(intvMonth == 0){
			list = list + "<li><a href='#' onclick=\"f_DueDtDtl_view(\'" +item.objtNo +"\',\'" + item.objtTp +"\',\'" + item.saleTP +"\',\'" + item.publicYn +"\',\'" + item.activeTp + "\');\">"
						+'[<font color="red"><b>만기' + item.intvDay + '일전</b></font>] '
		} else {
			list = list + "<li><a href='#' onclick=\"f_DueDtDtl_view(\'" +item.objtNo +"\',\'" + item.objtTp +"\',\'" + item.saleTP +"\',\'" + item.publicYn +"\',\'" + item.activeTp + "\');\">"
						+'[<font color="Green"><b>만기' + intvMonth + '개월전</b></font>] '
		}
		list = list + item.objtNm + '(' + item.objtTpNm + '/' + item.saleTpNm + ')</a>';
		
		list = list + '</li>';				
	}	
	
	return list;	
	
}

function makeSubject(sbj, size){
	var newSbj = "";
	
	if (sbj.length > size){
		newSbj =  sbj.substring(0, size);
		newSbj += '...';       
	} else {
		newSbj = sbj;
	}
	
    return newSbj;
}


function f_DueDtDtl_view (objtNo, objtTp, saleTp, publicYn, activeTp) {
	
	$(".frm_item #objtNo").val(objtNo);
	$(".frm_item #objtTp").val(objtTp);
	$(".frm_item #saleTp").val(saleTp);
	$(".frm_item #publicYn").val(publicYn);
	$(".frm_item #activeTp").val(activeTp);
	
	var url = "";
	switch (objtTp) {
		case "OT001"	:
			url = "viewObApt";
			break;
		case "OT002"	:
			url = "viewObStore";
			break;
		case "OT003"	:
			url = "viewObOffice";
			break;
		case "OT004"	:
			url = "viewObOps";
			break;
		case "OT005"	:
			url = "viewObHrapt";
			break;
		case "OT006"	:
			url = "viewObTicket";
			break;
		
	}
	$(".frm_item #viewUrl").val(url);
	
	var frm = $('#frm_item')[0];
	frm.action = '/objtDtlView.do';
	frm.method = 'POST';
	frm.submit();
}

