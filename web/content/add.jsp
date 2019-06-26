<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/splib.jsp" %>
<link rel="stylesheet" type="text/css" href="/PForum/css/content/add.css">
<script type="text/javascript" src="/PForum/js/content/add.js"></script>
<title>发布</title>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>发布</h2>
			<p class="lead">这里是濒临真正的结束的发布，算上这个还差两或者三个前端内容...第三个大概率不做了</p>
			<p class="lead text-danger">${param.erradd }</p>
			<p class="lead text-info">${param.msgadd }</p>
		</div>
		<div class="row">
			<form class="uadd-main" action="/PForum/content/addServlet" method="post">
			  	<div class="uadd-header">
			  		<input type="text" id="addctitle" name="addctitle" placeholder="标题" data-invalid="标题为2~64个字符，且不能以空格开头或结尾！"  class="form-control ${param.erraddctitle }" value="${param.addctitle }" required>
			  	</div>
			 	<div class="uadd-body">
			  		<textarea placeholder="内容" id="addccontent" name="addccontent" data-invalid="内容为2~256个字符，且不能以空格开头或结尾！" class="form-control ${param.erraddccontent }" required>${param.addccontent }</textarea>
			  	</div>
			  	<div class="uadd-footer">
			  		<div class="willnone">偷懒的完整版发布</div>
			  		<div class="myinvalid-feedback"></div>
			  		<div class="myvalid-feedback">nice</div>
					<button type="submit" id="addbtn" class="btn btn-outline-primary">发布</button>
					<button type="button" id="rstbtn" class="btn btn-outline-success">重置</button>
				</div>
			</form>
			<div class="udata-side">
				<img src="/PForum/img/user/${sessionScope.user.uid}.jpg" alt="头像" class="w-100 rounded">
				<h3 class="udata-sidetitle">${sessionScope.user.unickname }</h3>
				<div class="udata-sidecontent">
					<p>用户等级：</p>
					<p title="${sessionScope.user.ulvname }" data-toggle="tooltip" data-placement="right">${sessionScope.user.ulv }</p>
				</div>
				<div class="udata-sidecontent">
					<p>最后登录日期：</p>
					<p><fmt:formatDate value="${sessionScope.user.ulastlogintime }" pattern="yyyy-MM-dd"/></p>
				</div>
			</div>
		</div>
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">made by Amano Sei</p>
		<p>其实footer不写吐槽的话也可以当做重复代码丢include了诶...</p>
	</footer>
</body>
</html>