<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>회원탈퇴/Users/delete.jsp</title>
</head>
<body>
<div id="root">
	<header>
		<div class="header_box">
			<nav id="nav">
				<div class="navbar-right">
					<%@ include file="../include/nav.jsp"%>
				</div>
				<div id="index_logo_div">
					<a href="../index.do"><img id="index_logo_img"
						src="${pageContext.request.contextPath }/resources/images/project.png" /></a>
				</div>
				<div class="navbar-left">
					<c:choose>
						<c:when test="${not empty sessionScope.id }">
							<%@ include file="../include/users_aside.jsp"%>
						</c:when>
						<c:otherwise>
							<%@ include file="../include/unknown_aside.jsp"%>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</div>
	</header>
</div>
<section>
<div class="container">
	<br />
	<br />
	<h3 align="center">회원탈퇴가 완료되었습니다.그동안 이용해주셔서 감사합니다.</h3>
	<br />
	<p align="center"><a href="${pageContext.request.contextPath }/home.do">홈으로</a></p>
</div>
</section>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp"%>
	</div>
</footer>	

</body>


</html>