<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty errors }">
    <c:forEach items="${errors }" var="error" varStatus="L">
        <p class="text-danger">${L.count}. ${error }</p>
    </c:forEach>
</c:if>