<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<!-- Title and other stuffs -->
<title>我的微信服务号 <sitemesh:title /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Edmond Zhang">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<!-- Stylesheets -->
<link href="${ctx}/resources/style/bootstrap.css" rel="stylesheet">
	<!-- Font awesome icon -->
<link rel="stylesheet" href="${ctx}/resources/style/font-awesome.css">
	<!-- jQuery UI -->
<link rel="stylesheet" href="${ctx}/resources/style/jquery-ui.css">
	<!-- Calendar -->
<link rel="stylesheet" href="${ctx}/resources/style/fullcalendar.css">
	<!-- prettyPhoto -->
<link rel="stylesheet" href="${ctx}/resources/style/prettyPhoto.css">
	<!-- Star rating -->
<link rel="stylesheet" href="${ctx}/resources/style/rateit.css">
	<!-- Date picker -->
<link rel="stylesheet" href="${ctx}/resources/style/bootstrap-datetimepicker.min.css">
	<!-- CLEditor -->
<link rel="stylesheet" href="${ctx}/resources/style/jquery.cleditor.css">
	<!-- Uniform -->
<link rel="stylesheet" href="${ctx}/resources/style/uniform.default.css">
	<!-- Bootstrap toggle -->
<link rel="stylesheet" href="${ctx}/resources/style/bootstrap-switch.css">
	<!-- Main stylesheet -->
<link rel="stylesheet" href="${ctx}/resources/style/style.css">
	<!-- Widgets stylesheet -->
<link rel="stylesheet" href="${ctx}/resources/style/widgets.css">
	<!-- Bootstrap treeview -->
<link rel="stylesheet" href="${ctx}/resources/style/bootstrap-treeview.css">

<link rel="stylesheet" href="${ctx}/resources/js/jquery-validation/1.11.1/validate.css" type="text/css" />
	
	<!-- HTML5 Support for IE -->
	<!--[if lt IE 9]>
 		<script src="js/html5shim.js"></script>
	<![endif]-->

	<!-- Favicon -->
<link type="image/x-icon" href="${ctx}/resources/img/favicon.ico"
	rel="shortcut icon" />

	<!-- jQuery -->
	<script src="${ctx}/resources/js/jquery.js"></script>
<sitemesh:head />
</head>

<body>

	<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">

		<div class="container">
			<!-- Menu button for smallar screens -->
			<div class="navbar-header">
				<button class="navbar-toggle btn-navbar" type="button"
					data-toggle="collapse" data-target=".bs-navbar-collapse">
					<span>菜单</span>
				</button>
				<!-- Site name for smallar screens -->
				<a href="index.html" class="navbar-brand hidden-lg">首页</a>
			</div>



			<!-- Navigation starts -->
			<nav class="collapse navbar-collapse bs-navbar-collapse"
				role="navigation">

			<ul class="nav navbar-nav">

				<!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
				<li class="dropdown dropdown-big"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><span
						class="label label-success"><i
							class="glyphicon glyphicon-cloud-upload"> </i></span> 上传到云服务器</a> <!-- Dropdown -->
					<ul class="dropdown-menu">
						<li>
							<!-- Progress bar -->
							<p>图片上传进度</p> <!-- Bootstrap progress bar -->
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>

							<hr /> <!-- Progress bar -->
							<p>视频上传进度</p> <!-- Bootstrap progress bar -->
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100" style="width: 80%">
									<span class="sr-only">完成80%</span>
								</div>
							</div>

							<hr /> <!-- Dropdown menu footer -->
							<div class="drop-foot">
								<a href="#">查看所有</a>
							</div>

						</li>
					</ul></li>

				<!-- Sync to server link -->
				<li class="dropdown dropdown-big"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><span
						class="label label-danger"><i
							class="glyphicon glyphicon-refresh"></i></span> 同步到服务器</a> <!-- Dropdown -->
					<ul class="dropdown-menu">
						<li>
							<!-- Using "icon-spin" class to rotate icon. -->
							<p>
								<span class="label label-info"><i
									class="glyphicon glyphicon-cloud"></i></span>同步会员到服务器
							</p>
							<hr />
							<p>
								<span class="label label-warning"><i
									class="glyphicon glyphicon-cloud"></i></span>同步书签到云端
							</p>

							<hr /> <!-- Dropdown menu footer -->
							<div class="drop-foot">
								<a href="#">查看所有</a>
							</div>

						</li>
					</ul></li>

			</ul>

			<!-- Search form -->
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
			</form>
			<!-- Links -->
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown pull-right"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <i
						class="glyphicon glyphicon-user"></i> <shiro:principal
							property="name" /> <b class="caret"></b>
				</a> <!-- Dropdown menu -->
					<ul class="dropdown-menu">
						<li><a href="#"><i class="glyphicon glyphicon-user"></i>
								资料</a></li>
						<li><a href="${ctx}/profile"><i
								class="glyphicon glyphicon-cog"></i> 设置</a></li>
						<li><a href="${ctx}/logout"><i
								class="glyphicon glyphicon-off"></i> 退出</a></li>
					</ul></li>

			</ul>
			</nav>

		</div>
	</div>


	<!-- Header starts -->
	<header> <%@ include file="/WEB-INF/layouts/mac/header.jsp"%>
	</header>

	<!-- Header ends -->

	<!-- Main content starts -->

	<div class="content">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/layouts/mac/left.jsp"%>

		<!-- Sidebar ends -->

		<!-- Main bar -->
		<div class="mainbar">
			<sitemesh:body />
		</div>

		<!-- Mainbar ends -->
		<div class="clearfix"></div>

	</div>
	<!-- Content ends -->

	<!-- Footer starts -->
	<footer> <%@ include file="/WEB-INF/layouts/mac/footer.jsp"%>
	</footer>

	<!-- Footer ends -->

	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up">
		</i></a></span>


	<!-- JS -->
	<script
		src="${ctx}/resources/js/jquery-validation/1.11.1/jquery.validate.min.js"
		type="text/javascript"></script>
	<script
		src="${ctx}/resources/js/jquery-validation/1.11.1/messages_bs_zh.js"
		type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="${ctx}/resources/js/bootstrap.js"></script>
	<!-- jQuery UI -->
	<script src="${ctx}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- Full Google Calendar - Calendar -->
	<script src="${ctx}/resources/js/fullcalendar.min.js"></script>
	<!-- RateIt - Star rating -->
	<script src="${ctx}/resources/js/jquery.rateit.min.js"></script>
	<!-- prettyPhoto -->
	<script src="${ctx}/resources/js/jquery.prettyPhoto.js"></script>

	<!-- jQuery Flot -->
	<script src="${ctx}/resources/js/excanvas.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.resize.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.pie.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.stack.js"></script>

	<!-- jQuery Notification - Noty -->
	<script src="${ctx}/resources/js/jquery.noty.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx}/resources/js/themes/default.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx}/resources/js/layouts/bottom.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx}/resources/js/layouts/topRight.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx}/resources/js/layouts/top.js"></script>
	<!-- jQuery Notify -->
	<!-- jQuery Notification ends -->

	<!-- Sparklines -->
	<script src="${ctx}/resources/js/sparklines.js"></script>
	<!-- CLEditor -->
	<script src="${ctx}/resources/js/jquery.cleditor.min.js"></script>
	<!-- Date picker -->
	<script src="${ctx}/resources/js/bootstrap-datetimepicker.min.js"></script>
	<!-- jQuery Uniform -->
	<%-- <script src="${ctx}/resources/js/jquery.uniform.min.js"></script> --%>
	<!-- Bootstrap Toggle -->
	<script src="${ctx}/resources/js/bootstrap-switch.min.js"></script>
	<!-- Filter for support page -->
	<script src="${ctx}/resources/js/filter.js"></script>
	<!-- Custom codes -->
	<script src="${ctx}/resources/js/custom.js"></script>
	<!-- Charts & Graphs -->
	<script src="${ctx}/resources/js/charts.js"></script>
	<!-- TreeView -->
	<script src="${ctx}/resources/js/bootstrap-treeview.js"></script>

	<!-- Script for this page -->
	

</body>
</html>