<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 

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
			<td class="title">건물명 / 면적</td>
			<td colspan="4">
				<input type="text" style="width:200px"> 분양 
				<input type="text" style="width:135px"> 평형 /   
				실 <input type="text" style="width:135px">평 
				<select style="width:100px"><option>1</option></select>층
			</td>
		</tr>
		<tr>
			<td class="title">유형</td>
			<td colspan="2">
				<input type="radio" name="type_rb" id="type_rb1" class="rbbox" /><label for="type_rb1" class="rb-label moneyType">매매</label>&nbsp;&nbsp;
				<input type="radio" name="type_rb" id="type_rb2" class="rbbox" /><label for="type_rb2" class="rb-label moneyType">월세</label>&nbsp;&nbsp;
			</td>
			<td class="title">업종</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><input type="text" style="width:140px"> 만원</td>
			<td class="title">보증금</td>
			<td><input type="text" style="width:140px"> 만원 / 월세 <input type="text" style="width:140px"> 만원</td>
		</tr>
		<tr>
			<td class="title">권리금</td>
			<td colspan="2">
				권리금 <input type="text" style="width:140px"> 만원 / 관리비 <input type="text" style="width:140px"> 만원	
			</td>
			<td class="title">만기일</td>
			<td><img src="./resources/images/icon_cal.jpg"></td>
		</tr>
		<tr>
			<td class="title">입주가능일</td>
			<td colspan="4">
				<input type="radio" name="comeData_rb" id="comeData_rb1" class="rbbox" /><label for="comeData_rb1" class="rb-label comeData">정상</label>&nbsp;&nbsp;
				<input type="radio" name="comeData_rb" id="comeData_rb2" class="rbbox" /><label for="comeData_rb2" class="rb-label comeData">하시</label>&nbsp;&nbsp;
				<input type="radio" name="comeData_rb" id="comeData_rb3" class="rbbox" /><label for="comeData_rb3" class="rb-label comeData">공가</label>&nbsp;&nbsp;
				<input type="radio" name="comeData_rb" id="comeData_rb4" class="rbbox" /><label for="comeData_rb4" class="rb-label comeData">주전</label>&nbsp;&nbsp;
				<input type="radio" name="comeData_rb" id="comeData_rb5" class="rbbox" /><label for="comeData_rb5" class="rb-label comeData">세안고</label>&nbsp;&nbsp;
				<input type="radio" name="comeData_rb" id="comeData_rb6" class="rbbox" /><label for="comeData_rb6" class="rb-label comeData">협의</label>&nbsp;&nbsp;<input type="text" style="width:140px"> 년도
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

<%@ include file="/WEB-INF/views/comm/editObBottom.jsp" %> 
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 