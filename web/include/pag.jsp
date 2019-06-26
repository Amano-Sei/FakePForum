<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:if test="${requestScope.maxpage > 0}">
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<li class='page-item ${1>=requestScope.page ? "disabled":""}'>
			<a class="page-link" href="/PForum/content/list.jsp?uid=${requestScope.suser.uid}&keywords=${param.keywords }&page=1"><span aria-hidden="true" class="fas fa-angle-double-left"></span></a>
		</li>
		<li class='page-item ${1>=requestScope.page ? "disabled":""}'>
			<a class="page-link" href="/PForum/content/list.jsp?uid=${requestScope.suser.uid}&keywords=${param.keywords }&page=${requestScope.page-1}"><span aria-hidden="true" class="fas fa-angle-left"></span></a>
		</li>
	<c:forEach begin="${requestScope.sp }" end="${requestScope.ep }" var="i">
		<li class='page-item ${i == requestScope.page ? "active":""}'>
			<a class="page-link" href="/PForum/content/list.jsp?uid=${requestScope.suser.uid}&keywords=${param.keywords }&page=${i}">${i }</a>
		</li>
	</c:forEach>
		<li class='page-item ${requestScope.maxpage <= requestScope.page ? "disabled":""}'>
			<a class="page-link" href="/PForum/content/list.jsp?uid=${requestScope.suser.uid}&keywords=${param.keywords }&page=${requestScope.page+1}"><span aria-hidden="true" class="fas fa-angle-right"></span></a>
		</li>
		<li class='page-item ${requestScope.maxpage <= requestScope.page ? "disabled":""}'>
			<a class="page-link" href="/PForum/content/list.jsp?uid=${requestScope.suser.uid}&keywords=${param.keywords }&page=${requestScope.maxpage}"><span aria-hidden="true" class="fas fa-angle-double-right"></span></a>
		</li>
	</ul>
	<!-- 犹豫了一下最后还是选择了超出页面范围的情况不能到超出方向的最大页 -->
</nav>
</c:if>
