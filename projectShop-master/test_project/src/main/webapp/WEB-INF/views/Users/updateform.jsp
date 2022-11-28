<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정/Users/updateform.jsp</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
<div id="root">
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp"%>
					</div>
					<div id="index_logo_div">
						<a href="../index.do"><img id="index_logo_img"
							src="${pageContext.request.contextPath }/resources/images/project.png" /></a>
					</div>
					<div class="navbar-left">
						<c:choose>
							<c:when test="${not empty sessionScope.id }">
								<%@ include file="../include/users_aside.jsp"%>
							</c:when>
							<c:otherwise>
								<%@ include file="../include/unknown_aside.jsp"%>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>
		</header>
	</div>
	<br /><br />
<section id="content">
<div class="typeWrite">
 <form action="update.do" method="post">
 	<h2 class="title">개인 정보 페이지</h2>
	<br />
 	<table id="signup">
	 		<tbody id="signbody">
	    <tr>
	    	<th class="row" ><label for="userId">아이디</label></th>
	    	<td>
	    		<p>${dto.userId }</p>
	    		<input type="hidden" id="login_input" name="userId" value="${dto.userId}" required="required" />
	    	</td>
	    </tr>
	    <tr>
	    	<th class="row"><label for="userName">이름</label></th>
	    	<td>
	    		<input type="text" id="login_input" name="userName" value="${dto.userName}" required="required" /> 
	    	</td>
	    </tr>
	    <tr>
	    	<th class="row"> <label for="userPhone">연락처</label></th>
	    	<td>
	    		<input type="text" id="login_input" name="userPhone" value="${dto.userPhone }" required="required" />
	    	</td>
	    </tr>
	    <tr>
	    	<th class="row"> <label for="email">이메일</label></th>
	    	<td>
	    		<input type="email" id="login_input" name="email" value="${dto.email }"/> 
	    	</td>
	    </tr>
	    <tr>
	    	<th class="row">주소</th>
	    	<td ng-class="{'has-success':myForm.userAddr1.$valid,'has-error':myForm.userAddr1.$invalid &&myForm.userAddr1.$dirty}">
	            <input type="text" name="userAddr1" id="userAddr1" value="${dto.userAddr1}" ng-model="userAddr1" ng-required="true"/>
	            
	            <input id="addrbtn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><label for="userAddr1"><strong id="required"></strong></label><br>
	            
	    		
	            <input type="text" name="userAddr2" id="userAddr2" value="${dto.userAddr2}" ng-model="userAddr2" ng-required="true"/>
	            <label for="userAddr2">기본 주소 <strong id="required"></strong></label>
	           
	    		<br />
	            <input type="text" name="userAddr3" id="userAddr3" value="${dto.userAddr3}"/>
	            <label for="userAddr3">상세 주소</label>
	            <br /><br />
	    	</td>
	    </tr>
	</tbody>
 	</table>
 	<br /><br />
 	<div class="sbtn">
 		<button type="submit" id="update_Btn" name="update_Btn">수정완료</button>
 	</div>
 	<br /><br />
 </form>	
 </div>
</section>
<!-- 다음 주소 API 사용 -->     
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
             
    new daum.Postcode({
       oncomplete: function(data) {
       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
       
       // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
       var extraRoadAddr = ''; // 도로명 조합형 주소 변수
       
       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraRoadAddr += data.bname; }
       // 건물명이 있고, 공동주택일 경우 추가한다.
       if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName); }
       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
       if(extraRoadAddr !== ''){
                          extraRoadAddr = ' (' + extraRoadAddr + ')'; }
       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
       if(fullRoadAddr !== ''){
                          fullRoadAddr += extraRoadAddr; }
       
       // 우편번호와 주소 정보를 해당 필드에 넣는다.
       document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
       document.getElementById('userAddr2').value = fullRoadAddr;
       //document.getElementById('userAddr3').value = data.jibunAddress;
                  
       // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
       if(data.autoRoadAddress) {
          //예상되는 도로명 주소에 조합형 주소를 추가한다.
          var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
          document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
       
          } else if(data.autoJibunAddress) {
            var expJibunAddr = data.autoJibunAddress;
            document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
       	  } else {
            document.getElementById('guide').innerHTML = '';
            }
               }
              }).open();
          }        
</script>
</body>
</html>