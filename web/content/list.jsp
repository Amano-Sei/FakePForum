<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/splib.jsp" %>
<link rel="stylesheet" type="text/css" href="/PForum/css/content/list.css">
<script type="text/javascript" src="/PForum/js/content/list.js"></script>
<title>微博</title>
</head>
<body>
	<%@ include file="../include/nav.jsp" %>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>微博</h2>
			<p class="lead">终于来到了最后的最后了，看了眼半成品的前端部分，有种一言难尽的感觉...不过确实是一天可以改完的东西（其实要两天QAQ），相对而言真正的PForum无论是复杂度还是前端量都翻了n倍啊（</p>
			<p class="lead text-danger">${param.errlist }</p>
			<p class="lead text-info">${param.msglist }</p>
			<p class="lead text-info">${requestScope.msglist }</p>
			<p class="lead text-danger erradd">${param.erradd }</p>
			<p class="lead text-info">${param.msgadd }</p>
			<p class="lead text-danger">${param.erredit }</p>
			<p class="lead text-info">${param.msgedit }</p>
		</div>
		<form class="mycard" action="/PForum/content/addServlet?from=list" method="post">
		  	<div class="mycard-header">
		  		<input type="text" id="addctitle" name="addctitle" placeholder="标题" data-invalid="标题为2~64个字符，且不能以空格开头或结尾！"  class="form-control ${param.erraddctitle }" value="${param.addctitle }" required>
		  	</div>
		 	<div class="mycard-body">
		  		<textarea placeholder="内容" id="addccontent" name="addccontent" data-invalid="内容为2~256个字符，且不能以空格开头或结尾！" class="form-control ${param.erraddccontent }" required>${param.addccontent }</textarea>
		  	</div>
		  	<div class="mycard-footer">
		  		<div class="willnone">快速发布</div>
		  		<div class="myinvalid-feedback"></div>
		  		<div class="myvalid-feedback">nice</div>
				<button type="submit" id="addbtn" class="btn btn-outline-primary">发布</button>
			</div>
		</form>
		<hr>
		<div class="lead mb-3">${empty(requestScope.list) ? "好像什么都没有诶..." : "下面是".concat(requestScope.suser == null ?"大家":" ".concat(requestScope.suser.unickname).concat(" ")).concat("发布的微博。") }</div>
		<%@ include file="../include/pag.jsp" %>
		<c:forEach items="${requestScope.list}" var="comment">
			<div class="mycard-container">
			<div class="mycard">
				<div class="mycard-header">
			  		<p class="commentuname">发布人：<a href="/PForum/user/manage/status.jsp?uid=${comment.user.uid }"><img src="/PForum/img/user/${comment.user.uid }.jpg" alt="${comment.user.uname }" > ${comment.user.uname}</a></p>
			  		<p class="commentctime">--最后修改于<fmt:formatDate value="${comment.ctime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
				</div>
				<div class="mycard-body">
				    <h5 class="mycard-title">${comment.ctitle}</h5>
				    <p class="mycard-text">${comment.ccontent}</p>
				</div>
				<div class="mycard-footer text-muted text-right">
				  	<button type="button" class='btn btn-outline-primary myeditbtn ${sessionScope.user.uid != comment.user.uid ? "disabled" : "" }' data-cid=${comment.cid }>修改</button>
					<a href="/PForum/content/deleteServlet?cid=${comment.cid }" onclick="return confirm(&quot;确定要删除吗?&quot;)" class='btn btn-outline-danger ${sessionScope.user.uid != comment.user.uid ? "disabled" : "" }'>删除</a>
				</div>
			</div>
			</div>
		</c:forEach>
		<%@ include file="../include/pag.jsp" %>
	<hr>
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">made by Amano Sei</p>
		<p>这里是list的footer啦</p>
	</footer>
</body>
</html>