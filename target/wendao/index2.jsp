<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<style>
	img {
		margin: 0px;
		padding: 0px;
		vertical-align: top;
	}
	
	 .mui-content {
		background-color: #efeff4;
	}
	
	.cover {
		height: 180px;
		position: relative;
		overflow: hidden;
	}
	
	.cover .cover_img {
		width: 100%;
	}

	.cover .cover-content {
		background: transparent url("/image/other/cover-bg.png?v=20151218_17_49") repeat-x scroll 0% 0%;
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0px;
		left: 0px;
	}
	
	.cover .cover-content .title {
		box-sizing: border-box;
		position: absolute;
		width: 100%;
		top: 0px;
		left: 0px;
		padding: 15px 15px 0px;
		font-size: 22px;
		text-shadow: 0px 2px 5px rgba(3, 3, 3, 0.6);
		overflow: hidden;
		color: #FFF;
	}		
	
	.cover .cover-content .user {
		box-sizing: border-box;
		position: absolute;
		width: 100%;
		bottom: 0px;
		left: 0px;
		padding: 0px 10px 7px;
		
		text-shadow: 0px 2px 5px rgba(3, 3, 3, 0.6);
		overflow: hidden;
		color: #FFF;
	}
	
	.cover .cover-content .user .user_img {
		float: left;
		width: 40px;
		height: 40px;
		border: 2px solid #FFF;
		border-radius: 50%;
	}
	
	.cover .cover-content .user .user_name {
		float: left;
		margin-left: 10px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		height: 40px;
		line-height: 40px;
		font-size: 15px;
		color: #FFF;
	}
	
	.mui-segmented-control1 {
		font-size: 15px;
		font-weight: 400;
		position: relative;
		display: table;
		overflow: hidden;
		width: 100%;
		table-layout: fixed;
		background: #FFF;
	}
	
	.mui-segmented-control1 .mui-control-item1 {
		line-height: 38px;
		display: table-cell;
		overflow: hidden;
		width: 1%;
		transition: background-color 0.1s linear 0s;
		text-align: center;
		white-space: nowrap;
		text-overflow: ellipsis;
		
		color: #333;
	}
	</style>
</head>
<body>
	<div class="mui-content">
		<div class="cover">
			<img class="cover_img" src="http://dimg08.c-ctrip.com/images/fd/tg/g2/M09/1B/A8/CghzgVSyLVmAbmiTABHLIsWn8IU012_R_640_400.jpg">
			<div class="cover-content">
				<p class="title">大地铆钉</p>  
				<div class="user">
					<img class="user_img" src="/image/img/1.jpg">
					<p class="user_name">用户名</p>
				</div>
			</div>
		</div>
		<div id="segmentedControl" class="mui-segmented-control1">
			<a class="mui-control-item1" href="#item1">问答</a>
			<a class="mui-control-item1" href="#item2">链接</a>
			<a class="mui-control-item1" href="#item3">相册</a>
			<a class="mui-control-item1" href="#item4">文件</a>
		</div>
	</div>
</body>
</html>