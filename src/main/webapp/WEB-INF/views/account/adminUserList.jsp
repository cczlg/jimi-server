<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	
	
      <!-- Page heading -->
      <div class="page-head">
        <h2 class="pull-left"><i class="icon-table"></i> 用户管理</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="${ctx}/"><i class="icon-home"></i> 首页</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">用户管理</a>
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
                  <div class="pull-left">用户</div>
                  <div class="widget-icons pull-right">
                  	<button class="btn"  onclick="window.location.href='${ctx}/admin/user/'">创建</button>
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                  </div>  
                  <div class="clearfix"></div>
                </div>

                  <div class="widget-content">

                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>登陆名</th>
                          <th>用户名</th>
                          <th>电子邮箱</th>
                          <th>注册时间</th>
                          <th>状态</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${users}" var="user" varStatus="idx">
							<tr>
								<td> ${idx.index+1} </td>
								<td><a href="${ctx}/admin/user/update/${user.id}">${user.loginName}</a></td>
								<td>${user.name}</td>
								<td>${user.email}
								</td>
								<td>
									<fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" />
								</td>
								<td>
									<c:if test="${user.status eq 'enabled' }">
										<span class="label label-success">启用</span>
									</c:if>
									<c:if test="${user.status eq 'disabled' }">
										<span class="label label-danger">禁用</span>
									</c:if>
								</td>
								<td>
									<div class="btn-group1">
		                              <button class="btn btn-xs btn-warning" onclick="{location.href='${ctx}/admin/user/update/${user.id}'}"><i class="icon-pencil"></i> </button>
		                              <button class="btn btn-xs btn-success" onclick="{location.href='${ctx}/admin/user/authorized/${user.id}'}"><i class="icon-ok"></i> </button>
		                              <button class="btn btn-xs btn-danger" onclick="{location.href='${ctx}/admin/user/delete/${user.id}'}"><i class="icon-remove"></i> </button>
		                            </div>
								</td>
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
