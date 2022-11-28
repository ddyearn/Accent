<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>

</head>
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
	<div class="detail">
		<form role="form" action="register.do" method="post" autocomplete="off" enctype="multipart/form-data">
		<input type="hidden" name="itemNum" value="${dto.itemNum }" /> <input
					type="hidden" name="itemPrice" value="${dto.itemPrice }" /> <input
					type="hidden" name="userId" value="${sessionScope.userDto.userId}" />
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
				</div>
				<!--  <div class="inputArea">
					<p><span>상품 재고: </span><fmt:formatNumber pattern="###,###,###" value="${dto.itemCount}" /> EA</p>
				</div> -->
				<div class="cartStock">
					<span class="dd">구입 수량 </span>
					<div class="num">
					<p class="cartStock"> 					
					<button type="button" class ="plus">+</button>
					<input type = "number" class ="numBox" min="1" max="${dto.itemCount }" value="1" name="cartStock" readonly="readonly"/>
					<button type="button" class ="minus">-</button>
					<script>
					  $(".plus").click(function(){
					   var num = $(".numBox").val();
					   var plusNum = Number(num) + 1;
					   if(plusNum > ${dto.itemCount}) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(plusNum);          
					   }
					  });
					  
					  $(".minus").click(function(){
					   var num = $(".numBox").val();
					   var minusNum = Number(num) - 1;
					   
					   if(minusNum <= 0) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(minusNum);          
					   }
					  });
					 </script>
					 <p>
					 </div>
				</div>
			
			<div class="inputArea">
			<div class="addCart">
			<div class="wide">
				<button type="button" id="shop_btn" class="btn_buy">바로 주문하기</button>
			</div>
				<button type="button" id="shop1_btn" class="itembtn">장바구니</button>
				<button type="button" id="back_btn" class="itembtn">뒤로가기</button>
				<script type="text/javascript">
					$("#back_btn").click(function () {
						history.back();
					})
				</script>
			</div>
			<script>
				var formObj = $("form[role='form']");
				console.log(formObj);
				$("#shop_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
				var formObj = $("form[role='form']");
				console.log(formObj);
				$("#shop1_btn").click(function() {
					var con = confirm("로그인이 필요합니다. 로그인을 하시겠습니까?");
					if(con){
						formObj.attr("action","../Users/login_form.do");
						formObj.submit();							
					}
				});
			</script>
			</div>
			</div>
		</form>
		</div>
		<br/><br/><br /><br />
			<div align="center" id="underline">
				<span><a href="#detail">Detail</a>&nbsp;&nbsp;&nbsp;</span> <span><a
					href="#qna">Q&A</a>&nbsp;&nbsp;&nbsp;</span> <span><a
					href="#review">Review</a>&nbsp;</span>
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
												<c:when test="${sessionScope.userDto.verify eq 1 || sessionScope.userDto.userId == tmp.writer}">
													<a href="../qna/itemDetail.do?num=${tmp.num }&itemNum=${itemNum}">
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
				<div align="right">
					<a class="btn"
						href="../qna/insertform.do?itemNum=${itemNum }">문의하기</a>
				</div>
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
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
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
						<col class="col-xs-3" />
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
							<td>
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
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>