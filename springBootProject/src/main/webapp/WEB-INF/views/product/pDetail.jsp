<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f8f8f8;
    font-family: 'Arial', sans-serif;
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #ddd;
}

.product-page {
    display: flex;
    margin-top: 20px;
}

.product-gallery {
    flex: 1;
    padding-right: 20px;
}

.main-image {
    width: 100%;
    height: 400px;
    background-color: #ddd;
    margin-bottom: 10px;
}

.image-thumbnails {
    display: flex;
    justify-content: space-between;
}

.thumbnail {
    width: 22%;
    height: 80px;
    background-color: #ccc;
}

.product-details {
    flex: 1;
    padding: 50px;
}

.product-title {
    font-size: 24px;
    margin-bottom: 10px;
}

.product-price {
    font-size: 33px;
    color: #e74c3c;
    display: flex;
    justify-content: flex-end;
    padding-top: 200px;
}

.product-description {
    font-size: 14px;
    color: #777;
    margin-bottom: 20px;
}

.purchase-options {
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    padding-top: 50px;
}

.quantity-input {
    width: 50px;
    padding: 5
}
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}


#wrapper{
  width:600px;
  margin:50px auto;
  height:400px;
  position:relative;
  color:#fff;
  text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;  
}

#slider-wrap{
  width:600px;
  height:400px;
  position:relative;
  overflow:hidden;
}

#slider-wrap ul#slider{
  width:100%;
  height:100%;
  
  position:absolute;
  top:0;
  left:0;   
}

#slider-wrap ul#slider li{
  float:left;
  position:relative;
  width:600px;
  height:400px; 
}

#slider-wrap ul#slider li > div{
  position:absolute;
  top:20px;
  left:35px;  
}

#slider-wrap ul#slider li > div h3{
  font-size:36px;
  text-transform:uppercase; 
}

#slider-wrap ul#slider li > div span{
  font-family: Neucha, Arial, sans serif;
  font-size:21px;
}

#slider-wrap ul#slider li img{
  display:block;
  width:100%;
  height: 100%;
}


/*btns*/
.btns{
  position:absolute;
  width:50px;
  height:60px;
  top:50%;
  margin-top:-25px;
  line-height:57px;
  text-align:center;
  cursor:pointer; 
  background:rgba(0,0,0,0.1);
  z-index:100;
  
  
  -webkit-user-select: none;  
  -moz-user-select: none; 
  -khtml-user-select: none; 
  -ms-user-select: none;
  
  -webkit-transition: all 0.1s ease;
  -moz-transition: all 0.1s ease;
  -o-transition: all 0.1s ease;
  -ms-transition: all 0.1s ease;
  transition: all 0.1s ease;
}

.btns:hover{
  background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
  top: 30px; 
  right:35px; 
  width:auto;
  position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
  min-width:20px;
  margin-top:350px;
  margin-left: auto; 
  margin-right: auto;
  height:15px;
  position:relative;
  text-align:center;
}

#pagination-wrap ul {
  width:100%;
}

#pagination-wrap ul li{
  margin: 0 4px;
  display: inline-block;
  width:5px;
  height:5px;
  border-radius:50%;
  background:#fff;
  opacity:0.5;
  position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
  opacity:1;
  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
  -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
  transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}



.review-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    position: relative;
    
}

.rating-summary {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #e0e0e0;
}

.product-rating .rating-score {
    font-size: 32px;
    font-weight: bold;
    color: #ffcc00;
}

.review-count {
    font-size: 18px;
    color: #888888;
}

.rating-distribution {
    flex-grow: 1;
    margin-left: 20px;
}

.distribution-bar {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
}

.bar-label {
    width: 30px;
    font-size: 14px;
    color: #555555;
}

.bar {
    flex-grow: 1;
    height: 8px;
    background-color: #e0e0e0;
    border-radius: 4px;
    margin-left: 8px;
}

.fill {
    height: 100%;
    background-color: #ffcc00;
    border-radius: 4px;
}

.write-review-button {
    padding: 10px 20px;
    background-color: #333333;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

.write-review-button:hover {
    background-color: #555555;
}

.review-list {
    margin-top: 20px;
}

.review-item {
    display: flex;
    flex-direction: column;
    padding: 15px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    margin-bottom: 15px;
}

.review-stars {
    font-size: 20px;
    color: #ffcc00;
    margin-bottom: 8px;
}

.review-text {
    font-size: 16px;
    color: #333333;
}

.review-prompt {
    width: 300px; /* 필요한 크기에 따라 조정 가능 */
    padding: 20px;
    background-color: #f9f9f9;
    border: 2px dashed #ff9900; /* 점선 테두리 */
    border-radius: 12px; /* 둥근 테두리 */
    text-align: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto; /* 센터 정렬을 위한 마진 */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.stars {
    font-size: 24px;
    color: #333333;
    margin-bottom: 10px;
}

.review-text {
    font-size: 14px;
    color: #333333;
    margin-bottom: 20px;
}

.review-text strong {
    color: #000000;
    font-weight: bold;
}

.review-button {
    padding: 10px 20px;
    background-color: #333333;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
}

.review-button:hover {
    background-color: #555555;
}
.modal-content{
	margin-top: 250px;
  height: 400px;
}
#myform{
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}

#myform fieldset{
	display: inline-block;
	direction: rtl;
	border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
}
</style>
</head>
<body>

  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <div class="container">
        <div class="product-page">
            <div class="product-gallery">
                <div class="main-image">
                	<div id="wrapper">
								      <div id="slider-wrap">
								          <ul id="slider">
								             <li>               
																<img src="${contextPath}${list.productThumbnailPath}">
								             </li>
								             
								             <li>
																	<img src="${contextPath}${list.productThumbnailPath}">
														 </li>
																	             
								             <li>
								             			<img src="${contextPath}${list.productThumbnailPath}">
								             </li>
																	             
								            <li>
								               <img src="${contextPath}${list.productThumbnailPath}">
														</li>
																	             
								             <li>
								                <img src="${contextPath}${list.productThumbnailPath}">
								             </li>       
													</ul>
																	          
									           <!--controls-->
									          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
									          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
									          <div id="counter"></div>
									          
									          <div id="pagination-wrap">
									            <ul>
									            </ul>
									          </div>
									          <!--controls-->  
																	                 
													</div>
											  
											   </div>
		                </div>
		            </div>
		
		            <div class="product-details">
		                <h1 class="product-title">${ list.proName }</h1>
		                <p class="product-price"><b id="pPrice">${ list.productPrice }</b><b> 원</b></p>
		                <div class="purchase-options">
		                		<div style="display: flex;">
			                    <input type="text" name="amount" id="amount" value="1" size="3" max="" min="1">
			                   	
				                   	<input type="button" value="  -  " id="minus"> 
				                   	<input type="button" value="  +  " id="add">
			                   	
		                   	</div>
		                    <button class="add-to-cart">장바구니</button>
		                    <button class="buy-now">구매하기</button>
		                </div>
		            </div>
		        </div>
		        <div class="reviews">
		            <div class="review">
		            	<div class="review-container">
									    <div class="rating-summary">
									        <div class="product-rating">
									            <span class="rating-score">4.2</span> /5
									        </div>
									        <div class="rating-distribution">
									            <div class="distribution-bar">
									                <span class="bar-label">5점</span>
									                <div class="bar"><div class="fill" style="width: 55%;"></div></div>
									            </div>
									            <div class="distribution-bar">
									                <span class="bar-label">4점</span>
									                <div class="bar"><div class="fill" style="width: 35%;"></div></div>
									            </div>
									            <div class="distribution-bar">
									                <span class="bar-label">3점</span>
									                <div class="bar"><div class="fill" style="width: 25%;"></div></div>
									            </div>
									            <div class="distribution-bar">
									                <span class="bar-label">2점</span>
									                <div class="bar"><div class="fill" style="width: 15%;"></div></div>
									            </div>
									            <div class="distribution-bar">
									                <span class="bar-label">1점</span>
									                <div class="bar"><div class="fill" style="width: 5%;"></div></div>
									            </div>
									            <!-- 다른 점수들에 대해서도 반복 -->
									        </div>
									    </div>
									    <div class="review-list">
									        <div class="review-item">
									            <div class="review-stars">★★★★★</div>
									            <div class="review-text">너무 만족스러워요! 지인한테 엄청 추천했어요!</div>
									        </div>
									        <div class="review-item">
									            <div class="review-stars">★★★★★</div>
									            <div class="review-text">5점 만점에 10점! 부모님이 너무 좋아하세요.</div>
									        </div>
									        <div class="review-item">
									            <div class="review-stars">★★★★☆</div>
									            <div class="review-text">왜 진작 사지 않았을까요..? 고민은 구매만 늦출 뿐!!</div>
									        </div>
									    </div>
									    <div class="review-count">
									            <span>총 리뷰</span> 17
									    </div>
									    <div style="display: flex;
															    justify-content: flex-end;
															    align-items: center;
															    flex-direction: row;">
									    	<button class="write-review-button" data-toggle="modal" data-target="#myModal">리뷰 작성하기</button>
									    </div>
										    <div class="review-prompt">
												    <div class="stars">★★★★★</div>
												    <p class="review-text">리뷰 작성시 <strong>최대 1,500</strong>를 드립니다.<br>첫번째 리뷰를 작성해보세요.</p>
												    <button class="review-button" data-toggle="modal" data-target="#myModal">리뷰작성하기</button>
												</div>
									</div>
		            </div>
		            
		            <!-- 리뷰 모달 화면 div -->
		            		<!-- Button to Open the Modal -->
										
										<!-- The Modal -->
										<div class="modal" id="myModal">
										  <div class="modal-dialog">
										    <div class="modal-content">
									
										      <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">리뷰 작성하기</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
									
										      <!-- Modal body -->
										      <div class="modal-body">
										        <form class="mb-3" name="myform" id="myform" method="post">
															<fieldset>
																<input type="radio" name="reviewStar" value="5" id="rate1"><label
																	for="rate1">★</label>
																<input type="radio" name="reviewStar" value="4" id="rate2"><label
																	for="rate2">★</label>
																<input type="radio" name="reviewStar" value="3" id="rate3"><label
																	for="rate3">★</label>
																<input type="radio" name="reviewStar" value="2" id="rate4"><label
																	for="rate4">★</label>
																<input type="radio" name="reviewStar" value="1" id="rate5"><label
																	for="rate5">★</label>
															</fieldset>
														</form>
														
														<div>
															<textarea rows="5" cols="61" resize="none" id="reviewContent">
															
															</textarea>
														</div>
										      </div>
									
										      <!-- Modal footer -->
										      <div class="modal-footer" style="display: flex; justify-content: center;">
										        <button type="button" class="btn btn-danger" data-dismiss="modal" id="signUp">등록</button>
										      </div>
									
										    </div>
										  </div>
										</div>
		            <!-- 리뷰 모달 화면 div -->
		            
		            
		        </div>
		        
		        <div class="product-description-full">
		            <h2>상품 설명</h2>
		        </div>
		
		        <div class="related-products">
		            <h2>관련 상품</h2>
		            <div class="related-product">관련 상품 1</div>
		            <div class="related-product">관련 상품 2</div>
		            <div class="related-product">관련 상품 3</div>
		        </div>
		    </div>
		    
		    
<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
  
  
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
  
    //next slide  
  $('#next').click(function(){
    slideRight();
  });
  
  //previous slide
  $('#previous').click(function(){
    slideLeft();
  });
  
  
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
  );
  
  

});//DOCUMENT READY
  


/***********
 SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
  
  //*> optional
  countSlides();
  pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}



  
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}

//가격콤마
$(document).ready(function() {
  	 	var text = $(".product-price").find("#pPrice").text().trim();
      var price = parseFloat(text.replace(/,/g, ''));
      if (!isNaN(price)) {
    	  $(".product-price").find("#pPrice").text(price.toLocaleString('ko-KR'));
      }
});

//리뷰 작성 여부
$(document).ready(function(){
    var orderCheck = "${ list.orderCheck }";
    var reviewCheck = "${ list.reviewCheck }";

    if (orderCheck <= 1 && reviewCheck == 0) {
        $(".review-prompt").css({
            "z-index": "1",
            "display": "block" // 보이도록 설정
        });
        $(".write-review-button").css("display", "none");
    } else if (orderCheck <= 1 && reviewCheck <= 1) {
        $(".review-prompt").css({
            "z-index": "-1",
            "display": "none" // 숨기도록 설정
        });
        $(".write-review-button").css("display", "block");
    }
    
});




//등록버튼 confirm
$("#signUp").on("click",function(){
	 if(confirm("정말로 등록하시겠습니까?")){
		  $.ajax({
			  url:"${contextPath}/product/writeReview.do",
			  data:{
				 rating:$("input[type='radio'][name='reviewStar']:checked").val(),
				 reviewContent:$("#reviewContent").val(),
				 memberNo:"${no}"
			  },
			  success:function(response){
				  
			  },
			  error:function(){
				  console.log("ajax통신실패");
			  }
			  
			  
			  
		  })
		 
	 }
})



$("#add").on("click", function(){
	$("#amount").val(parseFloat($("#amount").val()) + 1);
	const price = "${list.productPrice}"
  const quantity = parseFloat($("#amount").val().trim());
	
  const totalPrice = quantity * parseFloat(price.trim());
  $('#pPrice').text(totalPrice.toLocaleString('ko-KR'));
  
  
})

$("#minus").on("click", function(){
	if($("#amount").val() > 1){
		$("#amount").val(parseFloat($("#amount").val()) -1);
		const price = "${list.productPrice}"
	  const quantity = parseFloat($("#amount").val().trim());
		
	  const totalPrice = quantity * parseFloat(price.trim());
	  $('#pPrice').text(totalPrice.toLocaleString('ko-KR'));
}

  
  
})
// 해야될것 (토요일)=========================================
// 로그인이 되지 않은 상태에서 리뷰작성하기 버튼 클릭하면 => 로그인화면으로 이동
// 구글 api 로그인 연동하기 크로스도메인 이슈
// 일반 회원가입 스프링 시큐리티
// 상품 리뷰 작성하기 완료하기
// 도란도란 게시판 => 인스타그램같은 커뮤니티 대댓글기능 + 사진올리기 + 좋아요기능 + 페이징처리 (되는데까지 해보기)
//=======================================================



</script>

</body>
</html>