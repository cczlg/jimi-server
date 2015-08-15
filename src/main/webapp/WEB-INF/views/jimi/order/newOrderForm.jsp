<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>订单管理</title>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					loginName: {
						remote: "${ctx}/jimi/order/checkName"
					}
				},
				messages: {
					loginName: {
						remote: "订单名已存在"
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
			订单管理
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">订单管理</a>
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
							<div class="pull-left">订单信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="icon-remove"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" role="form" id="inputForm" action="${ctx}/jimi/order/" method="post" autocomplete="off">

									<div class="form-group">
										<label class="col-lg-4 control-label" for="companyId">公司</label>
										<div class="col-lg-8">
											<input type="text" id="companyId" name="companyId"
												class="form-control required" placeholder="公司">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="employeeId">业务员</label>
										<div class="col-lg-8">
											<input type="text" id="employeeId" name="employeeId"
												class="form-control required" placeholder="业务员">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="code">订单号</label>
										<div class="col-lg-8">
											<input type="text" id="code" name="code"
												class="form-control " placeholder="订单号">
										</div>
									</div>
									<!-- <div class="form-group">
										<label class="col-lg-4 control-label" for="orderTime">订单时间</label>
										<div class="col-lg-8">
											<input type="text" id="orderTime" name="orderTime"
												class="form-control " placeholder="订单时间">
										</div>
									</div> -->
									<div class="form-group">
										<label class="col-lg-4 control-label" for="customer">客户</label>
										<div class="col-lg-8">
											<input type="text" id="customer" name="customer"
												class="form-control required" placeholder="客户">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="customerphone">客户电话</label>
										<div class="col-lg-8">
											<input type="text" id="customerphone" name="customerphone"
												class="form-control " placeholder="客户电话">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="address">送货地址</label>
										<div class="col-lg-8">
											<input type="text" id="address" name="address"
												class="form-control " placeholder="送货地址">
										</div>
									</div><div class="form-group">
										<label class="col-lg-4 control-label" for="total">订单金额</label>
										<div class="col-lg-8">
											<input type="text" id="total" name="total"
												class="form-control " placeholder="订单金额" value="0">
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
