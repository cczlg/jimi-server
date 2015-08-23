<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>公司管理</title>
</head>

<body>
	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			公司管理
			<!-- page meta -->
			<span class="page-meta">Company Management</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">公司管理</a>
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
							<div class="pull-left">公司信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="glyphicon glyphicon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" company="form" id="inputForm" action="${ctx}/jimi/company/update" method="post" autocomplete="off">
									<input type="hidden" name="id" value="${company.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="name">公司名称</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="公司名称" value="${company.name }" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="address">地址</label>
										<div class="col-lg-8">
											<input type="text" id="address" name="address"
												class="form-control required" placeholder="地址" value="${company.address }">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="linkMan">联系人</label>
										<div class="col-lg-8">
											<input type="text" id="linkMan" name="linkMan"
												class="form-control required" placeholder="联系人" value="${company.linkMan }">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="linkPhone">联系电话</label>
										<div class="col-lg-8">
											<input type="text" id="linkPhone" name="linkPhone"
												class="form-control required" placeholder="联系电话" value="${company.linkPhone }">
										</div>
									</div>
									<div class="form-group">
										<label for="memo" class="col-lg-4 control-label">备注</label>
										<div class="col-lg-8">
											<input type="text" id="memo" name="memo"
												class="form-control" placeholder="备注" value="${company.memo }">
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
