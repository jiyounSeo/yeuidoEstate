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
</style>