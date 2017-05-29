<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
	<div class="title">密码找回</div>
	<div class="content">
   		<div class="left">
   			<c:if test="${step eq '1' }">
	   			<form action="/resetPassword" method="post">
					<div class="form-group">
						<label class="sr-only" for="inputEmail">邮箱</label>
						<input type="email" class="form-control" id="inputEmail" name="email" placeholder="邮箱" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width:160px;">下一步</button>
				</form>
			</c:if>
			<c:if test="${step eq '2' }">
	   			<form action="/resetPassword2" method="post">
					<div class="form-group">
						<label class="sr-only" for="inputVerifyCode">验证码</label>
						<input type="text" class="form-control" id="inputVerifyCode" name="verifyCode" placeholder="验证码" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width:160px;">下一步</button>
				</form>
			</c:if>
			<c:if test="${step eq '3' }">
	   			<form action="/resetPassword3" method="post">
					<div class="form-group">
						<label class="sr-only" for="inputNewPassword">新密码</label>
						<input type="password" class="form-control" id="inputNewPassword" name="newPassword" placeholder="新密码" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width:160px;">完成</button>
				</form>
			</c:if>
   		</div>
   		<div class="right">
   			去首页看看? <a href="/" target="_blank">立即访问</a>
   		</div>
   	</div>
</div>
