<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
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

.trCategory td {
	font-size:7pt;
	padding: 10px;
	background: linear-gradient(#f4f5f9,#eaedf1) fixed;
	border-bottom: 1px solid #cccccc;
	border-right:  1px solid #cccccc;
	border-left:  1px solid #cccccc;
}

.trCategory a:link, a:visited {
	font-size:9pt;
}

.objtListTrHeader tr {
	border:0px;
}
.objtListTrHeader td {
	height:33px;
	text-align:center;
	color:#757575;
	background-color:#fafafa;
	border-collapse: collapse;
	padding:0px;
	border-top: 2px solid #808080;
	border-bottom: 1px solid #cccccc;
	font-size:10pt;
}

.objtListTrHeader span.orderTitle {
	font-weight:bold;
	text-decoration:underline;
	cursor:pointer;
}

.objtListTrBody tr{
	cursor:pointer;
	height:65px;
	background-color:#fcfcfc;
}
.objtListTrBody tr:nth-child(even){
	background-color:#ffffff;
}
.objtListTrBody tr:hover{
	background-color: #eeeeee;
}


.objtListTrBody td{
	font-size:10pt;
	text-align:center;
	border-bottom: 1px solid #cccccc;
}

.objtListTrBody td.obName{
	text-align:left;
	padding-left:20px;
}

td.orderMenu {
	width:670px;
	height:30px;
	text-align:right;
}

td.nav {
	font-size:10pt;
	width:300px;
	height:30px;
	text-align:left;
	padding-left:5px;
	font-weight:bold;
}

span.obPrice, 
div.obPrice {
	font-weight:bold;
}

.orderMenu a:link, a:visited {
	font-size:9pt;
}

div.nameBox {
	margin-bottom:5px;
}
span.bdName {
	color:#3d79cc;
	text-decoration : underline;
}


/* detail css */

.ob_detail td {
	border: 1px solid #f2f2f2;
	font-size:10pt;
}

.ob_detail td.title {
	border-top: 2px solid #52596b;
	border-bottom: 1px solid #cccccc;
	background-color:#f8f8fa;
	height:70px;
	padding-left:20px;
}

.ob_detail span.obTitle {
	font-size:20px;
	font-weight:bold;
}
.ob_detail span.areaText1 {
	font-size:12px;
	color:#5d5f66;
}
.ob_detail span.areaText2 {
	font-size:12px;
	color:#8f8f8f;
}
.ob_detail span.areaValue {
	font-size:25px;
	font-weight:bold;
}

.ob_detail span.priceValue {
	font-size:25px;
	font-weight:bold;
	color:#ff2200;
}

.ob_detail span.bar {
	font-size:25px;
	color:#b3b3b3;
}

.mapInfo {
	border:1px solid #cccccc;
}

.mapInfo td.addrText {
	background-color:#fafafa;
	height:30px;
	font-size:10pt;
	padding-left:10px;
}

.ob_detail2 td.title {
	height:40px; 
	width:90px;
	padding-left:15px;
	color:#757575;
	font-size:10pt;
	border-bottom: 1px solid #f2f2f2;
}

.ob_detail2 td.title:first-child {
	border-left:1px solid #f2f2f2;
}

.ob_detail2 td.value:last-child {
	border-right:1px solid #f2f2f2;
}

.ob_detail2 td.value {
	height:40px; 
	width:152.5px;
	color:#000000;
	font-size:10pt;
	border-bottom: 1px solid #f2f2f2;
}

.ob_detail2 span.estateTelText {
	font-size:10pt;
	color:#6585d6;
	font-weight:bold;
}

td.detail_text {
	color: #333333;
	font-size:10pt;	
	font-weight:bold;
	height:35px;
	border-bottom: 1px solid #9fa2a9;
}


td.detail_descript {
	padding:10px;
	background-color:#fdfdfd;
	border-bottom: 1px solid #e1e1e1;
}


.objtCommInfo td.space {
	width: 20px;
	border:0;
}

.objtCommInfo td.title1 {
	width:110px;
	height:30px;
	background-color:fafafa;
	padding-left:10px;
	font-size:10pt;
	color:#757575;
}

.objtCommInfo td.title2 {
	width:130px;
	height:25px;
	background-color:fafafa;
	padding-left:10px;
	font-size:10pt;
	color:#757575;
}

.objtCommInfo td.info {
	background-color:ffffff;
	padding-left:10px;
	font-size:10pt;
	color:#323232;
}

.map_info_pop {
	width:100%;
	font-size:12px;
}
.map_info_pop td.dataText {
	height:20px;
	padding-left:17px;
}
.map_info_pop td.titleText {
	background-color:#fafafa;
	color:#3f3f3f;
	height:35px;
	padding-left:17px;
}

.obNum a:link,
.obNum a:visited {
	color:#ff943f;
}

</style>