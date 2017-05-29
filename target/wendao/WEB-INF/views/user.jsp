<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="pager" tagdir="/WEB-INF/tags" %>


<style type="text/css">
ul, ol, li {
	list-style-type: none;
	margin: 0;
	padding: 0;
}
</style>

<style type="text/css">
.thumbnail {
	border: none;
}
.icon-star, .icon-star-half {
	color: yellow;
}
</style>

<style type="text/css">
#image-grid {
	width:250px;
	height:250px;
	background: #fff url('/image/basics-15-64-0.png') no-repeat scroll center;
	border:1px solid #ccc;
	/* background: #fff url('/image/basics-15-64-1.png') no-repeat scroll center;
	border:1px solid #e6e6e6; */
	position: relative;
	padding-left: 0;
	padding-right: 0;
}

/*form-control:focus*/
#image-grid:hover {
	border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    
    background: #fff url('/image/basics-15-64.png') no-repeat scroll center;
}

.upload-image-file {
	display: none;
}

.upload-image-show {
	width: 100%;
	height: 100%; 
}

.upload-image-file .file { 
	position: absolute; 
	top: 0; 
	left: 0; 
	width: 100%;
	height: 100%; 
	opacity: 0; /* ʵ�ֵĹؼ�� */ 
	filter:alpha(opacity=0);/* IE */ 
	-moz-opacity:0; /* Moz + FF */
} 
</style>

<style type="text/css">
.ebox-i {
   	position: relative;
	float: left;
	width: 50%;
	/* padding: 15px 15px 20px; */
	color: #777;
	border-bottom: 1px dashed #DDD;
	font-size: 12px;
	text-align: center;
	line-height: 1.42857;
}

.ebox-i:hover {
    background-color: #F9F9F9;
}

.ebox-01, .ebox-03 {
    border-right: 1px dashed #DDD;
}

.ebox-100 {
	width: 100%;
	margin-bottom: 0px;
	border-bottom: medium none;
}

.desc {
	width: 100%;
	position: absolute;
	/* top:0; */
	bottom:0;
	display: none;
	
	background-color: rgba(0,0,0,.5);
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr=#76000000,endColorStr=#76000000);
	
	color:#fff;
	text-align: center;
}
</style>


<%-- <form class="form-horizontal" action="<c:url value="/user/changeInfo"/>" method="post">
	<div class="form-group">
		<label for="inputText3" class="col-xs-2 control-label"><i class="icon-key"></i></label>
		<div class="col-xs-10">
			<input type="text" class="form-control" id="inputText3" placeholder="昵称" 
				name="text" value="Admin">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<button type="submit" class="btn btn-default"><i class="icon-signin"></i> 修改昵称</button>
		</div>
	</div>
</form>
<form id="changePwd" class="form-horizontal" action="<c:url value="/user/changePwd"/>" method="post">
	<div class="form-group">
		<label for="inputPassword3" class="col-xs-2 control-label"><i class="icon-key"></i></label>
		<div class="col-xs-10">
			<input type="password" class="form-control" id="inputPassword3" placeholder="密码" 
				name="password" value="admin">
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword3" class="col-xs-2 control-label"><i class="icon-key"></i></label>
		<div class="col-xs-10">
			<input type="password" class="form-control" id="inputPassword3" placeholder="密码" 
				name="password" value="admin">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<button type="submit" class="btn btn-default"><i class="icon-signin"></i> 修改密码</button>
		</div>
	</div>
</form> --%>

<div class="panel panel-default">
	<!-- <div class="panel-heading">
		<h3 class="panel-title">
	 		我的资料
		</h3>
	</div> -->
	<div class="panel-body">
		<div class="thumbnail text-center">
			<%-- <c:choose>
				<c:when test="${not empty currentUser.photo}">
					<img src="/upload/user/${currentUser.photo }">
				</c:when>
				<c:otherwise>
					<img src="/image/201507201450490931.jpg">
				</c:otherwise>
			</c:choose>
			<button class="btn btn-link" data-toggle="modal" data-target="#myModal">编辑头像</button> --%>
          		<div class="caption">
              		<h3>${currentUser.name }</h3>
              		<p>${currentUser.email }</p>
          		</div>
       		</div>
      		<div style="padding: 20px 0px;margin: 10px 15px;border-top: 1px dashed #DDD;border-bottom: 1px dashed #DDD;text-align: center;font-size: 14px;line-height: 1.42857;">
			<c:forEach begin="1" end="${starLevel }">
				<i class="icon-star"></i>
			</c:forEach>
			<c:if test="${starLevel % 2 == 1 }">
				<i class="icon-star-half"></i>
			</c:if>
		</div>
		<div class="row">
			<div class="col-xs-6 text-muted text-center"><a href="/u/blog">博客<br>${blogCount }</a></div>
			<div class="col-xs-6 text-muted text-center"><a href="/u/link">链接<br>${linkCount }</a></div>
		</div>
	</div>
</div>

<%-- <div class="panel panel-default">
	<div class="panel-heading">
      		<h3 class="panel-title">
			我关注的人
      		</h3>
  		</div>
  		<div class="panel-body">
  			<ul>
			<%for(int i = 0; i < 4; i++) {%>
				<%if (i%4 == 0) {%>
					<li class="ebox-i ebox-01">
						<div>
							<h4>Name <%=i %></h4>
							<p>Email <%=i %></p>
						</div>
						<div class="desc">
							<a class="btn btn-primary">取消关注</a>
							<a class="btn btn-danger">发送私信</a>
						</div>
					</li>
				<%} %>
				<%if (i%4 == 1) {%>
					<li class="ebox-i ebox-02">
						<div>
							<h4>Name <%=i %></h4>
							<p>Email <%=i %></p>
						</div>
						<div class="desc">
							<a class="btn btn-primary">取消关注</a>
							<a class="btn btn-danger">发送私信</a>
						</div>
					</li>
				<%} %>
				<%if (i%4 == 2) {%>
					<li class="ebox-i ebox-03">
						<div>
							<h4>Name <%=i %></h4>
							<p>Email <%=i %></p>
						</div>
						<div class="desc">
							<a class="btn btn-primary">取消关注</a>
							<a class="btn btn-danger">发送私信</a>
						</div>
					</li>
				<%} %>
				<%if (i%4 == 3) {%>
					<li class="ebox-i ebox-04">
						<div>
							<h4>Name <%=i %></h4>
							<p>Email <%=i %></p>
						</div>
						<div class="desc">
							<a class="btn btn-primary">取消关注</a>
							<a class="btn btn-danger">发送私信</a>
						</div>
					</li>
				<%} %>
			<%} %>
			<li class="ebox-i ebox-100">
				<h4>主题定制</h4>
				<p>完全按照您的需求量身打造，此项服务需要排期，具体请联系我们</p>
				<a class="btn btn-danger" href="">联系我们</a>
			</li>
		</ul>
  		</div>
</div> --%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">上传头像</h4>
            </div>
            <div class="modal-body">
            	<form id="photoForm" name="photoForm"  method="post" enctype="multipart/form-data" action="javascript: uploadAndSubmit();">
					<div class="row">
						<div class="col-xs-6 col-md-offset-3">
							<div id="image-grid">
								<div class="upload-image-file">
									<input type="file" name="file" class="file">
								</div>
								<div class="upload-image-show"></div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">确认上传</button>
					</div>
				</form>
            </div>
        </div><!-- /.modal-content -->
        
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
$("#image-grid").each(function(){
	var doEle = $(this);
	$(this).bind({
		mouseover:function() {
			doEle.find(".upload-image-file").css("display", "block");
		},
		mouseout:function() {
			doEle.find(".upload-image-file").css("display", "none");
		}
	});
	doEle.find(".upload-image-file .file").bind({
		change:function() {
			var file = this.files[0];
			var imageType = /image.*/;
			if (file.type.match(imageType)) {
				var reader = new FileReader();
				reader.onload = function(){
					var img = new Image();
					img.src = reader.result;
					$(img).width("100%");
					$(img).height("100%");
					doEle.find(".upload-image-show").empty(); 
					doEle.find(".upload-image-show").append(img); 
				};
				reader.readAsDataURL(file);
			}else{
				alert("不是图片");
			}
		}
	});
});
function uploadAndSubmit() {
	var form = document.forms["photoForm"];
	if (form["file"].files.length > 0) {
		var file = form["file"].files[0];
		
		var data = new FormData();
		data.append("file", file); 
		data.append("type", "user");
			
		//var filename = file['name'];
		//var ext = filename.substr(filename.lastIndexOf("."));  
		//var name = new Date().getTime()+ext.toUpperCase();  
		//https://segmentfault.com/a/1190000004322487
	      var xhr = new XMLHttpRequest();
	      xhr.responseType = "text";
	      xhr.open("POST", "/image/upload", true);
	      xhr.onload = function(e) { 
	      	if(this.status == 200||this.status == 304){
	      		var json=eval("("+this.responseText+")");
	          	if (json.status==0) {
	  				location.reload();
	          	}
			}
		};
		//xhr.ontimeout = function(e) { ... };
		//xhr.onerror = function(e) { ... };
		//xhr.upload.onprogress = function(e) { ... };
		xhr.send(data);
	}
}
</script>
<script type="text/javascript">
    $(".ebox-i").each(function() {
		$(this).hover(
			function() {
				$(this).find(".desc").animate({height: '100%', opacity: 'show'});
			},
			function() {
				$(this).find(".desc").animate({height: '0', opacity: 'hide'});
			}
		);
	});
</script>
</body>