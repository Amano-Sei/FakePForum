<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="html-sign-in">
<head>
<%@ include file="../include/splib.jsp" %>
<link rel="stylesheet" href="/PForum/css/user/login.css">
<script type="text/javascript" src="/PForum/js/user/login.js"></script>
<title>登录</title>
</head>
<body class="text-center">
	<form action="/PForum/user/loginServlet" method="post" class="form-signin">
		<a href="/PForum/content/list.jsp"><img alt="PForum" src="/PForum/img/page/icon.png" class="rounded mb-4" height="72" width="72"></a>
		<h3 class="mb-3 font-weight-normal">登录</h3>
		<label for="uname" class="sr-only">用户名</label>
		<input type="text" class="form-control" placeholder="用户名" name="uname" id="uname" value="${param.uname != null ? param.uname : cookie.uname.value }" required autofocus>
		<label for="upassword" class="sr-only">密码</label>
		<input type="password" class="form-control" placeholder="密码" name="upassword" id="upassword" value="${cookie.upassword.value }" required>
		<div class="small">
			<input type="checkbox" name="remme" id="remme" value="on">
			<label for="remme">记住账户名和密码</label>
		</div>
		<input type="hidden" name="preuri" value="${param.preuri }">
		<p class="text-muted small">没有账号?<a href="/PForum/user/register.jsp">注册</a></p>
		<p class="text-danger">${param.errlogin }</p>
		<p class="text-info">${param.msglogin }</p>
		<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		<p class="mt-5 mb-5 text-muted">&copy; 2019-2019</p>
	</form>
</body>
</html>