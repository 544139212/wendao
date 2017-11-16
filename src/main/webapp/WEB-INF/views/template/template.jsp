<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	</head>
		
	<body>
		<!-- Header Page -->
   		<tiles:insertAttribute name="header" />
   		<!-- Begin page content -->
		<div class="container">
			<tiles:insertAttribute name="body" />
		</div>
		<!-- Footer Page -->
		<tiles:insertAttribute name="footer" />
	</body>
</html>
