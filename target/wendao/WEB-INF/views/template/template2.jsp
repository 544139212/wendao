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
    	
    	<style type="text/css">
    	#wrapper {
			width:670px;height:420px;position:absolute;left:50%;margin-left:-335px;top:50%;margin-top:-210px;
			background: #FFF none repeat scroll 0% 0%;
		}
			
		#wrapper .title {
			height: 70px;
			line-height: 70px;
			padding: 0 40px;
			font-size:24px;
			border-bottom: 1px solid #e2e2e2;
		}
		
		#wrapper .content {
			height: 270px;padding: 40px;background: #FFF none repeat scroll 0% 0%;
		}
		
		#wrapper .content .left {
			float: left;width: 300px;padding-right:35px;border-right:1px dashed #ccc;
		}
			
		#wrapper .content .right {
			float: right;width: 220px;font-size:14px;
		}
		    	
    	</style>
	</head>
		
	<body style="background: #3AABBD url('/image/log_bg.png') no-repeat scroll center 166px;">
		<!-- Header Page -->
   		<%-- <tiles:insertAttribute name="header" /> --%>
   		<!-- Begin page content -->
		<div class="container">
	    	<tiles:insertAttribute name="body" />
		</div>
		<!-- Footer Page -->
		<%-- <tiles:insertAttribute name="footer" /> --%>
	</body>
</html>
