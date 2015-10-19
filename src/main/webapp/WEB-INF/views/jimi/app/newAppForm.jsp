<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>公司管理</title>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					name: {
						remote: "${ctx}/jimi/company/checkName"
					}
				},
				messages: {
					name: {
						remote: "公司名称已经存在"
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
			公司管理
			<!-- page meta -->
			<span class="page-meta">App Management</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="icon-home"></i> 首页</a>
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
								<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="icon-remove"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" role="form" id="inputForm" action="${ctx}/jimi/company/" method="post" autocomplete="off">

									<div class="form-group">
										<label class="col-lg-4 control-label" for="name">公司名称</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="公司名称">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="address">地址</label>
										<div class="col-lg-8">
											<input type="text" id="address" name="address"
												class="form-control required" placeholder="地址">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="linkMan">联系人</label>
										<div class="col-lg-8">
											<input type="text" id="linkMan" name="linkMan"
												class="form-control required" placeholder="联系人">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="linkPhone">联系电话</label>
										<div class="col-lg-8">
											<input type="text" id="linkPhone" name="linkPhone"
												class="form-control required" placeholder="联系电话">
										</div>
									</div>
									<div class="form-group">
										<label for="memo" class="col-lg-4 control-label">备注</label>
										<div class="col-lg-8">
											<input type="text" id="memo" name="memo"
												class="form-control" placeholder="备注">
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
