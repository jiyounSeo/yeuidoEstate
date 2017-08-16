<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/report/delPopup.jsp" %> 

<div style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:90px;">
		<img src="./resources/images/title_report.jpg">
	</div>
	
	<div class="new_page_container">
		<table class="new_report_table">
			<tr>
				<td class="title">작성자</td>
				<td><!--  --></td>
				<td class="title">만기일</td>
				<td><!--  --></td>
			</tr>
			<tr>
				<td class="title">계약종류</td>
				<td><!--  --></td>
				<td class="title">계약형태</td>
				<td class="sub">
					<table class="sub_table">
						<tr>
							<td class="title2" width="100px">양타</td>
							<td width="193px"><!--  -->&nbsp;</td>
							<td class="title2" width="100px">공동중개</td>
							<td width="192px"><!--  --></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="title">소재지</td>
				<td colspan="3"><!--  --></td>
			</tr>
			<tr>
				<td class="title">양수인<br>(매수인,<br> 임차인)</td>
				<td class="sub">
					<table class="sub_table">
						<tr><td class="title2" width="150px;">성명</td><td><!--  --></td></tr>
						<tr><td class="title2" width="150px;">연락처</td><td><!--  --></td></tr>
					</table>
				</td>
				<td class="title">양도인<br>(매도인,<br> 임대인)</td>
				<td class="sub">
					<table class="sub_table">
						<tr><td class="title2" width="150px;">성명</td><td><!--  --></td></tr>
						<tr><td class="title2" width="150px;">연락처</td><td><!--  --></td></tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="title">계약일</td>
				<td><!--  --></td>
				<td class="title">계약금</td>
				<td><!--  --></td>
			</tr>
			<tr>
				<td class="title">중도일</td>
				<td><!--  --></td>
				<td class="title">중도금</td>
				<td><!--  --></td>
			</tr>
			<tr>
				<td class="title">잔금일</td>
				<td><!--  --></td>
				<td class="title">잔금</td>
				<td><!--  --></td>
			</tr>
			<tr>
				<td class="title">특약사항 및 체크사항</td>
				<td colspan="3"><!--  --></td>
			</tr>
			<tr>
				<td class="title">계약해제사유</td>
				<td colspan="3"><!--  --></td>
			</tr>
			<tr>
				<td class="title">예상수수료</td>
				<td><!--  --></td>
				<td class="title">실제수수료</td>
				<td><!--  --></td>
			</tr>
			<tr>
				<td class="title">수수료변동사유</td>
				<td colspan="3"><!--  --></td>
			</tr>
			<tr>
				<td class="title">담당자</td>
				<td><!--  --></td>
				<td class="title">사장님</td>
				<td><!--  --></td>
			</tr>			
			<tr>
				<td class="title">상태</td>
				<td colspan="3">
					<input type="radio" name="type_rb" id="type_rb1" class="rbbox" /><label for="type_rb1" class="rb-label state">진행</label>&nbsp;&nbsp;
					<input type="radio" name="type_rb" id="type_rb2" class="rbbox" /><label for="type_rb2" class="rb-label state">완료</label>&nbsp;&nbsp;
					<input type="radio" name="type_rb" id="type_rb3" class="rbbox" /><label for="type_rb3" class="rb-label state">해지</label>
				</td>
			</tr>
		</table>
		<div style="height:50px;"></div>
		<div style="width:1400px;margin:auto;text-align:center;">
			<a href="#"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>
		</div>	
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
