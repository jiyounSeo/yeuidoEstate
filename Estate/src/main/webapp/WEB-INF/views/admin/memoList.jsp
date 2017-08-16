<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type='text/javascript'>

  function fnPopOpen(){

      $('#divPopup').lightbox_me(); 

 }
</script>
<script type="text/javascript" charset="utf-8">
    $(function() {
    	function launch() {
            $('#divListMemoPopup').lightbox_me({centered: true});
            $('#divAddMemoPopup').lightbox_me({centered: true}); 
    	}
    	
        $('#addMemoBtn').click(function(e) {
            $("#divAddMemoPopup").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
			}});

            e.preventDefault();
        });

        $('#listMemoBtn').click(function(e) {
            $("#divListMemoPopup").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
			}});

            e.preventDefault();
        });

        $('#popCancel1').click(function(e) {
        	$("#divListMemoPopup").trigger('close');
        });
        
        $('#popClose1').click(function(e) {
        	$("#divListMemoPopup").trigger('close');
        });
        $('#popCancel2').click(function(e) {
        	$("#divAddMemoPopup").trigger('close');
        });
        
        $('#popClose2').click(function(e) {
        	$("#divAddMemoPopup").trigger('close');
        });
    });
</script>

<style>


.listMemoPopup,
.addMemoPopup {
	background-color:#fafafa;
	width:900px;
	border:0px;
	padding:0px;
	margin:0px;
	border-collapse:collapse;
}

.listMemoPopup td.content,
.addMemoPopup td.content {
	height:10px;
	text-align:left;
	padding-left:30px;
	padding-right:30px;
	background-image:url("./resources/images/alert_bg2.jpg");
	background-repeat:repeat-y;
}

.listMemoPopup td.btn,
.addMemoPopup td.btn {
	height:30px;
	text-align:right;
	background-image:url("./resources/images/alert_bg2.jpg");
	background-repeat:repeat-y;
}

.addMemoPopup input[type=text] {
    width: 90%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
    vertical-align:20px;
}

.addMemoPopup textarea {
	width:100%;
	border: 1px solid #d3d3d3;
	margin: 5px 0 5px 0;
}

.memoList {
	width:840px;
	border:0px;
	padding:0px;
	margin:0px;
	border-collapse:collapse;
}

.memoList tr {
	background-colro:white;
	border: 1px solid #bfbfbf;
}

.memoList td.subject {
	width:680px;
	height:45px;
	padding-left:20px;
}

.memoList td.date {
	width:160px;
	text-align:center;
}
</style>

<div id="divListMemoPopup" style="display: none;">
	<table class="listMemoPopup">
		<tr><td height="34px" colspan="3"><a href="#" id="popClose1"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content"><img src="./resources/images/alert_memo_title.jpg"></td>
		</tr>
		<tr>
			<td class="content">
			<table class="memoList">
				<tr><td class="subject">tes</td><td class="date">2017.08.15</td></tr>
			</table>
			</td>
		</tr>
		<tr><td class="content" height="10px;"></td></tr>
		<tr><td align="center">paging....</td></tr>
		<tr>
			<td class="btn">
				<a href="#" id="popCancel1"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOk1"><img src="./resources/images/btn_ok.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" colspan="3"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>

<div id="divAddMemoPopup" style="display: none;">
	<table class="addMemoPopup" >
		<tr><td height="34px"><a href="#" id="popClose2"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
		<tr>
			<td class="content">
				<img src="./resources/images/alert_memo_subject_title.jpg"><input type="text">
			</td>
		</tr>
		<tr>
			<td class="content">
				<textarea rows="20" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td class="btn">
				<a href="#" id="popCancel2"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOk2"><img src="./resources/images/btn_ok.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;" ><img src="./resources/images/alert_bottom2.jpg"></td></tr>
	</table>
</div>