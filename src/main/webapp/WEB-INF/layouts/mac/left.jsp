<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<shiro:user>
	<div class="sidebar">
		<div class="sidebar-dropdown">
			<a href="#">导航</a>
		</div>

		<!--- Sidebar navigation -->
		<!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
		<ul id="nav">
			<!-- Main menu with font awesome icon -->
			<li><a href="${ctx}" class="open"><i
					class="glyphicon glyphicon-home"></i> 首页</a></li>

			<li class="has_sub"><a href="#"><i
					class="glyphicon glyphicon-wrench"></i> 微信管理 <span
					class="pull-right"><i
						class="glyphicon glyphicon-chevron-right"></i></span></a>
				<ul>
					<li><a href="${ctx}/wx/menu"><i
							class="glyphicon glyphicon-th-list"></i> 自定义菜单 </a></li>
				</ul></li>

			<li class="has_sub"><a href="#"><i
					class="glyphicon glyphicon-wrench"></i> 系统管理 <span
					class="pull-right"><i
						class="glyphicon glyphicon-chevron-right"></i></span></a>
				<ul>
					<li><a href="${ctx}/admin/user/users">帐号管理</a></li>
					<li><a href="${ctx}/admin/role/roles">角色管理</a></li>
					<li><a href="${ctx}/admin/permission/permissions">权限管理</a></li>
				</ul></li>
				
			<li class="has_sub"><a href="#"><i
					class="glyphicon glyphicon-wrench"></i> 发布管理 <span
					class="pull-right"><i
						class="glyphicon glyphicon-chevron-right"></i></span></a>
				<ul>
					<li><a href="${ctx}/jimi/app/apps">应用管理</a></li>
				</ul></li>

			<li class="has_sub"><a href="#"><i
					class="glyphicon glyphicon-wrench"></i> 公司管理 <span
					class="pull-right"><i
						class="glyphicon glyphicon-chevron-right"></i></span></a>
				<ul>
					<li><a href="${ctx}/jimi/company/companies">公司信息</a></li>
					<li><a href="${ctx}/jimi/employee/employees">员工管理</a></li>
				</ul></li>

			<li class="has_sub"><a href="#"><i
					class="glyphicon glyphicon-wrench"></i> 销售管理 <span
					class="pull-right"><i
						class="glyphicon glyphicon-chevron-right"></i></span></a>
				<ul>
					<li><a href="${ctx}/jimi/customer/customers">客户管理</a></li>
					<li><a href="${ctx}/jimi/product/products">产品管理</a></li>
					<li><a href="${ctx}/jimi/order/orders">订单管理</a></li>
				</ul></li>
		</ul>
	</div>
</shiro:user>