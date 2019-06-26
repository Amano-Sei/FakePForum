<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="/PForum/content/list.jsp"><img src="/PForum/img/user/${sessionScope.user.uid == null ? 0:sessionScope.user.uid}.jpg" width="30px" height="30px" class="rounded mr-2" alt="PForum">PForum</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-control="navbarCollapse" aria-expanded="false" aria-label="Toggle navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/PForum/content/add.jsp" class="nav-link ${requestScope.activeadd }">发布</a>
				</li>
				<li class="nav-item">
					<a href="/PForum/content/list.jsp" class="nav-link ${requestScope.activelist }">微博</a>
				</li>
				<li class="nav-item dropdown">
					<a href="/PForum/content/edit.jsp" class="nav-link ${requestScope.activecedit }" id="ceditdropdown-main">修改</a>
					<a href="#" class="nav-link dropdown-toggle dropdown-toggle-split ${requestScope.activecedit }" id="ceditdropdown-split" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
				    <div class="dropdown-menu mydropdown-menu">
						<form action="/PForum/content/edit.jsp" method="post" >
							<p class="mydropdown-item">
								<label for="minicid" >CID:</label>
								<input type="number" id="minicid" name="cid" min="1" class="form-control" required>
								<input type="submit" value="确定" class="btn btn-sm btn-primary">
							</p>
						</form>
				    </div>
				</li>
				<li class="ml-md-auto mr-md-2 nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" id="unamedropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.user.unickname }</a>
					<div class="dropdown-menu" aria-labelledby="unamedropdown">
						<a class="dropdown-item ${requestScope.activestatus }" href="/PForum/user/manage/status.jsp">信息</a>
						<a class="dropdown-item ${requestScope.activeedit }" href="/PForum/user/manage/edit.jsp">修改信息</a>
						<a class="dropdown-item ${requestScope.activechangepassword }" href="/PForum/user/manage/changepassword.jsp">修改密码</a>
						<a class="dropdown-item" href="/PForum/content/list.jsp?uid=${sessionScope.user.uid }">我发布的帖子</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/PForum/user/logoutServlet">登出</a>
					</div>
				</li>
			</ul>
			<form class='nav-form w-auto mt-2 mt-md-0 ${requestScope.activelist == null ? "d-none" : null }'>
				<input type="hidden" name="uid" value="${requestScope.suser.uid }">
				<input type="text" name="keywords" class="form-control mr-2" placeholder='Search<c:if test="${!empty(requestScope.suser) }"> in ${requestScope.suser.uid==sessionScope.user.uid?"mine":requestScope.suser.unickname }</c:if>...' aria-label="Search">
				<button type="submit" class="btn btn-outline-primary my-2 my-md-0">搜索</button>
			</form>
		</div>
	</nav>
	<script type="text/javascript">
		var hasresize;
		function onResize(){
			$("body").css("padding-top", $(".fixed-top").outerHeight());
			if($(window).innerWidth() >= 768){
				if($(".nav-form").attr("class").endsWith("d-none"))
					$(".navbar-nav").css("width", "92%");
				else
					$(".navbar-nav").css("width", "80%");
				$(".nav-form input").css("width", "");
			}else{
				$(".navbar-nav").css("width", "100%");
				$(".nav-form input").css("width", "100%");
			}
			$("hr+.lead").css("margin-left", $(".mycard").css("margin-left"))
			$(".position-sticky").css("top", $(".fixed-top").outerHeight()+16);
			$(".uadd-body").css("height", $(".uadd-main").innerHeight()-$(".uadd-header").innerHeight()-$(".uadd-footer").innerHeight());
			if($(window).innerWidth() <= 768)
				$("#minicid").css("width", $(window).innerWidth()-$(".mydropdown-item label").innerWidth()-$(".mydropdown-item .btn").innerWidth()-140);
			else
				$("#minicid").css("width", "");
			hasresize = false;
		}
		$(function(){
			onResize();
			$(window).resize(onResize);
			$(".navbar-collapse").on("shown.bs.collapse", onResize);
			$(".navbar-collapse").on("hidden.bs.collapse", onResize);
			$(".nav-form input").focus(function(){
				if($(window).innerWidth() >= 768){
					$(this).animate({width: '+=150px'} ,256);
					hasresize = true;
				}
			});
			$(".nav-form input").blur(function(){
				if($(window).innerWidth() >= 768 && hasresize){
					$(this).animate({width: '-=150px'} ,256);
					hasresize = false;
				}
			});
		})
	</script>
	<style type="text/css">
		.nav-form{
		  display: -ms-flexbox;
		  display: flex;
		  -ms-flex-flow: row nowrap;
		  flex-flow: row nowrap;
		  -ms-flex-align: center;
		  align-items: center;
		}
		.nav-form *{
			white-space: nowrap;
		}
	</style>
