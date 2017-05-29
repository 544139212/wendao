<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<div class="page-header"> 
			<h4>${linkData.name }</h4>
		</div>
		<a href="${linkData.url }" target="_blank"><c:out value="${linkData.url }" escapeXml="false"></c:out></a>
		<hr>
		<p class="text-muted">
			<small>
				<i class="icon-user"></i> ${linkData.createby }&nbsp; 
				<i class="icon-time"></i> <fmt:formatDate value="${linkData.createtime }" pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />
			</small>
		</p>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>