<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>
<form id="newNotice">
<div class="new_page_title">
	<img src="./resources/images/title_notice.jpg">
</div>
<script>

$(document).ready(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ntConts",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors.getById["ntConts"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
});
</script>

<div class="new_page_container">
	<table class="new_notice_table">
		<tr>
			<td width="155px" class="title">제목</td>
			<td width="1285px"><input type="text" name="ntSbj" id="ntSbj"></td>
		</tr>
		<tr>
			<td colspan="2" class="content_edit" valign="top">
				<!-- <textarea rows="20" cols="150" name="ntConts" id="ntConts"></textarea> -->
				<textarea id="ntConts" name="ntConts" style="width:99%;height:500px;"></textarea>
			</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">	
		<c:choose>
			<c:when test="${noticeId == null}">
				<a href="#"><img src="./resources/images/btn_add.jpg" onclick="f_notice_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./noticeList.do"><img src="./resources/images/btn_cancel.jpg"></a>
			</c:when>
			<c:otherwise>
				<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_notice_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="f_del_notice()"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./viewNoticeItem.do?noticeId=${noticeId}"><img src="./resources/images/btn_cancel.jpg"></a>			
			</c:otherwise>
		</c:choose>		
	</div>
</div>
<input type="hidden" name="noticeId" id="noticeId" value="${noticeId}" />
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 