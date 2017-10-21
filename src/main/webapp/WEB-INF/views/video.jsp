<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="scope" value="video" />
<c:set var="number" value="3" />
<c:set var="appl_number" value="1" />
<c:set var="comp_cert_number" value="1" />

<%@ taglib prefix="error" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="upload" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="summernote" tagdir="/WEB-INF/tags" %>

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
                <div class="box">
                    <div class="box-header">
                        <error:error />
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
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
                        <div class="form-group">
                            <label>内容</label>
                            <summernote:summernote scope="${scope }" />
                            <textarea id="content" name="content" class="form-control" placeholder="内容" required>内容</textarea>
                        </div>
                        <div class="form-group">
                            <label>封面图(建议尺寸: 250像素 X 130像素)</label>
                            <upload:upload type="image" scope="${scope }" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png,/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png,/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" number="${number }" />
                            <input type="hidden" name="image" class="form-control imageHidden" placeholder="图片" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png,/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png,/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" maxlength="1000" required>
                        </div>
                        <div class="form-group">
                            <label>图片(建议尺寸: 950像素 X 350像素)</label>
                            <upload:upload type="image" scope="${scope }" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" number="${appl_number }" />
                            <input type="hidden" name="image" class="form-control imageHidden" placeholder="图片" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" maxlength="500" required>
                        </div>
                        <div class="form-group">
                            <label>图片(建议尺寸: 200像素 X 150像素)</label>
                            <upload:upload type="image" scope="${scope }" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" number="${comp_cert_number }" />
                            <input type="hidden" name="image" class="form-control imageHidden" placeholder="图片" value="/upload/b7b39eaf-61d5-43cc-83b1-399d01b5fdb2.png" maxlength="500" required>
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

