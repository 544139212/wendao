<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="pager" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
  <head>
    <title>主页</title>
    
    <link href="/css/bootstrap.min.css" rel="stylesheet">
	<script src="/js/jquery.js"></script>
    <link href="/css/index2/index2.css" rel="stylesheet">
	<script src="/js/index2/mask-layer.js"></script>

	<style type="text/css">
	ul, ol, li {
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	</style>
	
	<style type="text/css">
	.li-table {
		display: table;
	}
	
	.li-table li {
		width: 237px;height: 119px;line-height: 119px;text-align:center;margin-right: -1px;margin-bottom:-1px;
		float: left;border: 1px solid #F2F2F2;overflow: hidden;
		/* -webkit-box-shadow:0 2px 2px #f2f2f2;-moz-box-shadow:0 2px 2px #f2f2f2;box-shadow:0 2px 2px #f2f2f2; */
	}
	</style>
	
	<style type="text/css">
	.alert100 {
		margin-right: -12px;float:left;min-width: 100%;
	}
	
	.alert100 li {
		width: 307px;height:150px;line-height:150px;text-align:center;margin-right: 12px;
		float:left;border-radius: 3px;
	}
	
	.message1 {
		background: none repeat scroll 0% 0% #F5FFE8;border: 1px solid #C2FF68;
	}
	
	.message2 {
		background: none repeat scroll 0% 0% #FFECEC;border: 1px solid #FFD2D2;
	}
	
	.message3 {
		background: none repeat scroll 0% 0% #FFFDF1;border: 1px solid #FAE798;
	}
	</style>

</head>
<body>
   	<ul class="li-table">
   		<li style="background:#1eb0e1;">#1EB0E1</li>
   		<li style="background:#ececec;">#ECECEC</li>
   		<li style="background:#009de0;">#009DE0</li>
   		<li style="background:#51d968;">#51D698</li>
   		<li style="background:#c3c3c3;">#C3C3C3</li>
   		<li style="background:#ffffcd;">#FFFFCD</li>
   		<li style="background:#e8f7fa;">#E8F7FA</li>
   		<li style="background:#0099e6;">#0099E6</li>
   		<li style="background:#4dd2b8;">#4DD2B8</li>
   		<li style="background:#E4F2FD;">#E4F2FD</li>
   		<li style="background:#428BCA;">#428BCA</li>
   		<li style="background:#9a9a9a;">#9A9A9A</li>
   		<li style="background:#2A6496;">#2A6496</li>
   		<li style="background:#4ac3eb;">#4AC3EB</li>
   		<li style="background:#e4f6f8;">#E4F6F8</li>
   		<li style="background:#FFA00A;">#FFA00A</li>
   		<li style="background:#61B3E6;">#61B3E6</li>
   		<li style="background:#88D3F9;">#88D3F9</li>
   		<li style="background:#C9302C;">#C9302C</li>
   		<li style="background:#761C19;">#761C19</li>
   		<li style="background:#35CE66;">#35CE66</li>
   		<li style="background:#2B78E4;">#2B78E4</li>
   		<li style="background:#0099CC;">#0099CC</li>
   		<li style="background:#2E7FDB;">#2E7FDB</li>
   		<li style="background:#009ACC;">#009ACC</li>
   		<li style="background:#EF4639;">#EF4639</li>
   		<li style="background:#45B6F7;">#45B6F7</li>
   		<li style="background:#DAE5E6;">#DAE5E6</li>
   		<li style="background:#F2FEFF;">#F2FEFF</li>
   		<li style="background:#FECCCD;">#FECCCD</li>
   		<li style="background:#FFF2F2;">#FFF2F2</li>
   		<li style="background:#83D5CE;">#83D5CE</li>
   		
   		<li style="background:#454545;">#454545</li>
   		<li style="background:#C0EEFF;">#C0EEFF</li>
   		<li style="background:#E2F7FF;">#E2F7FF</li>
   		<li style="background:#3FA7CB;">#3FA7CB</li>
   		<li style="background:#959595;">#959595</li>
   	</ul>
   	
   	<br>
   	
   	<ul class="alert100">
    	<li class="message1">效果展示1</li>
    	<li class="message2">效果展示2</li>
    	<li class="message3">效果展示3</li>
    </ul>

</body>