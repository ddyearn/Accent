<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/PassAndLogin</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>

<section id="content">
	<c:choose>
		<c:when test="${empty dto.userId }">
			<h1 align="center">해당 아이디 정보가 없습니다.</h1>
			<a href="${pageContext.request.contextPath }/Users/login_form.do" onclick="self.close();">로그인</a>
			<a href="${pageContext.request.contextPath }/Users/searchIdForm.do">아이디 찾기</a>
		</c:when>
		<c:otherwise>
			<h1 align="center">귀하의 아이디는 ${dto.userId } 입니다.</h1>
			<a href="${pageContext.request.contextPath }/Users/login_form.do" onclick="self.close();">로그인</a>
			<a href="${pageContext.request.contextPath }/Users/searchPassForm.do">비밀번호 찾기</a>
		</c:otherwise>
	</c:choose>
</section>

</body>
</html>