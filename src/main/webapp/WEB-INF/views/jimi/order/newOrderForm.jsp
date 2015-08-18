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
								<form class="form-horizontal" role="form" id="inputForm"
									action="${ctx}/jimi/order/" method="post" autocomplete="off">

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
									<div class="form-group">
										<label class="col-lg-4 control-label" for="orderTime">订单时间</label>
										<!-- <div class="col-lg-8">
											<input type="text" id="orderTime" name="orderTime"
												class="form-control " placeholder="订单时间">
										</div> -->

										<div class="col-lg-8 input-append date form_date" data-date=""
											data-date-format="yyyy-mm-dd" data-link-field="orderTime"
											data-link-format="yyyy-mm-dd" style="display: block">
											<input size="16" type="text" value="" readonly> <span
												class="add-on"><i class="icon-remove"></i></span> <span
												class="add-on"><i class="icon-th"></i></span>
										</div>
										<input type="hidden" id="orderTime" name="orderTime" value="" />
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="customer">客户</label>
										<div class="col-lg-8">
											<input type="text" id="customer" name="customer"
												class="form-control required" placeholder="客户">
											<span class="add-on" id="customerSearch" >
												<i class="icon-search"></i></span>
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
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="total">订单金额</label>
										<div class="col-lg-8">
											<input type="text" id="total" name="total"
												class="form-control " placeholder="订单金额" value="0">
										</div>
									</div>
									<!-- items start -->
									<div class="control-group">
										<button type="button" id="add">增加</button>
									</div>
									<div class="control-group">
										<table id="contentTable"
											class="table table-striped table-bordered table-condensed">
											<thead>
												<tr>
													<th style="width: 70px;">商品名称</th>
													<th style="width: 50px;">单价</th>
													<th style="width: 30px;">数量</th>
													<th style="width: 50px;">小计</th>
												</tr>
											</thead>
											<tbody id="itemBody">

											</tbody>

										</table>
									</div>
									<!-- items end -->
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

	<!-- template -->
	<textarea style="display: none" id="template">
		<tr>
			<td>
			<div class="input-append">
				<input id="productId_{0}" name="orderItems[{0}].productId">
				<input id="product_{0}" name="orderItems[{0}].product">
				<button class="btn" type="button" id="productSearchBtn_{0}"><i class="icon-search"></i></button>
			</div>
			</td>
			<td>
				<input id="price_{0}" name="orderItems[{0}].price" class="input-small price">
			</td>
			<td>
				<input id="quantity_{0}" name="orderItems[{0}].quantity"
				class="input-small quantity">
			</td>
			<td>
				<input id="subTotal_{0}" name="orderItems[{0}].subTotal"
				class="input-small subTotal">
			</td>
		</tr>
	</textarea>
	<!-- search dialog -->
	<!-- Modal product-->
	<div id="mtlModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myModalLabel">选择</h3>
	  </div>
	  <div class="modal-body">
	    <form class="form-search">
			<input type="text" placeholder="商品类别" class="input-medium search-query" >
  			<button type="submit" class="btn">Search</button>
	    </form>
	    <table class="table">
			<thead>
				<tr>
					<th></th>
					<th>商品代码</th>
					<th>商品名称</th>
					<th>品牌</th>
					<th>规格型号</th>
				</tr>
			</thead>
			<tbody id="mtlResult">
	    		
	    	</tbody>
	    </table>
	  </div>
	  <div class="modal-footer">
	    <button class="btn btn-primary" id="mtlSearchOk">确定</button>
	    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
	  </div>
	</div>
	<!-- Modal customer-->
	<div id="customerModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myModalLabel">选择</h3>
	  </div>
	  <div class="modal-body">
	    <form class="form-search">
			<input type="text" placeholder="客户类别" class="input-medium search-query" >
  			<button type="submit" class="btn">Search</button>
	    </form>
	    <table class="table">
			<thead>
				<tr>
					<th></th>
					<th>客户名称</th>
					<th>客户全称</th>
					<th>地区</th>
					<th>联系人</th>
				</tr>
			</thead>
			<tbody id="customerResult">
	    		
	    	</tbody>
	    </table>
	  </div>
	  <div class="modal-footer">
	    <button class="btn btn-primary" id="customerSearchOk">确定</button>
	    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
	  </div>
	</div>
	
	<script type="text/javascript">
	var ctx="${ctx}";
	</script>
	<script type="text/javascript" src="${ctx}/resources/jimi/order.js"></script>
	<script>
		
	</script>
</body>
</html>
