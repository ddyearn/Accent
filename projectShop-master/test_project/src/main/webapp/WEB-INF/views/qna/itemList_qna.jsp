<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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
	<div class="container_box">
		<c:if test="${not empty keyword }">
			<p class="breadcrumb">
				<strong>${keyword }</strong> 라는 검색어로 <strong>${totalRow }</strong>
				개의 글이 검색 되었습니다.
			</p>
		</c:if>
	</div>
	<div class="container">
		<h1>Q&A</h1>
		<table class="table table-hover">
			<colgroup>
				<col class="col-xs-1" />
				<col class="col-xs-2" />
				<col class="col-xs-5" />
				<col class="col-xs-1" />
				<col class="col-xs-1" />
				<col class="col-xs-2" />
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>상품정보</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<%-- <td>${tmp.num }</td> --%>
						<td>
							<a href="../qna/detail.do?num=${tmp.num }">
							<img src="../resources${tmp.itemImg }" /></a>
						</td>
						<td><c:choose>
								<c:when test="${not empty sessionScope.userDto.userId }">
									<c:choose>
										<c:when test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
											<a href="detail.do?num=${tmp.num }&condition=${condition }&keyword=${encodedKeyword }">
												${tmp.title }[${tmp.commentCount }] </a>
										</c:when>
										<c:otherwise>
											비밀글입니다. 
											<img src="${pageContext.request.contextPath }/resources/images/keySmall.png" />
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:otherwise>
									비밀글입니다. 
									<img src="${pageContext.request.contextPath }/resources/images/keySmall.png" />
								</c:otherwise>
							</c:choose></td>
						<td>${tmp.writer }</td>
						<td>${tmp.viewCount }</td>
						<td><fmt:parseDate value="${tmp.regdate }" var="orderDate" pattern="yy.MM.dd HH:mm" scope="page"/>
						<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a class="btn btn-info" href="insertform.do?itemNum=${itemNum }">새글
			작성</a>

		<div class="page-display">
			<ul class="pagination pagination-sm" style="padding-left: 36%;">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<%-- startPageNum != 1 --%>
						<li><a
							href="list.do?pageNum=${requestScope.startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&laquo;</a> <%-- : 아무것도 적지 않으면  동작하지 않는 링크가 된다. --%>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${i eq requestScope.pageNum }">
							<li class="active"><a
								href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li><a
							href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<%-- 글 검색 기능 폼 --%>

		<form action="list.do" method="get" style="text-align: right">
			<label for="condition">검색조건</label> 
			<select name="condition"id="condition">
				<option value="titlecontent"
					<c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
				<option value="title"
					<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer"
					<c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
			</select> 
			<input type="text" name="keyword" placeholder="검색어 입력..." value="${keyword }" />
			<button type="submit">검색</button>
		</form>
		<br/>
		<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
	</div>

</body>
</html>