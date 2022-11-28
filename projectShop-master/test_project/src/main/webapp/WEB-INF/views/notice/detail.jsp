<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
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
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/notice/list.do">목록</a></li>
			<li>글 상세 보기</li>
		</ol>
		<c:if test="${not empty keyword }">
			<p>
				<strong>${keyword }</strong> 검색어로 검색된 결과 자세히 보기 입니다.
			</p>
		</c:if>

		<c:if test="${dto.prevNum ne 0 }">
			<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
		</c:if>

		<c:if test="${dto.nextNum ne 0 }">
			<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
		</c:if>
		<table class="table table-bordered table-condensed">
			<colgroup>
				<col class="col-xs-2" />
				<col class="col-xs-10" />
			</colgroup>
			<tr>
				<th>글번호</th>
				<!-- num 인자를 전달 했을 때 글 하나의 정보를 리턴하는 메소드를 Dao에 만들어야 한다. -->
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<fmt:parseDate value="${dto.regdate }" var="orderDate" pattern="yy.MM.dd HH:mm" scope="page"/>
					<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div class="contents">${dto.content }</div></td>
			</tr>
		</table>
		<%-- 
			글 작성자와 로그인 된 아이디가 같을때만 기능을 제공해 준다. 
			즉, 본인이 작성한 글만 수정할수 있도록 하기 위해
		--%>
		<c:if test="${dto.writer eq id }">
			<!-- 글 작성자와 session에 있는 아이디가 같을 때! -->
		<div class="sbtn">
			<a class="btn" href="updateform.do?num=${dto.num }"> 수정</a>
			<a class="btn" href="javascript:deleteConfirm()">삭제</a>
		</div>
		</c:if>
		<br/><br/><br/>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
	<script>
		function deleteConfirm() {
			var isDelete = confirm("글을 삭제 하시 겠습니까?");
			if (isDelete) {
				location.href = "delete.do?num=${dto.num}";
			}
		}
	</script>
</body>
</html>




