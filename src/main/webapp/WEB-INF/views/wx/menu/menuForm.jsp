<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>自定义菜单管理</title>

<script>
	var selectedNode=null;
	var treeData=[ {
		text : "Parent 1",
		state: {
		    expanded: true,
		    selected: false
		  },
		nodes : [ {
			text : "Child 1",
			state: {
			    expanded: true,
			    selected: false
			  }
		}, {
			text : "Child 2",
			state: {
			    expanded: true,
			    selected: false
			  }
		} ]
	}, {
		text : "Parent 2",
		state: {
		    expanded: true,
		    selected: false
		  }
	}, {
		text : "Parent 3",
		state: {
		    expanded: true,
		    selected: false
		  }
	}, {
		text : "Parent 4",
		state: {
		    expanded: true,
		    selected: false
		  }
	}, {
		text : "Parent 5",
		state: {
		    expanded: true,
		    selected: false
		  }
	} ];
	
	function getTree() {
		var nTree=new Array();
		for(node in treeData){
			if(treeData[node].text!=selectedNode.text){
				if(treeData[node].nodes!=undefined){
					var subNode=new Array();
					for(sub in treeData[node].nodes){
						if(treeData[node].nodes[sub].text!=selectedNode.text){
							subNode.push(treeData[node].nodes[sub])
						}
					}
					treeData[node].nodes=subNode;
				}
				nTree.push(treeData[node]);
				
			}
		}
		treeData=nTree;
	}
	
	function removeData(){
		for(node in treeData){
			if(treeData[node].text===selectedNode.text){
				treeData.splice(node,1);
			}
			else if(treeData[node]!=undefined){
				for(subnode in treeData[node].nodes){
					if(treeData[node].nodes[subnode].text===selectedNode.text){
						treeData[node].nodes.splice(node,1);
					}
				}
			}
		}
	}
	
	function removeNode(){
		if(selectedNode==null){
			return;
		}		
		removeData();
		$('#tree').treeview("remove");
		//getTree();
		initTree();
	}
	
	function initTree(){
		$('#tree').treeview({
			data : treeData,
			onNodeSelected: function(event, node){
				selectedNode=node;
				},
			onNodeUnselected: function(event,node){
				selectedNode=null;
			}
		});
	}
	
	$(document).ready(function() {
		$('#remove').bind("click",removeNode);
		initTree();
		//聚焦第一个输入框
		$("#loginName").focus();
		//为inputForm注册validate函数
		$("#inputForm").validate({
			rules : {
				loginName : {
					remote : "${ctx}/register/checkLoginName"
				}
			},
			messages : {
				loginName : {
					remote : "用户登录名已存在"
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
			自定义菜单
			<!-- page meta -->
			<span class="page-meta">Something Goes Here</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="${ctx}/"><i class="glyphicon glyphicon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">自定义菜单管理</a>
		</div>

		<div class="clearfix"></div>

	</div>
	<!-- Page heading ends -->



	<!-- Matter -->

	<div class="matter">
		<div class="container">

			<div class="row">
				<!-- tree view for Custome Menu -->
				<div class="col-md-5">
					<div class="widget wgreen">
						<div class="widget-head">
							<div class="pull-left">菜单结构</div>
							<div class="widget-icons pull-right">
								<a href="javascript:void(0)" class="" id="add"><i
									class="glyphicon glyphicon-plus"></i></a> 
								<a href="javascript:void(0)" class=""
									id="remove"><i class="glyphicon glyphicon-minus"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd" id="tree"></div>
						</div>
					</div>
				</div>
				<!-- detail for One Menu -->
				<div class="col-md-7">


					<div class="widget wgreen">

						<div class="widget-head">
							<div class="pull-left">详细</div>

							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">

								<!-- Form starts.  -->
								<form class="form-horizontal" role="form" id="inputForm"
									action="${ctx}/admin/user" method="post" autocomplete="off">

									<div class="form-group">
										<label class="col-lg-4 control-label" for="loginName">Type:</label>
										<div class="col-lg-8">
											<input type="text" id="loginName" name="loginName"
												class="form-control required" placeholder="菜单类型"
												minlength="3">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label"
											for="loginName">Name:</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="菜单名称">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-4 control-label" for="loginName">Key:</label>
										<div class="col-lg-8">
											<input type="text" id="loginName" name="loginName"
												class="form-control required" placeholder="菜单类型"
												minlength="3">
										</div>
									</div>
									<div class="form-group">
										<label for="name" class="col-lg-4 control-label"
											for="loginName">Url:</label>
										<div class="col-lg-8">
											<input type="text" id="name" name="name"
												class="form-control required" placeholder="菜单名称">
										</div>
									</div>

									<hr />
									<div class="form-group">
										<div class="col-lg-offset-1 col-lg-9">
											<button type="submit" class="btn btn-success">确定</button>
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
