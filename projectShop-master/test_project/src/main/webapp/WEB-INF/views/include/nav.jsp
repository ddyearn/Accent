<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<ul class="nav nav-tabs">
	<c:choose>
		<c:when test="${not empty id}">
			<c:if test="${sessionScope.verify eq 1}">
				<li role="presentation">
					<a id="ms" href="${pageContext.request.contextPath }/master/master_index.do">관리자</a>
				</li> 
			</c:if> 
				<li role="presentation"><span class="navText"><strong>${id}님</strong> 환영합니다</span></li>
				<li>
					<a href="${pageContext.request.contextPath }/Users/logout.do">
					<img src="${pageContext.request.contextPath }/resources/images/header_logout_icon.png"  alt="로그아웃" 
					onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_logout_icon_on.png'" 
					onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_logout_icon.png'"/>	
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/shop/cartList.do" >
						<img src="${pageContext.request.contextPath }/resources/images/header_cart_icon.png"  alt="장바구니" 
						onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_cart_icon_on.png'" 
						onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_cart_icon.png'"/>	
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/Users/myPage.do" >
					<img src="${pageContext.request.contextPath }/resources/images/header_mypage_icon.png"  alt="마이페이지" 
					onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_mypage_icon_on.png'" 
					onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_mypage_icon.png'"/>	
					</a>
				</li>
				 
		</c:when>
		<c:otherwise>
			<li>
				<a href="${pageContext.request.contextPath }/Users/login_form.do" class="log">
				<img src="${pageContext.request.contextPath }/resources/images/header_login_icon.png"  alt="로그인" 
				onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_login_icon_on.png'" 
				onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_login_icon.png'"/>				
			</a>
			</li>			
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/Users/signup_form.do">
					<img src="${pageContext.request.contextPath }/resources/images/header_join_icon.png"  alt="회원가입" 
						onmouseover="this.src='${pageContext.request.contextPath }/resources/images/header_join_icon_on.png'" 
						onmouseout="this.src='${pageContext.request.contextPath }/resources/images/header_join_icon.png'"/>
				</a>
			</li>

		</c:otherwise>
	</c:choose>
</ul>





