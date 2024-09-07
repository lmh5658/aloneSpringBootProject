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
/* 공통 스타일 */
.container {
    display: flex;
    height: auto; /* 컨텐츠에 맞게 높이 자동 조정 */
}

.filters {
width: 20%;
    padding: 20px;
    border-right: 1px solid #ddd;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    height: 1200px;
    font-size: 14px;
}

.filters h2 {
    font-size: 1.8em;
    margin-bottom: 15px;
    border-bottom: 2px solid #dee2e6;
    padding-bottom: 10px;
    display: flex;
    align-items: baseline;
    justify-content: space-between;
}

.filter-category h3 {
    font-size: 1.4em;
    margin-bottom: 15px;
}

.filter-category {
    margin-bottom: 30px;
}

.filter-category label {
    display: block;
    margin-bottom: 10px;
}


.products {
    padding: 20px;
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    align-content: flex-start;
    margin-left: 72px;
}

.product {
    flex-shrink: 1;
    flex-basis: calc(25% - 20px); /* 4개 열에 맞게 설정 */
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    position: relative;
    height: auto;
    font-size: 13px;
}


.product img {
    width: 100%;
    height: 170px;
    object-fit: cover;
    border-radius: 8px;
    cursor: pointer;
}

.product .badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background: #ff4d4d;
    color: white;
    padding: 5px 10px;
    border-radius: 3px;
    font-size: 0.9em;
    font-weight: bold;
}

.product .price {
    font-size: 1.2em;
    padding: 10px;
}

.product .price .discount {
    color: #ff4d4d;
    font-weight: bold;
    text-decoration: line-through;
}

.noPrice {
    font-size: 1.2em;
    color: black;
}

.product button {
background: #ffffff;
    color: #000000;
    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 1em;
    transition: background 0.3s;
    height: 35px;
    display: flex;
    align-items: center;
    justify-content: center;
}


#productName {
        height: 59px;
    font-size: 1em;
    display: flex;
    align-items: center;
    padding: 10px 0;
    text-align: left;
    font-weight: bold;
}

#page {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

#totalPrice {
display: flex;
    align-items: center;
    padding-left: 16px;
    height: 36px;
}

.noPrice {
    color: black;
}

.price {
    color: #ff4d4d;
    text-decoration: line-through;
}

.sold-out-banner {
position: absolute;
    top: 86px;
    left: 0;
    width: 100%;
    background: #ffc10791;
    color: #ffffff;
    padding: 10px;
    text-align: center;
    font-size: 2.2em;
    font-weight: bold;
    z-index: 1;
    transform: skewY(-10deg);
    transform-origin: top left;
    cursor: not-allowed;
}
#pagination-wrap{
		display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 50px;
}
#pagination-wrap button{
background: white;
    border: 1px solid gray;
    padding: 3px 11px;
}

</style>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
    <div class="container" style="max-width: 1233px;">
        <aside class="filters">
            <h2>필터<button type="button" style="font-size: 13px; border: none; background: none;" id="reset">초기화</button></h2>
            
            <!-- 총 중량 필터 -->
            <section class="filter-category">
                <h3>총 중량</h3>
                <label>
                    <input type="checkbox" class="weight" value="1kg 이하"> 1kg 이하
                </label>
                <label>
                    <input type="checkbox" class="weight" value="1~5kg"> 1~5kg
                </label>
                <label>
                    <input type="checkbox" class="weight" value="5~10kg"> 5~10kg
                </label>
                <label>
                    <input type="checkbox" class="weight" value="10kg 이상"> 10kg 이상
                </label>
            </section>
            
            <!-- 대상 크기 필터 -->
            <section class="filter-category">
                <h3>급여 대상<small>(고양이)</small></h3>
                <label>
                    <input type="checkbox" class="salaryTarget" value="전연령"> 전연령
                </label>
                <label>
                    <input type="checkbox" class="salaryTarget" value="퍼피/키튼"> 퍼피/키튼
                </label>
                <label>
                    <input type="checkbox" class="salaryTarget" value="어덜트"> 어덜트
                </label>
                <label>
                    <input type="checkbox" class="salaryTarget" value="시니어"> 시니어
                </label>
            </section>
            
            <!-- 대상 크기 필터 -->
            <section class="filter-category">
                <h3>대상 크기<small>(강아지)</small></h3>
                <label>
                    <input type="checkbox" class="size" value="소형견"> 소형견
                </label>
                <label>
                    <input type="checkbox" class="size" value="중형견"> 중형견
                </label>
                <label>
                    <input type="checkbox" class="size" value="대형견"> 대형견
                </label>
            </section>
            
            <!-- 기능 필터 -->
            <section class="filter-category">
                <h3>기능</h3>
                <label>
                    <input type="checkbox" class="functional" value="다이어트"> 다이어트
                </label>
                <label>
                    <input type="checkbox" class="functional" value="면역력강화"> 면역력 강화
                </label>
                <label>
                    <input type="checkbox" class="functional" value="알러지예방"> 알러지 예방
                </label>
            </section>
            
            <!-- 가격 필터 -->
            <section class="filter-category">
                <h3>가격</h3>
                <label>
                    <input type="checkbox" class="price" value="20000"> 20,000원 이하
                </label>
                <label>
                    <input type="checkbox" class="price" value="20000~40000"> 20,000원 ~ 40,000원
                </label>
                <label>
                    <input type="checkbox" class="price" value="40000~60000"> 40,000원 ~ 60,000원
                </label>
                <label>
                    <input type="checkbox" class="price" value="60000~80000"> 60,000원 ~ 80,000원
                </label>
            </section>
            
            <!-- 별점 필터 -->
            <section class="filter-category">
                <h3>별점</h3>
                <label>
                    <input type="checkbox" class="rating" value="4"> ★★★★☆ 4점 이상
                </label>
                <label>
                    <input type="checkbox" class="rating" value="3"> ★★★☆☆ 3점 이상
                </label>
                <label>
                    <input type="checkbox" class="rating" value="2"> ★★☆☆☆ 2점 이상
                </label>
                <label>
                    <input type="checkbox" class="rating" value="1"> ★☆☆☆☆ 1점 이상
                </label>
            </section>
        </aside>
        
        <div style="width: 80%;">
        		<div style="text-align: center;font-size: 35px;">전체</div>
            <div id="productes" class="products">
                <!-- 상품 목록이 여기에 동적으로 삽입됩니다 -->
               <c:forEach var="p" items="${ list }">
                <div class="product">
                		<c:if test="${p.productSaleStatus == 'Y'}">
									    <div class="badge"> ${Math.round((p.productPrice - (p.productPrice - p.productSalePrice)) / p.productPrice * 100)} % SALE</div>
                		</c:if>
                		<c:if test="${p.proAmount == 0}">
								    	<div class="sold-out-banner">Sold Out</div>
								    </c:if>
								    <img src="${p.productThumbnailPath}" class="product-image" alt="Product Image">
								    <div id="productName">${p.proName}</div>
								    <div id="totalPrice">
								    		<c:choose>
								    			<c:when test="${p.productSaleStatus == 'Y'}">
										        <div class="discount">${p.productPrice - p.productSalePrice}</div>
										        <div class="price">${p.productPrice}</div>								    			
								    			</c:when>
								    			<c:otherwise>
								    				<div class="noPrice">${p.productPrice}</div>
								    			</c:otherwise>
								    		</c:choose>
								    </div>
								   
								    <c:choose>
								    	<c:when test="${p.proAmount == 0}">
									    	<button class="product_cart" style="cursor: not-allowed;" disabled>담기</button>
									    </c:when>
									    <c:otherwise>
									    	<button class="product_cart">담기</button>
									    </c:otherwise>
								    </c:choose>
								    <input type="hidden" value="${p.productNo}">
								</div>
               </c:forEach>
            </div>
            <div id="pagination-wrap">
                <c:if test="${ not empty list }">
                   <ul class="pagination">
                       <li class="page-item ${ pi.currentPage == 1 ?  'disabled' : ''}"><a class="page-link" href="${contextPath}/product/allProductSearch.do?search=${search}&page=${ pi.currentPage - 1}">이전</a></li>
                       <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                           <li class="page-item ${ pi.currentPage == p ? 'disabled active' : '' }">
                               <a class="page-link" href="${contextPath}/product/allProductSearch.do?search=${search}&page=${p}">${ p }</a>
                           </li>
                       </c:forEach>
                       <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/product/allProductSearch.do?search=${search}&page=${ pi.currentPage + 1 }">다음</a></li>
                   </ul>  
               </c:if>
            </div>
        </div>
    </div>
</body>
	 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	 
<script>

$("#reset").on("click", function(){
	 $(".filters input[type='checkbox']").prop("checked", false);
	 if($("#allProductSearch").val().trim() != ""){
	    	$("#allProductSearch").val("");
	 }
	 location.href="${contextPath}/product/list.do";
})

$(document).ready(function(){

 $(".price").each(function() {
 	 	var text = $(this).text().trim();
     var price = parseFloat(text.replace(/,/g, ''));
     if (!isNaN(price)) {
         $(this).text(price.toLocaleString('ko-KR') + "원");
     }
	 });
	 
	 $(".discount").each(function(){
	 		let discount = $(this).text().trim();
		 	let disCountprice = parseFloat(discount.replace(/,/g, ''));
    	if (!isNaN(disCountprice)) {
         $(this).text(disCountprice.toLocaleString('ko-KR') + "원");
      }
	 })
	 
	 $(".noPrice").each(function(){
		 	let price = $(this).text().trim();
		 	let noPrice = parseFloat(price.replace(/,/g, ''));
    	if (!isNaN(noPrice)) {
         $(this).text(noPrice.toLocaleString('ko-KR') + "원");
      }
	 })
	 
	 
})
</script>	 
	 
 <script>
 $(document).ready(function(){
	 $("#allProductSearch").val("${search}");
 })
	
 $(document).on("change", "input[type='checkbox']", function() {
	
	 		
	    let weight = [];
	    let salaryTarget = [];
	    let size = [];
	    let functional = [];
	    let price = [];
	    let rating = [];

	    $(".weight").each(function() {
	        if($(this).is(":checked")) {
	           weight.push($(this).parent().text().trim());
	        }
	    });

	    $(".salaryTarget").each(function() {
	        if($(this).is(":checked")) {
	        	salaryTarget.push($(this).val().trim());
	        }
	    });
	    
	    $(".size").each(function() {
	        if($(this).is(":checked")) {
	           size.push($(this).parent().text().trim());
	        }
	    });
	    
	    

	    $(".functional").each(function() {
	        if ($(this).is(":checked")) {
	            functional.push($(this).parent().text().trim());
	        }
	    });

	    
	    $(".price").each(function() {
	        if($(this).is(":checked")) {
	        	price.push($(this).val().trim());
	        }
	    });

	    $(".rating").each(function() {
	        if($(this).is(":checked")) {
	           rating.push($(this).val().trim());
	        }
	    });
	    if($("#allProductSearch").val().trim() != ""){
	    	$("#allProductSearch").val("");
	 		}
	    allFilterSearch(weight, salaryTarget, size, functional, price, rating, 1);
	    
	});

 
 
 function allFilterSearch(weight, salaryTarget, size, functional, price, rating, page) {
	 
	    $.ajax({
	        url: "${contextpath}/product/selectFilterSearch.do",
	        type: "get",
	        data: {
	            weight: weight,
	            size: size,
	            salaryTarget: salaryTarget,
	            functional: functional,
	            price: price,
	            rating: rating,
	            page: page
	        },
	        success: function(response) {
	            let list = response.list;
	            let pi = response.pi;

	            let html = '';
	            list.forEach(function(item) {
	            		html += '<div class="product">';
	                let originPrice = item.productPrice;
	                let salePrice = item.productSalePrice;

	                if (item.productSaleStatus === 'Y') {
	                    let discountPercentage = Math.round(((originPrice - (originPrice - salePrice)) / originPrice) * 100);
	                    html += '    <div class="badge">' + discountPercentage + '% SALE</div>';
	                }
	                if (item.proAmount === 0) {
	                    html += '<div class="sold-out-banner">Sold Out</div>';
	                }
	                html += '<img src="' + item.productThumbnailPath + '" class="product-image">';
	                html += '<div id="productName">' + item.proName + '</div>';
	                html += '<div id="totalPrice">';
	                if (item.productSaleStatus === 'Y') {
	                    html += '<div class="discount">' + (item.productPrice - item.productSalePrice).toLocaleString('ko-KR') + '원</div>';
	                    html += '<div class="price">' + item.productPrice.toLocaleString('ko-KR') + '원</div>';
	                } else {
	                    html += '<div class="noPrice">' + item.productPrice.toLocaleString('ko-KR') + '원</div>';
	                }
	                html += '</div>';
	                if (item.proAmount === 0) {
	                    html += '<button class="product_cart" style="cursor: not-allowed;" disabled>담기</button>';
	                } else {
	                    html += '<button class="product_cart">담기</button>';
	                }
	                html += '<input type="hidden" value="' + item.productNo + '">';
	                html += '</div>';
	            });
	            
	            $("#productes").html(html);
	            productPagination(weight, salaryTarget, size, functional, price, rating, pi);
	            
	        },
	        error: function() {
	            console.error('AJAX 통신 오류');
	        }
	    });
	}

 
 function productPagination(weight, salaryTarget, size, functional, price, rating, pi) {
	 		
	    var html = '';

	    if (pi.listCount > 0) {
	       
	        if (pi.currentPage === 1) {
	            html += "<button class='page bt' disabled>이전</button>";
	        } else {
	            html += "<button class='page bt' onclick='allFilterSearch(" +
	                    JSON.stringify(weight) + ", " +
	                    JSON.stringify(salaryTarget) + ", " +
	                    JSON.stringify(size) + ", " +
	                    JSON.stringify(functional) + ", " +
	                    JSON.stringify(price) + ", " +
	                    JSON.stringify(rating) + ", " +
	                    (pi.currentPage - 1) + ")'>이전</button>";
	        }

	        for (var i = pi.startPage; i <= pi.endPage; i++) {
	            if (i === pi.currentPage) {
	                html += "<button class='page active' disabled>" + i + "</button>";
	            } else {
	                html += "<button class='page' onclick='allFilterSearch(" +
	                        JSON.stringify(weight) + ", " +
	                        JSON.stringify(salaryTarget) + ", " +
	                        JSON.stringify(size) + ", " +
	                        JSON.stringify(functional) + ", " +
	                        JSON.stringify(price) + ", " +
	                        JSON.stringify(rating) + ", " +
	                        i + ")'>" + i + "</button>";
	            }
	        }

	        if (pi.currentPage === pi.maxPage) {
	            html += "<button class='page bt' disabled>다음</button>";
	        } else {
	            html += "<button class='page bt' onclick='allFilterSearch(" +
	                    JSON.stringify(weight) + ", " +
	                    JSON.stringify(salaryTarget) + ", " +
	                    JSON.stringify(size) + ", " +
	                    JSON.stringify(functional) + ", " +
	                    JSON.stringify(price) + ", " +
	                    JSON.stringify(rating) + ", " +
	                    (pi.currentPage + 1) + ")'>다음</button>";
	        }
	    }
	
	    $('#pagination-wrap').html(html);
	    
	}

$(document).on("click", "#pagination-wrap button", function(event){
	if ($(event.target).is('button')) {
        window.scrollTo(0, 0);
    }
})


 </script>


<script>



//상품 상세 페이지로 이동 스크립트
$(document).on("click", ".product-image", function(){
    var productNo = $(this).closest(".product").find("input[type='hidden']").val();
    location.href = "${contextPath}/product/detail.page?productNo=" + productNo;
});



$(document).on("click", ".product_cart", function(){
	
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
		if(confirm("로그인이 필요한 서비스입니다.\n로그인페이지로 이동하시겠습니까?")){
			location.href="${contextPath}/member/loginPage.page";			
		}
	}
	
	
	
	
})
</script>

</html>