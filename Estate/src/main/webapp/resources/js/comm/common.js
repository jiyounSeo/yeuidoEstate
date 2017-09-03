function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}
 
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
     
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+this.formId)[0];
        frm.action = this.url;
        frm.method = "post";
        frm.submit();  
    };
}

//페이징 html추가
function groupPaging(startPage, pageSize, endPage, lastPage){
	var html ="";
	if(startPage>1){
		html+= ("<a href='#' id='page"+Number(startPage-pageSize)+"' class='pagingBtn'>&laquo;</a>"); //
	} else {
		html+= ("<a href='#' id='page' class='pagingBtn'>&laquo;</a>"); //
	}
	for(var i=startPage; i<=endPage; i++){
		html+= "<a href='#' id='page"+i+"' class='pagingBtn'>"+i+"</a>";
	}
	if(endPage != lastPage){
		html+= "<a href='#' id='page"+Number(startPage+pageSize)+"' class='pagingBtn'>&raquo;</a>"; //
	}else {
		html+= ("<a href='#' id='page' class='pagingBtn'>&raquo;</a>"); //
	}
	
	return html;
}




