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
        
        $('#popOk').click(function(e) {
        	 var param = {
        			 taskDocId : $("#taskDocId").val()
        	    	};
        	 $.ajax({
        	  	  url : "/deleteLogbook.do",
        	  	  type: "post",
        		  data : param,
        	  	  dataType : "json",
        	  	  contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        	  	  success : function(result){
        	  		 location.href="./logbookListView.do";
        	  	  }
       	  	  });
        });
    });
</script>

<style>
.lbList {
	width: 550px;
	border-collapse:collapse;
}
.lbList tr {
	background: #f6f6f8;
	border-bottom: 0px;
	border-right: 1px solid #b2b2b2;	
}
.lbList tr:nth-child(even) {
	background: #fff;
}
.lbList tr:last-child {
	border-bottom:1px solid #b2b2b2;
}
.lbList td.title{
	height: 40px;
	background-color:#0063b1;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}
.lbList td {
	height:40px;
	text-align:center;
	border-left: 1px solid #b2b2b2;
}


</style>


<div id="divPopup" style="display: none;">
	<table style="background-color:#fafafa;width:615px;height:338px;border:0px;padding:0px;margin:0px;" cellpadding="0" cellspacing="0">
		<tr><td height="34px"><a href="#" id="popClose"><img src="./resources/images/alert_close.jpg"></a></td></tr>
		<tr><td height="10px"></td></tr>
		<tr><td style="background-color:#fafafa;" align="center" id="lb_list" valign="top"></td></tr>
		<tr><td height="23px;"><img src="./resources/images/alert_bottom.jpg"></td></tr>
	</table>
</div>