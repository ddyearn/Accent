<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/update.jsp</title>
</head>
<body>
<div class="container">
	<script>
	alert("글을 수정했습니다.");
	location.href="${pageContext.request.contextPath }/review/detail.do?reviewNum=${dto.reviewNum}"
	</script>
</div>
</body>
</html>