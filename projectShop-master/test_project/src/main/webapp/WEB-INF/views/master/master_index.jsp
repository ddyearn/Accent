<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
</head>
<body>
	<div id="root">		
		<header>
			<div class="header_box">
				<nav id="nav">
					<div class="navbar-right">
						<%@ include file="../include/nav.jsp" %>
					</div>
					<div id="index_logo_div">
						<%@ include file="../include/header.jsp" %>
					</div>
					<div class="navbar-left">
							<%@ include file="../include/master_aside.jsp" %>						
					</div>
				</nav>
			</div>
		</header>
		<section id="container">
			<div id="container_box">
					<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:1800px; height: 550px; margin: auto;">
				   <ol class="carousel-indicators">
				      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				      <li data-target="#myCarousel" data-slide-to="1"></li>
				      <li data-target="#myCarousel" data-slide-to="2"></li>
				      <li data-target="#myCarousel" data-slide-to="3"></li>
				    </ol>
			
				    <div class="carousel-inner" style="width:1800px; height: 550px;">
				      <div class="item active">
				        <img src="${pageContext.request.contextPath }/resources/images/best3_1.jpg" alt="Los Angeles" style="width:100%; height: 100%;">
				      </div>
				
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/images/best3_2.jpg" alt="Chicago" style="width:100%; height: 100%;">
				      </div>
				    
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/images/best3_3.jpg" alt="New york" style="width:100%; height: 100%;">
				      </div>
				      
				      <div class="item">
				        <img src="${pageContext.request.contextPath }/resources/imgUpLoad/KakaoTalk_20200410_180123960.gif" alt="New york" style="width:100%; height: 100%;">
				      </div>
				    </div>
				    
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>  									 		
			</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>