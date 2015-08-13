<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>角色管理</title>
</head>

<body>	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			角色授权管理
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">角色授权管理</a>
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
									 id="inputForm" action="${ctx}/admin/role/authorized"
									method="post" autocomplete="off">
									<input type="hidden" name="id" value="${role.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="loginName">角色名</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="用户登陆名"
												minlength="3" readonly value="${role.name}">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label" for="name">描述</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="用户昵称"
												 readonly value="${role.description}">
										</div>
									</div>

									<hr />
									<div class="form-group">
										<label class="col-lg-4 control-label">权限</label>
										<div class="col-lg-8">
											<c:forEach items="${perms}" var="perm" varStatus="status">
												<label for="perms${status.index}" class="checkbox-inline"> <input
													type="checkbox" id="perms${status.index}" name="permissions"
													value="${perm.id }" ${perm.stats}> ${perm.permission}
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
