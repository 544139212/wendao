<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="<c:url value="/scripts/GreenSchool.js"/>"></script>
<form:form method="post" name="Form0" action="change" id="Form0" commandName="passwordForm">
   	<div align="center" style="padding-top:10px;">
   		<font class="colorRed"><b>
      	</b></font>
    </div>
	<div class="contentPadding">
		<div class="pageNav">CHANGE PASSWORD 修改密碼</div>
		<div class="changePwd">
			<table class="widthP100">
				<tr>
					<td>Password</td>
					<td><form:input type="password" path="password" maxlength="255" id="password" class="inputTextL" onkeyup="trim(this)" /></td>
				</tr>
				<tr>
					<td>New Password</td>
					<td><form:input type="password" path="newPassword" maxlength="255" id="newPassword" class="inputTextL" onkeyup="trim(this)" /></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><form:input type="password" path="repeatPassword" maxlength="255" id="repeatPassword" class="inputTextL" onkeyup="trim(this)" /></td>
				</tr>
			</table>
		</div>
		<div class="submitBtn">
			<a class="btn btn_arrowright" href="javascript:;" onclick="document.Form0.submit();">Confirm<br>確定</a>
			<a class="btn btn_arrowleft" href="javascript:;" onclick="href='../home'">Back to Homepage<br>返回主頁</a>
		</div>
	</div>
   	<div id="footer">
       	<ul class="horizontal">
     		<li><a href="<c:url value="/images/PNS GSP 2015-16 Guideline.pdf"/>" target="_blank"><img src="<c:url value="/images/btn_1.png"/>" alt=""></img></a></li>
       		<li><a href="<c:url value="/proposalForm/toPromotionForm"/>"><img src="<c:url value="/images/btn_2.png"/>" alt=""></img></a></li>
   	   		<li><a href="<c:url value="/proposalForm/applicationResult"/>"><img src="<c:url value="/images/btn_3.png"/>" alt=""></img></a></li>
   	   		<%-- <li><a href="<c:url value="https://greenschool.parknshop.com/greenschool/GreenSchoolPromotionForm.do"/>"><img src="<c:url value="/images/btn_4.png"/>" alt=""></img></a></li> --%>
   	   		<li><a href="<c:url value="/images/PNS GSP 2015-16 Guideline.pdf"/>" target="_blank"><img src="<c:url value="/images/btn_5.png"/>" alt=""></img></a></li>
		</ul>
	</div>
</form:form>
        