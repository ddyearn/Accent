  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<section id="content">
<h2 class="title">비밀번호 찾기</h2>
 <form action="searchPass.do" method="post">
 <table id="findpwd">
 <tbody id="findpwdbody">
 	<tr>
 		<th><label for="userId">ID</label></th>
 		<td>
 			<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요" required="required" />
 		</td>
 	</tr>
 	<tr>
    	<th> <label for="PassQuiz">비밀번호 확인 질문</label></th>
    	<td>
    		<select name="PassQuiz" id="PassQuiz" required="required">
		    	 <option value="titlename" >질문을 선택하세요.</option>
		         <option value="Mom">어머니의 성함은?</option>
		         <option value="Dad">아버지의 성함은?</option>
		         <option value="Pet">애완동물의 이름은?</option>
		         <option value="Love">가장 사랑하는 인물은?</option>
		         <option value="Faverite">가장 존경하는 인물은?</option>
    		</select>
    	</td>
    </tr>
    <tr>
    	<th><label for="quizAnswer">비밀번호 찾기 답변</label></th>
    	<td>
    		<input type="text" id="quizAnswer" name="quizAnswer" placeholder="답을 입력하세요." required="required" />
    	</td>
    </tr>
    <tr>
    	<th><label for="userName">이름</label></th>
    	<td>
    		<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />
    	</td>
    </tr>
    <tr>
    	<th><label for="userPhone">연락처</label></th>
    	<td>
    		<input type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요" required="required" />
    	</td>
    </tr>
    <tr>
    	<th><label for="email">이메일</label></th>
    	<td>
    		<input type="email" id="email" name="email" placeholder="이메일 형식에 맞게 입력해주세요." required="required" />
    	</td>
    </tr>
 </tbody>
 </table>
  
  <button type="submit" id="update_Btn" name="update_Btn">비밀번호 찾기</button>
 </form>
</section>
<script>
	if(${check}==false){
		alert("입력하신 정보가 틀렸습니다. 다시 입력해주세요 :)");
	}
</script>
</body>
</html>