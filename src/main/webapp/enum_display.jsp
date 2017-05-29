<%@page import="com.example.enums.BlogType"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="types" value="<%= BlogType.values() %>"/>
<div> 
	<h4><strong>${blogData.title }</strong></h4>
       <p>
       	${blogData.createby } - ${blogData.createtime } - ${blogData.readcount } - 
       	<!-- 如何break? -->
		<c:forEach var="type" items="${types}">
			<c:if test="${blogData.type==type.getCode() }">
				${type.getDesc() }
			</c:if>
		</c:forEach>
       </p>
       <br>
 		${blogData.content }
</div>
