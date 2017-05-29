<%@page import="com.example.enums.BlogType"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/css/summernote/summernote.css" rel="stylesheet" />
<script src="/js/summernote/summernote.min.js"></script>
<script src="/js/summernote/summernote-zh-CN.js"></script>
<title>发布</title>
</head>
<body>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<div class="page-header"> 
			<h4>撰写博客</h4>
		</div>
		<form action="/u/blog/save" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="sr-only" for="title">标题</label>
				<input type="text" class="form-control" id="title" placeholder="标题" name="title" value="${blogData.title }" maxlength="500" required>
			</div>
			<div class="form-group">
				<label class="sr-only" for="summary">概要</label>
				<input type="hidden" class="form-control" id="summary" placeholder="概要" name="summary" value="${blogData.summary }">
			</div>
			<div class="form-group">
				<label class="sr-only" for="content">内容</label>
	 			<textarea class="form-control" id="content" placeholder="内容" name="content">${blogData.content }</textarea>
			</div>
			<button type="submit" class="btn btn-primary">确认提交</button>
		</form>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>
	
	<script type="text/javascript">
	var images = new Array();
	
	$(document).ready(function() {
		$("#content").summernote({
			lang: 'zh-CN', // default: 'en-US'
	    	
	   		height: 300,                 // set editor height
	
	   	  	minHeight: null,             // set minimum height of editor
	   	  	maxHeight: null,             // set maximum height of editor
	
	   	  	focus: false,                // set focus to editable area after initializing summernote
	   	  	
	   	 	placeholder: '说点什么吧..',
	   	 	 
	     	callbacks: {
	     		onImageUpload: function(files) {
	      			var data = new FormData();
	      			data.append("file", files[0]); 
	      			data.append("type", "textarea");
	      				
	   				//var filename = file['name'];
	   				//var ext = filename.substr(filename.lastIndexOf("."));  
	   				//var name = new Date().getTime()+ext.toUpperCase();  
	   				//https://segmentfault.com/a/1190000004322487
	   		        var xhr = new XMLHttpRequest();
	   		        xhr.responseType = "text";
	   		        xhr.open("POST", "/image/upload", true);
	   		        xhr.onload = function(e) { 
	   		        	if(this.status == 200||this.status == 304){
	   		        		var json=eval("("+this.responseText+")");
	   		            	if (json.status==0) {
	   		    				var url = URL.createObjectURL(files[0]);
	   							$('#content').summernote('insertImage', url, function ($image) {
	   								$image.css('max-width', '100%');
	   							  	$image.attr('src', json.path);
	   							 	images.push(json.path);
	   							});
	   		            	}
	   					}
	   				};
	   		        //xhr.ontimeout = function(e) { ... };
	   		        //xhr.onerror = function(e) { ... };
	   		        //xhr.upload.onprogress = function(e) { ... };
	   		        xhr.send(data);
	      	    }
			}
		});
		
		var markupStr = $('#content').summernote('code');
		markupStr.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/gi, function (match, capture) {
			images.push(capture);
		});
	});
	
	$("button[type='submit']").on('click', function(e) {
		var markupStr = $('#content').summernote('code');
		var noMarkupStr=getNoMarkupStr(markupStr);
		var length=noMarkupStr.length;
		if (length==0) {
			alert('至少说点什么吧');
			e.preventDefault(); 
		}
		
		$("#summary").val(getSubStr(noMarkupStr));
		
		markupStr.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/gi, function (match, capture) {
			images.splice($.inArray(capture, images), 1);
		});
		if (images.length > 0) {
			var data = new FormData();
			data.append("paths", images.join(",")); 
				
			//var filename = file['name'];
			//var ext = filename.substr(filename.lastIndexOf("."));  
			//var name = new Date().getTime()+ext.toUpperCase();  
			//https://segmentfault.com/a/1190000004322487
	        var xhr = new XMLHttpRequest();
	        xhr.responseType = "text";
	        xhr.open("POST", "/image/delete", true);
	        xhr.onload = function(e) { 
	        	if(this.status == 200||this.status == 304){
	        		var json=eval("("+this.responseText+")");
	            	if (json.status==0) {
	    				console.log("Remove finish!");
	            	}
				}
			};
	        //xhr.ontimeout = function(e) { ... };
	        //xhr.onerror = function(e) { ... };
	        //xhr.upload.onprogress = function(e) { ... };
	        xhr.send(data);
		}
	});
	
	function getNoMarkupStr(markupStr) {
		/* markupStr 源码</> */
		//console.log(markupStr);
		var noMarkupStr=$("<div>").html(markupStr).text();/* 得到可视文本(不含图片),将&nbsp;&lt;&gt;转为空字符串和<和>显示,同时去掉了换行,文本单行显示 */
		//console.log("1--S" + noMarkupStr + "E--");
		noMarkupStr=noMarkupStr.replace(/(\r\n|\n|\r)/gm,"");/* 去掉可视文本中的换行,(没有用,上一步已经自动处理) */
		//console.log("2--S" + noMarkupStr + "E--");
		noMarkupStr=noMarkupStr.replace(/^\s+/g,"");/* 替换开始位置一个或多个空格为一个空字符串 */
		//console.log("3--S" + noMarkupStr + "E--");
		noMarkupStr=noMarkupStr.replace(/\s+$/g,"");/* 替换结束位置一个或多个空格为一个空字符串 */
		//console.log("4--S" + noMarkupStr + "E--");
		noMarkupStr=noMarkupStr.replace(/\s+/g," ");/* 替换中间位置一个或多个空格为一个空格 */
		//console.log("5--S" + noMarkupStr + "E--");
		return noMarkupStr;
	}
	  
	function getSubStr(string) {
		var str='';
		var len = 0;
		for (var i = 0; i < string.length; i++) {
			if (string[i].match(/[^\x00-\xff]/ig) != null) {
				len += 2;
			} else {
				len += 1;
			}
			if (len > 240) {/* 240为要截取的长度 */
				str += '...';
				break;
			}
			str += string[i];
		}
		return str;
	}
	</script>
</body>
</html>