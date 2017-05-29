<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Category</title>
<style type="text/css">
.sidebar-block {
	margin-bottom: 20px;
}
</style>
</head>
<body>
  	<ol class="breadcrumb"> 
	    <li><a href="<c:url value="/"/>">首页</a></li> 
	    <li><a href="<c:url value="/catalog/${catalogData.code }"/>">${catalogData.name }</a></li> 
	    <li class="active">${categoryData.name }</li> 
	</ol>
	<div class="well">
	  	<h4>${categoryData.name }</h4> 
        <p>${categoryData.description }</p>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br>
	<!-- <ul class="nav nav-pills">
		<li><a href="#">博客 / 随笔</a></li>
		<li><a href="#">链接</a></li>
	</ul> -->
	<c:if test="${not empty catalogDataList }">
		<div class="row">
			<c:forEach items="${catalogDataList }" var="item">
				<div class="col-xs-6 col-sm-3">
					<div class="thumbnail">
						<img class="shadow" src="<c:url value="/image/img/${item.imageurl }"/>" alt="缩略图">
						<div class="caption">
							<h3>${item.name }</h3> 
			               	<p>${item.description }</p> 
			               	<p> 
								<a href="<c:url value="/catalog/${item.code }"/>" class="btn btn-primary" role="button">
			                   		<i class="icon-arrow-right"></i> 查看更多
								</a> 
							</p> 
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<c:if test="${not empty apiDataList }">
		<div class="row">
			<c:forEach items="${apiDataList }" var="item">
				<div class="col-xs-6 col-sm-3">
					<div class="thumbnail">
						<img class="shadow" src="<c:url value="/image/img/${item.imageurl }"/>" alt="缩略图">
						<div class="caption">
							<h3>${item.name }</h3> 
			               	<p>${item.description }</p> 
			               	<p> 
								<a href="<c:url value="/api/${item.code }"/>" class="btn btn-primary" role="button">
			                   		<i class="icon-arrow-right"></i> 查看更多
								</a> 
							</p> 
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	<div class="page-header">
		<h4><i class="icon-reorder"></i> 菜单区域</h4>
	</div>
	<div class="sidebar-block">
		<h4><a href="#"><i class="icon-double-angle-right"></i> 菜单一</a></h4>
		<ul class="nav nav-pills nav-stacked">
            <li><a href="#"><i class="icon-plus"></i> AAA</a></li>
            <li><a href="#"><i class="icon-plus"></i> BBB</a></li>
		</ul>
	</div>
	<div class="sidebar-block">
		<h4><a href="#"><i class="icon-double-angle-right"></i> 菜单二</a></h4>
		<ul class="nav nav-pills nav-stacked">
            <li><a href="#"><i class="icon-plus"></i> AAA</a></li>
            <li><a href="#"><i class="icon-plus"></i> BBB</a></li>
		</ul>
	</div>
</body>
</html>