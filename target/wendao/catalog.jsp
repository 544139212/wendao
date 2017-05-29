<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Catalog</title>

</head>
<body>
	<ol class="breadcrumb"> 
	    <li><a href="<c:url value="/"/>">首页</a></li> 
	    <li class="active">${catalogData.name }</li> 
	</ol>
	<div class="well">
	  	<h4>${catalogData.name }</h4> 
        <p>${catalogData.description }</p>
	</div>
	<c:if test="${not empty categoryDataList }">
		<div class="row">
			<c:forEach items="${categoryDataList }" var="item">
				<div class="col-xs-6 col-sm-3">
					<div class="thumbnail">
						<img class="shadow" src="<c:url value="/image/img/${item.imageurl }"/>" alt="缩略图">
						<div class="caption">
							<h3>${item.name }</h3> 
			               	<p>${item.description }</p> 
			               	<p> 
								<a href="<c:url value="/category/${item.code }"/>" class="btn btn-primary" role="button">
			                   		<i class="icon-arrow-right"></i> 查看更多
								</a> 
							</p> 
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</body>
</html>