<%@ page language="java" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
    <title>登录</title>
    <script type="text/javascript">
  		$(function() {
  			var login_btn = $("#login-btn");
  			login_btn.click(function() {
  				var username = $.trim($("#username").val());
  				var password = $.trim($("#password").val());
  				if (username == "" || password == "") {
  					login_btn.html("账号或密码错误，请重试！");
  					login_btn.addClass("error");
  					return;
  				}
  				login_btn.html("正在登录..");
  				$.ajax({
  					type: "POST",
  				  	url: "customer_logon.html", 
  				  	data: {"email":username, "password":password},
  				  	cache: false,
  				  	async: true,
  				  	dataType: "json",
  				  	success: function(data){
	  				  	var json = jQuery.parseJSON(data);
	  					if (json.status == 0) {
	  						window.location.href="index.jsp";
	  					} else {
	  						login_btn.html("账号或密码错误，请重试！");
	  						login_btn.addClass("error");
	  					}
  				  	}
  				});
  			}).html("登录");
  			
  			$(".input-wrap .input-text").focus(function() {
  				login_btn.html("登录");
  				$(this).parent().addClass("focus");
  				login_btn.removeClass("error");
  			}).blur(function() {
  				$(this).parent().removeClass("focus");
  			}).keyup(function() {
  				var v = $(this).val();
  				if (v == "") {
  					$(this).prev("label").css("display", "block");
  				} else {
  					$(this).prev("label").css("display", "none");
  				}
  	  		}).val("");
  		});
  	</script>
    <style type="text/css">
    	#login-f {
    		width: 288px;
    		height: 200px;
    		padding: 5% 0;
    		margin: 0 auto;
    	}
    	
    	.input-wrap {
    		width: 288px;
			height: 52px;
			margin-bottom: 3px;
			background: url('/image/other/startpage-0410.$6008.png') no-repeat scroll -210px -52px transparent;
			position: relative;
			margin-right: 5px;
    	}
    	
    	.input-wrap label {
    		position: absolute;
			width: 240px;
			height: 52px;
			margin: 0px 10px;
			line-height: 52px;
			color: #ABACAD;
			font-size: 16px;
			left: 32px;
			top: 0px;
			overflow: hidden;
			white-space: nowrap;
			z-index: 10;
    	}
    	
    	.input-wrap .input-icon {
    		display: block;
			float: left;
			width: 16px;
			height: 16px;
			background: url('/image/other/startpage-0410.$6008.png') no-repeat scroll 0% 0% transparent;
			margin: 18px 0px 0px 15px;
    	}
    	
    	.input-text {
    		width: 234px;
			padding: 10px;
			height: 32px;
			line-height: 32px;
			background: url('/image/img/blank.$166.png') repeat scroll 0% 0% transparent; /* image not exists, but only 'url' part can be removed */
			border: 0px none;
			outline: medium none;
			font-family: "Microsoft Yahei","微软雅黑",Tahoma,Arial,Helvetica,STHeiti;
			position: absolute;
			font-size: 16px;
			color: #8F8F8F;
			z-index: 20;
    	}
    	
    	.input-wrap.focus {
    		background-position: -210px 0px;
    	}

    	#input-login-email .input-icon {
    		background-position: 0px -197px;
    	}
    	
    	#input-login-pwd .input-icon {
    		background-position: 0px -300px;
    	}
    	
    	#login-btn {
    		width: 228px;
			padding: 0px 30px 0px 30px;
			line-height: 36px;
			margin-top: 10px;
			height: 40px;
			background: url('/image/other/startpage-0410.$6008.png') no-repeat scroll -200px -401px transparent;
			margin-bottom: 20px;
			color: #69664F;
			cursor: pointer;
			text-align: center;
    	}
    	
    	#login-btn.error {
    		width: 228px;
			padding: 0px 20px 0px 40px;
			line-height: 36px;
			margin-top: 10px;
			height: 40px;
			background: url('/image/other/startpage-0410.$6008.png') no-repeat scroll -200px -450px transparent;
			margin-bottom: 20px;
			color: #69664F;
			cursor: pointer;
			text-align: left;
    	}
    </style>
  </head>
  
  <body>
  	<div>
	    <form id="login-f">
			<div id="input-login-email" class="input-wrap">
				<span class="input-icon"></span>
				<label>邮箱</label>
				<input type="text" id="username" name="username" class="input-text">
			</div>
			<div id="input-login-pwd" class="input-wrap">
				<span class="input-icon"></span>
				<label>密码</label>
				<input type="password" id="password" name="password" class="input-text">
			</div>
			<div id="login-btn"></div>
		</form>
    </div>
  </body>
</html>
