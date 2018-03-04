<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/report/reportList.js?v20180304"></script>

<div style="width:1500px;margin:auto;padding:0;">

	<img src="./resources/images/title_report_list.jpg">
		<table id="reportList" class="report">
			<tr class="title">
				<td>등록일</td>
				<td>계약종류</td>
				<td>소재지</td>
				<td>계약일</td>
				<td>중도일</td>
				<td>잔금일</td>
				<td>담당자</td>
				<td>상태</td>
			</tr>
			<tbody id="repotTbody">
		
			</tbody>
		</table>
		<table>
			<tr><td height="20px">&nbsp;</td></tr>
			<tr><!-- paging -->
				<td align="center">
					<table width="1500px" height="41px" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="440px" height="41px"></td>
							<td width="620px" align="center">
								<div id="pagingDiv" class="pagination"></div>
							</td>
							<td width="440px" align="right">
								<div style="width:150px;height:41px;margin:0;padding:0;text-align:right">
									<a href="./newReport.do"><img src="./resources/images/btn_add_report.jpg"></a>
								</div>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>	
</div>
<script id="reportListTemplte" type="text/x-jquery-tmpl">	
{{each reportList}}					
	<tr class="list_data" onclick="f_repoDtl_view({{html $value.contractId}});return false;" style="cursor:pointer;">
		<td>{{html $value.regDt}}</td>
		<td>
			{{if $value.contTp1 == "OT001" }} 아파트 /
			{{else $value.contTp1 == "OT002" }} 상가 /
			{{else $value.contTp1 == "OT003" }} 사무실/빌딩 /
			{{else $value.contTp1 == "OT004" }} 오피스텔 /
			{{else $value.contTp1 == "OT005" }} 주상복합 /
			{{else $value.contTp1 == "OT006" }} 분양권 /
			{{/if}}

			{{if $value.contTp2 == "ST001" }} 매매
			{{else $value.contTp2 == "ST002" }} 전세
			{{else $value.contTp2 == "ST003" }} 월세
			{{else $value.contTp2 == "ST004" }} 렌트
			{{else $value.contTp2 == "ST005" }} 임대
			{{else $value.contTp2 == "ST006" }} 분양권
			{{else $value.contTp2 == "ST007" }} 전매
			{{/if}}
		</td>
		<td>
			{{if $value.addr == "" ||  $value.addr == null }} ---
			{{else}} {{html $value.addr}}
			{{/if}}
		</td>
		<td>
			{{if $value.contDt == "" ||  $value.contDt == null }} ---
			{{else}} {{html $value.contDt}}
			{{/if}}
		</td>
		<td>
			{{if $value.midContDt == "" ||  $value.midContDt == null }} ---
			{{else}} {{html $value.midContDt}}
			{{/if}}
		</td>
		<td>
			{{if $value.remainDt == "" ||  $value.remainDt == null }} ---
			{{else}} {{html $value.remainDt}}
			{{/if}}
		</td>
		<td>
			{{if $value.managerNm == "" ||  $value.managerNm == null }} ---
			{{else}} {{html $value.managerNm}}
			{{/if}}
		</td>
		<td>
			{{if $value.contSttSe == "1" }} 진행
			{{else $value.contSttSe == "2" }} 완료
			{{else $value.contSttSe == "3" }} 해지
			{{else}} --
			{{/if}}
		</td>
	</tr>							
{{/each}}	
</script>

<script id="reportListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td class="list_data" colspan="8">계약보고서가 존재하지 않습니다.</td>
	</tr>
</script>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 