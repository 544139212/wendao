<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home</title>

</head>
<body>
  	<div id="myCarousel" class="carousel slide"> 
	    <!-- 轮播（Carousel）指标 --> 
	    <ol class="carousel-indicators"> 
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li> 
	        <li data-target="#myCarousel" data-slide-to="1"></li> 
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	        <li data-target="#myCarousel" data-slide-to="3"></li> 
	    </ol> 
	    <!-- 轮播（Carousel）项目 --> 
	    <div class="carousel-inner"> 
	        <div class="item active"> 
	            <img src="image/img2/1.jpg" alt="First slide"> 
	        </div> 
	        <div class="item"> 
	            <img src="image/img2/2.jpg" alt="Second slide"> 
	        </div> 
	        <div class="item"> 
	            <img src="image/img2/3.jpg" alt="Third slide"> 
	        </div> 
	        <div class="item"> 
	            <img src="image/img2/4.jpg" alt="Third slide"> 
	        </div>
	    </div> 
	    <!-- 轮播（Carousel）导航 --> 
	    <a class="carousel-control left" href="#myCarousel" 
	        data-slide="prev">
	    </a> 
	    <a class="carousel-control right" href="#myCarousel" 
	        data-slide="next">
	    </a> 
	</div>
	<script> 
	    $(function(){ 
	        // 初始化轮播 
            $("#myCarousel").carousel('cycle'); 
	    }); 
	</script>
	<br>
	<c:if test="${not empty catalogDataList }">
		<div class="row">
			<c:forEach items="${catalogDataList }" var="item">
				<div class="col-xs-6 col-sm-3">
					<div class="thumbnail">
						<img class="shadow" src="<c:url value="/image/img/${item.imageurl }"/>" alt="缩略图">
						<div class="caption">
							<h3>${item.name }</h3> 
			               	<p>${item.description }</p> 
			               	<p> 
								<a href="<c:url value="/catalog/${item.code }"/>" class="btn btn-primary" role="button">
			                   		<i class="icon-arrow-right"></i> 查看更多
								</a> 
							</p> 
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<c:if test="${not empty apiDataList }">
		<div class="row">
			<c:forEach items="${apiDataList }" var="item">
				<div class="col-xs-6 col-sm-3">
					<div class="thumbnail">
						<img class="shadow" src="<c:url value="/image/img/${item.imageurl }"/>" alt="缩略图">
						<div class="caption">
							<h3>${item.name }</h3> 
			               	<p>${item.description }</p> 
			               	<p> 
								<a href="<c:url value="/api/${item.code }"/>" class="btn btn-primary" role="button">
			                   		<i class="icon-arrow-right"></i> 查看更多
								</a> 
							</p> 
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</body>
</html>