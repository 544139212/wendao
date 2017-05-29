<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<script src="/js/jquery.js"></script>
	<link href="/css/datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	<script src="/js/datepicker/bootstrap-datepicker.min.js"></script>
	<script src="/js/datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
</head>
<body>
	<div class="row">
		<div class="form-group col-sm-6">
			<label for="number">测试数字输入</label>
			<input type="number" class="form-control" id="number" name="number" value="1" maxlength="1" placeholder="测试数字输入" required>
		</div>
		<div class="form-group col-sm-6">
			<label for="date">测试日期输入</label>
			<input type="date" class="form-control datepickers" id="date" name="date" value="2016-04-05" placeholder="测试日期输入" required>
		</div>
	</div>
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("input[type='number']").keydown(function(evt) {
			var iKeyCode = window.event?evt.keyCode:evt.which;    
			/*    
			ascii码说明： 
			8：退格键 
			46：delete 
			37-40： 方向键 
			48-57：小键盘区的数字 
			96-105：主键盘区的数字 
			110、190：小键盘区和主键盘区的小数点 
			189、109：小键盘区和主键盘区的负号 
			 
			13：回车 
			9： Tab 就是那个把焦点移到下一个文本框的东东。 
			*/  
	        if((iKeyCode>=48) && (iKeyCode<=57) || (iKeyCode>=96) && (iKeyCode<=105) || (iKeyCode>=37) && (iKeyCode<=40) ||iKeyCode===8|| iKeyCode==46) {
	        	
	    	} else {    
				if (window.event) {    
	            	//IE 
	                event.returnValue = false;    
	            } else {    
	            	//Firefox
	                evt.preventDefault();    
	            }    
	        }
		}).keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,''));
		});
  	});
  
	$(".datepickers").datepicker({
        format: "yyyy-mm-dd",
        weekStart: 0,
        language: "zh-CN",
        autoclose: true,
        todayHighlight: true
    });
	</script>
</body>
</html>