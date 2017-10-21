<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="scope" value="u" />

<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户
        <small>列表</small>
    </h1>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a class="btn btn-primary" href="${ctx }/${scope }/create"><i class="fa fa-plus"></i> 添加</a>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="example2" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>昵称</th>
                                <th>用户名</th>
                                <th>创建人</th>
                                <th>创建日期</th>
                                <th>编辑人</th>
                                <th>编辑日期</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty page.results }">
                                <c:forEach items="${page.results }" var="item">
                                    <tr>
                                        <td>${item.nickname }</td>
                                        <td>${item.username }</td>
                                        <td>${item.createBy }</td>
                                        <td>${item.createTime }</td>
                                        <td>${item.updateBy }</td>
                                        <td>${item.updateTime }</td>
                                        <td>
                                            <a class="btn btn-primary btn-xs" href="${ctx }/${scope }/update?id=${item.id }"><i class="fa fa-edit"></i> 编辑</a>
                                            <a class="btn btn-danger btn-xs" href="${ctx }/${scope }/delete?id=${item.id }"><i class="fa fa-trash"></i> 删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <page:page />
                </div>
                <!-- /.box-footer -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->