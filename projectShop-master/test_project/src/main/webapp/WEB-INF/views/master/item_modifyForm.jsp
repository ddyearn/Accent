<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<form action="item_modify.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="itemNum" value="${dto.itemNum} "/>
							<h2>상품 수정</h2>
							 <label>1차 분류</label>
							 <select class="category1" id="cate1">
							  <option value="">전체</option>
							 </select>
							 
							 <label>2차 분류</label>
							 <select class="category2" name="cateCode">
							  <option value="">전체</option>
							 </select>
						<div id="inputArea">
							<label for="itmeName">상품명</label>
							<input type="text" id="itemName" name="itemName" value="${dto.itemName }"/>
						</div>
						<div id="inputArea">
							<label for="itmePrice">상품가격</label>
							<input type="text" name="itemPrice" value="${dto.itemPrice }" id="itemPrice"/>
						</div>
						<div id="inputArea">
							<label for="itemCount">상품수량</label>
							<input type="text" name="itemCount" value="${dto.itemCount }" id="itemCount"/>
						</div>
						<script>
							var regExp = /[^0-9]/gi;
							
							$("#itemPrice").keyup(function(){ numCheck($(this)); });
							$("#itemCount").keyup(function(){ numCheck($(this)); });
							
							function numCheck(selector) {
							 var tempVal = selector.val();
							 selector.val(tempVal.replace(regExp, ""));
							}
						</script>
						<div id="inputArea">
							<label for="itemDes">상품설명</label>
							<textarea rows="10" cols="50" name="itemDes" id="itemDes">${dto.itemDes }</textarea>
							<script type="text/javascript">
								$(function(){
									CKEDITOR.replace('itemDes',{
										filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
									});
								});
							</script>
						</div>
						
						<div class="inputArea">
							<label for="itemImg">이미지</label>
							<input type="file" id="itemImg" name="file"/>
							<div class="select_img">
								<img src="${dto.itemImg}"/>
								<input type="hidden" name = "itemImg" id="itemImg" value="${dto.itemImg}"/>
								<input type="hidden" name = "itemThumbImg" id="itemThumbImg" value="${dto.itemImg}"/>
							</div>
							<script>
								$("#itemImg").change(function() {
									if(this.files && this.files[0]){
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src", data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								})
							</script>
						</div>
						
						<div id="inputArea">
							<button type="submit" id="update_btn" class="btn">수정</button>
							<button type="button" id="back_btn" class="btn">취소</button>
							<script>
								/*취소 버튼을 눌렀을 때 뒤로가기*/
								$("#back_btn").click(function(){
									location.href="itemView_form.do?itemNum=" + ${dto.itemNum};
								})
								/*수정 버튼을 눌렀을 때 */
								$("#update_btn").on("click",function(){
									var cateSelect=document.getElementById("cate1");
								 	var cate1=cateSelect.options[document.getElementById("cate1").selectedIndex].value;
								 	if(cate1==""){
								 		alert("1차 상품분류를 선택해주세요 :)",function(){
							                  $("#cate1").focus();
							            },"warning");
							            return false;
								 	}
								 	
								 	//제출전 상품명,가격,수량 변수에 저장
								 	var itemName=$("#itemName").val();
								 	var itemPrice=$("#itemPrice").val();
								 	var itemCount=$("#itemCount").val();
								 	if(itemName==""){
								 		alert("상품명을 입력해주세요 :)",function(){
							                $("#itemName").focus();
							          },"warning");
							          return false;
								 	}
								 	if(itemPrice==""){
								 		alert("가격을 입력해주세요 :)",function(){
							                $("#itemPrice").focus();
							          },"warning");
							          return false;
								 	}
								 	if(itemCount==""){
								 		alert("상품재고 수량을 입력해주세요 :)",function(){
							                $("#itemCount").focus();
							          },"warning");
							          return false;
								 	}
								 	//제출 전 에디터 내용을 변수에 저장
									var content=CKEDITOR.instances.itemDes.getData();
									//제출 전 에디터 내용 길이를 변수에 저장
									var content_len=CKEDITOR.instances.itemDes.getData().length;
									//내용이 없는 경우
									if(content==""){
										alert("상품설명을 입력해주세요 :)",function(){
											//에디터 내용에 포커스 on
											CKEDITOR.instances.itemDes.focus();
											
										},"warning");
										return false;
									}
									
								});
							</script>
							
						</div>
					</form>
				</div>
		</section>
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	
	<script>
	var jsonData = JSON.parse('${list}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].cateLevel == "1") {
	  cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
	  cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}

	var cate1Select = $("select.category1")

	for(var i = 0; i < cate1Arr.length; i++) {
	 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	      + cate1Arr[i].cateName + "</option>"); 
	}
	
	$(document).on("change", "select.category1", function(){

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  
		  if(jsonData[i].cateLevel == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cateCode = jsonData[i].cateCode;
		   cate2Obj.cateName = jsonData[i].cateName;
		   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
		   
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		 var cate2Select = $("select.category2");
		 
		 cate2Select.children().remove();

		 $("option:selected", this).each(function(){
		  
		  var selectVal = $(this).val();
		  cate2Select.append("<option value='"+ selectVal + "'>전체</option>");
		  
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectVal == cate2Arr[i].cateCodeRef) {
		    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
		         + cate2Arr[i].cateName + "</option>");
		   }
		  }
		  
		 });
		 
		});
	
	var select_cateCode = '${dto.cateCode}';
	var select_cateCodeRef = '${dto.cateCodeRef}';
	var select_cateName = '${dto.cateName}';

	if(select_cateCodeRef != null && select_cateCodeRef != '') {
	 $(".category1").val(select_cateCodeRef);
	 $(".category2").val(select_cateCode);
	 $(".category2").children().remove();
	 $(".category2").append("<option value='"
	       + select_cateCode + "'>" + select_cateName + "</option>");
	} else {
	 $(".category1").val(select_cateCode);	
	 $(".category2").append("<option value=" + select_cateCode + " selected='selected'>전체</option>");
	}
	</script>
</body>
</html>