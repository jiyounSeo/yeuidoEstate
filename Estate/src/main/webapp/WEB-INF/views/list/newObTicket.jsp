<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<div class="new_page_title">
	<img src="./resources/images/title_new_ob_6.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="4"><input type="text"> </td>
		</tr>
		<tr>
			<td class="title">고객정보</td>
			<td class="title2">성명 </td>
			<td width="365px"><input type="text"></td>
			<td class="title2">연락처</td>
			<td><input type="text" style="width:130px"> - <input type="text" style="width:155px"> - <input type="text" style="width:155px"></td>
		</tr>
		<tr>
			<td class="title">건물명/면적</td>
			<td colspan="4"><select style="width:350px"><option>건물명/면적</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:135px"> 평형</td>
		</tr>
		<tr>
			<td class="title">분양가</td>
			<td colspan="2"><input type="text" style="width:140px"> 만원</td>
			<td class="title">프리미엄</td>
			<td><input type="text" style="width:140px"> 만원</td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="4">
				<input type="text" style="width:140px"> 동&nbsp;&nbsp;&nbsp;
				<input type="text" style="width:140px"> 층&nbsp;&nbsp;&nbsp;
				<input type="text" style="width:140px"> 향</td>
			</td>
		</tr>
		<tr>
			<td class="title">유형</td>
			<td colspan="2">
				<input type="radio" name="type_rb" id="type_rb1" class="rbbox" /><label for="type_rb1" class="rb-label moneyType">분양권</label>&nbsp;&nbsp;
				<input type="radio" name="type_rb" id="type_rb2" class="rbbox" /><label for="type_rb2" class="rb-label moneyType">전매</label>	
			</td>
			<td class="title">만기일</td>
			<td><img src="./resources/images/icon_cal.jpg"></td>
		</tr>
		<tr>
			<td class="title">입주일</td>
			<td colspan="4">
				<img src="./resources/images/icon_cal.jpg">
			</td>
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4">
				<textarea rows="6" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title">첨부사진</td>
			<td colspan="4"><img src="./resources/images/icon_attach.jpg"></td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4">
				<input type="radio" name="actState_rb" id="actState_rb1" class="rbbox" /><label for="actState_rb1" class="rb-label actState">활성</label>&nbsp;&nbsp;
				<input type="radio" name="actState_rb" id="actState_rb2" class="rbbox" /><label for="actState_rb2" class="rb-label actState">보류</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="checkboxG1" id="checkboxG1" class="ckbox" /><label for="checkboxG1" class="ck-label">공동</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="checkboxG2" id="checkboxG2" class="ckbox" /><label for="checkboxG2" class="ck-label">광고</label>
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