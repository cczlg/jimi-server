<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>产品管理</title>
</head>

<body>
	
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			产品管理
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">产品管理</a>
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
							<div class="pull-left">产品信息</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="glyphicon glyphicon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" product="form" id="inputForm" action="${ctx}/jimi/product/update" method="post" autocomplete="off">
									<input type="hidden" name="id" value="${product.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="companyId">公司</label>
										<div class="col-lg-8">
											<input type="text" id=""companyId"" name=""companyId""
												class="form-control required" placeholder="公司" value="${product.companyId}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="product">产品名称</label>
										<div class="col-lg-8">
											<input type="text" id="product" name="product"
												class="form-control required" placeholder="产品名称" value="${product.product}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="purchasePrice">进价</label>
										<div class="col-lg-8">
											<input type="text" id="purchasePrice" name="purchasePrice"
												class="form-control" placeholder="进价" value="${product.purchasePrice}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="price">售价</label>
										<div class="col-lg-8">
											<input type="text" id="price" name="price"
												class="form-control required" placeholder="售价"  value="${product.price}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="image">图片</label>
										<div class="col-lg-8">
											<input type="text" id="image" name="image"
												class="form-control required" placeholder="图片" value="${product.image}">
										</div>
									</div>
									<div class="form-group">
										<label for="memo" class="col-lg-4 control-label"
											for="loginName">备注</label>
										<div class="col-lg-8">
											<input type="text" id="memo" name="memo"
												class="form-control" placeholder="备注" value="${product.memo}">
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
			$("#product").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
