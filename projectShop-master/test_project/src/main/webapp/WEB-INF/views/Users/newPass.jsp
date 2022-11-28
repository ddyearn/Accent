<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 이후/Users/newPass.jsp</title>
</head>
<body>
	<strong>${usersDto.userId } 님의 비밀번호를 수정하였습니다.</strong>
	<p><a href="${pageContext.request.contextPath }/home.do">홈으로</a></p>
</body>
</html>