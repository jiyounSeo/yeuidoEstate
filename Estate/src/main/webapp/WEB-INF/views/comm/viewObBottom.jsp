<script type="text/javascript" src="./resources/js/list/addObject.js?v20180203"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
	<div style="height:50px;"></div>
<div class="new_page_container">
	<table class="bottom_btn_table">
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
				<td width="50%" align="right">
					<c:set var="referURL" value="${header.referer}" /><input type="hidden" name="beforUrl" id="beforUrl" value="${referURL}">
					<a href="#list" onclick="f_list_link();return false;"><input type="image" name="listBtn" src="./resources/images/btn_ob_list.jpg" ></a>
				</td>
			</tr>
		</table>
	</div>
	<input type="hidden" id="activeTp" name="activeTp" value="${activeTp}">
	<input type=hidden name="objtNo" id="objtNo" value="${objtNo}"/>
	<input type=hidden name="objtTp" id="objtTp" value="${objtTp}"/>
	<input type=hidden name="saleTp" id="saleTp" value="${saleTp}"/>
	<input type=hidden name="publicYn" id="publicYn" />
	<input type=hidden name="activeTp" id="activeTp" />
	<input type=hidden name="pageNm" id="pageNm" value="${pageNm}"/>
	