<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

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
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
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
								<a href="#" class="wminimize"><i class="glyphicon glyphicon-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" order="form" id="inputForm" action="${ctx}/jimi/order/update" method="post" autocomplete="off">
									<input type="hidden" name="id" value="${order.id}"/>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="companyId">公司</label>
										<div class="col-lg-8">
											<input type="text" id="companyId" name="companyId"
												class="form-control " placeholder="公司" value="${order.companyId}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="employeeId">业务员</label>
										<div class="col-lg-8">
											<input type="text" id="employeeId" name="employeeId"
												class="form-control " placeholder="业务员" value="${order.employeeId}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="code">订单号</label>
										<div class="col-lg-8">
											<input type="text" id="code" name="code"
												class="form-control " placeholder="订单号" value="${order.code}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="orderTime">下单时间</label>
										<%-- <div class="col-lg-8">
											<input type="text" id="orderTime" name="orderTime"
												class="form-control " placeholder="下单时间" value="${order.orderTime}" readonly="readonly">
										</div> --%>
										
										<div class="col-lg-8 input-append date form_date" data-date=""
											data-date-format="yyyy-mm-dd" data-link-field="orderTime"
											data-link-format="yyyy-mm-dd" style="display: block">
											<input size="16" type="text" value="<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd" />" readonly="readonly"> 
											<span
												class="add-on"><i class="glyphicon glyphicon-remove"></i></span> <span
												class="add-on"><i class="glyphicon glyphicon-th"></i></span>
										</div>
										<input type="hidden" id="orderTime" name="orderTime" value="<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd" />" />
									</div> 
									<div class="form-group">
										<label class="col-lg-4 control-label" for="customer">客户</label>
										<div class="col-lg-8">
											<input type="text" id="customer" name="customer"
												class="form-control required" placeholder="客户" value="${order.customer}" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="customerphone">客户电话</label>
										<div class="col-lg-8">
											<input type="text" id="customerphone" name="customerphone"
												class="form-control required" placeholder="客户电话" value="${order.customerphone}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="address">送货地址</label>
										<div class="col-lg-8">
											<input type="text" id="address" name="address"
												class="form-control " placeholder="送货地址" value="${order.address}">
										</div>
									</div><div class="form-group">
										<label class="col-lg-4 control-label" for="total">订单金额</label>
										<div class="col-lg-8">
											<input type="text" id="total" name="total"
												class="form-control " placeholder="订单金额" value="${order.total}">
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
												<c:forEach items="${order.items }" var="item"
													varStatus="status">
													<tr>
														<td>
															<div class="input-append">
																<input id="productId_${status.index }"
																	name="items[${status.index }].productId"
																	value="${item.productId }" class="">
																<button class="btn" type="button" onclick="order.showProductSearch(event)">
																	<i class="glyphicon glyphicon-search"></i>
																</button>
															</div>
														</td>
														<td><input id="price_${status.index }"
															name="items[${status.index }].price" value="${item.price }"
															class="price input-small"></td>
														<td><input id="quantity_${status.index }"
															name="items[${status.index }].quantity"
															value="${item.quantity }" class="quantity input-small"></td>
														<td><input id="subTotal_${status.index }"
															name="items[${status.index }].subTotal"
															value="${item.price*item.quantity }" class="subTotal input-small"></td>
						
													</tr>
												</c:forEach>
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
				<input id="productId_{0}" name="items[{0}].productId">
				<input id="product_{0}" name="items[{0}].product">
				<button class="btn" type="button" id="productSearchBtn_{0}"><i class="glyphicon glyphicon-search"></i></button>
			</div>
			</td>
			<td>
				<input id="price_{0}" name="items[{0}].price" class="input-small price">
			</td>
			<td>
				<input id="quantity_{0}" name="items[{0}].quantity"
				class="input-small quantity">
			</td>
			<td>
				<input id="subTotal_{0}" name="items[{0}].subTotal"
				class="input-small subTotal">
			</td>
		</tr>
	</textarea>
	
	<script type="text/javascript">
	var ctx="${ctx}";
	</script>
	<script type="text/javascript" src="${ctx}/resources/jimi/order.js"></script>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
			
			$('.form_date').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0
			});
		});
	</script>
</body>
</html>
