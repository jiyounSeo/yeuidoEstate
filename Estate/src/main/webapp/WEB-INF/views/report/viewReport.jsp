<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/report/delPopup.jsp" %> 
<script type="text/javascript" src="./resources/js/report/editReport.js"></script>

<form id="report" method="post" >
	<div style="width:1500px;margin:auto;padding:0;">
		<div style="width:1500px;height:90px;">
			<img src="./resources/images/title_report.jpg">
		</div>
		
		<div class="new_page_container">
			<table class="new_report_table">
				<tr>
					<td class="title">작성자</td>
					<td>${result.regUserNm}</td>
					<td class="title">만기일</td>
					<td>${result.dueDt}</td>
				</tr>
				<tr>
					<td class="title">계약종류</td>
					<td id="contTpTd"></td>
					<td class="title">계약형태</td>
					<td class="sub">					
						<input type="radio" name="contSe" id="contSe_rb1" class="rbbox" disabled /><label for="contSe_rb1" class="rb-label type" style="cursor:default">양타</label>&nbsp;&nbsp;
						<input type="radio" name="contSe" id="contSe_rb2" class="rbbox" disabled /><label for="contSe_rb2" class="rb-label type" style="cursor:default">공동중개</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td class="title">소재지</td>
					<td colspan="3">${result.addr}</td>
				</tr>
				<tr>
					<td class="title">양수인<br>(매수인,<br> 임차인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2" width="150px;">성명</td><td>${result.assignee}</td></tr>
							<tr><td class="title2" width="150px;">연락처</td><td>${result.assigneeTel}</td></tr>
						</table>
					</td>
					<td class="title">양도인<br>(매도인,<br> 임대인)</td>
					<td class="sub">
						<table class="sub_table">
							<tr><td class="title2" width="150px;">성명</td><td>${result.grantor}</td></tr>
							<tr><td class="title2" width="150px;">연락처</td><td>${result.grantorTel}</td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="title">계약일</td>
					<td>${result.contDt}</td>
					<td class="title">계약금</td>
					<td>${result.contAmt}</td>
				</tr>
				<tr>
					<td class="title">중도일</td>
					<td>${result.midContDt}</td>
					<td class="title">중도금</td>
					<td>${result.midContAmt}</td>
				</tr>
				<tr>
					<td class="title">잔금일</td>
					<td>${result.remainDt}</td>
					<td class="title">잔금</td>
					<td>${result.remainAmt}</td>
				</tr>
				<tr>
					<td class="title">특약사항 및 체크사항</td>
					<td colspan="3">${result.chkContent}</td>
				</tr>
				<tr>
					<td class="title">계약해제사유</td>
					<td colspan="3">${result.releaRsn}</td>
				</tr>
				<tr>
					<td class="title">예상수수료</td>
					<td>${result.preFees}</td>
					<td class="title">실제수수료</td>
					<td>${result.realFees}</td>
				</tr>
				<tr>
					<td class="title">수수료변동사유</td>
					<td colspan="3">${result.chngRsn}</td>
				</tr>
				<tr>
					<td class="title">담당자</td>
					<td id="managerTd"></td>
					<td class="title">사장님</td>
					<td id="bossTd"></td>
				</tr>			
				<tr>
					<td class="title">상태</td>
					<td colspan="3">
						<input type="radio" name="type_rb" id="type_rb1" class="rbbox" disabled/><label for="type_rb1" class="rb-label state" style="cursor:default">진행</label>&nbsp;&nbsp;
						<input type="radio" name="type_rb" id="type_rb2" class="rbbox" disabled/><label for="type_rb2" class="rb-label state" style="cursor:default">완료</label>&nbsp;&nbsp;
						<input type="radio" name="type_rb" id="type_rb3" class="rbbox" disabled/><label for="type_rb3" class="rb-label state" style="cursor:default">해지</label>
					</td>
				</tr>
			</table>
			<div style="height:50px;"></div>
			<div style="width:1400px;margin:auto;text-align:center;">
				<a href="./commRepList.do"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${result.regUser == sessionScope.user.loginId || sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}">
					<a href="./editReport?contractId=${result.contractId}"><img id="btn_edit" src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>
				</c:if>
			</div>	
		</div>
	</div>
	<input type="hidden" name="contractId" id="contractId" value="${result.contractId}"/>
	<input type="hidden" name="contSttSe" id="contSttSe" value="${result.contSttSe}"/>
	<input type="hidden" name="contTp" id="contTp1" value="${result.contTp1}">
	<input type="hidden" name="contTp" id="contTp2" value="${result.contTp2}">
	<input type="hidden" name="boss" id="boss" value="${result.boss}">
	<input type="hidden" name="contSe" id="contSe" value="${result.contSe}">
	<input type="hidden" id="manager" name="manager" value="${result.manager}">
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 
