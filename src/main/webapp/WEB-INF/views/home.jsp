<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
<!--
img {
	width: 100%;
	height: 100%;
}
-->
</style>
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
            <img src="image/img2/4.jpg" alt="Fourth slide"> 
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

