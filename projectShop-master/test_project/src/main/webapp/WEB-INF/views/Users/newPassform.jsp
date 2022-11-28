<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/newPassform.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<section id="content">
<form name="newPass" action="newPass.do" method="post">
 <div class="input_area">
 	<h2 class="title">비밀번호 수정 페이지</h2>
 	<br /><br />
 	<div>
 		<label for="userPass">기존 비밀번호</label>
 		<input type="password" name="userPass" id="userPass" />
 	</div>
 	<br />
 	<div>
 		<label for="newuserPass">신규 비밀번호</label>
 		<input type="password" name="newPass" id="newUserPass" />
 	</div>
 	
 	<button type="submit" id="upPass_Btn" name="upPass_Btn">수정확인</button>

 </div>
</form>
<script>	
	if(${isSuccess}){
		parent.close();
		window.close();
		self.close();
	}else if(${isSuccess}==false){
		alert("비밀번호가 틀렸습니다. 다시 시도해주세요");
	}
</script>

</section>
</body>
</html>