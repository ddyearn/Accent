<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/list.jsp</title>
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
				<strong>${keyword }</strong> 라는 키워드로 <strong>${totalRow }</strong>
				개의 글이 검색되었습니다.
			</p>
		</c:if>
	</div>
	<h1>Notice</h1>
	<br /><br />
	<div class="container">
	<!-- GET 방식으로 제출되므로 file/list.do?condition=x&keyword=xx 이런 형태로 주소창에 출력된다.-->
		<form action="list.do" method="get">
		<div class="searchbox" style="float: right;">
			<label for="condition">검색조건</label> 
			<select name="condition" id="condition" style="height: 30px;">
				<option value="titlecontent"
					<c:if test="${condition eq 'titlename' }">selected</c:if>>제목+내용</option>
				<!-- selected 문자열을 조건문으로 찍어준다. -->
				<option value="title"
					<c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<!-- selected value 값을 적어주면 검색을 눌렀을 때 고정된다. -->
				<option value="writer"
					<c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
			</select> <input type="text" name="keyword" id="keyword" style="height: 30px;"
				placeholder="검색어 입력..." value="${keyword }" />
			<!-- EL은 아무것도 들어있지 않으면 null이 아니라 빈문자열을 출력한다 -->
			<button class="btn" type="submit" style="margin-left:2px;">검색</button>
			</div>
		</form>
		<br /><br /><br /><br />
		<table class="table">
			<%-- 칼럼의 폭을 임의로 조절할 수 있다. 합이 12이여야 한다(12등분이므로) --%>
			<colgroup>
				<col class="col-xs-1" />
				<col class="col-xs-7" />
				<col class="col-xs-1" />
				<col class="col-xs-1" />
				<col class="col-xs-2" />
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }" varStatus="status">
					<%-- request에 담긴 list --%>
					<tr>
						<!-- <td>${tmp.num }</td> -->
						<td>${status.count }</td>
						<td><c:choose>
								<c:when test="${tmp.noticeNum==1 }">
									<a href="detail.do?num=${tmp.num }&pageNum=${pageNum}"> <strong
										id="title"> ${tmp.title } <%-- 글을 눌렀을 때 자세히 보기 되도록 링크를 걸고 num 이라는 파라미터에 글번호를 가져간다. --%>
									</strong>
									</a>
								</c:when>
								<c:otherwise>
									<a href="detail.do?num=${tmp.num }&pageNum=${pageNum}">
										${tmp.title } <%-- 글을 눌렀을 때 자세히 보기 되도록 링크를 걸고 num 이라는 파라미터에 글번호를 가져간다. --%>
									</a>
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
		<c:choose>
			<c:when test="${not empty sessionScope.userDto.userId }">
				<c:if test="${sessionScope.userDto.verify eq 1}">
					<a class="btn" style="float: right;" href="insertform.do">새글 작성</a>
					<!-- cafe/private/* 로그인 안하면  사용 못하게 필터링! -->
				</c:if>
			</c:when>
		</c:choose>
		<br /><br /><br />
		<div class="page-display" align="center">
			<ul class="pagination pagination-sm">
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
	</div>


</body>
</html>