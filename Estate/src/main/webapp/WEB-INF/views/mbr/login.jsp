<%@ include file="/WEB-INF/views/comm/mbrHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>

	<div style="width:342px; height:560px;text-align:left;background-image: url(./resources/images/login_bg.jpg); margin:auto; padding-left: 54px; padding-right: 54px">		
		<div style="height:60px; width: 342px;">&nbsp;</div>
		<div style="height:100%; width:342px;">
			<table width="342px" height="36px" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="96px">
						<a href="/estate/loginView.do"><img src="./resources/images/m_login_on.jpg" border="0"></a>
					</td>
					<td width="94px">
						<a href="/estate/regView.do"><img src="./resources/images/m_reg_off.jpg" border="0"></a>
					</td>
					<td width="152px"></td>
				</tr>
				<tr><td colspan="3" height="80px" ></td></tr>
				<tr><td colspan="3" height="45px" valign="bottom"><img src="./resources/images/t_uname.jpg"></td></tr>				
				<tr><td colspan="3" height="42px"><input type="text" id="log_id" name="log_id" class="mbr_txt"></td></tr>
				<tr><td colspan="3" height="45px" valign="bottom"><img src="./resources/images/t_upw.jpg"></td></tr>				
				<tr><td colspan="3" height="42px"><input type="password" id="log_id" name="log_id" class="mbr_pw"></td></tr>
				<tr><td colspan="3" height="30px" ></td></tr>
				<tr>
					<td colspan="3" height="90px" >
						<button type="button" class="mbr"><img src="./resources/images/login_btn.jpg"></button>
					</td>
				</tr>
				<tr><td colspan="3" height="10px" ></td></tr>
				<tr>
					<td colspan="3" height="20px" align="center">
						<button type="button" class="mbr"><img src="./resources/images/forget_btn.jpg"></button>
					</td>
				</tr>
			</table>
		</div>
	</div>

<table cellpadding="0" cellspacing="0" border="0">
	<tr><td height="50px">&nbsp;</td></tr>
</table>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 