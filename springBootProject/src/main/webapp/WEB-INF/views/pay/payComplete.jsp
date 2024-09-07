<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 기본 스타일 */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f4f8;
    color: #333;
}

/* 컨테이너 스타일 */
.container {
    max-width: 900px;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
}

/* 헤더 스타일 */
.header {
    background-color: #fef9e7;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.header h1 {
    margin: 0;
    color: #ffb74d;
    font-size: 2em;
}

/* 성공 메시지 섹션 스타일 
.success-message {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
*/
.success-message img {
    max-width: 150px;
    margin-bottom: 20px;
    border-radius: 10px;
}

.success-message h2 {
    color: #4caf50;
    margin-bottom: 10px;
}

.success-message p {
    font-size: 18px;
    color: #555;
}

/* 주문 내역 섹션 스타일 */
.order-details {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.order-details h3 {
    color: #ff5722;
    margin-bottom: 10px;
}

.order-details ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.order-details li {
    margin-bottom: 10px;
    font-size: 16px;
}

/* 결제된 상품 목록 섹션 스타일 */
.ordered-items {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.ordered-items h3 {
    color: #ff5722;
    margin-bottom: 15px;
}

.items {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.item {
    background-color: #f9f9f9;
    border-radius: 10px;
    margin: 10px;
    padding: 10px;
    width: 250px;
    text-align: left;
}

.item img {
		width: 100%;
    border-radius: 10px;
    height: 178px;
}

.item-details {
    padding: 10px;
}

.item-details h4 {
		margin: 0;
    color: #333;
    font-size: 16px;
}

.item-details p {
    margin: 5px 0;
}

/* 다음 단계 섹션 스타일 */
.next-steps {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.next-steps h3 {
    color: #ff5722;
    margin-bottom: 10px;
}

.next-steps p {
    font-size: 16px;
    color: #555;
}

.next-steps .button {
    display: inline-block;
    background-color: #000000;
    color: #ffffff;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    margin-top: 10px;
}

.next-steps .button:hover {
    background-color: #5d5d5d;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
    <div class="container">
        <header class="header">
            <h1> 결제가 완료되었습니다!</h1>
            <section class="success-message">
	            <div style="display: flex;flex-direction: column;align-items: center;">
	            	<a href="https://www.flaticon.com/kr/free-stickers/" title="코기 스티커">코기 스티커 제작자: Surfsup.Vector - Flaticon</a>
				        <img src="${contextPath}/resources/images/free-sticker-corgi-7603210.png" alt="https://www.flaticon.com/kr/free-stickers/">
			  			</div>
	             <p>귀하의 결제가 성공적으로 완료되었습니다. 소중한 주문을 주셔서 감사합니다!</p>
	             <p>주문 상태는 마이페이지 &nbsp;'주문관리'&nbsp; 메뉴에서 자세히 확인하실 수 있습니다.</p>                
            </section>
        </header>
        <main class="main-content">
            
            <section class="order-details">
                <h3>주문 내역</h3>
                <ul>
                    <li>주문 번호: <strong>${ orderList.orderNo }</strong></li>
                    <li>주문 날짜: <strong>${ orderList.orderDate }</strong></li>
                    <li>결제 날짜: <strong>${ orderList.paymentDate }</strong></li>
                    <li>결제 방법: <strong>${ orderList.paymentMethod }</strong></li>
                </ul>
            </section>
            <section class="ordered-items">
                <h3>결제된 상품</h3>
                <div class="items">
                <c:forEach var="item" items="${ orderPList }">
                    <div class="item">
                        <img src="${contextPath}${item.productThumbnailPath}">
                        <div class="item-details">
                            <h4>${item.orderProductName}</h4>
                            <p>수량: ${item.orderProductAmount}개</p>
                            <p>가격: ${item.orderProductAmount * item.productPrice}원</p>
                        </div>
                    </div>  
                </c:forEach>
                </div>
            </section>
        </main>
    </div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>