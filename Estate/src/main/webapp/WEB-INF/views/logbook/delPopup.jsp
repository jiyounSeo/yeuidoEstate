
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type='text/javascript'>

  function fnPopOpen(){

      $('#divPopup').lightbox_me(); 

 }
</script>
<script type="text/javascript" charset="utf-8">
    $(function() {
        function launch() {
             $('#divPopup').lightbox_me({centered: true});
        }
        
        $('#delBtn').click(function(e) {
            $("#divPopup").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
			}});

            e.preventDefault();
        });

        $('#popCancel').click(function(e) {
        	$("#divPopup").trigger('close');
        });
        
        $('#popClose').click(function(e) {
        	$("#divPopup").trigger('close');
        });
    });
</script>


<div id="divPopup" style="display: none;">
	<table style="background-color:#fafafa;width:615px;height:338px;border:0px;padding:0px;margin:0px;" cellpadding="0" cellspacing="0">
		<tr><td height="34px"><a href="#" id="popClose"><img src="./resources/images/alert_close.jpg"></a></td></tr>
		<tr><td height="233px"><img src="./resources/images/alert_logbook_del.jpg"></td></tr>
		<tr>
			<td align="right" style="background-color:#fafafa;height:48px;background-image:url('./resources/images/alert_bg.jpg');background-repeat:repeat-y;">
				<a href="#" id="popCancel"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="popOk"><img src="./resources/images/btn_ok.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr><td height="23px;"><img src="./resources/images/alert_bottom.jpg"></td></tr>
	</table>
</div>