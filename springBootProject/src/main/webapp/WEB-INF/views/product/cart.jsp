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
    font-family: Arial, sans-serif;
}

h1 {
    text-align: center;
}

#cartContainer {
    width: 80%;
    margin: 0 auto;
}
#cartContainer th{text-align: center;}
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

th {
    background-color: #f4f4f4;
}

input.quantity {
    width: 35px;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

button.remove {
    background-color: #f44336;
}

#totalAmount {
    text-align: right;
    font-size: 35px;
    margin-top: 10px;
}
.garbage{
	cursor: pointer;
	color:red;
}
#checkoutButton{
	 border-radius: 14px;
   background: #dc3545;
}
</style>
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <h1 style="font-weight: bold;">장바구니</h1>
    <div id="cartContainer">
    				<c:choose>
    					<c:when test="${ not empty cartList }">
    						<table>
		                <thead>
		                    <tr>	
		                    		<th><input type="checkbox" checked id="check_box"></th>
		                        <th>상품명</th>
		                        <th style="width: 128px;">수량</th>
		                        <th>가격</th>
		                        <th style="width: 150px;">총액</th>
		                        <th>삭제</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="item" items="${ cartList }">
		                        <tr class="item">
		                        		<td><input type="checkbox" class="listCheckbox" data-no="${ item.productNo }" checked></td>
		                            <td><div></div><image src="${contextPath}${item.productThumbnailPath}" style="width: 100px;"><div>${ item.proName }</td>
		                            <td>
		                            		<input type="button" value=" - " class="minus"> 
		                                <input type="text" class="quantity" value="${ item.count }">
						                   			<input type="button" value=" + " class="add">
		                                
		                            </td>
		                            <td class="price">${ item.productPrice - item.productSalePrice }</td>
		                            <td class="total">${ item.count * (item.productPrice - item.productSalePrice) }</td>
		                            <td>
		                            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash garbage" viewBox="0 0 16 16">
																	  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
																	  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
																	</svg>
																</td>
																<input type="hidden" class="pNo" value="${ item.productNo }">
		                        </tr>
		                    </c:forEach>
		                </tbody>
            		</table>
            			<div id="totalAmount">
			                총액: <span id="totalAmountValue"></span> 원
			            </div>
			           	<div style="display: flex;
			    										justify-content: center;">
			           		<button id="checkoutButton" type="submit">결제하기</button>
			           		
			           	</div>
    					</c:when>
    					<c:otherwise>
    						<div>
	    						 <p style="text-align: center;
   													 font-size: 30px;">장바구니가 비어 있습니다.</p>
    						</div>
    						<div style="display: flex;
    												justify-content: center;">
	    						 <img src="${contextPath}/resources/images/free-sticker-cute-11172322.png" style="height: 215px;">	
    						</div>
    						<div style="display: flex;
    												justify-content: center;">
    							<a href="https://www.flaticon.com/kr/free-stickers/" title="귀엽다 스티커">귀엽다 스티커 제작자: Stickers - Flaticon</a>
    						</div>
    					</c:otherwise>
    				</c:choose>
    </div>
<script>
$("#checkoutButton").on("click", function() {
    let arr = [];
    let hasCheckedItems = false;

    $(".item").each(function() {
        let checkedBoxes = $(this).find("input[type='checkbox']:checked");
        // 체크된 체크박스가 있는 경우
        if (checkedBoxes.length > 0) {
            hasCheckedItems = true;
            checkedBoxes.each(function() {
                arr.push($(this).data("no"));
                
            });
        }
    });
    
    // 체크된 상품이 없는 경우
    if (!hasCheckedItems) {
        alert("체크된 상품이 없습니다.");
        return; // 함수를 종료
    }

    if (confirm("결제화면으로 이동하시겠습니까?")) {
    	
        let totalPrice = $("#totalAmountValue").text();
        let productNoList = arr.join(",");

        // 페이지를 이동합니다.
        location.href = "${contextPath}/pay/pay.page?totalPrice=" + totalPrice + "&productNo=" + productNoList;
        
    }
    
   
});

$(".listCheckbox").on("change", function() {
	
    let isChecked = $(this).is(":checked");
    let totalPriceText = $("#totalAmountValue").text().replace(/,/g, '');
    let totalPrice = parseFloat(totalPriceText);
    
    let itemTotalText = $(this).closest('.item').find(".total").text().trim().replace(/,/g, '');
    let itemTotal = parseFloat(itemTotalText);

    if (isChecked) {
        totalPrice += itemTotal;
    } else {
        totalPrice -= itemTotal;
    }

    $("#totalAmountValue").text(totalPrice.toLocaleString("ko-KR"));
});

$("#check_box").on("change", function() {
	
    let isChecked = $(this).is(":checked");
    
    // 전체 체크박스 상태를 변경
    $(".item").each(function() {
        $(this).find("input[type='checkbox']").prop("checked", isChecked);
    });
    
    // 총합계 계산
    let sum = 0;
    $(".item").each(function() {
        if ($(this).find("input[type='checkbox']").is(":checked")) {
            let totalPriceText = $(this).find(".total").text().trim();
            let totalPrice = parseFloat(totalPriceText.replace(/,/g, ''));
            
            sum += totalPrice;
        }
    });

    let formattedSum = sum.toLocaleString("ko-KR");

    $("#totalAmountValue").text("");
    $("#totalAmountValue").text(formattedSum == 0 ? 0 : formattedSum);
});




$(document).ready(function(){
    // 페이지 로드 시 가격 및 총 가격을 로컬화된 문자열로 변환
    formatPrices();
    updateTotalAmount();
});

// 가격 및 총 가격을 한국어 형식으로 변환하는 함수
function formatPrices() {
	
    $(".price, .total").each(function() {
        var text = $(this).text().replace(/,/g, ''); // 쉼표 제거
        var value = parseFloat(text); // 실수로 변환
        if (!isNaN(value)) {
            $(this).text(value.toLocaleString('ko-KR')); // 한국어 형식으로 변환
        }
    });
    
    
}

// 총 금액 계산 및 업데이트 함수
function updateTotalAmount() {
    var totalAmount = 0;
    
    $(".total").each(function(){
        var text = $(this).text().replace(/,/g, ''); // 쉼표 제거
        var amount = parseFloat(text); // 실수로 변환
        if (!isNaN(amount)) {
            totalAmount += amount; // 총 금액에 더함
        }
    });
    
    // 총 금액을 로컬화된 문자열로 변환하여 #totalAmountValue에 설정
    $("#totalAmountValue").text(totalAmount.toLocaleString('ko-KR'));
}

// 수량 증가 버튼 클릭 핸들러
$(document).on("click", ".add", function() {
    var $item = $(this).closest(".item");
    
    var count = parseInt($item.find(".quantity").val(), 10);
    var price = parseFloat($item.find(".price").text().replace(/,/g, '')); // 쉼표 제거 후 실수로 변환
    var productNo = $item.find(".pNo").val();
    
    // 수량 증가
    $(this).prev().val(count + 1);
    
    // 총 가격 계산
    var total = (count + 1) * price;
    
    // 총 가격 업데이트 및 로컬화
    $item.find(".total").text(total.toLocaleString('ko-KR'));
    
    // 총 금액 업데이트
    updateTotalAmount();
    
    $.ajax({
    	url:"${contextPath}/product/cartCountUpdate.do",
    	type:"get",
    	data:{
    		productNo:productNo,
    		division:"plus"
    	},
    	success:function(){
    		console.log("카드 상품수량 증가 성공");
    	},
    	error:function(){
    		console.log("ajax통신실패")
    	}
    })
    
});

// 수량 감소 버튼 클릭 핸들러
$(document).on("click", ".minus", function() {
    var $item = $(this).closest(".item");
    
    var count = parseInt($item.find(".quantity").val(), 10);
    var price = parseFloat($item.find(".price").text().replace(/,/g, '')); // 쉼표 제거 후 실수로 변환
    var productNo = $item.find(".pNo").val();
    
    if (count > 1) {
        // 수량 감소
        $(this).next().val(count - 1);
        
        // 총 가격 계산
        var total = (count - 1) * price;
        
        // 총 가격 업데이트 및 로컬화
        $item.find(".total").text(total.toLocaleString('ko-KR'));
        
        // 총 금액 업데이트
        updateTotalAmount();
        
        $.ajax({
        	url:"${contextPath}/product/cartCountUpdate.do",
        	type:"get",
        	data:{
        		productNo:productNo,
        		division:"minus"
        	},
        	success:function(){
        		console.log("카드 상품수량 차감 성공");
        	},
        	error:function(){
        		console.log("ajax통신실패")
        	}
        })
    }
});

// 삭제 버튼 클릭 핸들러
$(document).on("click", ".garbage", function() {
    if (confirm("상품을 삭제하시겠습니까?")) {
        var $item = $(this).closest(".item");
        $item.remove(); // 요소 제거
        
        // AJAX 요청
        $.ajax({
            url: "${contextPath}/product/deleteCart.do",
            type: "GET",
            data: "productNo=" + $item.find(".pNo").val(),
            success: function(response) {
                console.log("ajax통신성공");
                
                location.reload();
                
            },
            error: function() {
                console.log("ajax통신실패");
            }
        });
        
        // 총 금액 업데이트
        updateTotalAmount();
    }
});
</script>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>