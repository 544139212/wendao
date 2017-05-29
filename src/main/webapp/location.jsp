<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
</head>
<body style="padding: 100px;">
	<table class="table table-bordered table-hover table-striped">
   		<caption>位置列表</caption>
	   	<thead>
			<tr>
				<th>序号</th>
				<th>经度</th>
				<th>纬度</th>
				<th>地址1</th>
				<th>地址2</th>
				<th>地址3</th>
				<th>地址4</th>
				<th>地址5</th>
				<th>地址6</th>
				<th>地址7</th>
				<th>地址8</th>
				<th>地址9</th>
				<th>地址10</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty locationDataList }">
				<c:forEach items="${locationDataList }" var="item" varStatus="L">
					<tr>
						<td>${L.count }</td>
						<td>${item.longitude }</td>
						<td>${item.latitude }</td>
						<td>${item.addressLine1 }</td>
						<td>${item.addressLine2 }</td>
						<td>${item.addressLine3 }</td>
						<td>${item.addressLine4 }</td>
						<td>${item.addressLine5 }</td>
						<td>${item.addressLine6 }</td>
						<td>${item.addressLine7 }</td>
						<td>${item.addressLine8 }</td>
						<td>${item.addressLine9 }</td>
						<td>${item.addressLine10 }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>