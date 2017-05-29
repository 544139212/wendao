<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="pager" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<c:if test="${not empty blogPageData.results }">
			<div class="page-header">
				<h4>博客</h4>
		   	</div>
		   	<form action="/u/blog/search" enctype="multipart/form-data" method="post">
				<input type="text" class="form-control" id="name" name="name" placeholder="输入关键字，按回车键发起搜索">
		   	</form>
		   	<br>
			<table class="table table-striped table-hover">
				<tbody>
					<c:forEach items="${blogPageData.results}" var="blog">
					<tr>
						<td>
							<a href="/blog/${blog.id }" target="_blank">${blog.title}</a>
						</td>
						<td width="40">
							<a href="/u/blog/update/${blog.id }"><i class="icon-pencil"></i></a>
						</td>
						<td width="40">
							<a href="/u/blog/delete/${blog.id }"><i class="icon-trash"></i></a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<pager:pager pager="${blogPageData }"/>
		</c:if>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>