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
			<td class="title">분류</td>
			<td colspan="4">
			  <input type="radio" id="activeTp1" name="activeTp" value="AT001"/><label for="activeTp1">활성</label>
			  <input type="radio" id="activeTp2" name="activeTp" value="AT002"/><label for="activeTp2">보류</label>
			  <input type="radio" id="activeTp3" name="activeTp" value="AT003"/><label for="activeTp3">계약완료</label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" name="publicYn" id="publicYn" value="Y" /><label for="publicYn">공동</label>
			</td>
		</tr>
		
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">핸드폰</td>
			<td><input type="text" maxLength ="3" style="width:105px" id="custTel1" name="custTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel2" name="custTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel3" name="custTel3"  ></td>
			<td class="title2">팩스 </td>			
			<td><input type="text" maxLength ="3" style="width:105px" id="faxTel1" name="faxTel1">
				 - <input type="text" maxLength ="4" style="width:105px" id="faxTel2" name="faxTel2">
				 - <input type="text" maxLength ="4" style="width:105px" id="faxTel3" name="faxTel3"></td>		
		</tr>
		<tr>
			<td class="title2">이메일 </td>
			<td colspan="3"><input type="text" style="width:320x" id="email" name="email"></td>
		</tr>
		
		<tr>
			<td class="title">예산</td>
			<td colspan="4"><input type="text" maxLength="10" style="width:140px" id="budAmt" name="budAmt" onkeyup="inputNumberFormat(this)"> 만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4">
				<textarea rows="10" cols="50" id="reqContent" name="reqContent"></textarea>
			</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_customer_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg" onclick="f_list_view_change();return false;"></a>
	</div>
</div>
<input type="hidden" name="pageNm" id="pageNm" value="${pageNm}"/>
<input type="hidden" name="custId" id="custId" value="${custId}"/>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 