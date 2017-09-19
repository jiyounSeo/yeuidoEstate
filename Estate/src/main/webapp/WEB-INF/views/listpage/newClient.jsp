<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/list/addClient.js"></script>

<form id="newClient">
<div class="new_page_title">
	<img src="./resources/images/title_new_cl_list.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">고객명</td>
			<td colspan="4"><input type="text" style="width:200px" id="custNm" name="custNm"></td>
		</tr>
		<tr>
			<td class="title">고객상태</td>
			<td colspan="4">
			  <input type="checkbox" name="contactYn" id="contactYn" value="Y" /><label for="contactYn">계약상황</label>
			  <input type="checkbox" name="explorYn" id="explorYn" value="Y" /><label for="explorYn">답사추진</label>
			  <input type="checkbox" name="talkYn" id="talkYn" value="Y" /><label for="talkYn">상담중</label>
			  <input type="checkbox" name="searchYn" id="searchYn" value="Y" /><label for="searchYn">물건검색</label>
			  <input type="checkbox" name="visitYn" id="visitYn" value="Y" /><label for="visitYn">방문예정</label>
			  <input type="checkbox" name="meetYn" id="meetYn" value="Y" /><label for="meetYn">미팅예정</label>
		</tr>
		
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">핸드폰</td>
			<td><input type="text" maxLength ="3" style="width:105px" id="custTel1" name="custTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel2" name="custTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel3" name="custTel3"  ></td>
			<td class="title2">자택 </td>
			<td><input type="text" maxLength ="3" style="width:105px" id="homeTel1" name="homeTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="homeTel2" name="homeTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="homeTel3" name="homeTel3"  ></td>
		
		</tr>
		<tr>
			<td class="title2">회사 </td>
				<td><input type="text" maxLength ="3" style="width:105px;height:90%;" id="orgnTel1" name="orgnTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="orgnTel2" name="orgnTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="orgnTel3" name="orgnTel3"  ></td>
			<td class="title2">팩스</td>
			<td><input type="text" maxLength ="3" style="width:105px" id="faxTel1" name="faxTel1">
				 - <input type="text" maxLength ="4" style="width:105px" id="faxTel2" name="faxTel2">
				 - <input type="text" maxLength ="4" style="width:105px" id="faxTel3" name="faxTel3"></td>
		</tr>
		
		<tr>
			<td class="title">등급</td>
			<td colspan="2">
			  <input type="radio" id="grade1" name="gradeTp" value="A"/><label for="grade1">A</label>
			  <input type="radio" id="grade2" name="gradeTp" value="B"/><label for="grade2">B</label>
			  <input type="radio" id="grade3" name="gradeTp" value="C"/><label for="grade3">C</label>
			</td>
			<td class="title">예산</td>
			<td><input type="text" maxLength="10" style="width:140px" id="budAmt" name="budAmt" onkeyup="inputNumberFormat(this)"> 만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4">
				<textarea rows="10" cols="50" id="reqContent" name="reqContent"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title">특징</td>
			<td colspan="4"><input type="text" id="feature" name="feature"></td>
		</tr>
		<tr>
			<td class="title">접수</td>
			<td colspan="4"><input type="text" id="jeobsu" name="jeobsu"></td>
		</tr>
		
		<tr>
			<td class="title">구입조건</td>
			<td colspan="4"><input type="text" id="buyCond" name="buyCond"></td>
		</tr>
		<tr>
			<td class="title">상세내역</td>
			<td colspan="4">
				<textarea rows="10" cols="50" id="dtlContent" name="dtlContent"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title">담당자메모</td>
			<td colspan="4">
				<textarea rows="10" cols="50" id="mbrMemo" name="mbrMemo"></textarea>
			</td>
		</tr>
		
		<tr>
			<td class="title">분류</td>
			<td colspan="4">
			  <input type="radio" id="activeTp1" name="activeTp" value="AT001"/><label for="activeTp1">활성</label>
			  <input type="radio" id="activeTp2" name="activeTp" value="AT002"/><label for="activeTp2">보류</label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" name="publicYn" id="publicYn" value="Y" /><label for="publicYn">공동</label>
			</td>
		</tr>
		
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_add.jpg" onclick="f_customer_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
	</div>
</div>
<input type="hidden" name="custId" id="custId" value="${custId}"/>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 