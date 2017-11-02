<style>
@import url(http://fonts.googleapis.com/css?family=Droid+Sans+Mono);

.noselect {
  -webkit-user-select: none;
  /* Chrome/Safari */
  -moz-user-select: none;
  /* Firefox */
  -ms-user-select: none;
  /* IE10+ */
}
.cal1 h4 {
  width: 75%;
  text-align: center;
  font-family: 'Droid Sans Mono';
  font-weight: normal;
  color: white;
  font-size: 14px;
  margin: 0 auto 1em auto;
  padding: 1em;
  background: #b63642;
}
.cal1 h5 {
  font-size: 1em;
  font-weight: bold;
}
.cal1 p {
  text-align: center;
  font-family: 'Droid Sans Mono';
  margin: 3em auto 1em auto;
  padding-top: 0.5em;
  padding-bottom: 0.5em;
  border-bottom: 2px solid #414141;
  background: #f4f4f4;
}
.left-align {
  text-align: left;
}
.right-align {
  text-align: right;
}
.cal1 {
  max-width: 1103px;
  font-family: 'Droid Sans Mono';
}
.cal1 .clndr .clndr-controls {
  display: inline-block;
  width: 100%;
  position: relative;
  margin:0 auto;
  height:44px;
  background-image: url("./resources/images/cal_top_bg.jpg");
  background-repeat: repeat-x;
}
.cal1 .clndr .clndr-controls .month {
  float: left;
  width: 33%;
  text-align: center;
  height:44px;
  padding-top: 12px;
  font-size: 18px;
  color: #fff;
  font-weight: bold;
  cursor: pointer;
}
.cal1 .clndr .clndr-controls .clndr-control-button {
  float: left;
  width: 33%;
  padding-top: 7px;
}
.cal1 .clndr .clndr-controls .clndr-control-button.rightalign {
  text-align: right;
  width: 34%;
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-next-button {
  cursor: pointer;
  padding-right:20px;
  -webkit-user-select: none;
  /* Chrome/Safari */
  -moz-user-select: none;
  /* Firefox */
  -ms-user-select: none;
  /* IE10+ */
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-next-button:hover {

}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-next-button.inactive {
  opacity: 0.5;
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-next-button.inactive:hover {
  background: none;
  cursor: default;
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-previous-button {
  cursor: pointer;
  padding-left:20px;
  -webkit-user-select: none;
  /* Chrome/Safari */
  -moz-user-select: none;
  /* Firefox */
  -ms-user-select: none;
  /* IE10+ */
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-previous-button:hover {
  
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-previous-button.inactive {
  opacity: 0.5;
}
.cal1 .clndr .clndr-controls .clndr-control-button .clndr-previous-button.inactive:hover {
  background: none;
  cursor: default;
}
.cal1 .clndr .clndr-table {
  table-layout: fixed;
  width: 100%;
}
.cal1 .clndr .clndr-table .header-days {
  height: 30px;
  font-size: 15px;
  background: #605e5f;
}
.cal1 .clndr .clndr-table .header-days .header-day {
  vertical-align: middle;
  text-align: center;
  color: #fff;
}
.cal1 .clndr .clndr-table .header-days .header-day:last-child {
  border-right: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr {
  height: 96px;
  background: #fff;
}

.cal1 .clndr .clndr-table tr:nth-child(even) {
  background: #efefef;
}

.cal1 .clndr .clndr-table tr td {
  vertical-align: top;
}
.cal1 .clndr .clndr-table tr .day {
  width: 100%;
  height: inherit;
  font-weight: bold;
  color: #363435;
}
.cal1 .clndr .clndr-table tr .day:hover {
  background: #b7b7b7;
}
.cal1 .clndr .clndr-table tr .day.today,
.cal1 .clndr .clndr-table tr .day.my-today {
	color: #fff;
}

.cal1 .clndr .clndr-table tr .day.today div.day-contents,
.cal1 .clndr .clndr-table tr .day.my-today div.day-contents {
	cursor: pointer;
	color: #fff;
	background:#0063af;
	border-radius:50%;
	width:30px;
	height:30px;
	margin:4px auto;
	padding-left:6px;
	padding-top:7px;
}

.cal1 .clndr .clndr-table tr .day.event div,
.cal1 .clndr .clndr-table tr .day.my-event div {
	cursor: pointer;
	color: #00af31;
	text-decoration:underline;
	width:30px;
	height:30px;
	margin:4px auto;
	padding-left:6px;
	padding-top:7px;
}

.cal1 .clndr .clndr-table tr .day.inactive,
.cal1 .clndr .clndr-table tr .day.my-inactive {
  background: #ddd;
}
.cal1 .clndr .clndr-table tr .day:first-child {
  border-left: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr .day:last-child {
  border-right: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr .day .day-contents {
  box-sizing: border-box;
  padding: 10px;
  font-size: 14px;
  text-align: center;
}

.cal1 .clndr .clndr-table tr .day .day-events {
  box-sizing: border-box;
  font-size: 12px;
  text-align: center;	
}

.cal1 .clndr .clndr-table tr .day.event div.day-events,
.cal1 .clndr .clndr-table tr .day.my-event div.day-events  {
	width:100%;
	cursor: pointer;
	text-decoration:none;
	color: #7c7c7c;	
}

.cal1 .clndr .clndr-table tr .day.today div.day-events,
.cal1 .clndr .clndr-table tr .day.my-today div.day-events {
	width:100%;
	cursor: pointer;
	text-decoration:none;
	color: #246eb7;	
}

.cal1 .clndr .clndr-table tr .empty,
.cal1 .clndr .clndr-table tr .adjacent-month,
.cal1 .clndr .clndr-table tr .my-empty,
.cal1 .clndr .clndr-table tr .my-adjacent-month {
  width: 100%;
  height: inherit;
  background: #fff;
  color: #c9c9c9;
}
.cal1 .clndr .clndr-table tr:nth-child(even) .empty,
.cal1 .clndr .clndr-table tr:nth-child(even) .adjacent-month,
.cal1 .clndr .clndr-table tr:nth-child(even) .my-empty,
.cal1 .clndr .clndr-table tr:nth-child(even) .my-adjacent-month {
  background: #efefef;
}

.cal1 .clndr .clndr-table tr .empty:hover,
.cal1 .clndr .clndr-table tr .adjacent-month:hover,
.cal1 .clndr .clndr-table tr .my-empty:hover,
.cal1 .clndr .clndr-table tr .my-adjacent-month:hover {
  background: #ddd;
}
.cal1 .clndr .clndr-table tr .empty:last-child,
.cal1 .clndr .clndr-table tr .adjacent-month:last-child,
.cal1 .clndr .clndr-table tr .my-empty:last-child,
.cal1 .clndr .clndr-table tr .my-adjacent-month:last-child {
  border-right: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr .empty:first-child,
.cal1 .clndr .clndr-table tr .adjacent-month:first-child,
.cal1 .clndr .clndr-table tr .my-empty:first-child,
.cal1 .clndr .clndr-table tr .my-adjacent-month:first-child {
  border-left: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr:last-child .day,
.cal1 .clndr .clndr-table tr:last-child .my-day {
  border-bottom: 1px solid #b2b2b2;
}
.cal1 .clndr .clndr-table tr:last-child .empty,
.cal1 .clndr .clndr-table tr:last-child .my-empty {
  border-bottom: 1px solid #b2b2b2;
}
.clndr-next-button,
.clndr-previous-button,
.clndr-next-year-button,
.clndr-previous-year-button {
  -webkit-user-select: none;
  /* Chrome/Safari */
  -moz-user-select: none;
  /* Firefox */
  -ms-user-select: none;
  /* IE10+ */
}
.clndr-next-button.inactive,
.clndr-previous-button.inactive,
.clndr-next-year-button.inactive,
.clndr-previous-year-button.inactive {
  opacity: 0.5;
  cursor: default;
}

.work div{
	width:1085px;
}

.work table {
	width:1085px;
}
.work tr {
  height: 45px;
  background: #fff;
}
.work tr:nth-child(even) {
  background: #efefef;
}

.work td {
	padding-left: 30px;
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
	width:99%;
	border: 1px solid #d3d3d3;
	margin: 5px 0 5px 0;
}

.directionBox {
	width:90%;
	border:1px dashed #d3d3d3;
	padding:5px;
	margin:5px 0 5px 0;
	text-align:left;
}

.directionBox table td {
	padding: 3px 0 3px 0;
}
.directionBox table td.isDo {
	border-right: 1px solid #d3d3d3;
	width:85px;
	padding : 0;
}

.directionBox table td.todoCont {
	padding : 0 10px 0 10px;
}


</style>