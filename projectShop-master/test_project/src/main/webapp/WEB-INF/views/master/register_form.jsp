<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/style/total.jsp"></jsp:include>
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
					<div class="reg">
					<form action="register.do" method="post" autocomplete="off" enctype="multipart/form-data">
						<h2 class="title">상품 등록</h2>
						 <label>1차 분류</label>
						 <select class="category1" id="cate1" style="height: 25px;">
						  <option value="">전체</option>
						 </select>
						 
						 <label>2차 분류</label>
						 <select class="category2" name="cateCode" style="height: 25px;">
						  <option value="">전체</option>
						 </select>
						 
						<div class="inputArea">
							<label for="itmeName" id="itemname">상품명</label>
							<input type="text" id="itemName" name="itemName" style="height: 25px;">
						</div>
						<div class="inputArea">
							<label for="itmePrice">상품가격</label>
							<input type="text" name="itemPrice" id="itemPrice" style="height: 25px;">
						</div>
						<div class="inputArea">
							<label for="itemCount">상품수량</label>
							<input type="text" name="itemCount" id="itemCount" style="height: 25px;">
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
						<div class="inputArea">
							<label for="itemDes">상품설명</label>
							<textarea name="itemDes" id="itemDes"></textarea>
						</div>
							<script type="text/javascript">
							$(function(){
								CKEDITOR.replace('itemDes',{
									filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
								});
							});
							</script>
		
						<div class="inputArea">
							<label for="itemImg">이미지</label>
							<input type="file" id="itemImg" name="file"/>
							<div class="select_img">
								<img src="../resources"${dto.itemImg}/>
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
						<%=request.getRealPath("/") %>
						<div id="inputArea">
						<div class="sbtn">
							<button type="submit" class="btn" id="register_Btn">등록</button>
							<button type="reset" class="btn">초기화</button>
							<button type="button" class="btn" id="back-btn">뒤로가기</button>
						</div>
							<script type="text/javascript">
								$("#back-btn").click(function() {
									location.href="itemList.do";
								})
							</script>
						</div>
						</form>
						</div>
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

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].cateLevel == "1") {
	  cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
	  cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
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
	
	</script>
	<script>
	$("#register_Btn").on("click",function(){
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
</body>
</html>