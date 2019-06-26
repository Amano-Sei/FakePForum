<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/splib.jsp" %>
<link rel="stylesheet" type="text/css" href="/PForum/css/user/manage/status.css">
<script type="text/javascript" src="/PForum/js/user/manage/status.js"></script>
<title>用户信息</title>
</head>
<body>
<%@ include file="../../include/nav.jsp" %>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>用户信息</h2>
			<p class="lead">这里是用户信息页了，在写add的时候觉得可以参考这边结果发觉没写前面的东西...</p>
			<p class="lead text-danger">${param.errstatus }</p>
		</div>
		<c:choose>
			<c:when test="${empty(requestScope.suser) }">
				<div class="row">
					<div class="udata-main rounded border bg-white">
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">用户id：</p>
								<p class="udata-content">${sessionScope.user.uid}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">用户名：</p>
								<p class="udata-content">${sessionScope.user.uname}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">昵称：</p>
								<p class="udata-content">${sessionScope.user.unickname}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">性别：</p>
								<p class="udata-content">${sessionScope.user.usex == 0 ? "女" : (sessionScope.user.usex == 1 ? "男":"保密")}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">用户等级：</p>
								<p class="udata-content">${sessionScope.user.ulv}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">等级名称：</p>
								<p class="udata-content">${sessionScope.user.ulvname}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">最后登录ip：</p>
								<p class="udata-content">${sessionScope.user.ulastloginip}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">最后登陆时间：</p>
								<p class="udata-content"><fmt:formatDate value="${sessionScope.user.ulastlogintime}" pattern="yyyy-MM-dd HH:mm"/></p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">注册时间：</p>
								<p class="udata-content"><fmt:formatDate value="${sessionScope.user.uregtime}" pattern="yyyy-MM-dd HH:mm"/></p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">生日：</p>
								<p class="udata-content"><fmt:formatDate value="${sessionScope.user.ubirth}" pattern="yyyy-MM-dd"/></p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">年龄：</p>
								<p class="udata-content">${sessionScope.user.uage}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">每页微博数：</p>
								<p class="udata-content">${sessionScope.user.upagecount}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">省：</p>
								<p class="udata-content">南极</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">市：</p>
								<p class="udata-content">南极</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">县：</p>
								<p class="udata-content">南极</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-8">
								<p class="udata-title">邮箱：</p>
								<p class="udata-content">${sessionScope.user.umail}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">爱好：</p>
								<p class="udata-content">${sessionScope.user.uhobby}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col">
								<p class="udata-title">个性签名：</p>
								<p class="udata-content">${sessionScope.user.usignature}</p>
							</div>
						</div>
					</div>
					<div class="udata-side border rounded bg-white">
						<img src="/PForum/img/user/${sessionScope.user.uid}.jpg" alt="头像" class="w-100 rounded">
						<h3 class="text-muted row py-2 pl-3">头像</h3>
						<p>你是本站的第${sessionScope.user.uid }名用户。</p>
						<p>一路写下来，感谢坚持。</p>
						<p>本人作为诚信单推，会永远喜欢iori的！</p>
						<p>↑其实是熬夜吐血写不动了鼓励自己一下</p>
					</div>
				</div>
			</c:when>			
			<c:otherwise>
				<div class="row">
					<div class="udata-main rounded border bg-white">
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">用户id：</p>
								<p class="udata-content">${requestScope.suser.uid}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">用户名：</p>
								<p class="udata-content">${requestScope.suser.uname}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">昵称：</p>
								<p class="udata-content">${requestScope.suser.unickname}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">性别：</p>
								<p class="udata-content">${requestScope.suser.usex == 0 ? "女" : (requestScope.suser.usex == 1 ? "男":"保密")}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">用户等级：</p>
								<p class="udata-content">${requestScope.suser.ulv}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">等级名称：</p>
								<p class="udata-content">${requestScope.suser.ulvname}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">最后登录ip：</p>
								<p class="udata-content">${requestScope.suser.ulastloginip}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">最后登陆时间：</p>
								<p class="udata-content"><fmt:formatDate value="${requestScope.suser.ulastlogintime}" pattern="yyyy-MM-dd HH:mm"/></p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">注册时间：</p>
								<p class="udata-content"><fmt:formatDate value="${requestScope.suser.uregtime}" pattern="yyyy-MM-dd HH:mm"/></p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">生日：</p>
								<p class="udata-content"><fmt:formatDate value="${requestScope.suser.ubirth}" pattern="yyyy-MM-dd"/></p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">年龄：</p>
								<p class="udata-content">${requestScope.suser.uage}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">每页微博数：</p>
								<p class="udata-content">${requestScope.suser.upagecount}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-4">
								<p class="udata-title">省：</p>
								<p class="udata-content">南极</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">市：</p>
								<p class="udata-content">南极</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">县：</p>
								<p class="udata-content">南极</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col-md-8">
								<p class="udata-title">邮箱：</p>
								<p class="udata-content">${requestScope.suser.umail}</p>
							</div>
							<div class="col-md-4">
								<p class="udata-title">爱好：</p>
								<p class="udata-content">${requestScope.suser.uhobby}</p>
							</div>
						</div>
						<div class="udata-row">
							<div class="col">
								<p class="udata-title">个性签名：</p>
								<p class="udata-content">${requestScope.suser.usignature}</p>
							</div>
						</div>
					</div>
					<div class="udata-side border rounded bg-white">
						<img src="/PForum/img/user/${requestScope.suser.uid}.jpg" alt="头像" class="w-100 rounded">
						<h3 class="text-muted row py-2 pl-3">头像</h3>
						<p>这是本站的第${requestScope.suser.uid }名用户。</p>
						<p>一路写下来，感谢坚持。</p>
						<p>本人作为诚信单推，会永远喜欢iori的！</p>
						<p>↑其实是熬夜吐血写不动了鼓励自己一下</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">made by Amano Sei</p>
		<p>在写list的时候才发觉footer没了（</p>
	</footer>
</body>
</html>