	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<table style="width:1400px;padding:0;margin:0;border:0">
			<tr>
				<td align="left" width="50%">
					<a href="./addObject"><img src="./resources/images/btn_new_ob.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="./modifyObject"><img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="./deleteObjt"><img src="./resources/images/btn_del.jpg"></a>
				</td>
				<td align="right">
					<c:if test="${list_url != null }">
						<a href="${list_url}"><img src="./resources/images/btn_ob_list.jpg"></a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>