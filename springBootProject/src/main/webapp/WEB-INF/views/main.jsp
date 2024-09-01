<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}


.product-carousel {
    padding: 20px;
    background-color: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}

.product-carousel h3 {
    font-size: 22px;
    margin-bottom: 10px;
    color: #333;
}

.product-carousel p {
    font-size: 16px;
    margin-bottom: 20px;
    color: #777;
}

.products {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
}

.product {
    background-color: #fff;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    text-align: center;
    max-width: 18%;
    position: relative;
    height: 313px;
    width: 212px;
}

.rank-badge {
    position: absolute;
    top: -10px;
    left: -10px;
    background-color: #ffd700;
    color: #fff;
    padding: 5px 10px;
    border-radius: 50%;
    font-weight: bold;
    font-size: 18px;
}

.product img {
    max-width: 100%;
    height: 169px;
    margin-bottom: 10px;
    margin-top: 7px;
}

.product-info p {
    font-size: 14px;
    color: #333;
    margin-bottom: 5px;
    height: 40px;
}

.discount {
    font-size: 16px;
    color: #d9534f;
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
}

.product-info button {
    background-color: white;
    color: black;
    border: 1px solid black;
    border-radius: 4px;
    cursor: pointer;
    width: 133px;
}

.product-info button:hover {
    background-color: #555;
    color: white;
}

.view-more a {
    font-size: 14px;
    color: #333;
    text-decoration: none;
    padding: 10px 20px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.view-more a:hover {
    background-color: #f0f0f0;
}
.price{
    display: flex;
    justify-content: center;
    gap: 10px;
}


</style>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>

    <!-- Banner Section -->
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextPath}/resources/images/benner.png" class="d-block w-100" alt="..." style="cursor:pointer" height="400px" onclick="location.href='${contextPath}/community/doranMain.page'">
    </div>
    <!-- 
    <div class="carousel-item">
      <img src="" class="d-block w-100" height="400px">
    </div>
     -->
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
    
    
    <!-- Product Carousel Section -->
    <div class="product-carousel">
        <h3 style="margin: 37px; font-size: 29px;"> 실시간 판매 랭킹 TOP 10</h3>
        <div class="products">
         
         </div>
        <div class="view-more">
            <a href="${contextPath}/product/list.do">전체보기</a>
        </div>
    </div>
    
</body>

<script>

$(document).ready(function(){
	loadProductRank(1);
})

function loadProductRank(page){
	$.ajax({
		url:"${contextPath}/product/selectMainProduct.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			let list = response.list;
			let pi = response.pi;
			
			let html = '';
			
			html += '<button data-pi="' + pi.currentPage + '"style="border: none; background: none; width: 24px;"></button>';
			
			list.forEach(function(item) {
			    html += '<div class="product" data-pro="' + item.productNo + '">';
			    html += '    <div class="rank-badge">' + item.rowNumber + '</div>';
			    html += '    <img class="productImgThumb" style="cursor:pointer;" src="${contextPath}' + item.productThumbnailPath + '">';
			    html += '    <div class="product-info">';
			    html += '        <p>' + item.proName + '</p>';
			    if (item.productSaleStatus == 'Y') {
			        html += '        <div class="price"><span class="discount">' + (item.productPrice - item.productSalePrice).toLocaleString('ko-KR') + '원</span><span style="text-decoration: line-through;">' + item.productPrice.toLocaleString('ko-KR') + '원</span></div>';
			    } else {
			        html += '        <span class="discount">' + item.productPrice.toLocaleString('ko-KR') + '원</span>';
			    }
			    html += '        <button class="product_cart">담기</button>';
			    html += '    </div>';
			    html += '</div>';
			});
			
			html += '<button id="nextButton" data-pi="' + pi.currentPage + '"style="border: none; background: none; width: 24px;"></button>';
			
			$(".products").html(html);
			
		},
		error:function(){
			
		}
	})
}


$(document).on("click", ".productImgThumb", function() {
    let $product = $(this).closest(".product").data("pro");
    location.href = "${contextPath}/product/detail.page?productNo=" + $product;
});



$(document).on("click", "#nextButton", function(){
	let currentPage = $(this).data("pi");
	
	if(currentPage == 2){
		loadProductRank(1);
	}else{
		loadProductRank(2);
	}
	
})


$(document).on("click", ".product_cart", function(){
		let productNo = $(this).closest(".product").data("pro");
		if("${ loginUser }" != ""){
			
			if(confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")){
					
					$.ajax({
						url:"${contextPath}/product/insertCart.do",
						type:"GET",
						data:{
							productNo:productNo
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
						productNo:productNo
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
		if(confirm("로그인이 필요한 서비스입니다.\n로그인페이지로 이동하시겠습니까?")){
			location.href="${contextPath}/member/loginPage.page";			
		}
	}
})
	



$(document).ready(function() {
	/*
    setInterval(function() {
        $("#nextButton").click();
    }, 3300);
	*/
});


		
		
</script>

	
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>