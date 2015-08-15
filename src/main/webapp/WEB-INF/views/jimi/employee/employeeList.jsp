<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>员工管理</title>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<h2 class="pull-left">
			<i class="glyphicon glyphicon-th-list"></i> 员工管理
		</h2>

		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/tml"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">员工管理</a>
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
							<div class="pull-left">员工</div>
							<div class="widget-icons pull-right">
								<button class="btn"
									onclick="window.location.href='${ctx}/jimi/employee/'">创建</button>
								<a href="#" class="wminimize"><i class=glyphicon glyphicon-chevron-up></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">

							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>公司名称</th>
										<th>员工姓名</th>
										<th>电话号码</th>
										<th>手机串号</th>
										<th>状态</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${employees}" var="employee" varStatus="idx">
										<tr>
											<td>${idx.index+1}</td>
											<td>${employee.companyId }</td>
											<td>${employee.name}</td>
											<td>${employee.phone }</td>
											<td>${employee.phoneIMEI }</td>
											<td>
												<c:if test="${employee.status eq 'enabled' }">
												已启用
												</c:if>
												<c:if test="${employee.status eq 'disabled' }">
												已禁用
												</c:if>
											</td>
											<td>
												<div class="btn-group1">
													<button class="btn btn-xs btn-warning"
														onclick="{location.href='${ctx}/jimi/employee/update/${employee.id}'}">
														<i class="icon-pencil"></i>
													</button>
													<c:if test="${employee.status eq 'enabled' }">
													<button class="btn btn-xs btn-danger" 
														onclick="{location.href='${ctx}/jimi/employee/changeStatus?id=${employee.id}&status=disabled'}">
														<i class="glyphicon glyphicon-ban-circle"></i>
													</button>
													</c:if>
													<c:if test="${employee.status eq 'disabled' }">
													<button class="btn btn-xs btn-success" 
														onclick="{location.href='${ctx}/jimi/employee/changeStatus?id=${employee.id}&status=enabled'}">
														<i class="glyphicon glyphicon-ok-circle"></i>
													</button>
													</c:if>
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
