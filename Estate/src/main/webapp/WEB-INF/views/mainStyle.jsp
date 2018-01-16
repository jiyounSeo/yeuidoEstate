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

.objtListTrBody tr{
	cursor:pointer;
	height:60px;
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
	height:30px;
	text-align:right;
}

span.obPrice, 
div.obPrice {
	font-weight:bold;
}

.orderMenu a:link, a:visited {
	font-size:9pt;
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
	font-size:16px;
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
</style>