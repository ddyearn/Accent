<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A/list.jsp</title>
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
	<h1>Q&A</h1>
	<br /><br />
	<div class="container">
		<%-- 글 검색 기능 폼 --%>
		<form action="list.do" method="get">
		<div class="searchbox" style="float: right;">
			<label for="condition">검색조건</label> <select name="condition" style="height: 30px;"
				id="condition">
				<option value="titlecontent"
					<c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
				<option value="title"
					<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer"
					<c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
			</select> <input type="text" name="keyword" placeholder="검색어 입력..." style="height: 30px;"
				value="${keyword }" />
			<button class="btn" type="submit" style="margin-left:2px;">검색</button>
		</div>	
		</form>
		<br /><br /><br /><br />
		<table class="table">
			<colgroup>
				<col class="col-xs-1" />
				<col class="col-xs-1" />
				<col class="col-xs-3" />
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
					<c:choose>
						<c:when test="${not empty sessionScope.id }">
							<tr>
								<td>${status.count }</td>
								<%-- <td>${tmp.num }</td> --%>
								<td>
									<a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1">
									<img src="../resources${tmp.itemImg }" id="itemImg"/></a>
								</td>
								<td><c:choose>
										<c:when test="${not empty sessionScope.userDto.userId }">
											<c:choose>
												<c:when
													test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
													<a href="detail.do?num=${tmp.num }&itemNum=${tmp.itemNum}&pageNum=${pageNum}&condition=${condition }&keyword=${encodedKeyword }">
														${tmp.title } [${tmp.commentCount }] </a>
												</c:when>
												<c:otherwise>
													비밀글입니다. <i class="fas fa-lock"></i>
												</c:otherwise>
											</c:choose>
		
										</c:when>
										<c:otherwise>
											비밀글입니다. <i class="fas fa-lock"></i>
										</c:otherwise>
									</c:choose></td>
								<td>${tmp.writer }</td>
								<td>${tmp.viewCount }</td>
								<td><fmt:parseDate value="${tmp.regdate }" var="orderDate" pattern="yy.MM.dd HH:mm" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>${status.count }</td>
								<%-- <td>${tmp.num }</td> --%>
								<td>
									<a href="../Unknown/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1">
									<img src="../resources${tmp.itemImg }" id="itemImg"/></a>
								</td>
								<td><c:choose>
										<c:when test="${not empty sessionScope.userDto.userId }">
											<c:choose>
												<c:when
													test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
													<a href="detail.do?num=${tmp.num }&itemNum=${tmp.itemNum}&pageNum=${pageNum}&condition=${condition }&keyword=${encodedKeyword }">
														${tmp.title } [${tmp.commentCount }] </a>
												</c:when>
												<c:otherwise>
													비밀글입니다. <i class="fas fa-lock"></i>
												</c:otherwise>
											</c:choose>
		
										</c:when>
										<c:otherwise>
											비밀글입니다. <i class="fas fa-lock"></i>
										</c:otherwise>
									</c:choose></td>
								<td>${tmp.writer }</td>
								<td>${tmp.viewCount }</td>
								<td><fmt:parseDate value="${tmp.regdate }" var="orderDate" pattern="yy.MM.dd HH:mm" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-display" >
			<ul class="pagination pagination-sm" >
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li><a
							href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedKeyword }">
								&laquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
					step="1">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active"><a
								href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li><a
							href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">
								&raquo; </a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

</body>
</html>