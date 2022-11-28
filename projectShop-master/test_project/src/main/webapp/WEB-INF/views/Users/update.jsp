<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 이후/Users/update.jsp</title>
</head>
<body>
	<strong>${dto.userId } 님의 정보가 수정되었습니다.</strong>
	<p><a href="${pageContext.request.contextPath}/home.do">홈으로</a></p>
</body>
</html>