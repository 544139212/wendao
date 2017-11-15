<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />


<div class="imageBox">
    <div class="thumbBox"></div>
    <div class="spinner" style="display: none">正在加载...</div>
</div>
<br>
<div class="row">
    <div class="col-xs-6">
        <input type="file" id="file">
    </div>
    <div class="col-xs-6 text-right">
        <input type="button" class="btn btn-default" id="btnZoomIn" value="放大">
        <input type="button" class="btn btn-default" id="btnZoomOut" value="缩小">
        <input type="button" class="btn btn-default" id="btnCrop" value="裁剪">
    </div>
</div>
<div class="cropped">

</div>





