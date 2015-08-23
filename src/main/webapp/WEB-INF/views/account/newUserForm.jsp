<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>新建用户</title>

<script>
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#loginName").focus();
		//为inputForm注册validate函数
		$("#inputForm").validate({
			rules : {
				loginName : {
					remote : "${ctx}/register/checkLoginName"
				}
			},
			messages : {
				loginName : {
					remote : "用户登录名已存在"
				}
			}
		});
	});
</script>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			用户管理
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">用户管理</a>
		</div>

		<div class="clearfix"></div>

	</div>
	<!-- Page heading ends -->



	<!-- Matter -->

	<div class="matter">
		<div class="container">

			<div class="row">

				<div class="col-md-12">


					<div class="widget wgreen">

						<div class="widget-head">
							<div class="pull-left">用户信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="glyphicon glyphicon-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" role="form" id="inputForm"
									action="${ctx}/admin/user" method="post" autocomplete="off">

									<div class="form-group">
										<label class="col-lg-4 control-label" for="loginName">登陆名:</label>
										<div class="col-lg-8">
											<input type="text" id="loginName" name="loginName"
												class="form-control required" placeholder="用户登陆名"
												minlength="3">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label"
											for="loginName">昵称:</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="用户昵称">
										</div>
									</div>
									<div class="form-group">
										<label for="plainPassword" class="col-lg-4 control-label">密码</label>
										<div class="col-lg-8">
											<input type="password" id="plainPassword" name="password"
												class="form-control required" placeholder="登陆密码">
										</div>
									</div>
									<div class="form-group">
										<label for="confirmPassword" class="col-lg-4 control-label">密码</label>
										<div class="col-lg-8">
											<input type="password" id="confirmPassword"
												name="confirmPassword" class="form-control required"
												placeholder="确认密码" equalTo="#plainPassword">
										</div>
									</div>

									<hr />
									<div class="form-group">
										<div class="col-lg-offset-1 col-lg-9">
											<button type="submit" class="btn btn-success">提交</button>
											<button type="reset" class="btn btn-default"
												onclick="history.back()">返回</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="widget-foot">
							<!-- Footer goes here -->
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>

	<!-- Matter ends -->
</body>
</html>
