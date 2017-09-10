<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/report/delPopup.jsp" %>
<script type="text/javascript" src="./resources/js/report/editReport.js"></script> 

<form id="report" method="post" >
	<div style="width:1500px;margin:auto;padding:0;">
		<div style="width:1500px;height:90px;">
			<img src="./resources/images/title_report_edit.jpg">
		</div>
		
		<div class="new_page_container">
			<table class="new_report_table">
				<tr>
					<td class="title">작성자</td>
					<td><input type="text" id="writer" name="writer" value="작성자 저장 필요!!"></td>
					<td class="title">만기일</td>
					<td><input type="text" id="dueDt" name="dueDt" value="${result.dueDt}" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
				</tr>
				<tr>
					<td class="title">계약종류</td>
					<td class="sub">
						<table class="sub_table">
							<tr>
								<td class="title2" width="100px">구분1</td>
								<td width="193px">
									<select id="contTpSelect1" name="contTpSelect1" style="width:183px;height:40px;">
									    <option value="0">선택</option>
									    <option value="1">아파트</option>
									    <option value="2">오피스텔</option>
									    <option value="3">주상복합</option>
									    <option value="4">상가</option>
									    <option value="5">사무실</option>
									    <option value="6">분양권</option>
									</select>
								</td>
								<td class="title2" width="100px">구분2</td>
								<td width="192px">
									<select id="contTpSelect2" name="contTpSelect2" style="width:183px;height:40px;"></select>
								</td>
							</tr>
						</table>
					</td>
					<td class="title">계약형태</td>
					<td class="sub">
						<table class="sub_table">
							<tr>
								<td class="title2" width="100px">양타</td>
								<td width="193px"><input type="text" id="contSe" name="contSe" value="${result.contSe}" style="width:183px;"></td>
								<td class="title2" width="100px">공동중개</td>
								<td width="192px"><input type="text" id="contSe" name="contSe" value="${result.contSe}"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="title">소재지</td>
					<td colspan="3"><input type="text" id="addr" name="addr" value="${result.addr}"></td>
				</tr>
				<tr>
					<td class="title">양수인<br>(매수인,<br> 임차인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2">성명</td><td><input type="text" id="assignee" name="assignee" value="${result.assignee}"></td></tr>
							<tr><td class="title2">연락처</td><td><input type="text" id="assignee" name="assignee" value="${result.assignee}"></td></tr>
						</table>
					</td>
					<td class="title">양도인<br>(매도인,<br> 임대인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2">성명</td><td><input type="text" id="grantor" name="grantor" value="${result.grantor}"></td></tr>
							<tr><td class="title2">연락처</td><td><input type="text" id="grantor" name="grantor" value="${result.grantor}"></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="title">계약일</td>
					<td><input type="text" id="contDt" name="contDt" value="${result.contDt}" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">계약금</td>
					<td><input type="text" id="contAmt" name="contAmt" value="${result.contAmt}"></td>
				</tr>
				<tr>
					<td class="title">중도일</td>
					<td><input type="text" id="midContDt" name="midContDt" value="${result.midContDt}" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">중도금</td>
					<td><input type="text" id="midContAmt" name="midContAmt" value="${result.midContAmt}"></td>
				</tr>
				<tr>
					<td class="title">잔금일</td>
					<td><input type="text" id="remainDt" name="remainDt" value="${result.remainDt}" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">잔금</td>
					<td><input type="text" id="remainAmt" name="remainAmt" value="${result.remainAmt}"></td>
				</tr>
				<tr>
					<td class="title">특약사항 및 체크사항</td>
					<td colspan="3"><input type="text" id="chkContent" name="chkContent" value="${result.chkContent}"></td>
				</tr>
				<tr>
					<td class="title">계약해제사유</td>
					<td colspan="3"><input type="text" id="releaRsn" name="releaRsn" value="${result.releaRsn}"></td>
				</tr>
				<tr>
					<td class="title">예상수수료</td>
					<td><input type="text" id="preFees" name="preFees" value="${result.preFees}"></td>
					<td class="title">실제수수료</td>
					<td><input type="text" id="realFees" name="realFees" value="${result.realFees}"></td>
				</tr>
				<tr>
					<td class="title">수수료변동사유</td>
					<td colspan="3"><input type="text" id="chngRsn" name="chngRsn" value="${result.chngRsn}"></td>
				</tr>
				<tr>
					<td class="title">담당자</td>
					<td><input type="text" id="manager" name="manager" value="${result.manager}" readonly="readonly"></td>
					<td class="title">사장님</td>
					<td>
						<select id="bossSelect" name="bossSelect" style="width:183px;height:40px;">
							<option value="0">선택</option>
						</select>
					</td>
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
				<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_report_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
			</div>
		</div>
	</div>
	<input type="hidden" name="contractId" id="contractId" value="${result.contractId}"/>
	<input type="hidden" name="contSttSe" id="contSttSe" value="${result.contSttSe}"/>
	<input type="hidden" name="contTp" id="contTp" value="${result.contTp}">
	<input type="hidden" name="boss" id="boss" value="${result.boss}">
</form>
 

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
