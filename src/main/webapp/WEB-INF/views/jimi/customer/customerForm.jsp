<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>客户管理</title>
</head>

<body>
	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			客户管理
			<!-- page meta -->
			<span class="page-meta">Customer Management</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">客户管理</a>
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
							<div class="pull-left">客户信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" customer="form" id="inputForm" action="${ctx}/jimi/customer/update" method="post" autocomplete="off">
									<input type="hidden" name="id" value="${customer.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="companyId">公司名称</label>
										<div class="col-lg-8">
											<input type="text" id="companyId" name="companyId"
												class="form-control required" placeholder="公司名称" readonly="readonly" value='${customer.companyId }'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="name">客户名称</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="客户名称" readonly="readonly" value='${customer.name }'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="phone">联系电话</label>
										<div class="col-lg-8">
											<input type="text" id="phone" name="phone"
												class="form-control required" placeholder="联系电话" value='${customer.phone }'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="address">地址</label>
										<div class="col-lg-8">
											<input type="text" id="address" name="address"
												class="form-control required" placeholder="地址" value='${customer.address }'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="score">积分</label>
										<div class="col-lg-8">
											<input type="text" id="score" name="score"
												class="form-control " placeholder="积分" readonly="readonly" value='${customer.score }'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="employeeId">业务员</label>
										<div class="col-lg-8">
											<input type="text" id="employeeId" name="employeeId"
												class="form-control " placeholder="业务员" value='${customer.employeeId }'>
										</div>
									</div>
									<div class="form-group">
										<label for="memo" class="col-lg-4 control-label"
											for="loginName">备注</label>
										<div class="col-lg-8">
											<input type="text" id="memo" name="memo"
												class="form-control" placeholder="备注" value='${customer.memo }'>
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
