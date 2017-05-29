<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<div>
		<div class="page-header"> 
			<h4>${blogData.title }</h4>
		</div>
		<c:out value="${blogData.content }" escapeXml="false"></c:out>
		<hr>
		<p class="text-muted">
			<small>
				<i class="icon-user"></i> ${blogData.createby }&nbsp; 
				<i class="icon-time"></i> <fmt:formatDate value="${blogData.createtime }" pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />
			</small>
		</p>
		</div>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>