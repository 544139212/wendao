<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="pager" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>


<div class="row">
	<div class="col-xs-12 col-md-8">
		<div class="page-header">
			<h4>博客</h4>
	   	</div>
	   	<form action="/u/blog/search" enctype="multipart/form-data" method="post">
			<input type="text" class="form-control" id="name" name="name" placeholder="输入关键字，按回车键发起搜索">
	   	</form>
	   	<br>
		<c:if test="${not empty blogPageData.results }">
			<ul class="list-group">
				<c:forEach items="${blogPageData.results }" var="blog">
				    <li class="list-group-item">
						<h4><a class="ellipsis" href="/blog/${blog.id }" target="_blank">${blog.title }</a></h4> 
						<p><small class="text-muted">
				       		${blog.createby } 发布于
				       		<fmt:formatDate value="${blog.createtime }" pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />
				       	</small></p>
						<p><c:out value="${blog.summary }"></c:out></p>
				    </li>
			    </c:forEach>
			</ul>
			<pager:pager pager="${blogPageData }"/>
		</c:if>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>