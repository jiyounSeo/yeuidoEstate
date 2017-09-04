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

.list_div1,
.list_div2,
.list_div9,
.list_div3 {
	width: 100%;
	background-color: #fff;
}

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
</style>