<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./resources/js/memo/listMemo.js"></script>

<form id="newMemo">
<script>
$(document).ready(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "memoCont",
		sSkinURI : "./resources/editor/SmartEditor2Skin.html", 	//SmartEditor2Skin.html 파일이 존재하는 경로
		htParams : {
		bUseToolbar : true, 			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)	
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function() {
		}
	},
	fOnAppLoad : function() {	
		oEditors.getById["memoCont"].exec("PASTE_HTML", [ "" ]);		//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
	});
});
</script>

<div class="new_page_title">
	<img src="./resources/images/title_memo.jpg">
</div>


<div class="new_page_container">
	<table class="new_memo_table">
		<tr>
			<td class="title" width="140px">제목</td>
			<td align="center" width="700px"><input type="text" name="memoSbj" id="memoSbj" style="width:99%" /></td>
		</tr>
		<tr>
			<td class="content" colspan="2">
				<textarea id="memoCont" name="memoCont" style="width:99%;height:500px;"></textarea>
			</td>
		</tr>
	</table>
	<div style="height:30px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">	
		<c:choose>
			<c:when test="${memoDocId == null}">				
				<a href="#" id="popOkAdd" ><img src="./resources/images/btn_add.jpg" onClick="f_memo_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./memoList.do"><img src="./resources/images/btn_cancel.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_memo_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="f_del_memo()"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./viewMemoItem.do?memoDocId=${memoDocId}"><img src="./resources/images/btn_cancel.jpg"></a>			
			</c:otherwise>
		</c:choose>	
			
	</div>	
	<input type="hidden" name="memoDocId" id="memoDocId" value="${memoDocId}" />
</div>
</form>

<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 