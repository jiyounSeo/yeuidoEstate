<script type="text/javascript" src="./resources/js/list/addObject.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<table style="width:1400px;padding:0;margin:0;border:0">
			<tr>
				<td align="left" width="50%">
					<a href="./addObject"><img src="./resources/images/btn_new_ob.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="./modifyObjectInfo.do?objtNo=${objtNo}&objtTp=${objtTp}">
					<img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="image" name="deleteBtn" onclick="f_objt_delete();return false;" src="./resources/images/btn_del.jpg" />
				</td>
				<td align="right">
					<c:if test="${list_url != null }">
						<a href="${list_url}"><img src="./resources/images/btn_ob_list.jpg"></a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>