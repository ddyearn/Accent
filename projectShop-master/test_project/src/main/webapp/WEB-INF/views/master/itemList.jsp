<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<%@ include file="../include/header.jsp" %>
					</div>
					<div class="navbar-left">
							<%@ include file="../include/master_aside.jsp" %>						
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<div id="container_box">
				<h2 class="title">상품 목록</h2>
					<table class="table table-hover" style="width: 1200px; margin-left: auto; margin-right: auto;">
						 <thead>
							 <tr>
							   <th>이미지</th>
							   <th>이름</th>
							   <th>카테고리</th>
							   <th>가격</th>
							   <th>수량</th>
							   <th>등록날짜</th>
							 </tr>
						 </thead>
						 <tbody>
						  <c:forEach items="${list}" var="list">
							  <tr>
								   <td><a href="itemView_form.do?itemNum=${list.itemNum}"></a><img alt="이미지" src="../resources${list.itemImg}" class="thumbImg"/></td>
								   <td><a href="itemView_form.do?itemNum=${list.itemNum}">${list.itemName}</a></td>
								   <td> <!-- 목록을 바꾼다면 카테코드 내용도 바꾸기 !! -->
								   	<c:choose>
								   		<c:when test="${list.cateCode eq 101}">악세사리-반지</c:when>
								   		<c:when test="${list.cateCode eq 102}">악세사리-귀걸이</c:when>
								   		<c:when test="${list.cateCode eq 103}">악세사리-목걸이</c:when>
								   		<c:when test="${list.cateCode eq 200}">여성의류</c:when>
								   		<c:when test="${list.cateCode eq 300}">남성의류</c:when>
								   		<c:otherwise>카테코드를 지정해주세요</c:otherwise>
								   	</c:choose>
								   </td>
								   <td> <fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###"/> 원 </td>
								   <td>
								   	<fmt:formatNumber value="${list.itemCount}" pattern="###,###,###"/>개</td>
								   <td>
								   <fmt:parseDate value="${list.itemDate}" var="itemDate"  pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								   <fmt:formatDate value="${itemDate}"  pattern="yyyy.MM.dd"/>
								   </td>
							  </tr>   
						  </c:forEach>
						 </tbody>
					</table>
							<div class="page-display">
				<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="itemList.do?pageNum=${startPageNum-1 }">
								&laquo;
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&laquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" 
					end="${endPageNum }" step="1">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active"><a href="itemList.do?pageNum=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="itemList.do?pageNum=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li>
							<a href="itemList.do?pageNum=${endPageNum+1 }">
								&raquo;
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				</ul>		
			</div>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
</body>
</html>