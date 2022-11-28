<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop/cartList</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
	<div class="container">
		<h1>Cart</h1>
		<br />
		<br />
		<c:choose>
			<c:when test="${map.count==0 }">
			<br />
				<br />
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="AllCheck" /></th>
							<th>이미지</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>최종 가격</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sumMoney" value="0" />
						<c:forEach var="tmp" items="${map.list }" varStatus="i">
							<tr>
								<td><input type="checkbox" name="delBox" value="${tmp.cartNum }" /></td>
								<td><img src="../resources/${tmp.itemImg }" width="140px" height="120px" /><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}"></td>
								<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}">${tmp.itemName}</a></td>
								<td><input type="hidden" id="itemPrice" /> 
									<fmt:formatNumber value="${tmp.itemPrice}" pattern="###,###,###" />원</td>
								<td>
									<input type="number" min="1" value="${tmp.cartStock }" style="width: 40px" name="cartStock" id="${tmp.cartNum }" /> 
									<input type="hidden" name="itemNum" value="${tmp.itemNum }" />
									<button type="button" class="btn" id="${tmp.cartNum }">수정</button>
								</td>
								<td>
									<fmt:formatNumber value="${tmp.cartStock * tmp.itemPrice}" pattern="###,###,###" />원
								</td>
							</tr>
							<c:set var="sumMoney" value="${sumMoney+(tmp.cartStock * tmp.itemPrice) }" />
						</c:forEach>
					</tbody>
				</table>
				<p align="center">장바구니가 비어있습니다.</p>
				<br />
				<br />
				<br />
				<div class="shopbtn" style="float: right">
					<div class="eff"></div>
					<a href="../index.do">쇼핑계속</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="buy" style="float: right">
					<button class="btn" id="buyEach" style="float: left">삭제</button>
				</div>
				<br /><br /><br />
				<table class="table table-hover" style="text-align: center">
					<thead>
						<tr>
							<th style="text-align: center"><input type="checkbox" id="AllCheck" /></th>
							<th style="text-align: center">이미지</th>
							<th style="text-align: center">상품명</th>
							<th style="text-align: center">가격</th>
							<th style="text-align: center">수량</th>
							<th style="text-align: center">최종 가격</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sumMoney" value="0" />
						<c:forEach var="tmp" items="${map.list }" varStatus="i">
							<tr>
								<td><input type="checkbox" name="delBox" value="${tmp.cartNum }" /></td>
								<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1"><img src="../resources/${tmp.itemImg }" width="140px" height="120px" /></a></td>
								<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1">${tmp.itemName}</a></td>
								<td><input type="hidden" id="itemPrice" /> 
									<fmt:formatNumber value="${tmp.itemPrice}" pattern="###,###,###" />원</td>
								<td><input type="number" min="1" value="${tmp.cartStock }"
										style="width: 40px" name="cartStock" id="${tmp.cartNum }" /> 
									<input type="hidden" name="itemNum" value="${tmp.itemNum }" />
									<button type="button" class="btn" id="${tmp.cartNum }">수정</button></td>
								<td><fmt:formatNumber value="${tmp.cartStock * tmp.itemPrice}" pattern="###,###,###" />원</td>
							</tr>
							<c:set var="sumMoney" value="${sumMoney+(tmp.cartStock * tmp.itemPrice) }" />
						</c:forEach>
					</tbody>
				</table>
				<br />
				<br />
				<br />
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th style="text-align: center">총 상품금액</th>
							<th style="text-align: center">총 배송비</th>
							<th style="text-align: center">결제예정금액</th>
							<th style="text-align: center"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:set var="allPrice" value="${sumMoney+fee }" />
							<td><fmt:formatNumber value="${sumMoney }" pattern="###,###,###" />원</td>
							<td>+<fmt:formatNumber value="${map.fee }" pattern="###,###,###" />원
							</td>
							<td><fmt:formatNumber value="${map.allPrice }" pattern="###,###,###" />원 <input type="hidden" name="allPrice"
									id="allPrice" value="${allPrice}" /></td>
						</tr>
					</tbody>
				</table>
				<br /><br /><br />
				
				<div class="button" >
				<span class="del">50,000원 이상 무료 배송</span>
					<div class="orderbtn" style="float: right">
						<div class="eff"></div>
						<a href="orderform.do">주문하기</a>
					</div>
					<div class="shopbtn" style="float: right">
						<div class="eff"></div>
						<a href="../index.do">쇼핑계속</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 전부 선택 -->
	<script type="text/javascript">
		$("#AllCheck").click(
				function() {
					if ($("#AllCheck").prop("checked")) {
						$("input[name=delBox]").not("[disabled]").prop(
								"checked", true);
					} else {
						$("input[name=delBox]").prop("checked", false);
					}
				});
		$("#buyEach").click(function() {
			var eachSize = $("input[name=delBox]:checked").length;
			if (eachSize == 0) {
				alert("1개 이상 체크해주세요.");
				return false;
			}
			var arrCheckBox = [];
			$("input[name=delBox]:checked").each(function(i) {
				arrCheckBox.push($(this).val());
			});

			$.ajax({
				url : "deleteEachCart.do", //이동할 주소
				type : "post", //form 전송 방식
				data : {"arrCheckBox" : arrCheckBox}, //데이터는 arrEachCode라는 이름으로 배열 전달
				//ajax 성공이라면 전달된값을 전달자로 받아 함수실행
				success : function(responseData) {
					if (responseData.isSuccess) {
						//알림 띄우고 새로고침
						alert("장바구니에서 상품을 삭제했습니다.");
						location.reload();
					} else {
						alert("삭제에 실패했습니다.");
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
		var tag = null;
		var targetVal = null;
		$("input[type=number]").click(function() {
			tag = $(this).attr("id");
			console.log(tag);
			targetVal = $(this).val();
			console.log(targetVal);
		})
		$("button[type=button]").click(function() {
			var tarArray = [];
			tarArray.push(tag);
			tarArray.push(targetVal);
			console.log(tarArray);
			$.ajax({
				url : "updateCartStock.do",
				type : "post",
				data : {"tarArray" : tarArray},
				success : function(responseData) {
					if (responseData.isSuccess) {
						//알림 띄우고 새로고침
						alert("상품수량을 변경하였습니다.");
						location.reload();
					} else {
						alert("실패지롱");
					}
				}
			})
		})
	</script>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
</body>
</html>