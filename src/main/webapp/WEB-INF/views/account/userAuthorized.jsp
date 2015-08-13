<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>用户授权</title>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			用户权限管理
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="index.html"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">用户权限管理</a>
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
							<div class="pull-left">用户权限信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" role="form" 
									 id="inputForm" action="${ctx}/admin/user/authorized"
									method="post" autocomplete="off">
									<input type="hidden" name="id" value="${user.id}" />
									<div class="form-group">
										<label class="col-lg-4 control-label" for="loginName">登陆名:</label>
										<div class="col-lg-8">
											<input type="text" id="loginName" name="loginName"
												class="form-control required" placeholder="用户登陆名"
												minlength="3" readonly value="${user.loginName}">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label" for="name">昵称:</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="用户昵称"
												 readonly value="${user.name}">
										</div>
									</div>

									<hr />
									<div class="form-group">
										<label class="col-lg-4 control-label">角色</label>
										<div class="col-lg-8">
											<c:forEach items="${roles}" var="role" varStatus="status">
												<label for="roles${status.index}" class="checkbox-inline"> <input
													type="checkbox" id="roles${status.index}" name="roles"
													value="${role.id }" ${role.stats}> ${role.name}
												</label> 
											</c:forEach>
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
