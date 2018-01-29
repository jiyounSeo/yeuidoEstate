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

.scrollDiv tbody tr:hover {
  background-color: #eeeeee;
}


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
	width:100%;
	border: 1px solid #d3d3d3;
	padding: 12px 20px;
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

.memo tbody tr:hover {
  background-color: #eeeeee;
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



input[type="checkbox"] {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;

}
input[type="checkbox"]:hover + label:before {
  border-color: #999;
}
input[type="checkbox"]:active + label:before {
  transition-duration: 0;
  filter: brightness(0.2);
}
input[type="checkbox"] + label {
  position: relative;
  padding-left: 26px;
  font-weight: normal;
}
input[type="checkbox"] + label:before, input[type="checkbox"] + label:after {
  box-sizing: content-box;
  position: absolute;
  content: '';
  display:inline;
  left: 0;
}
input[type="checkbox"] + label:before {
  top: 50%;
  width: 16px;
  height: 16px;
  margin-top: -10px;
  border: 2px solid #d9d9d9;
  text-align: center;
  display: block;
}
input[type="checkbox"] + label:after {
  background-color: #00bad2;
  top: 50%;
  left: 6px;
  width: 8px;
  height: 8px;
  margin-top: -4px;
  transform: scale(0);
  transform-origin: 50%;
  transition: transform 200ms ease-out;
}

input[type="checkbox"] + label:after {
  background-color: transparent;
  top: 50%;
  left: 5px;
  width: 7px;
  height: 4px;
  margin-top: -5px;
  border-style: solid;
  border-color: #00bad2;
  border-width: 0 0 3px 3px;
  -moz-transform: rotate(-45deg) scale(0);
  -ms-transform: rotate(-45deg) scale(0);
  -webkit-transform: rotate(-45deg) scale(0);
  transform: rotate(-45deg) scale(0);
  -moz-transition: none;
  -o-transition: none;
  -webkit-transition: none;
  transition: none;
}
input[type="checkbox"]:checked + label:before {
  -moz-animation: borderscale 200ms ease-in;
  -webkit-animation: borderscale 200ms ease-in;
  animation: borderscale 200ms ease-in;
}
input[type="checkbox"]:checked + label:after {
  content: '';
  -moz-transform: rotate(-45deg) scale(1);
  -ms-transform: rotate(-45deg) scale(1);
  -webkit-transform: rotate(-45deg) scale(1);
  transform: rotate(-45deg) scale(1);
  -moz-transition: -moz-transform 200ms ease-out;
  -o-transition: -o-transform 200ms ease-out;
  -webkit-transition: -webkit-transform 200ms ease-out;
  transition: transform 200ms ease-out;
}


</style>