<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>/Users/boardList.jsp</title>
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
			<h3>Q&A</h3>
			<table class="table table-hover">
				<colgroup>
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-2" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>이미지</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>				
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${qnalist }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum }&pageNum=1&reviewNum=1"><img src="../resources${tmp.itemImg }" id="itemImg"/></a></td>
							<td><a href="../qna/detail.do?num=${tmp.num }&itemNum=${tmp.itemNum}">${tmp.title }</a></td>
							<td>${tmp.viewCount }</td>
							<td>
								<fmt:parseDate value="${tmp.regdate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/>
							</td>
							<td>${tmp.writer }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
			<c:if test="${empty qnalist  }">
				<p style="text-align: center;">작성하신 Q&A가 없습니다.</p>
			</c:if>
		</div>
		<br/>
		<div class="container">
			<h3>Review</h3>
			<table class="table table-hover">
				<colgroup>
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-3" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
					<col class="col-xs-1" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>이미지</th>
						<th>아이템명</th>
						<th>리뷰</th>
						<th>평점</th>
						<th>좋아요</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>				
				</thead>
				<tbody>
					<c:forEach var="tmp2" items="${reviewlist }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp2.itemNum }&pageNum=1&reviewNum=1"><img src="../resources${tmp2.itemImg }" id="itemImg"/></a></td>
							<td><a href="../Users_Item/itemView_form.do?itemNum=${tmp2.itemNum }&pageNum=1&reviewNum=1">${tmp2.itemName }</a></td>
							<td><a href="../review/detail.do?reviewNum=${tmp2.reviewNum }">${tmp2.reviewContent }</a></td>
							<td>
								<span class="wrap-star"> 
									<span class='star-rating'>
										<span style="width:<fmt:formatNumber value="${tmp2.likeCount *10}" pattern=".0"/>%"></span>
									</span> 
								</span>
							</td>
							<td><span class="glyphicon glyphicon-thumbs-up"></span>
										${tmp2.upCount }</td>
							<td>
								<fmt:parseDate value="${tmp2.regdate }" var="orderDate" pattern="yyyy-MM-dd HH:mm:ss.S" scope="page"/>
								<fmt:formatDate value="${orderDate }" pattern="yyyy.MM.dd"/>
							</td>
							<td>${tmp2.reviewWriter }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
			<c:if test="${empty reviewlist  }">
				<p style="text-align: center;">작성하신 Review가 없습니다.</p>
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