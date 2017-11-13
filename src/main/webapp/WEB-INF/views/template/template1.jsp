<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    	<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="/favicon.ico">

		<title>Sticky Footer Navbar Template for Bootstrap</title>
		
		
		
		
    	<!-- Bootstrap core CSS -->
    	<link href="/css/bootstrap.min.css" rel="stylesheet" />
    	<link href="/css/font-awesome.min.css" rel="stylesheet" />

    	<!-- Custom styles for this template -->
    	<link href="/css/sticky-footer-navbar.css" rel="stylesheet" />
    	



		<link href="/css/summernote/summernote.css" rel="stylesheet" />

		<link href="/dist/css/AdminLTE.upload.css" rel="stylesheet" />

	</head>
		
	<body>
		<!-- Header Page -->
   		<tiles:insertAttribute name="header" />
   		<!-- Begin page content -->
		<div class="container">
			<tiles:insertAttribute name="body" />
			<div class="well text-center">
				<h1><a href="/u/blog/create">撰写文章</a> / <a href="/u/link/create">发布链接</a></h1>
				<p class="text-muted">不积跬步,无以至千里; 不积小流,无以成江海</p>
			</div>
		</div>
		<!-- Footer Page -->
		<tiles:insertAttribute name="footer" />


		<script src="/js/jquery-3.1.0.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/summernote/summernote.js"></script>
		<script src="/js/summernote/summernote-zh-CN.js"></script>
		<script src="/plugins/jQueryCropbox/cropbox.js"></script>

		<script type="text/javascript">
            function trim(obj){
                var ui = obj.value;
                var notValid=/(^\s)|(\s$)/;
                while(notValid.test(ui)){
                    ui=ui.replace(notValid,"");
                }
                obj.value = ui;
                return ui;
            }

            $("input").on("change", function() {
                $(this).val($.trim($(this).val()));
            }).trigger("change");
		</script>
	</body>
</html>
