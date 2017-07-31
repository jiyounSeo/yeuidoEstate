<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<div id="cl_list" name="cl_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_comm_cl_list.jpg">
	</div>
	<div class="list_div9">	
		<table width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="20px"></td>
				<td width="1460px" valign="top">
					<table width="1460px" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="100%" align="right" valign="bottom">
								<input type="checkbox">활성 <input type="checkbox">보류 <input type="checkbox">내가등록한고객만보기
							</td>
						</tr>
						<tr>
							<td>
								<table class="cl_list">
									<tr class="title">
										<td>등록일자</td>
										<td>고객명</td>
										<td>연락처</td>
										<td>의뢰내역</td>
										<td>등록자</td>
										<td>상태</td>
									</tr>
									<c:forEach var="i" begin="1" end="15" step="1">
									<tr>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
									</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						<tr><td height="20px">&nbsp;</td></tr>
						<tr><!-- paging -->
							<td align="center">
								<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="488px" height="41px">
											<div style="width:488px;height:41px;margin:0;padding:0;text-align:left">
												<a href="#"><img src="./resources/images/btn_search2.jpg"></a>
												<a href="#"><img src="./resources/images/btn_print.jpg"></a>
												<a href="#"><img src="./resources/images/btn_export_excel.jpg" border="0"></a>
											</div>
										</td>
										<td width="486px" align="center"><img src="./resources/images/page_temp.jpg"></td>
										<td width="486px" align="right">
											<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
												<a href="./newClient.do"><img src="./resources/images/btn_new_cl.jpg"></a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="20px"></td>
			</tr>
		</table>		
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
