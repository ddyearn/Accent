  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/Users/searchnewPass.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<section id="content">
<form action="changeNewPassData.do" method="post">
 <div class="input_area">
 	<h2 class="title">비밀번호 수정 페이지</h2>
 	<br /><br />
 	<input type="hidden" name="userId" value="${dto.userId }"/>
 	<table id="change">
 	<tbody id="changebody">
 		<tr>
 			<th><label for="newuserPass1">신규 비밀번호</label></th>
 			<td>
 				<input type="password" name="newPass" id="newuserPass1"  />
 			</td>
 		</tr>
 		<tr>
 			<th><label for="newuserPass2">신규 비밀번호 확인</label></th>
 			<td>
 				<input type="password" id="newuserPass2" />
 			</td>
 		</tr>
 	</tbody>
 	</table>
 	<button type="submit" id="searchupPass_Btn" name="searchupPass_Btn">수정확인</button>
 </div>
</form>
</section>
<script>
	//비밀번호를 입력할때 실행할 함수 등록
	$("#newuserPass1, #newuserPass2").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty=true;
		
		//입력한 비밀번호를 읽어온다.
		var pwd=$("#newuserPass1").val();
		var pwd2=$("#newuserPass2").val();
		
		if(pwd != pwd2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(pwd.length == 0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!isPwdEqual || !isPwdInput;
	});	
	$("#searchupPass_Btn").on("click",function(){
		var pwd=$("#newuserPass1").val();
		var pwd2=$("#newuserPass2").val();
		if(pwd != pwd2){
			alert("비밀번호가 일치하지 않습니다.");
			$("#newuserPass1").val("");
			$("#newuserPass2").val("");
			return false;
		}
		self.close();
	})
</script>
</body>
</html>