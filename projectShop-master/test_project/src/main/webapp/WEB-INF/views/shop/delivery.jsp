<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/delivery.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
	<br/>
	<div class="container">
		<div  style="text-align: center;" >
			<img style="width: 200px;" id="index_logo_img" src="${pageContext.request.contextPath }/resources/images/project.png"/>
		</div>
	</div>
	<br/>
	<br/>
		<div class="container">
		<c:forEach var="tmp" items="${list }">
			<p><strong>[${sessionScope.userDto.userName }]</strong> 님의 주문번호 : ${tmp.orderNum} 의  배송현황입니다.</p>
			<br/>
			<p>해당 주문번호의 배송 현황은 '${tmp.delivery }' 입니다.</p>
		</c:forEach>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
			<div style="text-align: center;">
				<button onclick="site();">배송 조회</button>
				<button onclick="self.close();">닫기</button>
			</div>
		</div>
		<script>
			function site(){
				window.open("https://www.cjlogistics.com/ko/tool/parcel/tracking","checkdelivery",
						"width=1000,height=900,top=200,left=550,resizable=no");
			}
		</script>

</body>
</html>