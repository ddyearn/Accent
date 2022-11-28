<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/orderList.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
		<div class="container">
				<br/>
				<br/>
				<p><strong>[${sessionScope.userDto.userName }]</strong> 님이 쇼핑몰에서 주문한 내역입니다.</p>
				<br/>
				<br/>
				<table class="table" id="orderform_t">
					<colgroup>
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-2" />
						<col class="col-xs-2" />
						<col class="col-xs-1" />
						<col class="col-xs-1" />			
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>주문번호</th>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>주문상세</th>
							<th>배송현황</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${orderList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${tmp.orderNum }</td>
								<td>
								<fmt:parseDate value="${tmp.orderDate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/>
								</td>
								<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum }&pageNum=1&reviewNum=1">${tmp.itemName}</a></td>	
								<td><fmt:formatNumber value="${tmp.allPrice }" pattern="###,###,###"/>원</td>
								<td><a href="detailList.do?orderNum=${tmp.orderNum }">조회</a></td>
								<td><a onclick="showDelivery();">조회</a></td>
								<script>
									function showDelivery(){
										window.open("delivery.do?orderNum=${tmp.orderNum }","delivery",
												"width=500,height=400,top=250,left=550,resizable=no");
									}
								</script>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br/>
				<c:if test="${empty orderList  }">
					<p style="text-align: center;">구매내역이 존재하지 않습니다.</p>
				</c:if>
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