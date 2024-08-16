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


.container {
    width: 100%;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    text-align: center;
    margin-bottom: 30px;
}

.product-list {
    display: flex;
    gap: 20px;
    align-content: stretch;
    flex-direction: row;
    justify-content: space-between;
    align-items: stretch;
    flex-wrap: wrap;
}

.product-card {
    background-color: #fff;
    border: 1px solid #004085;
    border-radius: 11px;
    overflow: hidden;
    width: calc(30% - -21px);
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    height: 350px;
}



.product-image {
    width: 100%;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 18px;
    color: #aaa;
}

.product-image:hover {
   cursor: pointer;
}

.product-info {
    padding: 15px;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: flex-end;
    height: 100px;
}

.product-title {
    font-size: 18px;
    margin-bottom: 10px;
}

.product-price {
    font-size: 16px;
    color: #e74c3c;
    margin-bottom: 10px;
}

.product-description {
    font-size: 14px;
    color: #777;
    line-height: 1.5;
    height: 45px;
    
}
#headerH1{
    font-size: 2.5rem;
    height: 150px;
    display: flex;
    flex-direction: row;
    justify-content: center;
}
img{
    vertical-align: middle;
    border-style: none;
    width: 100%;
    height: 75%;
}
.product_cart{
		display: flex;
    justify-content: flex-end;
    flex-wrap: nowrap;
    flex-direction: row;
    align-items: center;
    margin-right: 30px;
}
.product_cart>svg{
	cursor: pointer;
}
.product_cart>svg:hover{
	color: #ffc107;
	transform: translateY(-5px);
	transition: transform 0.3s;
}

</style>
</head>
<body>


  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <body>
	    <div class="container" style="height: auto;">
	    		
	        <h1 id="headerH1">CAT 마켓</h1>
	        <div class="product-list">
	        		<c:forEach var="p" items="${ list }">
		            <div class="product-card">
		                <div class="product-image">
		                	<input type="hidden" class="productNo" value="${ p.productNo }">
		                	<img src="${contextPath}${p.productThumbnailPath}">
		                </div>
		                <div class="product-info">
		                    <h2 class="product-title">${p.proName}</h2>
		                    <p class="product-price">${p.productPrice}</p>
		                </div>
		                <div class="product_cart">
			                <svg class="svg_cart" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
											  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
											</svg>
											<input type="hidden" class="pNo" value="${ p.productNo }">
		                </div>
		            </div>
	            </c:forEach>
	            <!-- 추가적인 상품 카드들 -->
	        </div>
	        <div style="display: flex;
									    justify-content: center;
									    margin-top: 100px;">
	        	<ul class="pagination">
						  <li class="page-item ${ pi.currentPage == 1 ?  'disabled' : ''}"><a class="page-link" href="${contextPath}/product/list.do?type=${type}&page=${ pi.currentPage - 1}">이전</a></li>
						  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							  <li class="page-item ${ pi.currentPage == p ? 'disabled active' : '' }">
							  	<a class="page-link" href="${contextPath}/product/list.do?type=${type}&page=${p}">${ p }</a>
							  </li>
							</c:forEach>
						  <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/product/list.do?type=${type}&page=${ pi.currentPage + 1 }">다음</a></li>
						</ul>
	        </div>
	    </div>
	    

	    
	 

<script>
//상품 상세 페이지로 이동 스크립트
$(document).on("click", ".product-image", function(){
    var productNo = $(this).find(".productNo").val();
    location.href = "${contextPath}/product/detail.page?productNo=" + productNo;
});

//가격 콤마 스크립트
$(document).ready(function() {
    $(".product-price").each(function() {
    	 	var text = $(this).text().trim();
        var price = parseFloat(text.replace(/,/g, ''));
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('ko-KR'));
        }
    });
});


$(document).on("click", ".svg_cart", function(){
	
	if("${ loginUser }" != ""){
		
				if(confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")){
						
						$.ajax({
							url:"${contextPath}/product/insertCart.do",
							type:"GET",
							data:{
								productNo:$(this).next().val()
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
							productNo:$(this).next().val()
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
		
		$('#loginModal').modal('show');
		
		
	}
	
	
})
</script>

 

</body>
</html>