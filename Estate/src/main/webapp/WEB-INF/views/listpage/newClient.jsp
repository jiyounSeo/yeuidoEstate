<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<div class="new_page_title">
	<img src="./resources/images/title_new_cl_list.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">고객명</td>
			<td colspan="2"><input type="text"></td>
			<td class="title">담당자</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">자택 </td>
			<td width="365px"><input type="text" style="width:105px"> - <input type="text" style="width:115px"> - <input type="text" style="width:115px"></td>
			<td class="title">회사</td>
			<td><input type="text" style="width:135px"> - <input type="text" style="width:155px"> - <input type="text" style="width:155px"></td>
		</tr>
		<tr>
			<td class="title2">핸드폰 </td>
			<td width="365px"><input type="text" style="width:105px"> - <input type="text" style="width:115px"> - <input type="text" style="width:115px"></td>
			<td class="title">팩스</td>
			<td><input type="text" style="width:135px"> - <input type="text" style="width:155px"> - <input type="text" style="width:155px"></td>
		</tr>
		<tr>
			<td class="title">등급</td>
			<td colspan="2">
				<input type="radio" name="grade_rb" id="grade_rb1" class="rbbox" /><label for="grade_rb1" class="rb-label grade">A</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="grade_rb" id="grade_rb2" class="rbbox" /><label for="grade_rb2" class="rb-label grade">B</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="grade_rb" id="grade_rb3" class="rbbox" /><label for="grade_rb3" class="rb-label grade">C</label>
			</td>
			<td class="title">예산</td>
			<td><input type="text" style="width:140px"> 만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4">
				<textarea rows="10" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title">특징</td>
			<td colspan="4"><input type="text"></td>
		</tr>
		<tr>
			<td class="title">구입조건</td>
			<td colspan="4"><input type="text"></td>
		</tr>
		<tr>
			<td class="title">상세내역</td>
			<td colspan="4">
				<textarea rows="10" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title">상태</td>
			<td colspan="4">
				<input type="radio" name="type_rb" id="type_rb1" class="rbbox" /><label for="type_rb1" class="rb-label cardType">활성</label>&nbsp;&nbsp;
				<input type="radio" name="type_rb" id="type_rb2" class="rbbox" /><label for="type_rb2" class="rb-label cardType">보류</label>&nbsp;&nbsp;
				<input type="checkbox">&nbsp;공동&nbsp;&nbsp;		
			</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_add.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 