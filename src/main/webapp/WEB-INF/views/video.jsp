<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="scope" value="video" />
<c:set var="number3" value="3" />
<c:set var="number1" value="1" />

<%@ taglib prefix="upload" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="summernote" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="cropbox" tagdir="/WEB-INF/tags" %>

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
                <div class="form-group">
                    <label>内容</label>
                    <summernote:summernote />
                    <textarea id="content" name="content" class="form-control" placeholder="内容" required>内容</textarea>
                </div>
                <div class="form-group">
                    <label>封面图(建议尺寸: 250像素 X 130像素)</label>
                    <upload:upload type="image" scope="${scope }" value="${threePic}" number="${number3 }" />
                    <input type="hidden" name="image" class="form-control imageHidden" placeholder="图片" value="${threePic}" maxlength="1000" required>
                </div>
                <div class="form-group">
                    <label>图片(建议尺寸: 950像素 X 350像素)</label>
                    <upload:upload type="image" scope="${scope }" value="${onePic}" number="${number1 }" />
                    <input type="hidden" name="image" class="form-control imageHidden" placeholder="图片" value="${onePic}" maxlength="500" required>
                </div>
            </form>
            <div class="form-group">
                <label>图片裁剪</label>
                <cropbox:cropbox />
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

