<style>
.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.addMemoPopup {
	background-color:#fafafa;
	width:900px;
	border:0px;
	padding:0px;
	margin:0px;
	border-collapse:collapse;
}

.addMemoPopup td.content {
	height:10px;
	text-align:left;
	padding-left:30px;
	padding-right:30px;
	background-image:url("./resources/images/alert_bg2.jpg");
	background-repeat:repeat-y;
}

.addMemoPopup td.title {
	width:140px;
	height:47px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
	padding-left:30px;
	padding-right:30px;
}

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
	width:99%;
	border: 1px solid #d3d3d3;
	margin: 5px 0 5px 0;
}
.new_page_title,
.new_page_container {
	width:1500px;
	padding:0;
	margin:auto;
	text-align:left;
}

.memo,
.new_memo_table {
	width: 1460px;
	border-collapse:collapse;
}

.new_memo_table tr,
.memo tr {
	background: #fff;
	border-bottom: 0px;
	border-right: 1px solid #b2b2b2;	
	border-left: 1px solid #b2b2b2;	
}

.new_memo_table tr:nth-child(even),
.memo tr:nth-child(even) {
	background: #f6f6f8;
}

.new_memo_table tr:first-child{
	border-top: 1px solid #b2b2b2;	
}

.new_memo_table tr:last-child,
.new_memo_table tr:last-child td.title{

	border-bottom: 1px solid #b2b2b2;	
}

.memo tr:last-child {
	border-bottom:1px solid #b2b2b2;
}

.memo .title td{
	height: 50px;
	background-color:#0063b1;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}

.memo td {
	height:50px;
	text-align:center;
	border-left: 1px solid #b2b2b2;
}


.new_memo_table td.title{
	height:50px;
	width:155px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}

.new_memo_table td{
	padding-left:5px;
	padding-right:5px;
}

.new_memo_table td.sub{
	padding-left:0px;
	padding-right:5px;
}



.new_memo_table td.content{
	height:500px;
	background:#fff;
	border-top: 1px solid #909090;
	valign:top;
	padding:20px;
}

.new_memo_table td.content_edit{
	height:500px;
	background:#fff;
	border-top: 1px solid #909090;
	valign:top;
	padding:20px;
}
.new_memo_table input[type=text] {
    width: 100%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.new_memo_table .sub_table{
	width:580px;
	border:0px;
	margin:0;
	padding:0;
	background-color : transparent;
}

.new_memo_table .sub_table tr{
	border:0px;
	background-color : transparent;
}

.new_memo_table .sub_table td{	
	border:0px;
	padding-right:0px;
	background-color : transparent;
}

.new_memo_table .sub_table td.title2{
	height:50px;
	border:0px;
	padding:0px;
	background-color : #d4d4d4;
	color:black;
	text-align:center;
	font-weight: bold;
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