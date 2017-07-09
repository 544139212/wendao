<%@page import="com.example.enums.BlogType"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="scope" value="blog" />
<c:set var="number" value="3" />

<%@ taglib prefix="right" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="error" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="upload" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="summernote" tagdir="/WEB-INF/tags" %>



<div class="row">
	<div class="col-xs-12 col-md-8">
		<div class="page-header"> 
			<h4>撰写博客</h4>
		</div>
		<error:error/>
		<form action="/u/blog/save" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="sr-only" for="title">标题</label>
				<input type="text" class="form-control" id="title" placeholder="标题" name="title" value="${blogData.title }" maxlength="500" required>
			</div>
			<div class="form-group">
				<label class="sr-only" for="image">封面图</label>
				<upload:upload type="image" scope="${scope }" value="${blogData.image }" number="${number }" />
				<input type="hidden" class="form-control imageHidden" id="image" placeholder="图片" name="image" value="${blogData.image }" maxlength="1000" required>
			</div>
			<div class="form-group">
				<label class="sr-only" for="summary">概要</label>
				<input type="hidden" class="form-control" id="summary" placeholder="概要" name="summary" value="${blogData.summary }">
			</div>
			<div class="form-group">
				<label class="sr-only" for="content">内容</label>
				<summernote:summernote scope="${scope }" />
	 			<textarea class="form-control" id="content" placeholder="内容" name="content">${blogData.content }</textarea>
			</div>
			<button type="submit" class="btn btn-primary">确认提交</button>
		</form>
	</div>
	<!-- /.col-md-8 -->
	<div class="col-xs-12 col-md-4">
		<right:right/>
	</div>
	<!-- /.col-md-4 -->
</div>
	
