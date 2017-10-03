<script type="text/javascript" src="./resources/js/list/addObject.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<table style="width:1400px;padding:0;margin:0;border:0">
			<tr>
				<td align="left" width="50%">
					<!-- <a href="#add" onclick="f_add_objectView();return false;"><img src="./resources/images/btn_new_ob.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 -->
					<c:if test="${modifyYn eq 'Y'}">
					<div id="viewObjBot">
						<a href="./modifyObjectInfo.do?objtNo=${objtNo}&objtTp=${objtTp}&pageNm=${pageNm}"><img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image" name="deleteBtn" onclick="f_objt_delete();return false;" src="./resources/images/btn_del.jpg" />
					</div>
					</c:if>
				</td>
				<td align="right">
					<a href="#list" onclick="f_list_view_change();return false;"><input type="image" name="listBtn" src="./resources/images/btn_ob_list.jpg" ></a>
				</td>
			</tr>
		</table>
	</div>
	<input type=hidden name="objtNo" id="objtNo" value="${objtNo}"/>
	<input type=hidden name="objtTp" id="objtTp" value="${objtTp}"/>
	<input type=hidden name="saleTp" id="saleTp" value="${saleTp}"/>
	<input type=hidden name="publicYn" id="publicYn" />
	<input type=hidden name="activeTp" id="activeTp" />
	<input type=hidden name="pageNm" id="pageNm" value="${pageNm}"/>
	