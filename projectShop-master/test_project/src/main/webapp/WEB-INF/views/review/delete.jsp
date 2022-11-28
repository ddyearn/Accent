<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/delete.jsp</title>
</head>
<body>
<div class="container">
	<script>
		alert("${reviewNum} 번 글을 삭제했습니다. ");
		location.href="../list.do";
	</script>
</div>
</body>
</html>