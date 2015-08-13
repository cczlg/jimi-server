<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<!-- Title and other stuffs -->
	<title>用户注册</title> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="Edmond Zhang">
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="${ctx}/resources/style/bootstrap.css">
	<link rel="stylesheet" href="${ctx}/resources/style/font-awesome.css">
 	<link rel="stylesheet" href="${ctx}/resources/style/style.css">
	<link rel="stylesheet" href="${ctx}/resources/js/jquery-validation/1.11.1/validate.css" type="text/css"/>
  
  	<!-- HTML5 Support for IE -->
  	<!--[if lt IE 9]>
  		<script src="js/html5shim.js"></script>
  	<![endif]-->

	<!-- Favicon -->
	<link type="image/x-icon" href="${ctx}/resources/img/favicon.ico" rel="shortcut icon"/>

</head>

<body>
<!-- Form area -->
<div class="admin-form">
  <div class="container">

    <div class="row">
      <div class="col-md-5">
        <!-- Widget starts -->
            <div class="widget worange">
              <!-- Widget head -->
              <div class="widget-head">
                <i class="glyphicon glyphicon-user"></i> 用户注册 
              </div>
				
              <div class="widget-content">
                <div class="padd">
	<form id="inputForm" action="${ctx}/register" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="loginName" class="control-label col-lg-3">登录名:</label>
				<div class="col-lg-9">
					<input type="text" id="loginName" name="loginName" class="form-control required" minlength="3"/>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-lg-3">用户名:</label>
				<div class="col-lg-9">
					<input type="text" id="name" name="name" class="form-control required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="plainPassword" class="control-label col-lg-3">密码:</label>
				<div class="col-lg-9">
					<input type="password" id="plainPassword" name="password" class="form-control required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="confirmPassword" class="control-label col-lg-3">确认密码:</label>
				<div class="col-lg-9">
					<input type="password" id="confirmPassword" name="confirmPassword" class="form-control required" equalTo="#plainPassword"/>
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
	</form>
	
	
				</div>
                </div>
              
            </div>  
      </div>
    </div>
  </div> 
</div>

<!-- JS -->
<script src="${ctx}/resources/js/jquery.js"></script>
<script src="${ctx}/resources/js/bootstrap.js"></script>
<script src="${ctx}/resources/js/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/resources/js/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					loginName: {
						remote: "${ctx}/register/checkLoginName"
					}
				},
				messages: {
					loginName: {
						remote: "用户登录名已存在"
					}
				}
			});
		});
	</script>
</body>
</html>
