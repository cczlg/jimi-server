<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>发布管理</title>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<h2 class="pull-left">
			<i class="icon-table"></i> 发布管理
		</h2>

		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/tml"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">发布管理</a>
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
							<div class="pull-left">版本</div>
							<div class="widget-icons pull-right">
								<button class="btn"
									onclick="window.location.href='${ctx}/jimi/app/'">创建</button>
								<a href="#" class="wminimize"><i class="glyphicon glyphicon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">

							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>版本名称</th>
										<th>版本代码</th>
										<th>文件名</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${apps}" var="app" varStatus="idx">
										<tr>
											<td>${idx.index+1}</td>
											<td>${app.versionName}</td>
											<td>${app.versionCode }</td>
											<td>${app.fileName }</td>
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
