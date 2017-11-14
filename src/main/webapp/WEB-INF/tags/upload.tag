<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath }" />

<%@ attribute name="type" required="true" type="java.lang.String" %>
<%@ attribute name="scope" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%@ attribute name="number" required="true" type="java.lang.Integer" %>

<div class="row">
    <c:choose>
        <c:when test="${not empty value }">
            <c:forEach items="${fn:split(fn:trim(value), ',') }" var="item">
                <div class="col-xs-${fn:split(12/number, '.')[0] }">
                    <div style="height: 200px; position: relative;">
                        <input type="file" class="${type eq 'image' ? 'imageFile' : 'videoFile' }">
                        <c:choose>
                            <c:when test="${item ne '/' }">
                                <div class="${type eq 'image' ? 'imagebg' : 'videobg' }" style="background-image:url('${ctx }${item }')"></div>
                            </c:when>
                            <c:otherwise>
                                <div class="${type eq 'image' ? 'imagebg' : 'videobg' }"></div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:forEach begin="1" end="${number }">
                <div class="col-xs-${fn:split(12/number, '.')[0] }">
                    <div style="height: 200px; position: relative;">
                        <input type="file" class="${type eq 'image' ? 'imageFile' : 'videoFile' }">
                        <div class="${type eq 'image' ? 'imagebg' : 'videobg' }"></div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>


<!-- jQuery 3.1.0 -->
<script src="/js/jquery-3.1.0.min.js"></script>
<script>
    $(function() {
        var array = new Array("${number }");
        for (var i = 0; i < "${number }"; i++) {
            array[i] = '/';
        }
        if ($(".imageHidden").val() != '') {
            array = $(".imageHidden").val().split(",");
        }
        $(".imageFile").each(function(index, domEle) {
            $(domEle).on('change', function(){
                var data = new FormData();
                var file = this.files[0];
                data.append("file", file);
                data.append("scope", "${scope }");
                var xhr = new XMLHttpRequest();
                xhr.responseType = "text";
                xhr.open("POST", "${ctx }/upload", true);
                xhr.onload = function(e) {
                    if(this.status == 200||this.status == 304){
                        var json=eval("("+this.responseText+")");
                        if (json.status==0) {
                            $(domEle).val('');
                            array.splice(index, 1, json.path);
                            $(".imageHidden").val(array.join());
                            $(domEle).parent().children('.imagebg').css("background-image",'url(' + "${ctx}" + json.path + ')');
                        }
                    }
                };
                xhr.send(data);
            })
        });
    });
</script>

