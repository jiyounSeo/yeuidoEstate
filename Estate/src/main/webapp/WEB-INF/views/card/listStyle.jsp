<style>

.new_page_title,
.new_page_container {
	width:1500px;
	padding:0;
	margin:auto;
	text-align:left;
}

.search_ob_table,
.new_page_table {
	width:1500px;
	border-collapse:collapse;
	border: 1px solid #b2b2b2;	
}

.search_ob_table_head {
	width:1500px;
	border-collapse:collapse;
	border:0;
	padding:0;
	margin:0;
	background-color:#55555d;
	color:#fff;
}
.search_ob_table_head tr {
	height:60px;
}
.search_ob_table tr,
.new_page_table tr {
	height:60px;
	background:#fff;
	border-bottom:none;
}


.search_ob_table tr:nth-child(even),
.new_page_table tr:nth-child(even){
	background:#f6f8f7;
}

.new_page_table td.title {
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}
.new_page_table td.title2 {
	width:74px;
	text-align:center;
	background:#d4d4d4;
	color:#000;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}
.new_page_table td.title3 {
	text-align:center;
	background:#00afb2;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}

.search_ob_table .result,
.new_page_table .work {
	overflow-y:auto; 
	overflow-x:hidden; 
	display:block; 
	max-height:200px;
}

.new_page_table .work td {
	text-align:left;
	padding-left:10px;
	padding-right:10px;
}

.new_page_table .work td:first-child {
	border-right:1px solid #b2b2b2;
}

.new_page_table td{
	text-align:center;
}

.new_page_table td.search_btn{
	background-color:#464646;
	color:white;
	font-weight: bold;
}

.new_page_table td.del_btn{
	background-color:#dbdbdb;
	color:#0063b1;
	text-align:center;
	font-weight:bold;
}

.new_page_table td:last-child {
	border-right: 1px solid #b2b2b2;	
}

.new_page_table input[type=text] {
    width: 95%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.new_page_table textarea {
	width:95%;
	border: 1px solid #d3d3d3;
	margin: 5px 0 5px 0;
}

.new_page_table select {
	height:42px;
	border: 1px solid #d3d3d3;
	-webkit-appearance: none; 
	-moz-appearance: none;    
	appearance: none;
	background: url('./images/icon_sel.jpg') no-repeat 100% 50%;	
}

.new_page_table select::-ms-expand {
	display:none;
}

input[type=checkbox].ckbox {
	position:absolute; z-index:-1000; left:-1000px; overflow: hidden; clip: rect(0 0 0 0); height:1px; width:1px; margin:-1px; padding:0; border:0;
}

input[type=checkbox].ckbox + label.ck-label {
	padding-left:30px;
	height:25px; 
	display:inline-block;
	line-height:25px;
	background-repeat:no-repeat;
	background-position: 0 0;
	vertical-align:middle;
	cursor:pointer;
}

input[type=checkbox].ckbox:checked + label.ck-label {
	background-position: 0 -25px;
}
label.ck-label {
	background-image:url(./images/cb1_back.png);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input[type=radio].rbbox {
	position:absolute; z-index:-1000; left:-1000px; overflow: hidden; clip: rect(0 0 0 0); height:1px; width:1px; margin:-1px; padding:0; border:0;
}

input[type=radio].rbbox + label.rb-label {
	padding-left:33px;
	height:28px; 
	display:inline-block;
	line-height:28px;
	background-repeat:no-repeat;
	background-position: 0 0;
	vertical-align:middle;
	cursor:pointer;

}

input[type=radio].rbbox:checked + label.rb-label {
	background-position: 0 -28px;
}
label.rb-label {
	background-image:url(./images/rb_back.png);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}


</style>