<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>发布管理</title>
</head>

<body>
	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			发布管理
			<!-- page meta -->
			<span class="page-meta">Company Management</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">发布管理</a>
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
							<div class="pull-left">版本</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" app="form" id="inputForm" action="${ctx}/jimi/app/" method="post" autocomplete="off">
									
									<div class="form-group">
										<label class="col-lg-4 control-label" for="versionName">版本名称</label>
										<div class="col-lg-8">
											<input type="text" id="versionName" name="versionName"
												class="form-control required" placeholder="版本名称" value="${app.versionName }" >
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="versionCode">版本代码</label>
										<div class="col-lg-8">
											<input type="text" id="versionCode" name="versionCode"
												class="form-control required" placeholder="版本代码" value="${app.versionCode }">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-4 control-label" for="fileName">文件名</label>
										<div class="col-lg-8">
											<input type="text" id="fileName" name="fileName"
												class="form-control required" placeholder="文件名" value="${app.fileName }">
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
