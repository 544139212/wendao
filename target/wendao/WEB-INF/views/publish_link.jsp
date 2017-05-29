<%@page import="com.example.enums.BlogType"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布</title>
<style type="text/css">
/*书签上传*/
#demoForm {
	border: 1px dashed #f2f2f2;
	margin-top:10px;
	margin-bottom:10px;
	padding-top:10px;
	padding-bottom:10px;
	text-align:center;
}

#demoForm .progressbar { 
	width:100%; 
	display:none;
} 

#demoForm .progressbar #loading { 
	width:400px; 
	height:20px; 
	background:/* url(20100311165403426.png) no-repeat */#f6f6f6; 
	position: relative;
	margin: 0 auto;
} 

#demoForm .progressbar #loading .progress { 
	width:0px; 
	height:20px; 
	line-height:20px; 
	background:#45B6F7/*url(20100311165403115.png) no-repeat*/; 
} 

#demoForm .progressbar #loading .percent {
	width:100%;
	height:20px; 
	line-height:20px;
	position: absolute;
	left: 0;
	top: 0;
	color:#fff; 
	z-index: 10;
	text-align:center; 
	font-family:Tahoma; 
	font-size:12px; 
}

#demoForm .progressbar #message { 
	width:100%; 
	height:25px; 
	line-height:25px;
	font-family:Tahoma; 
	font-size:12px; 
	/* background-color:#d8e7f0;  */
	/* border:1px solid #187CBE;  */
	text-align:center; 
	margin-top:10px; 
	
	/* display:none;  */
}

#demoForm .execute {
	width:100%; 
	text-align:center;
	display:none;
}

#demoForm .execute #filepath { 
	width:100%; 
	height:25px; 
	line-height:25px;
	font-family:Tahoma; 
	font-size:12px; 
	/* background-color:#d8e7f0;  */
	/* border:1px solid #187CBE;  */
	text-align:center; 
	margin-bottom:10px; 
	
	/* display:none;  */
}

#demoForm .execute button {
	width: 160px;height: 44px;border: medium none;border-radius: 2px;background: #00A3D9 none repeat scroll 0% 0%;font-size: 16px;color: #FFF;cursor: pointer;
}


/* http://www.ablanxue.com/prone_21850_1.html */
#demoForm .new-contentarea {
	width: 100%;
	overflow:hidden;
	margin: 0 auto;
	position:relative;
	display:block;
}
#demoForm .new-contentarea label {
	width:100%;
	height:100%;
	display:block;
	color: #FFFFFF;
	text-align:center;
	/* font-size: 20px;
	font: 400 14px/1.5 Arial,"Lucida Grande",Verdana,"Microsoft YaHei",hei; */
	font: 400 20px/2.85 Arial,"Lucida Grande",Verdana,"Microsoft YaHei",hei;
	
}
#demoForm .new-contentarea input[type=file] {
	width:166px;
	height:57px;
	background:#333;
	/* margin: 0 auto; */
	position:absolute;
	top:0;
	right/*\**/:0px\9;
	margin-right/*\**/:0px\9;
	width/*\**/:10px\9;
	opacity:0;
	filter:alpha(opacity=0);
	z-index:2;
}
#demoForm .new-contentarea a.upload-file{
	width:166px;
	display: inline-block;
	height:57px;
	line-height: 57px;
	background-color: #f38e81;
	border-radius: 3px;
	text-decoration:none;
	cursor:pointer;
}
#demoForm .new-contentarea a.upload-file:hover{
	background-color: #ec7e70;
}
</style>
</head>
<body>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<div class="page-header"> 
			<h4>发布链接</h4>
		</div>
		<form action="/u/link/save" enctype="multipart/form-data" method="post">
		  	<div class="form-group">
				<label class="sr-only" for="inputName">标题</label>
				<input type="text" class="form-control" id="inputName" placeholder="标题" name="name" value="${linkData.name}" maxlength="500" required>
			</div>
			<div class="form-group">
				<label class="sr-only" for="inputUrl">URL</label>
				<input type="text" class="form-control" id="inputUrl" placeholder="URL" name="url" value="${linkData.url}" maxlength="2000" required>
			</div>
			<button type="submit" class="btn btn-primary">确认提交</button>
		</form>
		
	  	<br><br><br><br>
	  	
		<!-- 按钮触发模态框 -->
		<%--<button class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal">批量上传书签</button>--%>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">批量上传书签</h4>
		            </div>
		            <div class="modal-body">
		            	<form id="demoForm" name="demoForm" method="post" enctype="multipart/form-data" action="javascript: uploadAndSubmit();">
							<div class="progressbar"> 
								<div id="loading">
									<div class="progress"></div>
									<div class="percent"></div>
								</div> 
								<div id="message"></div> 
							</div> 
							<div class="execute">
								<div id="filepath"></div> 
								<button>立即执行</button>
							</div>
					 			<div class="new-contentarea" style="text-align:center;">
								<a href="javascript:void(0)" class="upload-file"><label for="upload-file">上传文件</label></a>
								<input type="file" name="file" id="upload-file" style="right:50%;margin-right:-83px;" />
							</div>
						</form>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>
  	
	
	<script type="text/javascript">
	$("#upload-file").change(function() {
		var path = $(this).val();
		if (path != null && path != "") {
			$(".new-contentarea").css("display","none");
			$(".progressbar").css("display","none");
			$(".execute").css("display","block");
		} 
		$("#filepath").html(path);
	});
	
	function uploadAndSubmit() {
		$(".new-contentarea").css("display","none");
		$(".progressbar").css("display","block");
		$(".execute").css("display","none");
		
		var form = document.forms["demoForm"];
		if (form["file"].files.length > 0) {
			var file = form["file"].files[0];
			
			var reader = new FileReader();
			
			reader.onloadstart = function() {
				$("#message").html("开始加载..");
			};
			
			reader.onprogress = function(p) {
				$("#message").html("正在加载(Bytes：" + p.loaded + "/" + file.size + ")..");
			};
			
			reader.onload = function() {
				$("#message").html("完成加载..");
			};
			
			reader.onloadend = function() {
				if (reader.error) {
					$("#message").html("文件加载失败!");
				} else {
					var ppt = reader.result;
					
					var len = $(ppt).find("a").length;
					
					var text = "";
					var href = "";
					var error = "";
					$(ppt).find("a").each(function(i){
						text = $(ppt).find("a").eq(i).text();
						href = $(ppt).find("a").eq(i).attr("href");
						
						console.log(text);
						console.log(href);
						
						SetProgress(((i+1)/len*100).toFixed(2));

						$("#message").html("正在处理第" + (i+1) + "条数据..").fadeIn("slow");
						
						$.ajax({
							type: "POST",
						  	url: "/u/link/save",
						  	data: {"name":text, "url":href},
						  	cache: false,
						  	async: false,
						  	dataType: "json",
						  	success: function(data){
						  		var json = data;
			  					if (json.status != 0) {
			  						$("#message").html(json.msg);
			  						error += text + "<br>" + href + "<br><br>";
			  					}
						  	}
						});
					});
					
					if (error == "") {
						$("#message").html("执行成功!").fadeIn("slow");
					} else {
						$("#message").html("执行失败!<br><br>" + error).fadeIn("slow");
					}
					
				}
			};
			reader.readAsText(file);
		}
	}
	
	function SetProgress(progress) { 
		if (progress) { 
			$("#loading div").first().css("width", String(progress) + "%"); //控制#loading div宽度 
			$("#loading div").last().html(String(progress) + "%"); //显示百分比 
		} 
	} 
	</script>
</body>
</html>