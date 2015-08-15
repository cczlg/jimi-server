<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>员工管理</title>
</head>

<body>
	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			员工管理
			<!-- page meta -->
			<span class="page-meta">Employee Management</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">员工管理</a>
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
							<div class="pull-left">员工信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" employee="form" id="inputForm" action="${ctx}/jimi/employee/update" method="post" autocomplete="off">
									<input type="hidden" name="id" value="${employee.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="companyId">公司名称</label>
										<div class="col-lg-8">
											<input type="text" id="companyId" name="companyId"
												class="form-control required" placeholder="公司名称" readonly="readonly" value="${employee.companyId }">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="name">员工姓名</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="员工姓名" value="${employee.name }">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label"
											for="phone">电话号码</label>
										<div class="col-lg-8">
											<input type="text" id="phone" name="phone"
												class="form-control" placeholder="电话号码" value="${employee.phone }">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label"
											for="phoneIMEI">手机序列号</label>
										<div class="col-lg-8">
											<input type="text" id="phoneIMEI" name="phoneIMEI"
												class="form-control" placeholder="手机序列号" value="${employee.phoneIMEI }">
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
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
