$(document).ready(function(){
	latest_bbs("notice", "#notice_latest", "5");
	latest_bbs("taskdoc", "#taskdoc_latest", "5");
});

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
			var htmlText = "";			
			$(target).empty();
			htmlText = "<ul>";
			
			switch(bbs_name){
				case "notice": htmlText = htmlText + makeNoticeLatestList(result.list); break;
				case "taskdoc": htmlText = htmlText + makeSuggLatestList(result.list); break;
				default: break;
			}			
			htmlText = htmlText + '</ul>';
			$(target).append(htmlText);
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
		list = list + '<li><a href="./viewNoticeItem.do?noticeId='+ item.noticeId + '">' + makeSubject(item.ntSbj,17) + '    ('+ item.frstRegDt + ')</a></li>';				
	}
	return list;
}

function makeSuggLatestList(listArray){
	
	var list = "";
	for(var i=0; i<listArray.length; i++){
		var item = listArray[i];
		list = list + '<li><a href="./viewSuggItem.do?taskDocId='+ item.taskDocId + '">' + makeSubject(item.mbrNm + ' 님이 작성한 건의사항입니다',17) + '   ('+ item.frstRegDt +')</a></li>';				
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