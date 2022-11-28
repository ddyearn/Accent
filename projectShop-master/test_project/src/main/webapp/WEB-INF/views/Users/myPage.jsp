<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>Insert title here</title>
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

	<h1>MyPage</h1>
	<br /><br /><br />
	<div class="mypage_btn">
		<div class="item">
			<a href="../shop/orderList.do">
			<div class="mytitle"> ORDER</div>
			<div class="mytitle_kr">주문내역 조회</div>
			<div class="desc">
				고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
			</div>
			</a>
		</div>
		<div class="item">
			<a href="../shop/wishlist.do">
			<div class="mytitle">WISHLIST</div>
			<div class="mytitle_kr">관심 상품</div>		
			<div class="desc">
				관심상품으로 등록하신 상품의 목록을 보여드립니다.
			</div>
			</a>
		</div>
		<div class="item">
			<a href="../shop/cartList.do">
			<div class="mytitle">CART</div>
			<div class="mytitle_kr">장바구니</div>
			<div class="desc">
				고객님의 장바구니를 관리하는 공간입니다.<br><!-- 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다. -->
			</div>
			</a>
		</div>
		<div class="item">
			<a href="boardList.do">
			<div class="mytitle">BOARD</div>
			<div class="mytitle_kr">내가 쓴 글 보기</div>
			<div class="desc">
				고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.
			</div>
			</a>
		</div>

		<div class="item">
			<a href="info.do">
			<div class="mytitle">PROFILE</div>
			<div class="mytitle_kr">회원 정보</div>
			<div class="desc">
				회원이신 고객님의 개인정보를 관리하는 공간입니다.<br><!-- 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다. -->
			</div>
			</a>
		</div>

		<div class="item">
			<a href="#" id="click">
			<div class="mytitle">WITHDRWAL</div>
			<div class="mytitle_kr">회원 탈퇴</div>
			<div class="desc">
				회원 탈퇴를 하실 수 있습니다.
			</div>
			</a>
		</div>
		<script>
			$("#click").on("click",function(){
				var delConfirm = confirm('회원 탈퇴를 하시겠습니까?');
				   if (delConfirm) {
				      location.href="delete.do";
				   }
				   else {
				      return false;
				   }
			})
		</script>
	</div>
</div>
</section>
<footer id="footer">
	<div id="footer_box">
		<%@ include file="../include/footer.jsp"%>
	</div>
</footer>	
</body>
</html>  