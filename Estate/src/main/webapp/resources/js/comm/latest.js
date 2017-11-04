$(document).ready(function(){
	latest_bbs("notice", "#notice_latest", "5");
	latest_bbs("taskdoc", "#taskdoc_latest", "5");
	latest_bbs("direction", "#direction_latest", "0");
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
		case "direction": url = "/selectNotDoneDirList.do"; break;
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
			var htmlText = "";			
			$(target).empty();
			htmlText = "<ul>";
			
			switch(bbs_name){
				case "notice": htmlText = htmlText + makeNoticeLatestList(result.list); break;
				case "taskdoc": htmlText = htmlText + makeSuggLatestList(result.list); break;
				case "direction": htmlText = htmlText + makeDirLatestList(result.dirList); break;
				default: break;
			}			
			htmlText = htmlText + '</ul>';
			console.log(htmlText);
			console.log(target);
			$(target).append(htmlText);
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			console.log("getLatest fail");
		}
	});
	
}

var new_icon = "<img src = './resources/images/icon_new.gif'>";

function makeNoticeLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + '<li><a href="./viewNoticeItem.do?noticeId='+ item.noticeId + '">' + makeSubject(item.ntSbj,17) + '    ('+ item.frstRegDt + ')</a>';
		if(item.frstRegDt == today){
			list = list + "&nbsp;" + new_icon;
		}
		
		list = list + '</li>';				
	}
	return list;
}

function makeSuggLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + '<li><a href="./viewSuggItem.do?taskDocId='+ item.taskDocId + '">' + makeSubject(item.mbrNm + ' 님이 작성한 건의사항입니다',17) + '   ('+ item.frstRegDt +')</a>';
		if(item.frstRegDt == today){
			list = list + "&nbsp;" + new_icon;
		}
		
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
		list = list + '<li><a href="#" onclick="f_modifyWorkAtTodoList('+ item.workNo + ')">' + makeSubject(item.dirContent, 29) + '   (<b>' + item.regUserNm + '</b> / ' + item.regDate +')</a>';
		if(item.regDate == today_full){
			list = list + "&nbsp;" + new_icon;
		}
		
		list = list + '</li>';				
	}	
	return list;
	
}

function makeDirLatestListForAdmin(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + '<li><a href="#" onclick="f_modifyWorkAtTodoList('+ item.workNo + ')">[<b>' + item.targetUserNm + '</b>] ' + makeSubject(item.dirContent, 29) + '   (' + item.regDate +')</a>';
		if(item.regDate == today_full){
			list = list + "&nbsp;" + new_icon;
		}
		
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