<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/error/data_access.jsp</title>

</head>
<body>
<div class="container">
	<h1>DB 관리 예외 발생!</h1>
	<div>
		<p class="alert alert-danger">${exception.message }</p>
	</div>
	<p><a href="${pageContext.request.contextPath }/home.do">홈으로</a></p>
</div>
</body>
</html>