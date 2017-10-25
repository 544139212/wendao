<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
   	<div class="title">用户登录</div>
   	<div class="content">
   		<div class="left">
   			<form action="/j_spring_security_check" method="post">
				<div class="form-group">
					<label class="sr-only" for="inputEmail">邮箱</label>
					<input type="email" class="form-control" id="inputEmail" name="email" placeholder="邮箱" required>
				</div>
				<div class="form-group">
					<label class="sr-only" for="inputPassword">密码</label>
					<input type="password" class="form-control" id="inputPassword" name="password" placeholder="密码" required>
				</div>
				<div class="checkbox">
					<label>
						<input type="checkbox" name="rememberMe"> 30天之内免登录
					</label>
					<a href="resetPassword" style="float:right;">忘记密码?</a>
				</div>
   				<button type="submit" class="btn btn-primary" style="width:160px;">登录</button>
   				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">  
					<div class="text-danger"> 
						<c:choose>
							<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
								用户名或密码错误
							</c:when>
							<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'User is disabled'}">
								账户已锁定
							</c:when>
							<c:otherwise>
								登录异常，请稍后再试${SPRING_SECURITY_LAST_EXCEPTION.message}
							</c:otherwise>
						</c:choose>
					</div>
			   	</c:if>
		   	</form>
   		</div>
   		<div class="right">
   			还没有账号? <a href="/register">立即注册</a>
   		</div>
   	</div>
</div>
   

		

