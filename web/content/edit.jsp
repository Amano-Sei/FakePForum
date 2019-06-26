<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/splib.jsp" %>
<link rel="stylesheet" type="text/css" href="/PForum/css/content/edit.css">
<script type="text/javascript" src="/PForum/js/content/edit.js"></script>
<title>修改</title>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>修改</h2>
			<p class="lead">开始偷懒了hhh不过其实是半开玩笑的，这让我深刻感受到了代码可重用性的重要性...大工程大量重复工作真的可以把人做崩溃的说...</p>
			<p class="lead text-danger">${param.erredit }</p>
			<p class="lead text-info">${param.msgedit }</p>
		</div>
		<c:choose>
			<c:when test="${empty(param.cid) }">
				<div class="text-center form-container">
					<p class="lead">这里是修改界面，需要输入cid才可以修改</p>
					<form action="/PForum/content/edit.jsp" method="post" class="row">
						<label for="cid" class="mylabel col-2">CID:</label>
						<input type="number" id="cid" name="cid" min="1" class="form-control col-8" required>
						<input type="submit" value="确定" class="btn btn-outline-primary col">
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<form class="uedit-main" action="/PForum/content/editServlet" method="post">
					  	<div class="uedit-header">
					  		<input type="hidden" id="editcid" name="editcid" value="${requestScope.editcomment.cid }">
					  		<input type="text" id="editctitle" name="editctitle" placeholder="标题" data-invalid="标题为2~64个字符，且不能以空格开头或结尾！"  class="form-control ${param.erreditctitle }" value="${param.editcid==null?requestScope.editcomment.ctitle:param.editctitle }" required>
					  	</div>
					 	<div class="uedit-body">
					  		<textarea placeholder="内容" id="editccontent" name="editccontent" data-invalid="内容为2~256个字符，且不能以空格开头或结尾！" class="form-control ${param.erreditccontent }" required>${param.editcid==null?requestScope.editcomment.ccontent:param.editccontent }</textarea>
					  	</div>
					  	<div class="uedit-footer">
					  		<div class="willnone">最后修改于<fmt:formatDate value="${requestScope.editcomment.ctime }" pattern="yyyy-MM-dd HH:mm"/></div>
					  		<div class="myinvalid-feedback"></div>
					  		<div class="myvalid-feedback">nice</div>
							<button type="submit" id="editbtn" class="btn btn-outline-primary">修改</button>
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
			</c:otherwise>
		</c:choose>		
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">made by Amano Sei</p>
		<p>终于只差一个下拉菜单和一个不想做的页面了...应该是不做了（</p>
	</footer>
</body>
</html>