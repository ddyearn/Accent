<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<section id="content">
<h2 class="title">아이디 찾기</h2>
<br /><br />
 <form action="PassAndLogin.do" method="post">
 	<table id="find">
 	<tbody id="findbody">
 		<tr>
	 		<th class="row"><label for="userName">이름</label></th>
	 		<td>
	 			<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요" required="required" /> 
	 		</td>
 		</tr>
 		<tr>
 			<th class="row"><label for="userPhone">연락처</label></th>
 			<td>
 				<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요" required="required" />
 			</td>
 		</tr>
 		<tr>
 			<th class="row"><label for="birthday">생년월일</label></th>
 			<td>
 				<input type="date" id="birthday" name="birthday" required="required" />
 			</td>
 		</tr>
 	</tbody>
 	</table>
 	<button type="submit" id="searchId_btn" name="searchId_btn">아이디 찾기</button>
 </form>
 
</section>
</body>
</html>