<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="pager" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>

<div class="row">
	<div class="col-xs-12 col-md-8">
		<c:if test="${not empty linkPageData.results }">
			<div class="page-header">
				<h4>链接</h4>
		   	</div>
		   	<form action="/u/link/search" enctype="multipart/form-data" method="post">
				<input type="text" class="form-control" id="name" name="name" placeholder="输入关键字，按回车键发起搜索">
		   	</form>
		   	<br>
			<table class="table table-striped table-hover">
				<tbody>
					<c:forEach items="${linkPageData.results}" var="link">
					<tr>
						<td>
							<a href="${link.url}" target="_blank">${link.name}</a>
						</td>
						<td width="40">
							<a href="/u/link/update/${link.id }"><i class="icon-pencil"></i></a>
						</td>
						<td width="40">
							<a href="/u/link/delete/${link.id }"><i class="icon-trash"></i></a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<pager:pager pager="${linkPageData }"/>
		</c:if>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>