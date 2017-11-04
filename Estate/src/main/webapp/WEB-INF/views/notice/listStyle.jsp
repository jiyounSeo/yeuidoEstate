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

.new_page_title,
.new_page_container {
	width:1500px;
	padding:0;
	margin:auto;
	text-align:left;
}

.notice,
.new_notice_table {
	width: 1460px;
	border-collapse:collapse;
}

.new_notice_table tr,
.notice tr {
	background: #fff;
	border-bottom: 0px;
	border-right: 1px solid #b2b2b2;	
	border-left: 1px solid #b2b2b2;	
}

.new_notice_table tr:nth-child(even),
.notice tr:nth-child(even) {
	background: #f6f6f8;
}

.new_notice_table tr:first-child{
	border-top: 1px solid #b2b2b2;	
}

.new_notice_table tr:last-child,
.new_notice_table tr:last-child td.title{

	border-bottom: 1px solid #b2b2b2;	
}

.notice tr:last-child {
	border-bottom:1px solid #b2b2b2;
}


.notice tbody tr:hover {
  background-color: #eeeeee;
}

.notice .title td{
	height: 50px;
	background-color:#0063b1;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}

.notice td {
	height:50px;
	text-align:center;
	border-left: 1px solid #b2b2b2;
}


.new_notice_table td.title{
	height:50px;
	width:155px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}

.new_notice_table td{
	padding-left:5px;
	padding-right:5px;
}

.new_notice_table td.sub{
	padding-left:0px;
	padding-right:5px;
}



.new_notice_table td.content{
	height:500px;
	background:#fff;
	border-top: 1px solid #909090;
	valign:top;
	padding:20px;
}

.new_notice_table td.content_edit{
	height:500px;
	background:#fff;
	border-top: 1px solid #909090;
	valign:top;
	padding:20px;
}
.new_notice_table input[type=text] {
    width: 100%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.new_notice_table .sub_table{
	width:580px;
	border:0px;
	margin:0;
	padding:0;
	background-color : transparent;
}

.new_notice_table .sub_table tr{
	border:0px;
	background-color : transparent;
}

.new_notice_table .sub_table td{	
	border:0px;
	padding-right:0px;
	background-color : transparent;
}

.new_notice_table .sub_table td.title2{
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