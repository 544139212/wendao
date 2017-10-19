<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="scope" value="u" />

<%@ taglib prefix="error" tagdir="/WEB-INF/tags" %>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户
        <small>详情</small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <form role="form" action="${ctx }/${scope }/save" method="post">
                <div class="box">
                    <div class="box-header">
                        <error:error />
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <input type="text" name="nickname" class="form-control" placeholder="昵称" value="${user.nickname}" maxlength="30" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="账号" value="${user.username}" maxlength="30" required>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
            </form>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

