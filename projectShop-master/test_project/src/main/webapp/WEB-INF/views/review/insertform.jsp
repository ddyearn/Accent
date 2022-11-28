<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.js"></script>
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
				<form action="insert.do" method="post" id="form" onSubmit="s">
					<input type="hidden" name="itemNum" value="${itemNum }" />
					<input type="hidden" name="reviewWriter" value="${sessionScope.userDto.userId}" />
					<input type="hidden" id="likeCount" name="likeCount" value=2 />
					<div class="container" >
						<label for="reviewContent">상품 리뷰</label>
						<textarea name="reviewContent" id="reviewContent" ></textarea>
						<script type="text/javascript">
							$(function(){
								CKEDITOR.replace('reviewContent',{
									filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
								});
							});
						</script>
					</div>
			
					<div class="container">
						<label for="likeCount">평가</label>
						<!--  <input type="text" name="likeCount" id="likeCount" /> -->
						<p id="star_grade">
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
						</p>
					</div>
					<div class="sbtn">
					<button id="starBtn" class="btn" type="submit" >등록</button>
					<button type="button" class="btn" id="back_btn">취소</button>
					</div>
					<script>
						$("#back_btn").click(function () {
							history.back();
						});
					</script>  

				</form>
				<script>
					$("#starBtn").on("click",function(){
						//제출 전 에디터 내용을 변수에 저장
						var content=CKEDITOR.instances.reviewContent.getData();
						//제출 전 에디터 내용 길이를 변수에 저장
						var content_len=CKEDITOR.instances.reviewContent.getData().length;
						//내용이 없는 경우
						if(content==""){
							alert("내용을 입력하세요.",function(){
								//에디터 내용에 포커스 on
								CKEDITOR.instances.reviewContent.focus();
								
							},"warning");
							return false;
						}
						//내용이 30글자 미만인 경우
						//기본적으로 8글자를 가짐 빈문자열+<p></p> =8글자
						if(content_len<38){
							alert("내용을  30자 이상 입력하세요.",function(){
								//에디터 내용에 초기화
								CKEDITOR.instances.reviewContent.setData("");
								//에디터 내용에 포커스 on
								CKEDITOR.instances.reviewContent.focus();
							},"warning");
							return false;
						}
					});
				</script>
			</div>
		</div>

	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>
<script>
	$('#star_grade a').click(function(){
	    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	      var likeCount = document.querySelectorAll(".on").length*2;
	      $("#likeCount").val(likeCount);
	    return false;
	});
</script>
<script type="text/javascript">
	 window.history.forward();
	 function noBack(){window.history.forward();}
	</script>
</body>
</html>