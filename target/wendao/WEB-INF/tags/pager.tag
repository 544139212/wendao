<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="pager" required="true" type="com.example.data.SearchPageData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<p class="text-muted text-right">${pager.pageNo } / ${pager.totalPages } 页，共 ${pager.totalRecords } 条记录</p>
<ul class="pagination"> 
	<li class="${pager.disableFirst?'disabled':'' }">
    	<%-- <a href="<c:url value="/page/${pager.firstPageNo }"/>">首页</a> --%>
    	<a href="?page=${pager.firstPageNo }">首页</a>
    </li>
    <li class="${pager.disableFirst?'disabled':'' }">
    	<%-- <a href="<c:url value="/page/${pager.previousPageNo }"/>">&laquo;</a> --%>
    	<a href="?page=${pager.previousPageNo }">&laquo;</a>
    </li> 
    <li class="${pager.ellipsisBefore?'':'hidden' }">
    	<a href="#" style="pointer-events: none;">...</a>
    </li>
    <c:forEach var="pageNo" begin="${pager.begin }" end="${pager.end }">
    	<li class="${pager.pageNo==pageNo?'active':'' }">
    		<%-- <a href="<c:url value="/page/${pageNo }"/>">${pageNo }</a> --%>
    		<a href="?page=${pageNo }">${pageNo }</a>
    	</li> 
	</c:forEach>
	<li class="${pager.ellipsisAfter?'':'hidden' }">
    	<a href="#" style="pointer-events: none;">...</a>
    </li>
    <li class="${pager.disableLast?'disabled':'' }">
    	<%-- <a href="<c:url value="/page/${pager.nextPageNo }"/>">&raquo;</a> --%>
    	<a href="?page=${pager.nextPageNo }">&raquo;</a>
    </li> 
    <li class="${pager.disableLast?'disabled':'' }">
    	<%-- <a href="<c:url value="/page/${pager.lastPageNo }"/>">尾页</a> --%>
    	<a href="?page=${pager.lastPageNo }">尾页</a>
    </li>
</ul>