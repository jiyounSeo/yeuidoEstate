<%@ include file="/WEB-INF/views/comm/header.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<style>
	input[type=text].mbr_txt 
	{
	    width: 100%;
	    padding: 12px 20px;
	    margin: 0;
	    box-sizing: border-box;
	    border: none;
	    border-bottom: 2px solid #88b95d;
	    background-color: rgba(255, 0, 0, 0);
	}
	input[type=password].mbr_pw
	{
	    width: 100%;
	    padding: 12px 20px;
	    margin: 0;
	    box-sizing: border-box;
	    border: none;
	    border-bottom: 2px solid #88b95d;
	    background-color: rgba(255, 0, 0, 0);
	}
	
	input[type=text].mbr_phone
	{
	    width: 30%;
	    padding: 12px 20px;
	    margin: 0;
	    box-sizing: border-box;
	    border: none;
	    border-bottom: 2px solid #88b95d;
	    background-color: rgba(255, 0, 0, 0);
	}
	
	select.mbr_sel
	{
	    width: 100%;
	    padding: 16px 20px;
	    border: none;
	    border-radius: 4px;
	    background-color: #f1f1f1;
	}
	
	button.mbr
	{
		padding:0;
		margin:0;
		border: none;
	    background-color: rgba(255, 0, 0, 0);
	    cursor:pointer;
	}
	
	td.mbr_mem
	{
		text-align: center;
		vertical-align: middle;
		height:55px;
		border:none;
	    border-bottom: 1px solid #989898;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	if( '${sessionScope.user.mbrId}' != null && '${sessionScope.user.mbrId}' != ''){
		$("#hrefId").attr('href','./index.do');
		$("#hrefId2").attr("href", "./adminMainView.do")
	}
});

</script>
<body style="margin:0; background-color: #fffff">  
<div style="width:100%;margin:auto;padding:0;background:url('/resources/images/bg.jpg');background-repeat:repeat-x;">	
	<div style="width:970px; text-align:left; margin:auto; padding:0;background-color:#393939;background:url('/resources/images/bg.jpg');background-repeat:repeat-x;">		
		<table width="100%" height="121px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td align="center" background="./resources/images/bg.jpg"  style="background-repeat:repeat-x;margin: 0; padding: 0; height: 121px;">
					<a id="hrefId" href="./"><img src="./resources/images/logo.jpg" style="height: 121px; border: 0" /></a>
				</td>		
			</tr>
			<tr>
				<td style="height:30px;" align="right" valign="middle">
					<div style="margin-top:-65px;"><a id="hrefId2" href='./loginView.go'><img src="./resources/images/admin_button.png"></a></div>
				</td>
			</tr>
		</table>
	</div>
</div>