<%@ include file="/WEB-INF/views/comm/mbrHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/mbr/joinMember.js"></script>


<form id="joinMember" method="post" > 

	<div style="width:342px; height:727px;text-align:left;background-image: url(./resources/images/reg_bg.jpg); margin:auto; padding-left: 54px; padding-right: 54px">		
		<div style="height:60px; width: 342px;">&nbsp;</div>
		<div style="height:36px; width:342px;">
			<table width="342px" height="36px" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="96px">
						<a href="/estate/loginView.go"><img src="./resources/images/m_login_off.jpg" border="0"></a>
					</td>
					<td width="94px">
						<a href="/estate/regView.go"><img src="./resources/images/m_reg_on.jpg" border="0"></a>
					</td>
					<td width="152px"></td>
				</tr>
			</table>
		</div>
		<div style="height: 100%; width: 342px;">
			<table width="342px" cellpadding="0" cellspacing="0" border="0">
				<tr><td height="30px">&nbsp;</td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_id.jpg" valign="bottom"></td></tr>
				<tr><td height="42px"><input type="text" id="loginId" name="loginId" class="mbr_txt essential onlyEng" maxlength="16" onkeydown="return f_inputEngAndNum(event);" onblur="f_loginIdDupChk();"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_pw.jpg"></td></tr>
				<tr><td height="42px"><input type="password" id="pw" name="pw" class="mbr_pw essential onlyEng" maxlength="16" onkeydown="return f_inputEngAndNum(event);"></td></tr>
				<tr><td height="5px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_name.jpg"></td></tr>
				<tr><td height="42px"><input type="text" id="mbrNm" name="mbrNm" class="mbr_txt essential" maxlength="50"></td></tr>
				<tr><td height="5px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_phone.jpg"></td></tr>
				<tr>
					<td height="42px">
						<input type="text" id="tel1" name="tel1" class="mbr_phone essential" maxlength="4" onkeydown="return f_inputOnlyNum(event);">  -  
						<input type="text" id="tel2" name="tel2" class="mbr_phone essential" maxlength="4" onkeydown="return f_inputOnlyNum(event);">  -  
						<input type="text" id="tel3" name="tel3" class="mbr_phone essential" maxlength="4" onkeydown="return f_inputOnlyNum(event);">
					</td>
				</tr>
				<tr><td height="10px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_agency.jpg"></td></tr>
				<tr><td height="10px"></td></tr>
				<tr>
					<td>
						<select id="estateCd" name="estateCd" class="mbr_sel essential">
							<option value="">-- 선택 --</option>
							<option value="00001">테스트1</option>
							<option value="00001">테스트2</option>
						</select>
					</td>
				</tr>
				<tr><td height="30px"></td></tr>
				<tr>
					<td align="left">
						<button id="save" type="button" class="mbr" onclick="f_member_save();">
							<img src="./resources/images/mbr_btn_reg.jpg"> 
						</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mbr" onclick="f_backToLogin();return false;">
							<img src="./resources/images/mbr_btn_c.jpg">
						</button>
					</td>
				</tr>
			</table>			
		</div>		
	</div>  
</form>
<form id="formId" style="display:none;"></form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

