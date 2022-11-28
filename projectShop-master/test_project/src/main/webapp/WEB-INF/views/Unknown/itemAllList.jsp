<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<body>
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
<section id="container">
	<div id="container_box">
		<h2 class="title">상품 목록</h2>
		<div class="row" style="width:1100px; height: 1500px; margin: auto;">
		   <c:forEach items="${list}" var="list">
		   	<div class="col-xs-6 col-md-3">
		   		<div class="thumbnail">
		   		<a href="itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
				   <img id="indexItemImg" alt="이미지" src="../resources${list.itemImg}" class="thumbImg"/>
		   		</a>
		   		<a href="itemView_form.do?itemNum=${list.itemNum}&pageNum=1&reviewNum=1">
			   		<p style="padding:10px;  text-align: center;">${list.itemName }</p></a>
			   		<p style="padding:10px;  text-align: center;"><fmt:formatNumber value="${list.itemPrice}" pattern="###,###,###"/>원</p>
		   		</div>
		   	</div>
		  </c:forEach>		
		</div>
			<div class="page-display">
				<ul class="pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li>
							<a href="itemAllList.do?pageNum=${startPageNum-1 }">
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
							<li class="active"><a href="itemAllList.do?pageNum=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="itemAllList.do?pageNum=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li>
							<a href="itemAllList.do?pageNum=${endPageNum+1 }">
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