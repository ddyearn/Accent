<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/order.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
</head>
<body>
	<div id="root">
		<header>
		<div class="header_box">
			<nav id="nav">
				<div class="navbar-right">
					<%@ include file="../include/nav.jsp" %>
				</div>
				<div id="index_logo_div">
					<a href="../index.do"><img id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/></a>
				</div>
				<div class="navbar-left">
						<%@ include file="../include/users_aside.jsp" %>						
				</div>
			</nav>
		</div>
	</header>
	<section id="container">	
	<div id="container_box">
		<h1>결제가 완료되었습니다</h1>
		<br /><br /><br />
		<div class="sbtn" style="float: center;">
			<div class="shopbtn" >
			<div class="eff"></div>
			<a href="../home.do">쇼핑 계속</a>
		</div>
		<div class="orderbtn">
			<div class="eff"></div>
			<a href="orderList.do">주문 확인</a>
		</div>
	</div>
	</div>
</section>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp" %>
	</div>
</footer>
	</div>
</body>
</html>