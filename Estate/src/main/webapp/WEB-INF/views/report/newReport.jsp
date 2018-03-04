<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %>
<script type="text/javascript" src="./resources/js/report/editReport.js?v20180301"></script> 

<form id="report" method="post" >
	<div style="width:1500px;margin:auto;padding:0;">
		<div style="width:1500px;height:90px;">
			<img src="./resources/images/title_new_report.jpg">
		</div>
		
		<div class="new_page_container">
			<table class="new_report_table">
				<tr>
					<td class="title">작성자</td>
					<td>${sessionScope.user.mbrNm}</td>
					<td class="title">만기일</td>
					<td><input type="text" id="dueDt" name="dueDt" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
				</tr>
				<tr>
					<td class="title">* 계약종류</td>
					<td class="sub">
						<table class="sub_table">
							<tr>
								<td class="title2" width="100px">구분1</td>
								<td width="193px">
									<select id="contTpSelect1" name="contTpSelect1" style="width:183px;height:40px;">
									    <option value="0">선택</option>
									    <option value="OT001">아파트</option>
									    <option value="OT002">상가</option>
									    <option value="OT003">사무실/빌딩</option>
									    <option value="OT004">오피스텔</option>
									    <option value="OT005">주상복합</option>
									    <option value="OT006">분양권</option>
									</select>
								</td>
								<td class="title2" width="100px">구분2</td>
								<td width="192px">
									<select id="contTpSelect2" name="contTpSelect2" style="width:183px;height:40px;">
									    <option value="0">선택</option>
									</select>
								</td>
							</tr>
						</table>
					</td>
					<td class="title">* 계약형태</td>
					<td class="sub">					
						<input type="radio" name="contSe_rb" id="contSe_rb1" value="1" class="rbbox" onChange="f_disableFieldByRadioBtn(this.value)" /><label for="contSe_rb1" class="rb-label type">양타</label>&nbsp;&nbsp;
						<input type="radio" name="contSe_rb" id="contSe_rb2" value="2" class="rbbox" onChange="f_disableFieldByRadioBtn(this.value)" /><label for="contSe_rb2" class="rb-label type">공동중개</label>&nbsp;&nbsp;
						<input type="text" name="contSeText" id="contSeText" style="width:200px;" disabled>
						<input type="hidden" name="contSe" id="contSe">
					</td>
				</tr>
				<tr>
					<td class="title">소재지</td>
					<td colspan="3"><input id="addr" name="addr" type="text"></td>
				</tr>
				<tr>
					<td class="title">양수인<br>(매수인,<br> 임차인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2">* 성명</td><td><input id="assignee" name="assignee" type="text"></td></tr>
							<tr><td class="title2">연락처</td><td><input id="assigneeTel" name="assigneeTel" type="text"></td></tr>
						</table>
					</td>
					<td class="title">양도인<br>(매도인,<br> 임대인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2">* 성명</td><td><input id="grantor" name="grantor" type="text"></td></tr>
							<tr><td class="title2">연락처</td><td><input id="grantorTel" name="grantorTel"  type="text"></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="title">계약일</td>
					<td><input type="text" id="contDt" name="contDt" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">계약금</td>
					<td><input id="contAmt" name="contAmt" type="text" onkeyup="inputNumberFormat(this)" maxLength="15" style="width:60%"> 원</td>
				</tr>
				<tr>
					<td class="title">중도일</td>
					<td><input type="text" id="midContDt" name="midContDt" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">중도금</td>
					<td><input id="midContAmt" name="midContAmt" type="text" onkeyup="inputNumberFormat(this)" maxLength="15" style="width:60%"> 원</td>
				</tr>
				<tr>
					<td class="title">잔금일</td>
					<td><input type="text" id="remainDt" name="remainDt" class="datepicker" style="width:140px" readonly="readonly"><img src="./resources/images/icon_cal.jpg"></td>
					<td class="title">잔금</td>
					<td><input id="remainAmt" name="remainAmt" type="text" onkeyup="inputNumberFormat(this)" maxLength="15" style="width:60%"> 원</td>
				</tr>
				<tr>
					<td class="title">특약사항 및 체크사항</td>
					<td colspan="3"><textarea rows="6" cols="50" id="chkContent" name="chkContent" style="width:100%;height:450px;"></textarea></td>
				</tr>
				<tr>
					<td class="title">계약해제사유</td>
					<td colspan="3"><input id="releaRsn" name="releaRsn" type="text"></td>
				</tr>
				<tr>
					<td class="title">예상수수료</td>
					<td><input id="preFees" name="preFees" type="text" onkeyup="inputNumberFormat(this)" maxLength="10" style="width:50%"> 원</td>
					<td class="title">실제수수료</td>
					<td><input id="realFees" name="realFees"  type="text" onkeyup="inputNumberFormat(this)" maxLength="10" style="width:50%"> 원</td>
				</tr>
				<tr>
					<td class="title">수수료변동사유</td>
					<td colspan="3"><input id="chngRsn" name="chngRsn" type="text"></td>
				</tr>
				<tr>
					<td class="title">담당자</td>
					<td>
						<select id="managerSelect" name="managerSelect" style="width:183px;height:40px;">
							<option value="0">선택</option>
						</select>
					</td>
					<td class="title">사장님</td>
					<td>
						<select id="bossSelect" name="bossSelect" style="width:183px;height:40px;">
							<option value="0">선택</option>
						</select>
					</td>
				</tr>
			</table>
			<div style="height:50px;"><input type="hidden" id="stateChngDt" name="stateChngDt" value=""></div>
			<div style="width:1400px;margin:auto;text-align:center;">
				<a href="#"><img id="btn_add" src="./resources/images/btn_add.jpg" onclick="f_report_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./commRepList.do"><img src="./resources/images/btn_cancel.jpg"></a>
			</div>
		</div>
	</div>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 
