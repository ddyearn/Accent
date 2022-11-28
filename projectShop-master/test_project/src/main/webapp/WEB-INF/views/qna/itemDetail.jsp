<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:choose>
		<c:when test="${sessionScope.userDto.verify eq 1 || dto.writer eq id}">
			<div class="container">
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/qna/list.do">전체 목록</a></li>
					<li><a href="${pageContext.request.contextPath }/Users_Item/itemView_form.do?itemNum=${itemNum}&pageNum=1&reviewNum=1">목록</a></li>
					<li>글 상세 보기</li>
				</ol>
				<c:if test="${not empty keyword }">
					<p>
						<strong>${keyword }</strong> 검색어로 검색된 결과 자세히 보기 입니다.
					</p>
				</c:if>
				<c:if test="${dto.prevNum ne 0 }">
					<a href="itemDetail.do?num=${dto.prevNum }&itemNum=${itemNum}">이전글</a>
				</c:if>

				<c:if test="${dto.nextNum ne 0 }">
					<a
						href="itemDetail.do?num=${dto.nextNum }&itemNum=${itemNum}">다음글</a>
				</c:if>
				<table class="table table-bordered table-condensed">
					<colgroup>
						<col class="col-xs-2" />
						<col class="col-xs-10" />
					</colgroup>
					<tr>
						<th>글번호</th>
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
						<td>${dto.regdate }</td>
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
					<a class="btn btn-info" href="updateform.do?num=${dto.num }&itemNum=${itemNum}">
						수정 </a>
					<a class="btn btn-warning" href="javascript:deleteConfirm()">삭제</a>
				</c:if>
				<br/><br/>
				<div class="comments">
					<ul>
						<c:forEach items="${commentList }" var="tmp">
							<c:choose>
								<c:when test="${tmp.deleted ne 'yes' }">
									<li class="comment" id="comment${tmp.num }"
										<c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
										<span>${tmp.writer }</span> <c:if
											test="${tmp.num ne tmp.comment_group }">
									to <strong>${tmp.target_id }</strong>
										</c:if> <span>${tmp.regdate }</span> <a href="javascript:"
										class="reply_link">답글</a>&nbsp;
										<c:choose>
											<%-- 로그인된 아이디와 댓글의 작성자가 같으면 --%>
											<c:when test="${id eq tmp.writer }">
												<a href="javascript:" class="comment-update-link">수정</a>&nbsp;
										<a href="javascript:deleteComment(${tmp.num })">삭제</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:">신고</a>
											</c:otherwise>
										</c:choose>
										<dl>
											<dt></dt>
											<dd>
												<pre>${tmp.content }</pre>
											</dd>
										</dl>
										<form class="comment-insert-form" action="comment_insert.do?itemNum=${itemNum}"
											method="post">
											<!-- 덧글 그룹 -->
											<input type="hidden" name="ref_group" value="${dto.num }" />
											<!-- 덧글 대상 -->
											<input type="hidden" name="target_id" value="${tmp.writer }" />
											<input type="hidden" name="comment_group"
												value="${tmp.comment_group }" />
											<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
											<button type="submit">등록</button>
										</form> <!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 --> <c:if
											test="${id eq tmp.writer }">
											<form class="comment-update-form" action="comment_update.do"
												method="post">
												<input type="hidden" name="num" value="${tmp.num }" />
												<textarea name="content">${tmp.content }</textarea>
												<button type="submit">수정</button>
											</form>
										</c:if>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<div class="clearfix"></div>
					<!-- 원글에 댓글을 작성할수 있는 폼 -->
					<div class="comment_form">
						<c:choose>
							<c:when test="${not empty sessionScope.userDto.userId }">
								<c:if test="${sessionScope.userDto.verify eq 1}">
									<form action="comment_insert.do?itemNum=${itemNum}" method="post">
										<!-- 댓글의 그룹번호는 원글의 글번호가 된다.  -->
										<input type="hidden" name="ref_group" value="${dto.num }" />
										<!-- 댓글의 대상자는 원글의 작성자가 된다. -->
										<input type="hidden" name="target_id" value="${dto.writer }" />
										<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
										<button type="submit">등록</button>
									</form>
								</c:if>
							</c:when>
						</c:choose>
					</div>
				</div>
				<footer id="footer">
					<div id="footer_box">
						<%@ include file="../include/footer.jsp"%>
					</div>
				</footer>
			</div>
		</c:when>
		<c:otherwise>
			<h1>잘못된 접근입니다.</h1>
		</c:otherwise>
	</c:choose>
	<script>
	//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".comment-update-link").click(function(){
		$(this)
		.parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		// "comment_update.do"
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// num=댓글번호&content=댓글내용
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막기 
		return false;
	});
	
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			// 페이지 전환 없이 ajax 요청을 통해서 삭제 하기
			$.ajax({
				url:"comment_delete.do", // "/qna/comment_delete.do" 요청
				method:"post",
				data:{"num":num}, // num 이라는 파라미터명으로 삭제할 댓글의 번호 전송
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("");
					}
				}
			});
		}
	}
	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/Users/loginform.do?url=${pageContext.request.contextPath}/qna/detail.do?num=${dto.num}";
			return false;//폼 전송 막기 
		}
	});
	
	//폼에 focus 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form textarea").on("click", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			var isMove=confirm("로그인페이지로 이동하시겠습니가?");
			if(isMove){
				location.href="${pageContext.request.contextPath}/Users/loginform.do?url=${pageContext.request.contextPath}/qna/detail.do?num=${dto.num}";
			}
		}
	});
	
	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		$(this)
		.parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		// 답글 <=> 취소가 서로 토글 되도록 한다. 
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});
	function deleteConfirm(){
		var isDelete=confirm("글을 삭제 하시 겠습니까?");
		if(isDelete){
			location.href="delete.do?num=${dto.num}";
		}
	}
</script>
</body>
</html>