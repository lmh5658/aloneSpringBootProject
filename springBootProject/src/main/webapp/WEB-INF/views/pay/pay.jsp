<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 포트원 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

h1, h2 {
    color: #333;
}

.cart-summary {
    margin-bottom: 20px;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 10px;
}

.cart-table th, .cart-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.cart-table th {
    background-color: #f4f4f4;
}

.final-amount {
    font-size: 1.2em;
    font-weight: bold;
}

.payment-info {
    margin-top: 20px;
}

form label {
    display: block;
    margin: 10px 0 5px;
}

form input, form textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

form textarea {
    height: 80px;
    resize: vertical;
}

.pay-button {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 15px;
    font-size: 1.2em;
    cursor: pointer;
    border-radius: 4px;
}

.pay-button:hover {
    background-color: #dd2e3fb5;
}
#paymentForm th{
		width: 100px;
    text-align: center;
}
.cart-table th{
	text-align: center;
}
#productName{display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.cart-summary td{
		text-align: center;
    font-size: 18px;
    font-weight: bolder;

}
</style>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <div class="container">
        <h1 style="text-align: center;">결제</h1>
        
        <!-- 결제 정보 -->
        <div class="payment-info">
            <form id="paymentForm">
            		<h2>배송지 및 주문자 정보</h2>
            		<div style="display: flex;
    												justify-content: flex-end; margin-bottom: 20px;">
	                <div style="width: 10px; display: flex;align-items: flex-end;">
	                	<input type="checkbox" id="check">
	                </div>
	                <label for="check" style="margin-left: 10px; font-size: 20px;" id="check">주문자 정보와 동일</label>
            		</div>
            		<table>
            			<tr>
            				<th>주문자 이름<b style="color: red;">&nbsp;*</b></th>
            				<td><input type="text" id="orderName" name="orderName" placeholder="수령인을 입력하세요." required></td>
            			</tr>
            			<tr>
            				<th>휴대전화<b style="color: red;">&nbsp;*</b></th>
            				<td><input type="text" id="phone" name="orerPhone" placeholder="예)010-0000-0000" required></td>
            			</tr>
            			<tr>
            				<th class="col1">이메일<b style="color: red;">&nbsp;*</b></th>
				        		<td class="col2">
					            <input type="text" name="mail" style="width: 145px;" required>
					            <span class="a">@</span>
					            <input type="text" name="email" style="width: 145px;" required>
					            <select name="mailslc" id="mailSelect">
					                <option id="self" value="" selected>직접입력</option>
					                <option value="naver.com">naver.com</option>
					                <option value="gmail.com">gmail.com</option>
					                <option value="daum.com">daum.com</option>
					                <option value="yahoo.com">yahoo.com</option>
					            </select>
				        		</td>
            			</tr>
            			<tr>
            				<th>주소<b style="color: red;">&nbsp;*</b></th>
            				<td>
												<input type="text" id="sample6_postcode" placeholder="우편번호" required style="width: 470px" name="streetAddress">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 130px"><br>
												<input type="text" id="sample6_address" placeholder="주소" name="address" required><br>
												<input type="text" id="sample6_detailAddress" name="addressDatail" placeholder="상세주소" style="width: 400px;" required>
												<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width: 200px;" name="otherAddress">
										</td>
            			</tr>
            		</table>
                <label for="deliveryNotes">배송 요청사항</label>
                <textarea id="deliveryNotes" name="orderRequest" placeholder="배송 요청사항을 입력하세요"></textarea>
                
                <!-- 상품 목록 -->
					      <div class="cart-summary">
					          <h2>상품 목록</h2>
					          <table class="cart-table">
					              <thead>
					                  <tr>
					                      <th>상품명</th>
					                      <th>수량</th>
					                      <th>단가</th>
					                      <th>총액</th>
					                  </tr>
					              </thead>
					              <tbody>
					                  <c:forEach var="item" items="${ cartList }" begin="0" end="${ cartList.size() - 1 }" varStatus="status">
													    <tr class="item">
													        <td id="productName">
													            <div></div>
													            <img src="${contextPath}${item.productThumbnailPath}" style="width: 100px;">
													            <div>${item.proName}</div>
													        </td>
													        <td>${item.count}</td>
													        <td class="price">${item.productPrice}</td>
													        <td class="total">${item.count * item.productPrice}</td>
													        <input type="hidden" class="pNo" value="${item.productNo}" name="orderProduct[${status.index}].orderProductNo">
													        <input type="hidden" value="${item.proName}" name="orderProduct[${status.index}].orderProductName">
													        <input type="hidden" value="${item.count}" name="orderProduct[${status.index}].orderProductAmount">
													        <input type="hidden" value="${userNo}" name="orderProduct[${status.index}].userNo">
													    </tr>
													</c:forEach>
					              </tbody>
					          </table>
					          <div class="final-amount" style="text-align: right;font-size: 25px;">
					              <p>최종 결제 금액: <span id="totalAmountValue"> ${totalPrice} </span> 원</p>
												<input type="hidden" value="${ totalPrice }" name="orderTotalPrice">
												<input type="hidden" value="kakaoPay" name="paymentMethod">
					          </div>
					          
					      </div>
					      
					      <div class="cart-summary" style="height: 266px;display: flex;flex-direction: column;justify-content: center; align-items: flex-start;">
					          <h2>결제수단</h2>
					          <div style="margin-top: 48px;">
					          	<input type="radio" style="width: 10px; height: 10px;" id="kakaoRadio">
					          	<img alt="" src="${contextPath}/resources/images/payment_icon_yellow_small.png">
					          </div>
					      </div>
					      <div style="display: flex;
												    align-items: center;
												    justify-content: center;
												    margin: 103p">
	                <button type="button" class="pay-button" id="payBtn">결제하기</button>					      
					      </div>
                
                
            </form>
        </div>
    </div>
<script>




$(document).ready(function(){
	
    $(".pay-button").on("click", function (event) {
        // 올바른 셀렉터를 사용하여 체크된 라디오 버튼을 확인합니다.
        if ($("input[type='radio']:checked").length > 0 && $("#kakaoRadio").is(":checked")) {
            kakaoPay();
        } else {
            alert("결제수단을 설정해주세요.");
            event.preventDefault();
        }
    });
    
});

//구매자 정보

function kakaoPay() {
	
	var IMP = window.IMP;
	
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;
	
if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
   //const emoticonName = document.getElementById('title').innerText
	 let userEmail = '${memberList.email}';
	 let userName = '${memberList.userName}';
	 let userPhone = '${memberList.phone}';
	 var totalPrice = "${totalPrice}";
	 
			
			
	 		IMP.init('imp37456887'); //가맹점 식별코드
   		IMP.request_pay({
       pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
       pay_method: 'card', // 결제 방식
       merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
       name: "도란", // 제품명
       amount: totalPrice, // 가격
       //구매자 정보 ↓
       buyer_email: userEmail,
       buyer_name: userName,
       buyer_tel : userPhone
       // buyer_addr : '서울특별시 강남구 삼성동',
       // buyer_postcode : '123-456'
       
   }, async function (rsp) { // callback
	   
       if (rsp.success) { //결제 성공시
           console.log(rsp);
       
       	$.ajax({
       		url:"${contextPath}/pay/ajaxkakaoPayment.do",
       		type:"post",
       		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
       		dataType: "text",
       		data:$("#paymentForm").serialize(),
       		success:function(response){
       			
       			console.log("전달 여부 :" + response);
       			//결제 성공시
       		
  	        if (response > 0) { // DB저장 성공시
  	            
  	        		console.log("ajax통신 성공!!");
  	        		//location.href="${contextPath}/pay/payCompleted.do";
  	        
  	        } else{ // 결제완료 후 DB저장 실패시
  	            alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
  	            // DB저장 실패시 status에 따라 추가적인 작업 가능성
  	        }
       		
       		},
       		error:function(){
       			console.log("ajax 통신 실패");
       		}
       		
       	})
		
           
       } else if (rsp.success == false) { // 결제 실패시
           alert(rsp.error_msg)
       }
   
   
   });
   
}else{
		return false;
}

}
</script>    
    
   
    
    
<script>
//주문자 정보와 동일 체크 이벤트 스크립트
$(document).ready(function(){
	
	var userName = "${memberList.userName}";
	var phones = "${memberList.phone}";
	var address = "${memberList.address}";
	var addressDatail = "${memberList.addressDatail}";
	var streetAddress = "${memberList.streetAddress}";
	var otherAddress = "${memberList.otherAddress}";
	var email = "${memberList.email}";
	var parts = email.split("@");
  var userPart = parts[0];
  var domainPart = parts[1];
  
		
  

  $("#check").change(function() {
      if($(this).is(":checked")) {
          $("input[type='text'][name='userName']").val(userName);
          $("input[type='text'][name='phone']").val(phones);
          $("input[type='text'][name='mail']").val(userPart);
          $("input[type='text'][name='email']").val(domainPart);
          $("input[type='text'][name='address']").val(address);
          $("input[type='text'][name='addressDatail']").val(addressDatail);
          $("input[type='text'][name='streetAddress']").val(streetAddress);
          $("input[type='text'][name='otherAddress']").val(otherAddress);
      } else {
          $("input[type='text']").val("");
      }
  });
	
})








//select change 이벤트 발생시 email input 요소에 value값 넣어주기 + 직접입력은 input요소에 focus()
$(document).on("change", "#mailSelect", function() {
	
    var selectedValue = $(this).val();
    
    $("input[type='text'][name='email']").val(selectedValue);
    
    var selectedOption = $(this).find("option:selected");
    
    if (selectedOption.attr("id") === "self") {
    	$("input[type='text'][name='email']").focus();
    }
});
</script>


<!------------------------------- 우편번호 찾기 api 스크립트 -------------------------------------->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 금액 콤마 스크립트 -->
<script>
$(document).ready(function(){
	formatPrices();
})
function formatPrices() {
    $(".price, .total").each(function() {
        var text = $(this).text().replace(/,/g, ''); // 쉼표 제거
        var value = parseFloat(text); // 실수로 변환
        if (!isNaN(value)) {
            $(this).text(value.toLocaleString('ko-KR')); // 한국어 형식으로 변환
        }
    });
}
</script>
<!-- ---------------------------------------------------------------------------------------------- -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>