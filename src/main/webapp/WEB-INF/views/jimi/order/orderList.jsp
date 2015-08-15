<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>订单管理</title>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<h2 class="pull-left">
			<i class="icon-table"></i> 订单管理
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
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
			<button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<!-- Matter -->

	<div class="matter">
		<div class="container">

			<!-- Table -->

			<div class="row">

				<div class="col-md-12">

					<div class="widget">

						<div class="widget-head">
							<div class="pull-left">订单</div>
							<div class="widget-icons pull-right">
								<button class="btn"
									onclick="window.location.href='${ctx}/jimi/order/'">创建</button>
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">

							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>公司</th>
										<th>订单号</th>
										<th>业务员</th>
										<th>订单日期</th>
										<th>订单金额</th>
										<th>客户</th>
										<th>客户电话</th>
										<th>地址</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${orders}" var="order" varStatus="idx">
										<tr>
											<td>${idx.index+1}</td>
											<td>${order.companyId}</td>
											<td>${order.code}</td>
											<td>${order.employeeId}</td>
											<td>${order.orderTime}</td>
											<td>${order.total}</td>
											<td>${order.customer}</td>
											<td>${order.customerphone}</td>
											<td>${order.address}</td>
											<td>
												<div class="btn-group1">
													<button class="btn btn-xs btn-warning"
														onclick="{location.href='${ctx}/jimi/order/update/${order.id}'}">
														<i class="icon-pencil"></i>
													</button>
													<button class="btn btn-xs btn-danger"
														onclick="{location.href='${ctx}/jimi/order/delete/${order.id}'}">
														<i class="icon-remove"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="widget-foot">


								<ul class="pagination pull-right">
									<li><a href="#">上一页</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">下一页</a></li>
								</ul>

								<div class="clearfix"></div>

							</div>

						</div>

					</div>


				</div>

			</div>


		</div>
	</div>

	<!-- Matter ends -->

</body>
</html>
