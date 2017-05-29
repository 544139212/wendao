<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>车票预定 | 客运服务 | 铁路客户服务中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath %>favicon.ico" type="image/x-icon" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/js/jquery.js"></script>
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/css/huochepiao/ui.css">
	<link rel="stylesheet" type="text/css" href="/css/huochepiao/huochepiao.css">
  </head>
  
  <body>
    <div class="center-in-parent">
		<div class="input-line">
			<input id="zmail" name="loginUserDTO.user_name" type="text" value="huayushuangfei" placeholder="用户名">
		</div>
		<div class="input-line">
			<input id="zpass" name="userDTO.password" type="password"value="wanghua2liyu" placeholder="密码">
		</div>
		<div class="input-line">
			<div class="verify-code-img">
				<img>
				<div class="refresh">
					<a href="javascript:void(0);"><i class="fa fa-refresh"></i> <span>刷新</span></a>
				</div>
				<ul>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
					<li><span></span></li>
				</ul>
			</div>
			<div class="verify-code-text">
				<div class="title">控制台</div>
				<div class="content"></div>
			</div>
		</div>
		<button><i class="fa fa-long-arrow-right"></i> 继续</button>
    </div>
    
    <script type="text/javascript">
	    function refresh() {
			$('a > span').html('刷新中...');
			var r = Math.floor(Math.random()*9999999999999999+1)/10000000000000000;
			$("img").attr('src','https://kyfw.12306.cn/otn/passcodeNew/getPassCodeNew?module=login&rand=sjrand&'+r).load(function(){
				$('a > span').html('刷新');
				
				$('li').css("z-index","-999");
	    		$('li > span').html('');
	    		$(".verify-code-text .content").html('');
				});
		}
    
   		refresh();
   		
   		$("a").click(function() {
    		refresh();
    	});
   		
    	$("img").click(function(event) {
    		var srcObj = event.target || event.srcElement;
    		var x = event.offsetX || (event.clientX - srcObj.getBoundingClientRect().left);
    		var y = event.offsetY || (event.clientY - srcObj.getBoundingClientRect().top);
    		y = y-14;
    		
    		x = x + 3;
    		y = y - 16;
    		
    		if (y < 0) y = 0;
    		
    		var nx = Math.floor(x/73.25);
    		var ny = Math.floor(y/80);
    		
    		var n = ny*4+nx+1;
    		
    		$('li').eq(n-1).css("z-index","999");
    		
    		x = x.toFixed(2);
    		y = y.toFixed(2);
    		
    		$('li > span').eq(n-1).html(x + ',' + y);
    		
    		var result = $(".verify-code-text .content");
    		result.html('选中第'+n+'个图像，坐标为'+x+','+y+'<br>从左到右第'+(nx+1)+'个，从上到下第'+(ny+1)+'个<br><br>'+result.html());
    	});
    	
    	$('li').click(function() {
    		$(this).css("z-index","-999");
    	});
    	
		$("button").click(function() {
			/* var username = $.trim($("#zmail").val());
			var password = $.trim($("#zpass").val());
			if (username == "" || password == "") {
				login_err.html("用户名和密码必须输入!").css("display", "block");
				return;
			}
			login_btn.html("正在登录..").attr("disabled", true).css("cursor", "wait"); */
			var randCode = '';
			$('li > span').each(function(i) {
				if ($(this).html()!='') {
					randCode+=$(this).html()+',';
				}
			});
			if (randCode!='') {
				randCode=randCode.substr(0,randCode.length-1);
			}
			
			$.post("<%=basePath %>huochepiao?randCode="+randCode);
			
			/* $.ajax({
				url: "https://kyfw.12306.cn/otn/passcodeNew/checkRandCodeAnsyn",
	            type:"GET",
	          	cache: false,
	          	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	          	data: {"rand":"sjrand","randCode":randCode},
	          	dataType:"jsonp",
	          	jsonp:"callback",
	          	jsonpCallback: "jsonpcallback"
			}); */
			
			/* $.ajax({
			    url : 'http://api.map.baidu.com/telematics/v3/weather?location=%E8%A1%A1%E9%98%B3&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8',
			    dataType : 'jsonp',
			  	success : function(data){
			        //your code
			        alert(JSON.stringify(data));
			    }
			});  */
			
			/* getData(randCode); */
		});
    	
    	function CreateScript(src) {
            $("<script><\/script>").attr("src", src).appendTo("body");
        }
        function getData(randCode) {
           CreateScript("https://kyfw.12306.cn/otn/passcodeNew/checkRandCodeAnsyn?randCode="+randCode+"&rand=sjrand&output=json&callback=jsonpcallback");  
           /* CreateScript("http://api.map.baidu.com/telematics/v3/weather?location=%E8%A1%A1%E9%98%B3&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8&callback=jsonpcallback"); */      
        }
        
        function jsonpcallback(data) {
        	alert(123);
            alert(JSON.stringify(data));
        }
        
        
    </script>
    
    <!-- <script src="https://kyfw.12306.cn/otn/passcodeNew/checkRandCodeAnsyn?randCode=246,120&rand=sjrand&callback=jsonpcallback"></script> -->
    <!-- <script src="http://api.map.baidu.com/telematics/v3/weather?location=%E8%A1%A1%E9%98%B3&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8&callback=jsonpcallback"></script> -->
  </body>
</html>