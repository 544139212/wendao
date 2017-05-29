<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<script src="/js/jquery.js"></script>
	<link href="/css/confirm/jquery-confirm.min.css" rel="stylesheet">
	<script src="/js/confirm/jquery-confirm.min.js"></script>
</head>
<body>
	<a href="javascript:void(0);" onclick="fdel(1)">测试删除</a>
		
	<script type="text/javascript">
    function fdel(id) {
        $.confirm({
        	theme: 'black',	
        	icon: 'fa fa-warning',
            title: '警告',
            content: '确认删除该记录?',
            confirmButton: '是的',
            cancelButton: '不，先留着',
            confirm: function () {
            	$.ajax({
					type: "GET",
				  	url: "#", 
				  	data: {"id":id},
				  	cache: false,
				  	async: false,
				  	dataType: "json",
				  	success: function(data){
				  		var json = data;
	  					if (json.status == 0) {
	  						$.alert({
	  							theme: 'black',	
	  						    title: '提醒',
	  						    content: '删除成功',
	  						  	confirmButton: '好哒',
	  						    confirm: function(){
	  						    	window.location.reload();
	  						    }
	  						});
	  					}
				  	},
				  	error: function(XMLHttpRequest, textStatus, errorThrown) {
				  		alert(errorThrown);
				  	}
				});
            },
            cancel: function () {
                
            }
        });
    }
    </script>
</body>
</html>