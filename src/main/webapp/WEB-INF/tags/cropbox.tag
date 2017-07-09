<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />

<button class="btn btn-primary" data-toggle="modal" data-target="#myModal1">裁剪图片</button>

<div class="example-modal">
    <div class="modal" id="myModal1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">图片裁剪</h4>
                </div>
                <div class="modal-body">
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
<!-- /.example-modal -->


<!-- jQuery 3.1.0 -->
<script src="/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    $(function() {
        var options =
            {
                thumbBox: '.thumbBox',
                spinner: '.spinner',
                imgSrc: '${ctx }/plugins/jQueryCropbox/bg.png'
            }
        var cropper = $('.imageBox').cropbox(options);
        $('#file').on('change', function(){
            var reader = new FileReader();
            reader.onload = function(e) {
                options.imgSrc = e.target.result;
                cropper = $('.imageBox').cropbox(options);
            }
            reader.readAsDataURL(this.files[0]);
            /*this.files = [];*/
        })
        $('#btnCrop').on('click', function(){
            if ($('#file').val() == '') {
                alert('未选择文件');
                return;
            }
            var img = cropper.getDataURL();
            $('.cropped').empty();
            $('.cropped').append('<img src="'+img+'">');
        })
        $('#btnZoomIn').on('click', function(){
            cropper.zoomIn();
        })
        $('#btnZoomOut').on('click', function(){
            cropper.zoomOut();
        })
    });
</script>

