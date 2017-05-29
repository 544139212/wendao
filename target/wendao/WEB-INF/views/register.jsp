<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div id="wrapper">
   	<div class="title">用户注册</div>
   	<div class="content">
   		<div class="left">
   			<form action="/register" method="post">
    			<div class="form-group">
					<label class="sr-only" for="inputText">昵称</label>
					<input type="text" class="form-control" id="inputText" name="name" placeholder="昵称" required>
				</div>
				<div class="form-group">
					<label class="sr-only" for="inputEmail">邮箱</label>
					<input type="email" class="form-control" id="inputEmail" name="email" placeholder="邮箱" required>
				</div>
   				<button type="submit" class="btn btn-primary" style="width:160px;">注册</button>
			</form>
   		</div>
   		<div class="right">
   			已有账号? <a href="/login">快速登录</a>
   		</div>
   	</div>
</div>
   

		

