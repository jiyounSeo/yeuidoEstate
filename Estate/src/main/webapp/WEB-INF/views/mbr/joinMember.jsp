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
						<a href="/estate/loginView.do"><img src="./resources/images/m_login_off.jpg" border="0"></a>
					</td>
					<td width="94px">
						<a href="/estate/regView.do"><img src="./resources/images/m_reg_on.jpg" border="0"></a>
					</td>
					<td width="152px"></td>
				</tr>
			</table>
		</div>
		<div style="height: 100%; width: 342px;">
			<table width="342px" cellpadding="0" cellspacing="0" border="0">
				<tr><td height="30px">&nbsp;</td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_id.jpg" valign="bottom"></td></tr>
				<tr><td height="42px"><input type="text" id="mbr_id" name="mbr_id" class="mbr_txt"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_pw.jpg"></td></tr>
				<tr><td height="42px"><input type="password" id="mbr_pw" name="mbr_pw" class="mbr_pw"></td></tr>
				<tr><td height="5px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_name.jpg"></td></tr>
				<tr><td height="42px"><input type="text" id="mbr_nm" name="mbr_nm" class="mbr_txt"></td></tr>
				<tr><td height="5px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_phone.jpg"></td></tr>
				<tr>
					<td height="42px">
						<input type="text" id="phone1" name="phone1" class="mbr_phone">  -  
						<input type="text" id="phone2" name="phone2" class="mbr_phone">  -  
						<input type="text" id="phone3" name="phone3" class="mbr_phone">
					</td>
				</tr>
				<tr><td height="10px"></td></tr>
				<tr><td height="42px" valign="bottom"><img src="./resources/images/t_agency.jpg"></td></tr>
				<tr><td height="10px"></td></tr>
				<tr>
					<td>
						<select id="agency" name="agency" class="mbr_sel">
							<option value=" ">부동산 이름</option>
							<option value="테스트1">테스트1</option>
							<option value="테스트2">테스트2</option>
						</select>
					</td>
				</tr>
				<tr><td height="30px"></td></tr>
				<tr>
					<td align="left">
						<button id="save" type="button" class="mbr" onclick="f_member_save();return false;">
							<img src="./resources/images/mbr_btn_reg.jpg"> 
						</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="mbr" onclick="#">
							<img src="./resources/images/mbr_btn_c.jpg">
						</button>
					</td>
				</tr>
			</table>			
		</div>		
	</div>
<div>
<a href="#member" onclick="f_member_list();return false;">목록</a>
</div>

</form>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

<script id="mbrListTemplte" type="text/x-jquery-tmpl">	

{{each mbrList}}		
			<tr>
				<td>아이디</td>
				<td>{{html $value.mbr_id}}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" id="tel1" name="tel1" maxlength="3">
					-<input type="text" id="tel2" name="tel2" maxlength="4">
					-<input type="text" id="tel3" name="tel3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>소속</td>
				<td><input type="text" id=groupId" name="groupId"></td>
			</tr>
{{/each}}

