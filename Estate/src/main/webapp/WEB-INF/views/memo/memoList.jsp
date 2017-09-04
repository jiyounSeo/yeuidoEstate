
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type='text/javascript'>

  function fnPopOpen(){

      $('#divListMemoPopup').lightbox_me(); 
      $('#divViewMemoPopup').lightbox_me(); 
      $('#divAddMemoPopup').lightbox_me(); 
 }
</script>

<script type="text/javascript" charset="utf-8">
    $(function() {
    	function launch() {
            $('#divListMemoPopup').lightbox_me({centered: true});
        	$("#divViewMemoPopup").lightbox_me({centered: true});
        	$("#divAddMemoPopup").lightbox_me({centered: true});
    	}
    	
        $('#listMemoBtn').click(function(e) {
            $("#divListMemoPopup").lightbox_me({centered: true, onLoad: function() {
			}});
            e.preventDefault();
        });
        $('#newMemoBtn').click(function(e) {

        	$("#divListMemoPopup").trigger('close');
        	
        	$("#divAddMemoPopup").lightbox_me({centered: true, onLoad: function() {
			}});
            e.preventDefault();
        });
        $('#addMemoBtn').click(function(e) {
        	$("#divAddMemoPopup").lightbox_me({centered: true, onLoad: function() {
			}});

            e.preventDefault();
        });
        $('#popCancelList').click(function(e) {
        	$("#divListMemoPopup").trigger('close');
        });
        
        $('#popCloseList').click(function(e) {
        	$("#divListMemoPopup").trigger('close');
        });
        
        $('#popCancelView').click(function(e) {
        	$("#divViewMemoPopup").trigger('close');
        	$("#divListMemoPopup").lightbox_me({centered: true, onLoad: function() {
 			}});
             e.preventDefault();
        });
        
        $('#popCloseView').click(function(e) {
        	$("#divViewMemoPopup").trigger('close');
        });
        
        $('#popCancelAdd').click(function(e) {
        	$("#divAddMemoPopup").trigger('close');
        	$("#divListMemoPopup").lightbox_me({centered: true, onLoad: function() {
 			}});
             e.preventDefault();
        });
        
        $('#popCloseAdd').click(function(e) {
        	$("#divAddMemoPopup").trigger('close');
        });
    });
</script>

<script type="text/javascript" src="./resources/js/memo/listMemo.js"></script>

<div id="divListMemoPopup" style="display: none;">
	<table class="listMemoPopup">
		<tr><td height="34px" colspan="3"><a href="#" id="popCloseList"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content"><img src="./resources/images/alert_memo_title.jpg"></td>
		</tr>
		<tr>
			<td class="content">
			<table class="memoList">
				<tbody id="memoTbody"></tbody>
			</table>
			</td>
		</tr>
		<tr><td class="content" height="10px;"></td></tr>
		<tr><td align="center"><div id="pagingDiv" class="pagination"></div></td></tr>
		<tr>
			<td class="btn">
				<a href="#" id="newMemoBtn"><img src="./resources/images/btn_add.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" colspan="3"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>

<script id="memoListTemplte" type="text/x-jquery-tmpl">	
{{each memoList}}					
	<tr>
		<td class="subject"><a href="#" onClick="f_memoView_select('{{html $value.memoDocId}}')">{{html $value.memoSbj}}</a></td>
		<td class="date">{{html $value.frstRegDt}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="memoListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="2">메모가 존재하지 않습니다.</td>
	</tr>
</script>

<div id="divViewMemoPopup" style="display: none;">
	<table class="viewMemoPopup">
		<tr><td height="34px"><a href="#" id="popCloseView"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content">
				<div id="memoSubject" class="Subject"><img src="./resources/images/alert_memo_subject_title.jpg"></div>
			</td>
		</tr>
		<tr>
			<td class="content"><div id="memoContent" class="Content"></div>
			</td>
		</tr>
		<tr>
			<td><div id="frstRegDt" class="date"></div></td>
		</tr>
		<tr>
			<td class="btn">
				<a href="#" id="popCancelView"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOkView"><img src="./resources/images/btn_ok.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" ><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>

<form id="addMemo" name="addMemo" method="post">
<div id="divAddMemoPopup" style="display: none;">
	<table class="addMemoPopup" >
		<tr><td height="34px"><a href="#" id="popCloseAdd"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content">
				<img src="./resources/images/alert_memo_subject_title.jpg"><input type="text" id="memoSbj" name="memoSbj">
			</td>
		</tr>
		<tr>
			<td class="content">
				<textarea rows="20" cols="50" id="memoCont" name="memoCont"></textarea>
			</td>
		</tr>
		<tr>
			<td class="btn">
				<a href="#" id="popCancelAdd"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_memo_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" ><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>
<input type="hidden" id="memoDocId" name="memoDocId">
</form>