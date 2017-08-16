<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 

<div style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:90px;">
		<img src="./resources/images/title_new_report.jpg">
	</div>
	
	<div class="new_page_container">
		<table class="new_report_table">
			<tr>
				<td class="title">작성자</td>
				<td><input type="text"></td>
				<td class="title">만기일</td>
				<td><img src="./resources/images/icon_cal.jpg"></td>
			</tr>
			<tr>
				<td class="title">계약종류</td>
				<td><input type="text"></td>
				<td class="title">계약형태</td>
				<td class="sub">
					<table class="sub_table">
						<tr>
							<td class="title2" width="100px">양타</td>
							<td width="193px"><input type="text" style="width:183px;"></td>
							<td class="title2" width="100px">공동중개</td>
							<td width="192px"><input type="text"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="title">소재지</td>
				<td colspan="3"><input type="text"></td>
			</tr>
			<tr>
				<td class="title">양수인<br>(매수인,<br> 임차인)</td>
				<td class="sub">
					<table class="sub_table">
						<tr><td class="title2">성명</td><td><input type="text"></td></tr>
						<tr><td class="title2">연락처</td><td><input type="text"></td></tr>
					</table>
				</td>
				<td class="title">양도인<br>(매도인,<br> 임대인)</td>
				<td class="sub">
					<table class="sub_table">
						<tr><td class="title2">성명</td><td><input type="text"></td></tr>
						<tr><td class="title2">연락처</td><td><input type="text"></td></tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="title">계약일</td>
				<td><img src="./resources/images/icon_cal.jpg"></td>
				<td class="title">계약금</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td class="title">중도일</td>
				<td><img src="./resources/images/icon_cal.jpg"></td>
				<td class="title">중도금</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td class="title">잔금일</td>
				<td><img src="./resources/images/icon_cal.jpg"></td>
				<td class="title">잔금</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td class="title">특약사항 및 체크사항</td>
				<td colspan="3"><input type="text"></td>
			</tr>
			<tr>
				<td class="title">계약해제사유</td>
				<td colspan="3"><input type="text"></td>
			</tr>
			<tr>
				<td class="title">예상수수료</td>
				<td><input type="text"></td>
				<td class="title">실제수수료</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td class="title">수수료변동사유</td>
				<td colspan="3"><input type="text"></td>
			</tr>
			<tr>
				<td class="title">담당자</td>
				<td><input type="text"></td>
				<td class="title">사장님</td>
				<td><input type="text"></td>
			</tr>
		</table>
		<div style="height:50px;"></div>
		<div style="width:1400px;margin:auto;text-align:center;">
			<a href="#"><img src="./resources/images/btn_add.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
		</div>	
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
