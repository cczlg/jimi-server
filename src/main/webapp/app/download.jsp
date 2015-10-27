<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>下载</title>
</head>
<body>
<a style="font-size:60px;" href="${ctx}/jimi/app/download">安卓版本点击下载或者扫描二维码</a>
<p>

<img alt="扫描下载" src="${ctx }/resources/img/jimi/download_android.png">
</p>
<p style="color:red;font-size:40px;">
iOS版本暂不提供
</p>
<p style="font-size:40px;">
	
	如果无法打开下载窗口，请点击微信公众号右上角菜单“在浏览器中打开”
</p>
</body>
</html>