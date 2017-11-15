<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        视讯
        <small>详情</small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <form role="form" action="${ctx }/${scope }/save" method="post">
                <div class="form-group">
                    <label>视讯类型</label>
                    <select name="typeId" class="form-control select2" style="width: 100%;">
                        <c:if test="${not empty videoTypeList }">
                            <c:forEach items="${videoTypeList }" var="item">
                                <option value="${item }" ${item eq 2 ? 'selected' : '' }>${item }</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="form-group">
                    <label>标题</label>
                    <input type="text" name="title" class="form-control" placeholder="标题" value="标题" maxlength="200" required>
                </div>
                <div class="form-group">
                    <label>介绍</label>
                    <textarea name="intro" class="form-control" placeholder="介绍" maxlength="1000" required>介绍</textarea>
                </div>

            </form>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

