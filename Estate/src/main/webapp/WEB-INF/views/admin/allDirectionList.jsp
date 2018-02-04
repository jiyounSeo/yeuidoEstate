<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/direction/crudDirection.js"></script>

<%@ include file="/WEB-INF/views/admin/dirListStyle.jsp" %> 
<%@ include file="/WEB-INF/views/admin/calStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<div class="new_page_title">
	<img src="./resources/images/title_todo.jpg">
</div>

<div class="new_page_container">
	<table class="direction">
		<tr class="title">
		<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 -->			
			<td width="8%">지시자</td>
			<td width="12%">지시날짜</td>
			<td width="55%">지시사항</td>
			<td width="10%">종료일</td>
			<td width="5%">완료여부</td>
			<td width="10%">완료날짜</td>
		</c:if>
		<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 -->
			<td width="8%">지시자</td>
			<td width="8%">수행자</td>
			<td width="49%">지시사항</td>
			<td width="10%">지시날짜</td>
			<td width="10%">종료일</td>
			<td width="5%">완료여부</td>
			<td width="10%">완료날짜</td>
		</c:if>
		</tr>
		<tbody id="dirTbody">

		</tbody>
	</table>
	<br>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>

<input type="hidden" name="memberType" id="memberType" value="${sessionScope.user.mbrTp}" />

<div id="divAddWorkPopup" style="display: none;">
	<form id="workForm">
		<table class="addMemoPopup" >
			<tr><td height="34px"><a href="#" onClick="f_closePopup()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
			<tr>
				<td align="center" valign="top">
					<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 : 지시받은 리스트 출력 -->
					<fieldset style="width:90%;">
						<legend align="left" style="margin-bottom:10px;"><b>[ 작업내역 ]</b></legend>
						<table class="workItem">
							<tr>
								<td class="workTitle">제목</td>
								<td class="workContent"><input type="text" id="workTitle" name="workTitle" maxlength="150" style="width:100%;"></td>
							</tr>
							<tr>
								<td class="workTitle">내용</td>
								<td class="workContent">
									<textarea rows="5" cols="50" name="workContent" id="workContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea>
								</td>
							</tr>
						</table>
					</fieldset>
					</c:if>
					<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 지시사항입력창 -->
					<fieldset style="width:90%;background-color:#f0efef;">
						<div id="workTitleForAdmin" style="text-align:left;padding:10px 20px 10px 20px;"></div>
						<div id="workContentForAdmin" style="text-align:left;padding:0 20px 10px 30px;"></div>
					</fieldset>
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding:5px 40px 5px 0;" id="todoItemList">
				</td>
			</tr>
			<tr>
				<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 지시사항입력창 -->
				<td align="center" valign="top">
					<div id="todoCommentBox" style="width:90%;">
						<table class="todoBox">
							<tr>
								<td width="85%"><textarea rows="5" cols="50" name="dirContent" id="dirContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea></td>
								<td width="15%"><a href="#"><img src="./resources/images/btn_write_todo.png" onClick="f_todo_save()"></a></td>							
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 : 수정버튼 -->
				<td class="btn">
							<a href="#" onClick="f_closePopup()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				</td>
			</tr>
			<tr><td height="23px;"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		<input type="hidden" name="curSelectedItemIdx" id="curSelectedItemIdx">
		<input type="hidden" name="memberType" id="memberType" value="${sessionScope.user.mbrTp}" />
	</form>
</div>

<script id="dirListTemplteAdmin" type="text/x-jquery-tmpl">	
{{each dirList}}					
	<tr onClick="f_viewWork('{{html $index}}')" style="cursor:pointer;">
		<td>{{html $value.regUserNm}}</td>
		<td>{{html $value.targetUserNm}}</td>
		<td style="text-align:left;padding-left:10px;">{{html $value.dirContent}}</td>
		<td>{{html $value.regDate}}</td>

		{{if $value.endDateYn == "Y" }}
			<td>{{html $value.endDt}} {{if $value.isDone == "N" }} (D{{html $value.intvDay}}) {{/if}}</td>
		{{else}}
			<td>---</td>
		{{/if}}

		{{if $value.isDone == "Y"}}
			<td><img src="./resources/images/icon_done.gif"></td>
		{{else}}
			<td><img src="./resources/images/icon_n_done.gif"></td>
		{{/if}}
		<td>{{html $value.doneDate}}</td>
	</tr>							
{{/each}}	
</script>

<script id="dirListEmptyTemplteAdmin" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="7">게시글이 존재하지 않습니다.</td>
	</tr>
</script>
<script id="dirListTemplteMbr" type="text/x-jquery-tmpl">	
{{each dirList}}					
	<tr onClick="f_viewWork('{{html $index}}')" style="cursor:pointer;">
		<td>{{html $value.regUserNm}}</td>
		<td>{{html $value.regDate}}</td>
		<td style="text-align:left;padding-left:10px;">{{html $value.dirContent}}</td>

		{{if $value.endDateYn == "Y" }}
			<td>{{html $value.endDt}} {{if $value.isDone == "N" }} (D{{html $value.intvDay}}) {{/if}}</td>
		{{else}}
			<td>---</td>
		{{/if}}

		{{if $value.isDone == "Y"}}
			<td><img src="./resources/images/icon_done.gif"></td>
		{{else}}
			<td><img src="./resources/images/icon_n_done.gif"></td>
		{{/if}}
		<td>{{html $value.doneDate}}</td>
	</tr>							
{{/each}}	
</script>

<script id="dirListEmptyTemplteMbr" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="6">게시글이 존재하지 않습니다.</td>
	</tr>
</script>


<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 