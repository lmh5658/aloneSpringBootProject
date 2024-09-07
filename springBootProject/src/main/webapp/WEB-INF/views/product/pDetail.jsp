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
    font-size: 30px;
}

.product-price {
    font-size: 33px;
    color: #e74c3c;
    display: flex;
    justify-content: flex-end;
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
    font-size: 20px;
}

.rating-summary {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #e0e0e0;
}

.product-rating .rating-score {
    font-size: 15px;
    font-weight: bold;
    color: #ffcc00;
}

.review-count {
    font-size: 18px;
    color: #888888;
}
.review{
margin-top: 123px;
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
    height: 620px;
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
    border: 2px dashed #007bff59; /* 점선 테두리 */
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
#myform, #myforms{
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}
#myforms fieldset{
	display: inline-block;
	direction: rtl;
	border:0;
}
#myforms fieldset legend{
    text-align: right;
}
#myforms input[type=radio]{
    display: none;
}
#myforms label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myforms label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
}
#myforms label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
}
#myforms input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    cursor: pointer;
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
.page{
	border: none;
  background: #f9f9f9;
  margin:10px;
}
.bt{
margin: 10px;
}


/* 관련 상품 스타일 */
.related-products {
    margin: 20px;
    margin-top: 100px;
    margin-bottom: 100px;
}


.product-grid {
    display: flex;
    gap: 17px;
    flex-wrap: wrap;
}

.product-card {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    width: 184px;
    text-align: center;
}

.product-card img {
    width: 100%;
    border-radius: 5px;
    height: 180px;
}

.product-name {
    font-size: 18px;
    margin: 10px 0;
    height: 50px;
}

.product-price {
    font-size: 16px;
    color: #e60012;
}

.view-button {
    background-color: #e60012;
    color: white;
    border: none;
    padding: 8px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 5px;
}

.view-button:hover {
    background-color: #c6000d;
}



.product-rating {
  	color: #333;
    text-align: end;
    font-size: 27px;
}

.no-reviews {
  color: #888; /* 회색으로 부드럽게 표시 */
  display: flex;
    align-items: center;
    justify-content: center;
    height: 312px;
}


.slider-container {
    position: relative;
    width: 100%;
    overflow: hidden;
}




.arrow-left {
    left: 10px;
    border: 2px solid white;
    background: none;
}

.arrow-right {
    right: 10px;
    border: 2px solid white;
    background: none;
}

.reviews h2{
    margin-bottom: 34px;
    color: #343a40;
}
.add-to-cart{
	border: 3px #dd68e333 solid;
  border-radius: 6px;
  background: #dd68e333;
  padding: 5px;
  font-size: 20px;
  margin-right: 21px;

}

.buy-now{
border: 3px #000000 solid;
    border-radius: 6px;
    background: #000000;
    padding: 5px;
    font-size: 20px;
    width: 300px;
    color: white;
}

#minus, #add{
    border: 1px solid #ced4da;
    background: #ffffff;
    width: 33px;
    font-size: 21px;
}

#amount{
text-align: center;
    border: 1px solid #ced4da;
    width: 32px;
    font-size: 22px;
}
.product-details>.product-price{
	font-size:30px;
	color: #004085;
	font-weight: bold;
}

#signUp{
		border: 3px #dd68e333 solid;
    border-radius: 6px;
    background: #dd68e333;
    padding: 5px;
    font-size: 20px;
    color: black;
    width: 83px;
}

#reviewContent{
	resize: none;
	width: 466px;
	border: 3px #f8e1f9 dashed;
}

#firstReviewContent{
	resize: none;
	width: 466px;
	border: 3px #f8e1f9 dashed;
}

.arrow>svg{
		background: #f9f9f9;
    border-radius: 22px;
    color: black;
}

.no-to-cart{
    border: 3px #dd68e333 solid;
    border-radius: 6px;
    background: #dd68e333;
    padding: 5px;
    font-size: 20px;
    margin-right: 21px;
}





.related-product-detail {
    height: 550px; /* 기본 높이 설정 */
    overflow: hidden; /* 넘치는 부분 숨김 */
    position: relative;
    /*transition: height 0.5s ease;  부드러운 전환 효과 */
    margin-top: 100px;
}

.related-product-detail.expanded {
    height: auto; /* 높이를 자동으로 조정 */
}

.related-product-detail img {
    width: 100%; /* 이미지 가로 폭을 100%로 설정 */
    display: block; /* 이미지 아래 공백 제거 */
}

.show-more-btn {
position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #d9d9d9;
    color: #000000;
    padding: 5px 10px;
    cursor: pointer;
    border: 2px solid black;
    border-radius: 5px;
    font-size: 0.9em;
    z-index: 1;
    width: 135px;
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
		                <c:choose>
		                <c:when test="${ list.productSaleStatus == 'Y' }">
			                <p class="product-price" style="margin-top: 211px;"><b id="pPrice">${ list.productPrice - list.productSalePrice }</b><b> 원</b> &nbsp;&nbsp; <b style="color: red;text-decoration: line-through;">${ list.productPrice }원</b></b></p>		                
		                </c:when>
		                <c:otherwise>
			                <p class="product-price" style="margin-top: 211px;"><b id="pPrice">${ list.productPrice }</b><b> 원</b></p>
		                </c:otherwise>
		                </c:choose>
		                <div class="purchase-options">
		                		<div style="display: flex;margin-right: 20px;">
		                			<input type="button" value="  -  " id="minus"> 
			                    <input type="text" name="amount" id="amount" value="1" size="3" max="" min="1">
				                	<input type="button" value="  +  " id="add">
			                   	
		                   	</div>
		                   	<c:choose>
		                    <c:when test="${ list.proAmount == 0 }">
		                    <button style="cursor: not-allowed;" class="no-to-cart" disabled>
			                    <svg xmlns="http://www.w3.org/2000/svg" style="color: #000000;" width="25" height="25" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
													  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
													</svg>                   
		                    
		                    </c:when>
		                     <c:otherwise>
		                     <button class="add-to-cart">
		                   		 <svg xmlns="http://www.w3.org/2000/svg" style="color: #000000;"  width="25" height="25" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
													  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
														</svg>
													</button>                    
		                    </c:otherwise>
		                    </c:choose>
		                    <c:choose>
		                    <c:when test="${ list.proAmount == 0 }">
		                    	 <button class="buy-now" style="cursor: not-allowed;" disabled>Sold Out</button>		
		                    </c:when>
		                    <c:otherwise>
		                   		 <button class="buy-now">구매하기</button>		                    
		                    </c:otherwise>
		                    </c:choose>
		                    
		                </div>
		            </div>
		        </div>
		        
		        <script>
		        	$(".buy-now").on("click", function(){
		        		let price = "${list.productPrice - list.productSalePrice}";
		        		let amount = $("#amount").val();
		        		let totalPrice = (parseFloat(price) * parseFloat(amount)).toLocaleString('ko-KR');
		        		let productdNo = "${list.productNo}"
		        		if(confirm("상품을 결제하시겠습니까? \n확인버튼 클릭시 결제화면으로 이동합니다.")){
			        		if("${loginUser}" != ""){
				        		location.href="${contextPath}/pay/directPay.page?totalPrice=" + totalPrice + "&productNo=" + productdNo + "&amount=" + amount;		        			
			        		}else{
			        			location.href="${contextPath}/member/loginPage.page";
			        		}		        			
		        		}
		        	})
		        </script>

		        
		        <div class="reviews">
		            <div class="review">
		            	<h2>리뷰</h2>
				           <div class="review-container">
				            		<div id="reviewYes" style="display:none;">
				            			<!-- 별점 영역 -->
											    <div class="rating-summary">
											    
											    </div>
											    <div class="product-rating">
															<span id="rating-score" data-rating="${reviewList[0].avgRatingTotal}"></span> / 5.0점
													</div>
											     <!-- 리뷰 리스트 영역 -->
											    <div class="review-list">
											    
											    </div>
											    <div class="review-count" style="margin-top: 40px;">
											        <span>총 리뷰 </span><b></b>건
											    </div>
											    <div>
													<!-- 페이징 영역 -->
											    <div style="display: flex;justify-content: center;margin-top: 100px;margin: 5px;">
										        	<ul class="pagination">
										        	
															</ul>
										      </div>
											   </div>
											 </div>
		            			<p class="not_review" id="reviewNo" style="text-align: center; height: 264px; display: none;">
											 <span class="no-reviews">아직 작성된 리뷰가 없습니다.</span>
											</p>
								    <div style="display: flex; justify-content: flex-end; align-items: center; flex-direction: row;">
								    	<button class="write-review-button" data-toggle="modal" data-target="#myModal">리뷰 작성하기</button>
								    </div>
								    <div class="review-prompt">
										    <div class="stars" style="display: flex; justify-content: space-between;"><div style="margin-left: 86px;">★★★★★</div><div style="cursor: pointer;" onclick="closed();">x</div></div>
										    <p class="review-text">리뷰 작성시 <strong>최대 500 포인트</strong>을 드립니다.<br>첫번째 리뷰를 작성해보세요.</p>
										    <button class="review-button" data-toggle="modal" data-target="#firstMyModal">리뷰작성하기</button>
										</div>
							</div>
	         </div>   
		            <!-- 리뷰 모달 화면 S -->
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
															<textarea rows="5" cols="61" resize="none" id="reviewContent" style="resize: none; width: 466px;" placeholder="리뷰를 작성해주세요.">
															
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
		            <!-- 리뷰 모달 화면 E-->
		            
		            <!-- 리뷰 모달 화면 S -->
										<!-- The Modal -->
										<div class="modal" id="firstMyModal">
										  <div class="modal-dialog">
										    <div class="modal-content">
									
										      <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">리뷰 작성하기</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
									
										      <!-- Modal body -->
										      <div class="modal-body">
										        <form class="mb-3" name="myforms" id="myforms" method="post">
															<fieldset>
																<input type="radio" name="reviewStar" value="5" id="rat1"><label
																	for="rat1">★</label>
																<input type="radio" name="reviewStar" value="4" id="rat2"><label
																	for="rat2">★</label>
																<input type="radio" name="reviewStar" value="3" id="rat3"><label
																	for="rat3">★</label>
																<input type="radio" name="reviewStar" value="2" id="rat4"><label
																	for="rat4">★</label>
																<input type="radio" name="reviewStar" value="1" id="rat5"><label
																	for="rat5">★</label>
															</fieldset>
														</form>
														
														<div>
															<textarea rows="5" cols="61" resize="none" id="firstReviewContent" style="resize: none; width: 466px;" placeholder="리뷰를 작성해주세요.">
															
															</textarea>
														</div>
										      </div>
									
										      <!-- Modal footer -->
										      <div class="modal-footer" style="display: flex; justify-content: center;">
										        <button type="button" class="btn btn-danger" data-dismiss="modal" id="firstReview">등록</button>
										      </div>
									
										    </div>
										  </div>
										</div>
		            <!-- 리뷰 모달 화면 E-->
		            
		            <div class="related-product-detail" style=" height: 550px; ">
							    <h2>상품 상세</h2>
							    <img id="productImage" alt="" src="${list.productDatailPath}">
							    <button class="show-more-btn">자세히보기</button>
							</div>
							  <div class="related-products">
							      <h2>관련 추천 TOP 상품</h2>
							      <div class="product-grid">
							          
							          
							      </div>
							  </div>
            
        </div>
      
        
    </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  
		  	
<script>
$(document).ready(function() {
    $('.show-more-btn').on('click', function() {
        var $parentDiv = $(this).closest('.related-product-detail');
        var $img = $parentDiv.find('#productImage');

        if ($parentDiv.hasClass('expanded')) {
            $parentDiv.removeClass('expanded').css('height', '550px');
            $(this).text('자세히보기');
        } else {
            //var imgHeight = $img[0].naturalHeight;
            $parentDiv.addClass('expanded').css('height', '1178px');
            $(this).text('접기');
        }
    });
});


//장바구니 스크립트
$(document).on("click", ".add-to-cart", function(){
	
	let count = $("#amount").val();
	let productNo = "${list.productNo}";
	
	if("${ loginUser }" != ""){
		
		if(confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")){
				
				$.ajax({
					url:"${contextPath}/product/insertCart.do",
					type:"GET",
					data:{
						productNo: productNo,
						count: count
					},
					success:function(response){
						
							location.href="${contextPath}/product/cart.page"
						
					},
					error:function(){
						console.log("ajax통신 실패");
					}
				})
				
				
		}else{
			
			$.ajax({
				url:"${contextPath}/product/insertCart.do",
				type:"GET",
				data:{
					productNo: productNo,
					count: count
				},
				success:function(response){
					
						console.log(response);					
					
				},
				error:function(){
					console.log("ajax통신 실패");
				}
				
			})
		}

	}else{
		
		
	}
	
})

function closed(){
	 $(".review-prompt").css({
		    "z-index": "-1",
     "display": "none" // 보이도록 설정
 });
	 $(".write-review-button").css("display", "none");
}

</script>
		    
<script>

var loginCheck = "${ loginUser }"

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
	
    var reviewCheck = "${ list.reviewCheck }";
    var orderCheck = "${ list.orderCheck }";
		let login = "${ loginUser }";
		
		if(login == ""){
			 $(".review-prompt").css({
				    "z-index": "-1",
		        "display": "none" // 보이도록 설정
		    });
			 $(".write-review-button").css("display", "none");
		}else{
			if (reviewCheck == 0 && orderCheck >= 1) {
				
	        $(".review-prompt").css({
	            "z-index": "1",
	            "display": "block" // 보이도록 설정
	        });
	        $(".write-review-button").css("display", "none");
	        
	    } else if(reviewCheck >= 1 && orderCheck >= 1){
	        $(".review-prompt").css({
	            "z-index": "-1",
	            "display": "none" // 숨기도록 설정
	    		});
	        $(".write-review-button").css("display", "block");
	    }else{
	    	 $(".review-prompt").css({
				    "z-index": "-1",
		        "display": "none" // 보이도록 설정
		    });
			 $(".write-review-button").css("display", "none");
	    }
			
		}
   
    
});



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

//리뷰버튼 클릭시 로그인체크 스크립트
 $(document).on("click", ".review-button", function() {
	 
    if (loginCheck == "") {
        $("#firstMyModal").modal('hide');
        $('#loginModal').modal('show');
    }
    
});


</script>

<script>
$(document).ready(function() {
    // 페이지 로드 시 리뷰를 가져오고 페이징을 렌더링
    loadPage(1);
    loadPageOtherProducts(1);
});


function loadPageOtherProducts(page) {
    $.ajax({
        url: "${contextPath}/product/ajaxOtherProductList.do",
        type: "get",
        data: {
            page: page,
            categoryType: "C",
            productNo: "${list.productNo}"
        },
        success: function(response) {
            let list = response.otherList;
            let pi = response.pi;
            let contextPath = '${contextPath}'; 

            let html = "";
            html += '    <button class="arrow arrow-left">';
            html += '        <svg id="arrowL" data-pi="' + pi.currentPage + '" xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">';
            html += '            <path d="M10 12.796V3.204L4.519 8zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506L9.34 2.451C9.989 1.885 11 2.345 11 3.204v9.592a1 1 0 0 1-1.659.753"/>';
            html += '        </svg>';
            html += '    </button>';

            list.forEach(function(item) {
                html += '        <div class="product-card">';
                html += '            <img style="cursor:pointer" src="' + contextPath + item.productThumbnailPath + '" onclick="location.href=\'' + contextPath + '/product/detail.page?page=1&productNo=' + item.productNo + '\'">';
                html += '            <p class="product-name" style="text-align: center;">' + item.proName + '</p>';
                html += '            <p class="product-price">' + item.productPrice.toLocaleString('ko-KR') + '원</p>';
                html += '            <p class="product-rating" style="font-size: 15px;">평균 리뷰 점수 ' + item.avgRating.toFixed(1) + '</p>';
                html += '        </div>';
            });

            html += '    <button class="arrow arrow-right">';
            html += '        <svg id="arrowR" data-pi="' + pi.currentPage + '" xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">';
            html += '            <path d="M6 12.796V3.204L11.481 8zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753"/>';
            html += '        </svg>';
            html += '    </button>';

            $(".product-grid").html(html);
        },
        error: function() {
            console.error("상품 목록을 불러오는 데 실패했습니다.");
        }
    });
}
//상품관련 페이징처리
$(document).on("click", "#arrowL", function() {
    let pi = $(this).data("pi");
    loadPageOtherProducts(pi == 1 ? 3 : pi - 1);
});

$(document).on("click", "#arrowR", function() {
    let pi = $(this).data("pi");
    loadPageOtherProducts(pi == 3 ? 1 : pi + 1);
});

//상품관련 setInterval 3초마다 적용
$(document).ready(function() {
	
    setInterval(function() {
        $("#arrowL").click();
    }, 3000);
	
});





//Sign Up 버튼 클릭 이벤트 처리
$("#signUp").on("click", function() {
    
    let reviewContent = $("#reviewContent").val().trim();
    let selectedStar = $("#myform input[type='radio']:checked").val();
    
    if (reviewContent === "" || selectedStar === undefined) {
        alert("내용을 빠짐없이 기입해주세요.");
        //$("#myModal").modal("show"); 
    } else {
        
        if (confirm("리뷰를 등록하시겠습니까?")) {
        	 submitReview();
        }
    }
});

// First Review 버튼 클릭 이벤트 처리
$("#firstReview").on("click", function() {
   
    let reviewContent = $("#firstReviewContent").val().trim();
    let selectedStar = $("#myforms input[type='radio']:checked").val();
    
    if (reviewContent === "" || selectedStar === undefined) {
        alert("내용을 빠짐없이 기입해주세요.");
        //$("#firstMyModal").modal("show"); 
    } else {
       
        if (confirm("리뷰를 등록하시겠습니까?")) {
            firstReview();
        }
    }
});



//페이지 데이터 로드 및 렌더링
function loadPage(page) {
  $.ajax({
      url: "${contextPath}/product/reviewList.do", // 리뷰 목록
      type: "get",
      data: {
          productNo: "${list.productNo}",
          page: page
      },
      success: function(response) {
      	if(response.list.length > 0){
      			$("#reviewYes").css("display", "block");
      			$(".review-container").css("height", "1078px");
      			renderReviews(response); 
      	}else{
      			$("#reviewNo").css("display", "block");
      			$(".review-container").css("height", "370px");
      	}
          console.log(response);
      },
      error: function() {
          console.log("AJAX 통신 실패");
      }
  });
  
}





// 리뷰와 페이징 버튼 렌더링
function renderReviews(response) {

		rating = '';
		rating += '<div class="rating-distribution">';
		rating += '    <div class="distribution-bar">';
		rating += '        <span class="bar-label">5점</span>';
		rating += '        <div class="bar"><div class="fill" id="bar-5"></div></div>';
		rating += '    </div>';
		rating += '    <div class="distribution-bar">';
		rating += '        <span class="bar-label">4점</span>';
		rating += '        <div class="bar"><div class="fill" id="bar-4"></div></div>';
		rating += '    </div>';
		rating += '    <div class="distribution-bar">';
		rating += '        <span class="bar-label">3점</span>';
		rating += '        <div class="bar"><div class="fill" id="bar-3"></div></div>';
		rating += '    </div>';
		rating += '    <div class="distribution-bar">';
		rating += '        <span class="bar-label">2점</span>';
		rating += '        <div class="bar"><div class="fill" id="bar-2"></div></div>';
		rating += '    </div>';
		rating += '    <div class="distribution-bar">';
		rating += '        <span class="bar-label">1점</span>';
		rating += '        <div class="bar"><div class="fill" id="bar-1"></div></div>';
		rating += '    </div>';
		rating += '</div>';
	
	
	
		$(".rating-summary").html(rating);
		ratingScore(response);
		
    let body = "";
    response.list.forEach(function(number) {
        body += "<div class='review-item'>";
        body += "<div style='display: flex;'>";
        body += "<div class='review-stars' style='width: 80%;'>" +
            (number.rating == 5 ? '★★★★★' :
            number.rating == 4 ? '★★★★☆' :
            number.rating === 3 ? '★★★☆☆' :
            number.rating === 2 ? '★★☆☆☆' : '★☆☆☆☆') + "</div>";
        body += "<div style='display: flex; justify-content: flex-end; width: 20%;margin-right: 20px;'>" + number.nickName + "</div>";
        body += "</div>";
        body += "<div style='display: flex;'>";
        body += "<div class='review-text' style='width: 80%;'>" + number.reviewContent + "</div>";
        body += "<div style='display: flex; justify-content: flex-end; width: 20%; align-items: center; margin-right: 20px;'>" + number.reviewPostDt + "</div>";
        
        if(number.memberNo == response.userNo){
        	 body += "<div style='display: flex; align-items: center;'>";
        	 body += "  <button id='deleteBtn' onclick='deleteFunction(\"" + number.reviewNo + "\")' style='display: flex; align-items: center; border: none; background: none; cursor: pointer;'>";
           body += "    <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16' style='color: #c55325;'>";
           body += "      <path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0'/>";
           body += "    </svg>";
           body += "  </button>";
           body += "</div>";
        }
        
        body += "</div>";
        body += "</div>";
        body += "</div>";
    });

    $(".review-list").html(body);
    console.log(response);
    $(".review-count b").html(response.list[0].totalReviewCount);
    renderPagination(response.pi);
}

function ratingScore(response){
	$(document).ready(function() {
	    // 평균 점수와 각 점수의 리뷰 수를 템플릿 엔진에서 JavaScript로 전달
	    var $ratingScoreElement = $('#rating-score');
	    var avgRatingTotal = parseFloat($ratingScoreElement.attr("data-rating"));

	    // 서버에서 전달된 값들을 받아와서 숫자로 변환
	    var ratingAvg5 = parseInt(response.list[0].avgRating5, 10);
	    var ratingAvg4 = parseInt(response.list[0].avgRating4, 10);
	    var ratingAvg3 = parseInt(response.list[0].avgRating3, 10);
	    var ratingAvg2 = parseInt(response.list[0].avgRating2, 10);
	    var ratingAvg1 = parseInt(response.list[0].avgRating1, 10);
	    var totalReviews = parseInt(response.list[0].avgRatingTotal, 10);
	    var totalReviewCount = parseInt(response.list[0].totalReviewCount, 10);

	    // 실제 데이터로 각 점수별 카운트 설정
	    var ratingsCount = {
	        5: ratingAvg5,
	        4: ratingAvg4,
	        3: ratingAvg3,
	        2: ratingAvg2,
	        1: ratingAvg1
	    };

	    console.log('Ratings Count:', ratingsCount);
	    
	    if (!isNaN(totalReviews) && totalReviews > 0) {
	        $.each(ratingsCount, function(rating, count) {
	            var percentage = (count / totalReviews) * 100;
	            percentage = Math.min(percentage, 100);

	            $('#bar-' + rating).css('width', percentage + '%');

	            console.log('Rating ' + rating + ': ' + percentage + '%');
	        });
	    }
	    
	    // 평균 점수를 표시
	    $ratingScoreElement.text(avgRatingTotal.toFixed(1));
	    
	    $(".review-count b").html(totalReviewCount);
	});
}

// 페이징 버튼 렌더링
function renderPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='loadPage(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currenPage == i ? "disabled active" : "")  + " onclick='loadPage(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='loadPage(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.pagination').html("");
       $('.pagination').append(html);
		}else{
			$('.pagination').html("");
		}
   
}

function firstReview() {
	let type = "first";
    $.ajax({
        url: "${contextPath}/product/writeReview.do",
        type: "post",
        data: {
            rating: $("input[type='radio'][name='reviewStar']:checked").val(),
            reviewContent: $("#firstReviewContent").val().trim(),
            productNo: "${list.productNo}",
            type:type
        },
        success: function(response) {
            if(response.list.length > 0) {
                alert("리뷰 등록이 완료되었습니다. \n 500포인트가 정상적으로 적립되었습니다.");
                $(".review-prompt").css({"z-index": "-1", "display": "none"});
                $("#firstReviewContent").val("");
                $("#myforms input[type='radio']").prop("checked", false);
              
                if(response.list.length == 1){
                	location.reload();
                }else{
	                renderReviews(response);                	
                }
                
            } else {
            	 location.reload();
            }
        },
        error: function() {
            console.log("AJAX 통신 실패");
        }
    });
}


function submitReview() {
    $.ajax({
        url: "${contextPath}/product/writeReview.do",
        type: "post",
        data: {
            rating: $("input[type='radio'][name='reviewStar']:checked").val(),
            reviewContent: $("#reviewContent").val().trim(),
            productNo: "${list.productNo}"
        },
        success: function(response) {
            if(response.list.length > 0) {
                alert("리뷰 등록이 완료되었습니다.");
                if($(".review-prompt").css("display") != "none"){
	                $(".review-prompt").css({"z-index": "-1", "display": "none"});                	
                }
                
                $("#reviewContent").val("");
                $("#myform input[type='radio']").prop("checked", false);
                if(response.list.length == 1){
                	location.reload();
                }else{
	                renderReviews(response);                	
                }
                
            } else {
            	location.reload();
            }
        },
        error: function() {
            console.log("AJAX 통신 실패");
        }
    });
}

//리뷰글 삭제 
function deleteFunction(reviewNo){
	let productNo = "${list.productNo}";
	if(confirm("해당 리뷰글을 삭제하시겠습니까?")){
		$.ajax({
			url:"${contextPath}/product/ajaxReviewDel.do",
			type:"get",
			data:"reviewNo=" + reviewNo + "&productNo=" + productNo,
			success:function(response){
				alert("리뷰 글이 정상적으로 삭제되었습니다.");
				
				 if (response.list.length > 0) {
					 	renderReviews(response);      
         }else{
        	 location.reload();
         }
				
			},
			error:function(){
				
			}
			
			
		})		
	}

}

</script>










</body>
</html>