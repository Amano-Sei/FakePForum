<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/splib.jsp" %>
<title>修改密码</title>
<link rel="stylesheet" href="/PForum/css/user/manage/changepassword.css">
<script type="text/javascript" src="/PForum/js/user/manage/changepassword.js"></script>
</head>
<body>
	<%@ include file="../../include/nav.jsp" %>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>修改密码</h2>
			<p class="lead">这里是修改密码的说，要求和注册的时候是完全一样的</p>
			<p class="lead text-danger">${param.errchangepassword }</p>
		</div>
		<form action="/PForum/user/manage/changepasswordServlet" method="post" class="needs-validation row" novalidate>
			<div class="col-md-9">
				<div class="row">
					<label for="oriupassword">原始密码：</label>
					<input type="password" class="form-control ${param.erroriupassword }" id="oriupassword" name="oriupassword" placeholder="请输入5~16位的用户名" value="" required pattern="^[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w]{8,20}$">
					<div class="invalid-feedback">虽然还没有提交，但是你的密码肯定是错的!</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="upassword">新密码：</label>
					<input type="password" class="form-control ${param.errupassword }" id="upassword" name="upassword" placeholder="请输入8~20位的密码" value="" required pattern="^[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w]{8,20}$">
					<div class="invalid-feedback">密码只能为8~20位的+!@#$%^&?><,()[]{}.*-=_/\或字母!</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="reupassword">重复密码：</label>
					<input type="password" class="form-control ${param.errreupassword }" id="reupassword" name="reupassword" placeholder="请再次输入密码" value="" required>
					<div class="invalid-feedback">两次输入的密码不同!</div>
					<div class="valid-feedback">nice</div>
				</div>
			</div>
			
			<nav class="col-md-3 position-sticky">
				<h6 class="d-flex justify-content-between align-items-center mb-3">
					<a class="text-muted" href="#">剩余</a>
					<span class="badge badge-secondary badge-pill" id="invlast">3</span>
				</h6>
				<div class="list-group mb-3 lh-1 small">
					<a id="aoriupassword" href="#oriupassword" class='list-group-item list-group-item-action ${param.erroriupassword==null? "list-group-item-light" : (param.erroriupassword=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>密码</a>
					<a id="aupassword" href="#upassword" class='list-group-item list-group-item-action ${param.errupassword==null? "list-group-item-light" : (param.errupassword=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>密码</a>
					<a id="areupassword" href="#reupassword" class='list-group-item list-group-item-action ${param.errreupassword==null? "list-group-item-light" : (param.errreupassword=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>重复密码</a>
				</div>
				<div class="d-flex justify-content-around">
					<button type="submit" class="btn btn-outline-primary" id="tosubmit">修改</button>
					<button type="reset" class="btn btn-outline-success">重置</button>
				</div>
			</nav>
		</form>
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">made by Amano Sei</p>
		<p>就是半成品改也不好改啊QAQ</p>
	</footer>
</body>
</html>