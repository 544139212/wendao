<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>编辑资源</title>
    <link href="/css/index3/index3.css" rel="stylesheet">
  </head>
  
  <body>
  
 	<br><br><br><br>
  
  	<div>
		<div>
			<div class="dis-tab-wrap">
				<div class="dis-tab-cell-wrap">
					<label>标题：</label>
					<div class="text_wrap">
						<input type="text" name="name" class="textfield">
					</div>
				</div>
			</div>
			
			<div class="dis-tab-wrap">
				<div class="dis-tab-cell-wrap">
					<label>性别：</label>
					<div class="select_wrap">
						<span></span>
						<select class="select" name="sexrequest">
							<option label="Male" value="M">
							<option label="Female" value="F">
						</select>
					</div>
				</div>
			</div>
			
			<div class="dis-tab-wrap">
				<div class="dis-tab-cell-wrap">
					<label>是否付费：</label>
					<div class="radio_wrap">
						<span>
							<em class="face-val"></em>
							<em class="face-val"></em>
						</span>
						<div class="real-val">
							<input type="radio" name="commend" value="true">是
							<input type="radio" name="commend" value="false">否
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="dguide-sub">
			<input type="button" class="btn btn-yellow" value="保存修改">
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	$(".select_wrap").on("change", function() {
		var o;
		var opt = $(this).find('option');
		opt.each(function(i) {
			if (opt[i].selected == true) {
				o = opt[i].innerHTML;
			}
		});
		$(this).find('span').html(o);
	}).trigger('change');



	$(".radio_wrap").on("change", function() {
		var o;
		var opt = $(this).find('.radio');
		opt.each(function(i) {
			if (opt[i].checked == true) {/* should use eq */
				o = i;
			}
		});
		var p = $(this).find('em');
		p.each(function(i) {
			if (i == o) {
				p.eq(i).addClass("on");
			} else {
				p.eq(i).removeClass("on");
			}
		});
	}).trigger('change');
	
	</script>
	
  </body>
</html>


