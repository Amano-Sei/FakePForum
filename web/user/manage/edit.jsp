<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../include/splib.jsp" %>
<link rel="stylesheet" href="/PForum/css/user/manage/edit.css">
<script type="text/javascript" src="/PForum/js/user/manage/edit.js"></script>
<title>修改信息</title>
</head>
<body>
<%@ include file="../../include/nav.jsp" %>
<div class="container">
		<div class="py-5 text-center">
		<input type="hidden" id="uid" value="${sessionScope.user.uid }">
			<a href="/PForum/content/list.jsp"><img class="rounded d-block mx-auto mb-4" src="/PForum/img/user/${sessionScope.user.uid }.jpg" alt="PForum" width="72" height="72"></a>
			<h2>修改信息</h2>
			<p class="lead">这里是腰斩版的修改，需要注意选填要么不填要么有效</p>
			<p class="lead text-danger">${param.erredit }</p>
		</div>
		<form action="/PForum/user/manage/editServlet" method="post" class="needs-validation row" novalidate enctype="multipart/form-data">
			<div class="col-md-9">
				<div class="mustlist">
				<h4 class="row">必填</h4>
				<div class="row">
					<label for="unickname">昵称：</label>
					<input type="text" class="form-control ${param.errunickname }" id="unickname" name="unickname" placeholder="请输入昵称" value="${param.unickname == null ? sessionScope.user.unickname : param.unickname}" pattern="^([^\x00-\xff]|\w)([^\x00-\xff]|\w| ){0,14}([^\x00-\xff]|\w)$" required>
					<div class="invalid-feedback">昵称为2~16位的汉字或者字符或者下划线或者空格切不能以空格为开头或结尾!</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="umail">邮箱：</label>
					<input type="email" class="form-control ${param.errumail }" id="umail" name="umail" placeholder="请输入邮箱" value="${param.umail == null ? sessionScope.user.umail : param.umail}" pattern="^\w+@(\w+.)+\w+$" required>
					<div class="invalid-feedback">请输入正确的邮箱!</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="secret">性别：</label>
				</div>
				<div class="row">
					<div class="custom-control custom-radio ml-3 col-md-3">
						<input type="radio" class="custom-control-input ${param.errusex }" ${sessionScope.user.usex == 1?"checked":"" } id="male" name="usex" value="male" required>
						<label class="custom-control-label" for="male">男</label>
						<div class="invalid-feedback">保密也是可以鸭</div>
						<div class="valid-feedback">nice</div>
					</div>
					<div class="custom-control custom-radio col-md-3">
						<input type="radio" class="custom-control-input ${param.errusex }" ${sessionScope.user.usex == 0?"checked":"" } id="female" name="usex" value="female" required>
						<label class="custom-control-label" for="female">女</label>
					</div>
					<div class="custom-control custom-radio col-md-3">
						<input type="radio" class="custom-control-input ${param.errusex }" ${sessionScope.user.usex == -1?"checked":"" }  id="secret" name="usex" value="secret" required>
						<label class="custom-control-label" for="secret">保密</label>
					</div>
				</div>
				
				</div>
				<hr class="mb-1 row">
				<div class="optionallist">
				<h4 class="row mt-2">选填</h4>
				<div class="row">
					<label for="uprofile">头像：</label>
					<div class="custom-file">
						<input type="file" class="custom-file-input ${param.erruprofile }" id="uprofile" name="uprofile" accept="image/jpeg">
						<label class="custom-file-label" for="uprofile">修改头像...</label>
						<div class="invalid-feedback mt-3">头像大小不能超过1m，且必须为jpg文件</div>
						<div class="valid-feedback mt-3">nice</div>
					</div>
				</div>
				<div class="row">
					<label for="ubirth">生日：</label>
					<!-- 这一段是强行用el表达式QAQ用哭了QAQ -->
					<input type="date" class="form-control ${param.errubirth }" value='${param.ubirthyear == null ? sessionScope.user.ubirth.year+1900 : param.ubirthyear}-${(param.ubirthmonth == null && sessionScope.user.ubirth.month/10 < 1) ? "0":""}${param.ubirthmonth == null ? sessionScope.user.ubirth.month+1 : param.ubirthmonth}-${(param.ubirthmonth == null && sessionScope.user.ubirth.date/10 < 1) ? "0":""}${param.ubirthdate == null ? sessionScope.user.ubirth.date : param.ubirthdate}' id="ubirth" name="ubirth" min="1900-01-01" max="2019-6-21">
					<div class="invalid-feedback">格式需要形如"yyyy-MM-dd"，否则按照常理来说是不可能存在的的生日！（当然如果是正确的生日请联系管理员，同时给老先生您道个歉，对不起）</div>
					<div class="valid-feedback">nice，需要注意据已知最少chrome不会产生无效的日期，所以如果是无效的生日的话请当做你没有填</div>
				</div>
				<div class="row">
					<label for="uhobby">爱好：</label>
					<input type="text" class="form-control ${param.erruhobby }" id="uhobby" name="uhobby" placeholder="请输入爱好" value="${param.uhobby == null ? sessionScope.user.uhobby : param.uhobby }">
					<div class="invalid-feedback">爱好需要为2~60位双字节字符（你可以当做是中文）或英文字符或下划线或空格且不能以空格开头或结尾！</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="usignature">个性签名：</label>
					<textarea class="form-control ${param.errusignature }" id="usignature" name="usignature" placeholder="这个人很懒，什么都没有留下">${param.usignature == null ? sessionScope.user.usignature : param.usignature}</textarea>
					<div class="invalid-feedback">个性签名的限制为2~256个字符且不能以空格开头或结尾</div>
					<div class="valid-feedback">nice</div>
				</div>
				<div class="row">
					<label for="upagecount">每页微博数：</label>
					<input type="number" class="form-control ${param.errupagecount }" id="upagecount" name="upagecount" placeholder="请输入爱好" value="${param.upagecount == null ? sessionScope.user.upagecount : param.upagecount }" min="10" max="50">
					<div class="invalid-feedback">每页微博数只能是10~50之间的整数</div>
					<div class="valid-feedback">nice</div>
				</div>
			</div>
			
			<div class="row">
				<label for="upassword">输入密码确认：</label>
				<input type="password" class="form-control ${param.errupassword }" id="upassword" name="upassword" placeholder="请输入密码" value="" required pattern="^[!@#$%&?><,^+\/()\[\]{}.*\-=\\\w]{8,20}$">
				<div class="invalid-feedback">虽然还没有提交，但是我想你的密码一定是错的</div>
				<div class="valid-feedback">nice</div>
			</div>
			</div>
			
			<nav class="col-md-3 position-sticky">
				<h6 class="d-flex justify-content-between align-items-center mb-3">
					<a class="text-muted" href="#">剩余</a>
					<span class="badge badge-secondary badge-pill" id="invlast">7</span>
				</h6>
				<div class="list-group mb-3 lh-1 small">
					<a id="aunickname" href="#unickname" class='list-group-item list-group-item-action ${param.errunickname==null? "list-group-item-light" : (param.errunickname=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>昵称</a>
					<a id="aumail" href="#umail" class='list-group-item list-group-item-action ${param.errumail==null? "list-group-item-light" : (param.errumail=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>邮箱</a>
					<a id="ausex" href="#secret" class='list-group-item list-group-item-action ${param.errusex==null? "list-group-item-light" : (param.errusex=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>性别</a>
					<a id="auprofile" href="#uprofile" class='list-group-item list-group-item-action ${param.erruprofile==null||param.erruprofile=="is-valid" ? "list-group-item-success" : "list-group-item-danger"}'>头像</a>
					<a id="aubirth" href="#ubirth" class='list-group-item list-group-item-action ${param.errubirth==null||param.errubirth=="is-valid" ? "list-group-item-success" : "list-group-item-danger"}'>生日</a>
					<a id="auhobby" href="#uhobby" class='list-group-item list-group-item-action ${param.erruhobby==null||param.erruhobby=="is-valid" ? "list-group-item-success" : "list-group-item-danger"}'>爱好</a>
					<a id="ausignature" href="#usignature" class='list-group-item list-group-item-action ${param.errusignature==null||param.errusignature=="is-valid" ? "list-group-item-success" : "list-group-item-danger"}'>个性签名</a>
					<a id="aupagecount" href="#upagecount" class='list-group-item list-group-item-action ${param.errupagecount==null||param.errupagecount=="is-valid" ? "list-group-item-success" : "list-group-item-danger"}'>每页微博数</a>
					<a id="aupassword" href="#upassword" class='list-group-item list-group-item-action ${param.errupassword==null? "list-group-item-light" : (param.errupassword=="is-valid" ? "list-group-item-success" : "list-group-item-danger")}'>密码</a>
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
		<p>直接用register调整来的内容</p>
	</footer>	
</body>
</html>