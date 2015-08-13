<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>错误 </title>
</head>

<body>
	<h2>错误 - 您的操作发生了错误，请联系管理员.</h2>
	<form:errors path="*" cssClass="errorblock" element="div" />
	<p><a href="<c:url value="/"/>">返回首页</a></p>
</body>
</html>