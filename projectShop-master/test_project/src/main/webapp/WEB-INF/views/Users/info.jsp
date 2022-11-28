<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<title>회원수정 창/Users/info.jsp</title>
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
	<br /><br />
<section id="content">
<div class="typeWrite">
<form action="info.do">
		<h2 class="title">개인 정보 페이지</h2>
		<br />
		<table id="signup">
		 <tbody id="signbody">
			<tr>
				<th class="row">ID</th>
				<td>${dto.userId}</td>
			</tr>
			<tr>
				<th>PassWord</th>
				<td><a onclick="newpassform();">수정하기</a></td>
			</tr>
            <script>
               function newpassform(){
                  window.open("newPassform.do","newpass",
                        "width=500,height=400,top=250,left=550,resizable=no");
               }
            </script>
			<tr>
				<th>이름</th>  
				<td>${dto.userName}</td>
			</tr>
			<tr>
				<th class="row">연락처</th>
				<td>${dto.userPhone}</td>
			</tr>
			<tr>
				<th class="row">E-mail</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th class="row">주소</th>
				<td>${dto.userAddr1}<br />
				${dto.userAddr2}, ${dto.userAddr3}</td>
			</tr>
			
			<tr>
				<th class="row">생년월일</th>
				<td>${dto.birthday}</td>
			</tr>
			<tr>
				<th class="row">가입일</th>
				<td>${dto.regiDate}</td>
			</tr>
			</tbody>
		</table>		
		<%-- <p><a href="${pageContext.request.contextPath}/Users/updateform.do">개인 정보 수정하기</a></p> --%>
	</form>
	<br />
<div class="sbtn">
	<div class="shopbtn" style="float: right">
	<div class="eff"></div>
	<a href="updateform.do">수정하기</a>
</div>
<div class="orderbtn" style="float: right">
	<div class="eff"></div>
	<a href="../index.do">홈으로</a>
</div>
</div>
</div>

</section>
</body>
</html>





