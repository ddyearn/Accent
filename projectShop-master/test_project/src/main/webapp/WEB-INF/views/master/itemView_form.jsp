<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/master/itemView_form.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<style>

</style>
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
					<%@ include file="../include/master_aside.jsp"%>
				</div>
			</nav>
		</div>
	</header>
</div>
		<section id="container">
		<div id="container_box">
		<div class="detail">
			<form role="form" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="itemNum" value="${dto.itemNum }" />
				<input type="hidden" name="itemPrice" value="${dto.itemPrice }" /> 
				<input type="hidden" name="userId" value="${sessionScope.userDto.userId}" />
					<div class="itemImg">
						<img alt="이미지" src="../resources${dto.itemImg}" />
					</div>
				<div class="itemInfo">
					<h2 class="prd_title">${dto.itemName }</h2>
					<br />
				<div class="inputArea">				
					<p>
					<span class="dd">판매가 </span>
					<span class="num"><fmt:formatNumber pattern="###,###,###" value="${dto.itemPrice}" /> 원</span>
					</p>
					<p>
					<span class="dd">상품수량</span>
					<span class="num1"><fmt:formatNumber value="${dto.itemCount }" pattern="###,###,###"/>개</span>
					</p>
				</div>
				<div class="inputArea">
					<!-- <label>1차 분류</label> <span class="category1"></span>  -->
					<!-- 아이템 목록이 바뀐다면 바꾸기 -->
					<span class="dd">상품 분류</span> 
					<span class="num2">
						<c:choose>
					   		<c:when test="${dto.cateCode eq 101}">악세사리 - 반지</c:when>
					   		<c:when test="${dto.cateCode eq 102}">악세사리 - 귀걸이</c:when>
					   		<c:when test="${dto.cateCode eq 103}">악세사리 - 목걸이</c:when>
					   		<c:when test="${dto.cateCode eq 200}">여성의류</c:when>
					   		<c:when test="${dto.cateCode eq 300}">남성의류</c:when>
					   		<c:otherwise>카테코드를 지정해주세요</c:otherwise>
					   	</c:choose>
					</span>
				</div>
				
				<div class="inputArea">
				<div class="addCarts">
					<button type="button" id="modify_btn" class="itembtn">수정</button>
					<button type="button" id="delete_btn" class="itembtn">삭제</button>
				</div>
				</div>
				<script>
					var formObj = $("form[role='form']");
					console.log(formObj);
					$("#modify_btn").click(function() {
						formObj.attr("action", "item_modifyForm.do");
						formObj.attr("method", "post")
						formObj.submit();
					});
					$("#delete_btn").click(function() {
						var con = confirm("정말로 삭제하시겠습니까?");
						if (con) {
							formObj.attr("action", "delete.do");
							formObj.submit();
						}
					});
				</script>
				</div>
			</form>
			</div>
			<br/>
			<br/>
			<br/><br/>
				<div align="center" id="underline">
					<span><a href="#detail">Detail</a>&nbsp;&nbsp;&nbsp;</span> 
					<span><a href="#qna">Q&A</a>&nbsp;&nbsp;&nbsp;</span> 
					<span><a href="#review">Review</a>&nbsp;</span>
				</div>
				<br /> <br />
				<div class="itemDes" id="detail">${dto.itemDes }</div>
				<br /><br /><br />
			<!-- 해당아이템의  Q&A -->
			<div class="container" id="qna">
				<p style="text-align: center;" id="underline">
					<strong>Q&A</strong>
				</p>
				<br />
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
						<c:forEach var="tmp" items="${requestScope.list }">
							<tr>
								<td>${tmp.num }</td>
								<td><img src="../resources${tmp.itemImg }" id="itemImg" /></td>
								<td><c:choose>
										<c:when test="${not empty sessionScope.userDto.userId }">
											<c:choose>
												<c:when
													test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
													<a
														href="../qna/itemDetail.do?num=${tmp.num }&itemNum=${itemNum}">
														${tmp.title }[${tmp.commentCount }] </a>
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
								<td>${tmp.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page-display">
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${startPageNum ne 1 }">
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${startPageNum-1 }&reviewNum=${reviewNum }">&laquo;</a>	
							   	</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
							step="1">
							<c:choose>
								<c:when test="${i eq pageNum }">
									<li class="active">
										<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${i }&reviewNum=${reviewNum }">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${i }&reviewNum=${reviewNum }">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${endPageNum lt totalPageCount }">
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${endPageNum+1 }&reviewNum=${reviewNum }">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<br /> <br />
			<!-- 해당아이템의 리뷰 -->
			<div class="container" id="review">
				<p style="text-align: center;" id="underline">
					<strong>Review</strong>
				</p>
				<br />
				<p style="font-weight: bold;">
					리뷰 평점 : <span class="wrap-star"> <span class='star-rating'>
							<span style="width:<fmt:formatNumber value="${avg *10}" pattern=".0"/>%"></span>						
					</span>
					</span>
				</p>
				<br /> <br />

				<table class="table table-hover">
					<colgroup>
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-4" />
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-1" />
						<col class="col-xs-2" />
					</colgroup>
					<thead>
						<tr>
							<th>글 번호</th>
							<th>이미지</th>
							<th>아이템명</th>
							<th>리뷰</th>
							<th>별점</th>
							<th>좋아요</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tmp" items="${requestScope.reviewlist }"
							varStatus="status">
							<tr>
								<td>${status.count}</td>
								<!-- <td>${tmp.reviewNum}</td> -->
								<td><img src="../resources${tmp.itemImg }" id="itemImg" /></td>
								<td>${tmp.itemName }</td>
								<td style="word-break:break-all"><a href="../review/detail.do?reviewNum=${tmp.reviewNum }" class="review${tmp.reviewNum }">${tmp.reviewContent }</a></td>
								<script>
									/* reviewContent에 img가 있을 경우 삭제해줌*/
									$(document).ready(function(){
										$(".review${tmp.reviewNum} p img").remove();
										var text1=$(".review${tmp.reviewNum} p").text().substring(0,15);
										$(".review${tmp.reviewNum} p").text(text1);
									})
								</script>
								<td><span class="wrap-star"> 
										<span class='star-rating'> 
										<span style="width:<fmt:formatNumber value="${tmp.likeCount *10}" pattern=".0"/>%"></span>		
									</span>
								</span></td>
								<td><span class="glyphicon glyphicon-thumbs-up"></span>
									${tmp.upCount }</td>
								<td>${tmp.reviewWriter }</td>
								<td>${tmp.regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<c:if test="${empty reviewlist  }">
				<p style="text-align: center;">해당 아이템의 리뷰가 없습니다.</p>
			</c:if>
			<div class="page-display">
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${RstartPageNum ne 1 }">
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${RendPageNum-1}">&laquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="javascript:">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<%-- step="1" 은 기본값이다. --%>
						<c:forEach var="i" begin="${RstartPageNum }" end="${RendPageNum }"
							step="1">
							<c:choose>
								<c:when test="${i eq reviewNum }">
									<li class="active">
										<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${i}">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${i}">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${RendPageNum < RtotalPageCount }">
								<li>
									<a href="itemView_form.do?itemNum=${itemNum}&pageNum=${pageNum }&reviewNum=${RendPageNum+1}">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<!-- "javascript:" 이것만 쓰면 동작하지않음 --> <a href="javascript:">&raquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
</body>
</html>