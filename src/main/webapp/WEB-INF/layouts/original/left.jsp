<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="leftbar" class="span2">
	<shiro:user>
		<h1>系统管理</h1>
		<div class="submenu">
			<a id="account-tab" href="${ctx}/admin/user/users">帐号管理</a> 
			<a id="account-tab" href="${ctx}/admin/role/roles">角色管理</a>
			<a id="account_tab" href="${ctx}/admin/permission/permissions">权限管理</a>
		</div>
		<!-- 
	<h1>系统管理</h1>
	<div class="submenu">
		<a id="account-tab"href="${ctx}/admin/user/">帐号管理</a>
	</div> -->
	</shiro:user>
</div>