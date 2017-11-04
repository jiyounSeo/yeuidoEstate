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

.new_page_container {
	width:1500px;
	padding:0;
	margin:auto;
	text-align:left;
}

.report,
.new_report_table {
	width: 1460px;
	border-collapse:collapse;
}

.new_report_table tr,
.report tr {
	background: #f6f6f8;
	border-bottom: 0px;
	border-right: 1px solid #b2b2b2;	
}

.new_report_table tr:nth-child(even),
.report tr:nth-child(even) {
	background: #fff;
}

.new_report_table tr:first-child{
	border-top: 1px solid #b2b2b2;	
}

.new_report_table tr:last-child,
.new_report_table tr:last-child td.title{

	border-bottom: 1px solid #b2b2b2;	
}

.report tr:last-child {
	border-bottom:1px solid #b2b2b2;
}

.report tbody tr:hover {
  background-color: #eeeeee;
}
.report .title td{
	height: 50px;
	background-color:#0063b1;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}

.report td {
	height:50px;
	text-align:center;
	border-left: 1px solid #b2b2b2;
}


.new_report_table td.title{
	height:50px;
	width:155px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}

.new_report_table td{
	padding-left:5px;
	padding-right:5px;
}

.new_report_table td.sub{
	padding-left:0px;
	padding-right:5px;
}


.new_report_table input[type=text] {
    width: 100%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.new_report_table .sub_table{
	width:580px;
	border:0px;
	margin:0;
	padding:0;
	background-color : transparent;
}

.new_report_table .sub_table tr{
	border:0px;
	background-color : transparent;
}

.new_report_table .sub_table td{	
	border:0px;
	padding-right:0px;
	background-color : transparent;
}

.new_report_table .sub_table td.title2{
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
	background-image:url(./resources/images/rb_back.png);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
</style>