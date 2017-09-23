<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
    font-family: "Jeju Gothic", sans-serif;
}

.tab_bg {
	display :block;
	width : 100px;
	background-color:#E47501; 
	border-radius:5px 5px 0 0 ;
	height : 25px;
	color : #fff;
	font-size : 20px;
	font-weight : 500;
	text-align : center;
	vertical-align : middle;
	font-family: "Jeju Gothic", sans-serif;
	padding : 12px 10px;
}

.title_txt {
	font-size : 30px;
	font-weight : 500;
	text-align : center;
	vertical-align : middle;
	color : #777d93;
	font-family: "Jeju Gothic", sans-serif;
}


.tab_on_txt {
	display :block;
	background-color :#F6F8F7;
	border:2px solid #989898;
	border-radius:5px 5px 5px 5px ;
	height : 30px;
	color : #fff;
	font-size : 25px;
	font-weight : 500;
	text-align : center;
	vertical-align : middle;
	color : #989898;
	font-family: "Jeju Gothic", sans-serif;
	padding : 12px 10px;
}

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

.list_div1 {		/* ( viewMode : all ) ob_list_back_div */
	height: 560px;
}

.list_div2 {		/* ( viewMode : ob_list_only ) ob_list_back_div */
	height: 850px;
}

.list_div3 {		/* ( viewMode : all ) cl_list_back_div */
	padding-top: 20px;
	height: 430px;
	background-color :#F6F8F7;
}

.list_div9 {		/* ( viewMode : cl_list_only ) cl_list_back_div */
	padding-top: 20px;
	height: 850px;
}


.cl_list,
.ob_list {
	width: 1500px;
	border-collapse:collapse;
	borde: 1px solid #444444;	
}
.list_div {
	background: #f6f8f7;
}
.cl_list .title td,
.ob_list .title1 td,
.ob_list .title2 td,
.ob_list .title3 td,
.ob_list .title4 td,
.ob_list .title5 td,
.ob_list .title6 td{
	height: 60px;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}

.ob_list .title1 td {
	border-bottom: 2px solid #e47501;
	border-top: 2px solid #e47501;
	background: #e47501;
}

.ob_list .title2 td {
	border-bottom: 2px solid #4c97d8;
	border-top: 2px solid #4c97d8;
	background: #4c97d8;
}

.ob_list .title3 td {
	border-bottom: 2px solid #409834;
	border-top: 2px solid #409834;
	background: #409834;
}


.ob_list .title4 td {
	border-bottom: 2px solid #473d3c;
	border-top: 2px solid #473d3c;
	background: #473d3c;
}

.ob_list .title5 td {
	border-bottom: 2px solid #d81e07;
	border-top: 2px solid #d81e07;
	background: #d81e07;
}

.ob_list .title6 td {
	border-bottom: 2px solid #1823b0;
	border-top: 2px solid #1823b0;
	background: #1823b0;
}


.cl_list .title td:last-child,
.ob_list .title1 td:last-child,
.ob_list .title2 td:last-child,
.ob_list .title3 td:last-child,
.ob_list .title4 td:last-child,
.ob_list .title5 td:last-child,
.ob_list .title6 td:last-child {
	border-right: 0px;
}


.cl_list tr,
.ob_list tr {
	background: #f6f6f8;
	border-bottom: none;
}

.cl_list tr:nth-child(even),
.ob_list tr:nth-child(even) {
	background: #fff;
}

.cl_list tr:last-child,
.ob_list tr:last-child {
	border-bottom: 1px solid #b2b2b2;
}

.cl_list td,
.ob_list td {
	height: 45px;
	text-align: center;
	border-right: 1px solid #909090;
}

.cl_list td:last-child,
.ob_list td:last-child {
	border-right: 1px solid #b2b2b2;
}

.cl_list td:first-child,
.ob_list td:first-child {
	border-left: 1px solid #b2b2b2;
}


.cl_list .title td {
	border-bottom: 2px solid #777d93;
	border-top: 2px solid #777d93;
	background: #777d93;
	text-align: center;
}

.add_ob_list {
	width:1500px;
	border-collapse:collapse;
}

.add_ob_list tr {
	border:1px solid #c3c3c3;
}

.add_ob_list td:first-child {
	width:343px;
	padding: 0;
}

.add_ob_list td {
	background: #fff;
	padding-left:80px;
}

.odd_ob_list tr {
	height:64px;
}

.add_ob_list tr:nth-child(even) {
	height:10px;
	border-right:0px;
	border-left:0px;
	background: #f6f8f7;
}

.add_ob_list img {
	border: 0;
}

.add_ob_list a,
.add_ob_list a:hover
.add_ob_list a:active
.add_ob_list a:visited {
	color:black;
}

.add_ob_list a:hover {
	text-decoration: none;
}

.popup_page_container {
	width:400px;
	padding:0;
	margin:auto;
	text-align:left;
}
.popup_page_table {
	width:400px;
	border-collapse:collapse;
	border: 1px solid #b2b2b2;	
}


.new_page_title,
.new_page_container {
	width:1400px;
	padding:0;
	margin:auto;
	text-align:left;
}

.new_page_table {
	width:1400px;
	border-collapse:collapse;
	border: 1px solid #b2b2b2;	
}

.new_page_table tr {
	height:60px;
	background:#fff;
	border-bottom:none;
}

.new_page_table tr:nth-child(even){
	background:#f6f8f7;
}

.new_page_table td {
	padding-left:10px;
	padding-right:10px;
}
.new_page_table td.title {
	width:155px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}
.new_page_table td.title2 {
	width:145px;
	text-align:center;
	background:#d4d4d4;
	color:#000;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}

.new_page_table td.title3 {
	text-align:center;
	background: #00AFB2;
	color:#fff;
	font-weight: bold;
	width:155px;
	border-bottom: 1px solid #fff;
}
.new_page_table td.title4 {
	text-align:left;
	background: #A2A2AA;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
}
.new_page_table td.title_ess {
	width:155px;
	text-align:center;
	background:#0063b1;
	color:#fff;
	font-weight: bold;
	border-bottom: 1px solid #fff;
	text-decoration:underline;
}


/* ie 용 스크롤 바 *********************************************/
html { scrollbar-arrow-color: #efefef;
        scrollbar-Track-Color: #efefef; 
        scrollbar-base-color: #dfdfdf;
        scrollbar-Face-Color: #dfdfdf;
        scrollbar-3dLight-Color: #dfdfdf;         
        scrollbar-DarkShadow-Color: #dfdfdf;
        scrollbar-Highlight-Color: #dfdfdf;
        scrollbar-Shadow-Color: #dfdfdf}
/* Chrome, Safari용 스크롤 바 */
::-webkit-scrollbar {width: 20px; height: 12px;  }
::-webkit-scrollbar-button:start:decrement, 
::-webkit-scrollbar-button:end:increment {display: block; width: 12px;height: 12px; background: url() rgba(0,0,0,.05);}
::-webkit-scrollbar-track {     background: rgba(0,0,0,.05); }
::-webkit-scrollbar-thumb {  background: rgba(0,0,0,.1);  }
/* ------------------------------------------------------------ */
.scrollDiv {
    width: 100%;
    height: 200px;
    overflow: auto;
}

.btn_type1 {
	border-radius:3px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	-ms-border-radius:3px;
	-khtml-border-radius:3px;
	-o-border-radius:3px;
	font-weight:700;
	color:#0d69a1;
	background:#f8fcff;
	border:#629dc1 1px solid;
	padding : 3px 10px 3px 10px;
	height :35px;
	line-height : 1em;
}

.new_page_table td:last-child {
	border-right: 1px solid #b2b2b2;	
}

.new_page_table input[type=text] {
    width: 100%;
    height: 42px;
    padding: 12px 20px;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.new_page_table textarea {
	width:100%;
	border: 1px solid #d3d3d3;
	margin: 5px 0 5px 0;
}

.new_page_table select {
	height:42px;
	border: 1px solid #d3d3d3;
	-webkit-appearance: none; 
	-moz-appearance: none;    
	appearance: none;
	background: url('./resources/images/icon_sel.jpg') no-repeat 100% 50%;	
}

.new_page_table select::-ms-expand {
	display:none;
}

/*
input[type=checkbox].ckbox {
	position:absolute; z-index:-1000; left:-1000px; overflow: hidden; clip: rect(0 0 0 0); height:1px; width:1px; margin:-1px; padding:0; border:0;
}

input[type=checkbox].ckbox + label.ck-label {
	padding-left:30px;
	height:25px; 
	display:inline-block;
	line-height:25px;
	background-repeat:no-repeat;
	background-position: 0 0;
	vertical-align:middle;
	cursor:pointer;
}

input[type=checkbox].ckbox:checked + label.ck-label {
	background-position: 0 -25px;
}
label.ck-label {
	background-image:url(./resources/images/cb1_back.png);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
*/
/* here */

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

input[type="checkbox"],
input[type="radio"] {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;

}
input[type="checkbox"]:hover + label:before,
input[type="radio"]:hover + label:before {
  border-color: #999;
}
input[type="checkbox"]:active + label:before,
input[type="radio"]:active + label:before {
  transition-duration: 0;
  filter: brightness(0.2);
}
input[type="checkbox"] + label,
input[type="radio"] + label {
  position: relative;
  padding-left: 26px;
  font-weight: normal;
}
input[type="checkbox"] + label:before, input[type="checkbox"] + label:after,
input[type="radio"] + label:before,
input[type="radio"] + label:after {
  box-sizing: content-box;
  position: absolute;
  content: '';
  display:inline;
  left: 0;
}
input[type="checkbox"] + label:before,
input[type="radio"] + label:before {
  top: 50%;
  width: 16px;
  height: 16px;
  margin-top: -10px;
  border: 2px solid #d9d9d9;
  text-align: center;
  display: block;
}
input[type="checkbox"] + label:after,
input[type="radio"] + label:after {
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

input[type="radio"]:checked + label:before {
  -moz-animation: borderscale 300ms ease-in;
  -webkit-animation: borderscale 300ms ease-in;
  animation: borderscale 300ms ease-in;
  background-color: #fff;
}
input[type="radio"]:checked + label:after {
  transform: scale(1);
}
input[type="radio"] + label:before, input[type="radio"] + label:after {
  border-radius: 50%;
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
.centerDiv { position:absolute; left:45%; overflow:hidden; }

/*
input[type=radio].rbbox {
	position:absolute;
	z-index:-1000;
	left:-1000px;
	overflow: hidden;
	clip: rect(0 0 0 0);
	height:1px;
	width:1px;
	margin:-1px;
	padding:0;
	border:0;
}

input[type="radio"].rbbox+label.rb-label {
	padding-left:33px;
	height:28px; 
	display:inline-block;
	line-height:28px;
	background-repeat: no-repeat;
	background-position: 0 0;
	vertical-align:middle;
	cursor:pointer;

}

input[type="radio"].rbbox:checked + label.rb-label {
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
}*/

</style>