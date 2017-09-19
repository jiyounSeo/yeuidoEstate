<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./resources/js/memo/listMemo.js"></script>

<!-- 신규Memo -->
<div id="divAddMemoPopup" style="display: none;">
<form id="newMemo">
	<table class="addMemoPopup" >
		<tr><td height="34px" colspan="4"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td width="30px"></td>
			<td class="title" width="140px">제목</td>
			<td align="center" width="700px"><input type="text" name="memoSbj" id="memoSbj" style="width:99%" /></td>
			<td width="30px"></td>
		</tr>
		<tr>
			<td class="content" colspan="4">
				<textarea name="memoCont" id="memoCont" style="width:99%;height:400px;background-color:white;"></textarea>
			</td>
		</tr>
		<tr><td colspan="4" height="15px"></td></tr>
		<tr>
			<td class="btn" colspan="4">
				<a href="#" onClick="f_cancel_to_list()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_memo_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" colspan="4"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
<input type="hidden" name="memoDocId" id="memoDocId">
</form>
</div>
<!-- 신규Memo -->

<!-- memo 리스트 -->
<div id="divListMemoPopup" style="display: none;">
	<table class="listMemoPopup">
		<tr><td height="34px" colspan="3"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content"><img src="./resources/images/alert_memo_title.jpg"></td>
		</tr>
		<tr>
			<td class="content">
			<table class="memoList">
				<tbody id="memoTbody"></tbody>
			</table>
			</td>
		</tr>
		<tr><td class="content" height="10px;"></td></tr>
		<tr><td align="center"><div id="pagingDiv" class="pagination"></div></td></tr>
		<tr>
			<td class="btn">
				<a href="#" onClick="f_addMeno()"><img src="./resources/images/btn_add.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" colspan="3"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>

<script id="memoListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="2">메모가 존재하지 않습니다.</td>
	</tr>
</script>
<!-- memo 리스트 -->


<!-- memo 상세페이지 -->
<div id="divViewMemoPopup" style="display: none;">
	<table class="viewMemoPopup">
		<tr><td height="34px" colspan="4"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td width="30px"></td>
			<td class="title" width="140px">제목</td>
			<td width="700px"><div id="memoSubject" class="Subject"></div></td>
			<td width="30px"></td>
		</tr>
		<tr>
			<td class="content" colspan="4"><div id="memoContent" class="memoCont"></div></td>
		</tr>
		<tr>
			<td colspan="4"><div id="frstRegDt" class="dtlDate"></div></td>
		</tr>
		<tr>
			<td class="btn" colspan="4">
				<a href="#" onClick="f_del_memo()"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="f_edit_memo_view()"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="f_cancel_to_list()"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td colspan="4" height="15px"></td></tr>
		<tr><td height="23px;" colspan="4"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>
<!-- memo 상세페이지 -->

<script id="memoListTemplte" type="text/x-jquery-tmpl">	
{{each memoList}}					
	<tr>
		<td class="subject"><a href="#" onClick="f_memoView_select('{{html $value.memoDocId}}')">{{html $value.memoSbj}}</a></td>
		<td class="date">{{html $value.frstRegDt}}</td>
	</tr>
							
{{/each}}
	
</script>