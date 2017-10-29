<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/card/listStyle.jsp" %> 

<div class="new_page_title">
	<img src="./resources/images/title_cl_reserve.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td colspan="2" class="title" width="152px">고객명</td>
			<td colspan="6"><input type="text" style="width:730px;"></td>
			<td colspan="4">
				<input type="checkbox">&nbsp;계약상황&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;답사추진&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;상담중&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;물건검색&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;방문예정&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;미팅예정
			</td>
		</tr>
		<tr>
			<td class="title" width="78px" rowspan="10">고객<br>내역</td>
			<td class="title2" width="74px">특징</td>
			<td colspan="7"><input type="text" style="width:970px;"></td>
			<td rowspan="9" class="title" width="42px">고<br>객<br>이<br><br>찾<br>는<br><br>대<br>상<br>물<br>건<br>조<br>건</td>
			<td class="title2" width="72px">물건명</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td class="title2" width="74px">접수</td>
			<td width="260px"><input type="text"></td>
			<td rowspan="9" class="title" width="42px" valign="top"><br>연<br>락<br>처</td>
			<td class="title2" width="72px">자택</td>
			<td width="240px"><input type="text"></td>
			<td rowspan="9" class="title" width="42px" valign="top"><br>메<br>모</td>
			<td class="title2" width="72px">담당자</td>
			<td width="240px"><input type="text"></td>
			<td class="title2" width="72px">종류</td>
			<td><input type="text" style="width:104px;">&nbsp;&nbsp;<input type="text" style="width:104px;"></td>
		</tr>
		<tr>
			<td class="title2" width="74px">등급</td>
			<td><input type="text"></td>
			<td class="title2" width="72px">회사</td>
			<td><input type="text"></td>
			<td class="title2" rowspan="8" width="72px">&nbsp;</td>
			<td rowspan="8"><textarea rows="33" cols="10"></textarea></td>
			<td class="title2" width="72px">주소</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td class="title2" rowspan="3" width="74px">의뢰<br>내용</td>
			<td rowspan="3"><textarea rows="12" cols="10"></textarea></td>
			<td class="title2" width="72px">팩스</td>
			<td><input type="text"></td>
			<td class="title2" rowspan="2" width="72px">평수</td>
			<td align="left"><input type="text" style="width:94px;"> ~ <input type="text" style="width:94px;"></td>
		</tr>
		<tr>
			<td class="title2" width="72px">핸드폰</td>
			<td><input type="text"></td>
			<td><input type="text" style="width:150px"> 평 이상</td>
		</tr>
		<tr>
			<td class="title2" width="72px" rowspan="5">상세<br>내역</td>
			<td rowspan="5"><textarea rows="20" cols="10"></textarea></td>
			<td class="title2" width="72px">특징</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td class="title2" width="74px">예산</td>
			<td><input type="text"></td>
			<td class="title2" rowspan="2" width="72px">금액</td>
			<td><input type="text" style="width:90px"> ~ <input type="text" style="width:90px"> 원</td>
		</tr>
		<tr>
			<td class="title2" width="74px" rowspan="3">구입<br>조건</td>
			<td rowspan="3"><textarea rows="12" cols="10"></textarea></td>
			<td><input type="text" style="width:155px"> 원 이상</td>
		</tr>
		<tr>
			<td class="title2" width="72px">연락처</td>
			<td><input type="text"></td>
		</tr>
		<tr><td colspan="3" class="search_btn">물건검색</td></tr>
		<tr>
			<td class="title3">작업<br>입력</td>
			<td colspan="11" style="height:200px"><!-- 작업내역 -->
				<div  class="work">
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr><td style="width:200px">테스트</td><td>테스트</td></tr>
					<tr><td></td><td></td></tr>
					<tr><td></td><td></td></tr>
					<tr><td></td><td></td></tr>
					<tr><td></td><td></td></tr>
				</table>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:center;background-color:white">
				<b>고객대상물건</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>(0건)</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td colspan="6" style="text-align:right;padding-right:35px;">
				<input type="checkbox">&nbsp;주소&nbsp;&nbsp;&nbsp;
				<input type="checkbox">&nbsp;위치
			</td>
			<td colspan="3" class="del_btn">선택대상물건삭제</td>
		</tr>
	</table>
	<table class="search_ob_table_head">
		<tr>
			<th>목록</th>
			<th>물건명</th>
			<th>종류</th>
			<th>업종</th>
			<th>주소</th>
			<th>보증금</th>
			<th>월세</th>
			<th>권리금</th>
			<th>합계</th>
			<th>비고</th>
			<th>실평수</th>						
		</tr>
	</table>
	<table class="search_ob_table">
		<tr>
			<td style="height:200px">
			<div class="result">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<c:forEach var="i" begin="1" end="7" step="1">
				<tr>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
				</tr>
				</c:forEach>
			</table>	
			</div>
			</td>
		</tr>	
	</table>
	<div style="height:50px;"></div>
	<div style="width:1500px;margin:auto;text-align:center;">
		<table style="width:1500px;padding:0;margin:0;border:0">
			<tr>
				<td style="text-align:center;">
					<a href="#"><img src="./resources/images/btn_save.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#"><img src="./resources/images/btn_del.jpg"></a>
					<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>					
				</td>
			</tr>
		</table>
		
	</div>
</div>


<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 