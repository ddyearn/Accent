<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shop/wishlist</title>
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
   <c:choose>
      <c:when test="${map.count==0 }">
         	위시리스트가 비어있습니다.
      </c:when>
      <c:otherwise>
      <div class="container">
      <h1>WishList</h1>
	  <form role="form" enctype="multipart/form-data" >
      <br />
      <br />
      <table class="table table-hover" style="text-align: center">
         <thead>
            <tr>
               <th style="text-align: center">이미지</th>
               <th style="text-align: center">상품명</th>
               <th style="text-align: center">가격</th>
               <th style="text-align: center">선택</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach var="tmp" items="${wishlist}" varStatus="1" >
            <tr>
               <td>
               		<a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1">
               		<img src="../resources/${tmp.itemImg }" width="140px" height="120px"/> </a>
               </td>
               <td> 
               		<a href="../Users_Item/itemView_form.do?itemNum=${tmp.itemNum}&pageNum=1&reviewNum=1">${tmp.itemName}</a>
               		<input type="hidden" value="${tmp.itemName }" name="itemName">
               		<input type="hidden" value="${tmp.wishNum }" name="wishNum"/>
               </td>       
               <td>
               		<input type="hidden" value="${tmp.itemNum }" name="itemNum"/>
               		<input type="hidden" value="${tmp.itemPrice }" name="itemPrice">
              		 <fmt:formatNumber value="${tmp.itemPrice}" 
                      pattern="###,###,###"/>원
               </td>
               <td>        
                	<button type="button" id="shop_btn" class="btn">장바구니</button>      		   	   	
		   	   		<input type="button" class="btn" onclick="deleteWish(${tmp.wishNum})" value="삭제" />
               </td>     	
           </tr>
         </c:forEach>
         </tbody>
      </table>
      <br />
      <br />
      <div class="button" style="float: right">
     		<div class="shopbtn">
				<div class="eff"></div>
				<a href="../index.do">쇼핑계속</a>
			</div>
		</div>
      </form>
        </div>
      </c:otherwise>
   </c:choose>
   <script>
	var formObj = $("form[role='form']");
	console.log(formObj);
	$("#shop_btn").click(function() {
		var con = confirm("장바구니에 추가하시겠습니까?");
		if(con){
			formObj.attr("action","insertCart.do");
			formObj.attr("method", "post");
			formObj.submit();							
		}
		
	});
    function deleteWish(wishNum){
 	   var isDelete=confirm("위시리스트에서 삭제하시겠습니까?")
 	   if(isDelete){
 		   location.href="deleteWish.do?wishNum="+wishNum;
 	   }
     }
    </script>  
   <footer id="footer">
      <div id="footer_box">
         <%@ include file="../include/footer.jsp" %>
      </div>      
   </footer>
</body>
</html> 