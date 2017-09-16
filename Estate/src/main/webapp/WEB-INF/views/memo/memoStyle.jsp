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

.viewMemoPopup,
.listMemoPopup,
.addMemoPopup {
	background-color:#fafafa;
	width:900px;
	border:0px;
	padding:0px;
	margin:0px;
	border-collapse:collapse;
}

.viewMemoPopup td.content,
.listMemoPopup td.content,
.addMemoPopup td.content {
	height:10px;
	text-align:left;
	padding-left:30px;
	padding-right:30px;
	background-image:url("./resources/images/alert_bg2.jpg");
	background-repeat:repeat-y;
}

.viewMemoPopup td.btn,
.listMemoPopup td.btn,
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
	margin: 5px 0 5px 0;
}

.memoList {
	width:840px;
	border:0px;
	padding:0px;
	margin:0px;
	border-collapse:collapse;
}

.memoList tr {
	background-colro:white;
	border: 1px solid #bfbfbf;
}

.memoList td.subject {
	width:680px;
	height:45px;
	padding-left:20px;
}

.memoList td.date {
	width:160px;
	text-align:center;
}

.dtlDate {
	padding-left:30px;
	padding-bottom:20px;
	margin-top:10px;
	width:840px;
	text-align:right;
}

.memoCont {
	padding-left:20px;
	padding-top:10px;
	margin-top:10px;
	width:840px;
	height:300px;
	border: 1px solid #bfbfbf;
	
}
.btn_delType {
	border-radius:3px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	-ms-border-radius:3px;
	-khtml-border-radius:3px;
	-o-border-radius:3px;
	font-weight:700;
	color:#ee513e;
	background:#fff;
	border:#ee4d3c 1px solid;
	padding : 3px 10px 3px 10px;
	height :35px;
	line-height : 1em;
}


.contentTitle {
	color : #609DCE;
	font-weight:600;
}
</style>