<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Java Community</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/blog">博客</a></li>
	            <li><a href="/link">链接</a></li>
	            <!-- <li class="q-newicon"><a href="#">新</a></li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty currentUser }">
						<li><a href="/login">登录</a></li>
						<li><a href="/register">注册</a></li>
					</c:when>
					<c:otherwise>
						<%-- <li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								${currentUser.name } 
								<i class="icon-angle-down"></i> 
							</a>
							<ul class="dropdown-menu">
								<li><a href="/u"><i class="icon-cog"></i> 个人中心</a></li>
								<li> 
					                <a href="javascript:;" onclick="href='/j_spring_security_logout'"><i class="icon-signout"></i> 退出登录</a>
					            </li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">特殊权限</li>
								<li><a href="#">后台管理</a></li>
							</ul>
						</li>
						<li><a href="/publish"><i class=" icon-edit"></i> 发布</a></li> --%>
						
						<li><a href="/u"><!-- <span class="dot"></span> -->${currentUser.name }</a></li>
						<li class="q-nav-sp"><span></span></li>
						<li><a href="javascript:;" onclick="href='/j_spring_security_logout'"><i class="icon-signout"></i> 注销</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
</nav>