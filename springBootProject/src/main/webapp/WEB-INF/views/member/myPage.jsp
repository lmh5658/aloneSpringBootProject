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


.order-status-section {
margin-top: 71px;
    padding: 20px;
    background-color: #ffffff;
    border: 3px solid #ff9999;
    margin-bottom: 70px;
    border-radius: 20px;
   }

.order-status-section h2 {
		font-size: 27px;
    margin-bottom: 20px;
}

.order-progress {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

.step {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.circle {
    width: 40px;
    height: 40px;
    background-color: #ddd;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    margin-bottom: 5px;
}

.label {
    font-size: 12px;
    color: #555;
}

.arrow {
    margin: 0 10px;
    font-size: 20px;
    color: #aaa;
}

.order-summary {
    display: flex;
    justify-content: space-around;
    font-size: 14px;
    color: #555;
}

.order-summary div {
    padding: 5px 10px;
    border-right: 1px solid #ddd;
}




/* 기본 스타일 초기화 */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9;
    color: #333;
}

.container {
    display: flex;
    min-height: 100vh;
    height: 1677px;
}

/* 사이드바 스타일 */
nav.sidebar {
    background-color: #ffefef; /* 연한 핑크색 */
    color: #333;
    width: 17%;
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    height: 100%;
}

nav.sidebar ul {
    list-style: none;
    padding: 0;
}

nav.sidebar ul li {
    margin-bottom: 15px;
    cursor: pointer;
}

nav.sidebar ul li a {
    color: #333;
    text-decoration: none;
    display: block;
    padding: 10px 15px;
    border-radius: 10px;
    background-color: #ffe0e0; /* 부드러운 핑크색 */
    transition: background-color 0.3s, padding-left 0.3s;
}

nav.sidebar ul li a:hover {
    background-color: #ffcccc; /* 조금 더 진한 핑크색 */
    padding-left: 25px;
}

nav.sidebar ul li.active a {
    background-color: #ffb3b3; /* 강조된 핑크색 */
    padding-left: 25px;
}

nav.sidebar ul li .sub-menu {
    padding-left: 15px;
    margin-top: 10px;
}

nav.sidebar ul li .sub-menu {
    padding-left: 15px;
    margin-top: 10px;
}

nav.sidebar ul li .account-menu{
    padding-left: 15px;
    margin-top: 10px;
}





nav.sidebar ul li .account-menu li {
    margin-bottom: 5px;
}

nav.sidebar ul li .account-menu li a {
    color: #666;
    background-color: #ffb3b3; /* 부드러운 핑크색 */
}

nav.sidebar ul li .account-menu li a:hover {
    color: #333;
    background-color: #ff9999; /* 강조된 핑크색 */
}


nav.sidebar ul li .sub-menu li {
    margin-bottom: 5px;
}

nav.sidebar ul li .sub-menu li a {
    color: #666;
    background-color: #ffb3b3; /* 부드러운 핑크색 */
}

nav.sidebar ul li .sub-menu li a:hover {
    color: #333;
    background-color: #ff9999; /* 강조된 핑크색 */
}

/* 메인 컨텐츠 스타일 */
main.main-content {
    padding: 20px;
    width: 80%;
    background-color: #fff;
}

.header {
		display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    width: 100%;
    height: 150px;
    border: solid 7px #ffefef;
    border-radius: 20px;
}

.profile {
    display: flex;
    align-items: center;
    width: 40%;
    padding-left: 10px;
    height: 100px;
}

.avatar {
    width: 60px;
    height: 60px;
    background-color: #ddd;
    border-radius: 50%;
    margin-right: 10px;
}

.username {
    font-size: 25px;
    font-weight: bold;
}

.points-coupons {
    display: flex;
    gap: 20px;
    width: 50%;
    justify-content: space-around;
}

.points, .coupons {
    text-align: center;
}

.amount {
    display: block;
    font-size: 20px;
    font-weight: bold;
    color: #333;
}

.coupons-section {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
}

.coupon {
		background-color: #ffefef8c;
    padding: 15px;
    border-radius: 8px;
    text-align: center;
    border: dashed 3px #ff9999;
}

.coupon-title {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 5px;
}

.coupon-description {
    font-size: 14px;
    color: #777;
    margin-bottom: 15px;
}

.coupon-button {
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
}

.coupon-button {
    background-color: #ff9999;
    color: #fff;
}

.coupon-button.disabled {
    background-color: #e0e0e0;
    color: #aaa;
    cursor: not-allowed;
}

section {
    margin-bottom: 30px;
}

section h2 {
    border-bottom: 2px solid #ff9999; /* 부드러운 핑크색 */
    padding-bottom: 10px;
    margin-bottom: 20px;
    color: #333;
}

button {
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    background-color: #ff9999; /* 부드러운 핑크색 */
    color: #fff;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s, transform 0.2s;
}

button:hover {
    background-color: #ff6666; /* 강조된 핑크색 */
    transform: scale(1.05);
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
}

table th, table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

table th {
    background-color: #ff9999; /* 부드러운 핑크색 */
    color: #fff;
}

table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tbody tr:hover {
    background-color: #f1f1f1;
}

.coupon-history{
	  margin-top: 23px;
}
/*나의 주문관리*/
.main-content {
    padding: 20px;
    max-width: 1000px;
    background-color: #fff; /* 배경색: 흰색 */
}

/* search-section 스타일 */
.search-section {
    background-color: #fff0f5; /* 배경색: 연한 라벤더 핑크 */
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 20px;
    border: 2px dashed #ffb6c1; /* 대시 선 테두리 */
}

.search-section h2 {
    color: #000000;
    margin-bottom: 10px;
    font-size: 26px;
}

.search-section label {
    display: block;
    margin-top: 10px;
    color: #595959;
}

.search-section input[type="date"] {
    border: 2px solid #ffd9ec;
    border-radius: 10px; /* 둥근 모서리 */
    padding: 8px;
    margin-top: 5px;
    font-size: 1em;
    background-color: #fff; /* 입력 필드 배경색: 흰색 */
}

.search-section button {
    background-color: #ffb6c1;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 10px 20px;
    margin-top: 10px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.search-section button:hover {
    background-color: #ff96a6; /* 버튼 호버 색상: 조금 더 어두운 핫핑크 */
}

/* order-list 스타일 */
.order-list {
    background-color: #ffffff; /* 배경색: 연한 크림색 */
    border-radius: 15px;
    padding: 20px;
    border: 2px solid #ffb6c1; /* 테두리 색상: 연한 핑크 */
    height: 1434px;
}

.order-list h2 {
    color: #000000;
    margin-bottom: 15px;
    font-size: 26px;
}

/* 테이블 스타일 */
.order-list table {
    width: 100%;
    border-collapse: collapse;
}

.order-list th, .order-list td {
    padding: 12px;
    text-align: center;
    border: 1px solid black; /* 테두리 색상: 금색 */
    font-size: 14px;
    cursor: pointer;
}

.order-list th {
    background-color: #ffb6c1; /* 헤더 배경색: 연한 핑크 */
    color: #fff; /* 헤더 텍스트 색상: 흰색 */
    font-weight: bold;
}

.order-list tr:nth-child(even) {
    background-color: #fff0f5; /* 홀수 줄 배경색: 연한 라벤더 핑크 */
}

.order-list tr:nth-child(odd) {
    background-color: white; /* 짝수 줄 배경색: 연한 크림색 */
}

.order-list img {
    width: 60px; /* 이미지 크기 조정 */
    height: auto;
    border-radius: 10px; /* 이미지 둥글게 */
    border: 2px solid #ffb6c1; /* 이미지 테두리 색상: 연한 핑크 */
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .main-content {
        padding: 10px;
    }

    .search-section, .order-list {
        padding: 10px;
    }

    .order-list table {
        font-size: 0.9em;
    }
}

#search-form{
    display: flex;
    justify-content: space-around;
    align-items: baseline;
}

.pointPagination *, .couponPagination *, .couponUsagePagination *, .reviewPointPagination *, .reviewPagination *
, .myOrderInfoPagination *{
	font-size: 13px;
	padding: 9px;
}





/* 모달 기본 스타일 */

.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 999;
    overflow: auto; /* 모달이 열릴 때 페이지 스크롤 유지 */
}

.modal-content {
    position: relative;
    margin: 5% auto; /* 모달 중앙 배치 */
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    max-width: 800px;
    width: 90%;
    max-height: 80vh; /* 모달 최대 높이 설정 */
    overflow-y: auto; /* 모달 내용이 길어질 경우 스크롤 가능 */
}

.close {
    font-size: 24px;
    color: #333;
    cursor: pointer;
    float: right;
}

h2 {
    margin-top: 0;
}

.order-details p {
    margin: 10px 0;
}

.order-details strong {
    display: inline-block;
    width: 120px;
}

.related-products {
    margin-top: 20px;
}

.related-products h3 {
    margin-top: 0;
}

.related-products .grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 두 개씩 배치 */
    gap: 20px;
}

.related-products .grid-item {
    display: flex;
    align-items: center;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    background-color: #f9f9f9;
}

.related-products img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    margin-right: 10px;
    border-radius: 4px;
}

.product-info {
    flex: 1;
}

.review-stars {
    font-size: 20px;
    color: #ffcc00;
    margin-bottom: 8px;
}


/*---나의 정보관리 css---*/
/* 프로필 정보 카드 스타일 */
.profile-info {
    margin-bottom: 20px;
}

.profile-card {
    display: flex;
    align-items: center;
    padding: 15px;
    background: none;
    border-radius: 8px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    border: 1px solid #ffb3b3;
}

.profile-img {
    width: 162px;
    height: 162px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 15px;
    margin-bottom: 41px;
}

.profile-details p {
    margin: 5px 0;
}

/* 프로필 수정 섹션 스타일 */
.profile-edit {
    margin-top: 20px;
}



form label {
    margin-bottom: 5px;
    font-weight: bold;
}

form input {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.btn-submit {
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

.btn-submit:hover {
    background-color: #0056b3;
}




/* 포인트 잔여 수를 상단에 표시하는 스타일 */
.points-summary {
		width: 100%;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: end;
    padding-right: 40px;
}

.points-summary p {
    margin: 10px 0;
    font-size: 19px;
    color: #333;
}

.points-summary strong {
    color: #555;
}
.points-summary #miustPoints {
    color: red;
}

.points-summary span {
    font-weight: bold;
    color: #007bff; /* 원하는 색상으로 변경 가능 */
}





label {
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="password"] {
    margin-bottom: 15px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

p {
    margin-bottom: 20px;
}

.hidden {
    display: none;
}

.active {
    display: block; /* 또는 원하는 스타일로 설정 */
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
   <body>
    <div class="container">
        <!-- 사이드바 -->
			<nav class="sidebar">
			    <ul>
			        <li><a id="info-mainContent">메인</a></li>
			        <li>
			            <a class="toggle-btn">나의 정보관리</a>
			            <ul class="account-menu hidden">
			                <li><a id="info-management">회원정보 관리</a></li>
			                <li><a id="change-password">비밀번호 변경</a></li>
			                <li><a id="delete-account">회원 탈퇴</a></li>
			            </ul>
			        </li>
			        <li><a id="order-management">주문 관리</a></li>
			        <li class="benefits">
			            <a id="benefits" class="toggle-btn">혜택 관리</a>
			            <ul class="sub-menu hidden">
			                <li><a id="points">포인트</a></li>
			                <li><a id="coupons">쿠폰</a></li>
			            </ul>
			        </li>
			    </ul>
			</nav>


<!-- ======================= 나의 정보관리 <비밀번호변경> 영역 S ====================================-->   
<main class="main-content" id="change-password-content" style="display: none;">
    <section id="coupon-history" class="coupon-history" style="display: flex; flex-direction: column; margin: 27px;">
    <h2>비밀번호 변경</h2>
        <label for="current-password">현재 비밀번호:</label>
        <input type="password" id="current-password" name="current-password" required>
        
        <label for="new-password">새 비밀번호:</label>
        <input type="password" id="new-password" name="new-password" required>
        
        <label for="confirm-password">비밀번호 확인:</label>
        <input type="password" id="confirm-password" name="confirm-password" required>
        
        <button type="button" id="passwordModify">변경하기</button>
    </section>
</main>
<!-- ======================= 나의 정보관리 <비밀번호변경> 영역 E ====================================-->   

<!-- ======================= 나의 정보관리 <회원탈퇴> 영역 S ====================================-->  
<main class="main-content" id="delete-account-content" style="display: none;">
    <section id="coupon-history" class="coupon-history" style="display: flex; flex-direction: column; margin: 27px;">
    <h2>회원 탈퇴</h2>
    <p>회원 탈퇴는 복구할 수 없으니 신중히 결정해 주세요.</p>
        <label for="password">비밀번호 입력:</label>
        <input type="password" id="account_password" name="password" required>
        
        <button type="submit" id="account_deletion">회원 탈퇴</button>
    </section>
</main>
<!-- ======================= 나의 정보관리 <회원탈퇴> 영역 E ====================================--> 
 
<script>
$(document).on("click", "#change-password", function(){
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "none");
	$("#myInfoManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#delete-account-content").css("display", "none");
	$("#change-password-content").css("display", "block");
})
$(document).on("click", "#delete-account", function(){
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "none");
	$("#myInfoManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "block");
})

$(document).on("click", "#passwordModify", function(){
	
	let currentPwd = $("#current-password").val(); //기존 비밀번호
	let modifyPwd = $("#new-password").val(); //새 비밀번호
	let checkModifyPwd = $("#confirm-password").val(); //새 비밀번호 확인
	
	if(confirm("정말로 탈퇴를 진행하시겠습니까?")){
		
		if(currentPwd.trim() == "" && modifyPwd.trim() == "" && checkModifyPwd.trim() == ""){
			alert("비밀번호를 다시 입력해주세요.");
		}else{
			
			if(modifyPwd == checkModifyPwd){
				$.ajax({
					url:"${contextPath}/member/updatePassword.do",
					type:"post",
					data:{
						currentPwd: currentPwd,
						modifyPwd: modifyPwd
					},
					success:function(response){
						if(response == 0){
							alert("기존 비밀번호가 맞지 않습니다. 다시 입력해주세요.");
						}else{
							alert("비밀번호가 정상적으로 변경 되었습니다.");
						}
					},
					error:function(){
						
					}
						
					
				})		
			}else{
				alert("새 비밀번호가 일치하지않습니다. 다시 확인해주세요.");
			}
			
		}
	}
			
			
	
	
	
})

$(document).on("click", "#account_deletion", function(){
	let pwd = $("#account_password").val();
	if(confirm("정말로 탈퇴를 진행하시겠습니까?")){
		if(pwd.trim() == ""){
			alert("비밀번호를 다시 입력해주세요.")
		}else{
			$.ajax({
				url:"${contextPath}/member/accountDeletion.do",
				type:"post",
				data:{
					pwd: pwd,
				},
				success:function(response){
					if(response == 0){
						alert("비밀번호가 다릅니다. 다시 입력해주세요.");
					}else{
						alert("회원 탈퇴가 정상적으로 진행되었습니다. 그동안 이용해주셔서 감사합니다.");
						location.href="${contextPath}/";
					}
				},
				error:function(){
					
				}
			})
		}
	
	}
	
	
})



</script>      
        
 <!-- ===============================혜택 관리 <쿠폰> 영역 S =====================================-->       
<main class="main-content" id="couponContent" style="display: none;">
    <!-- 쿠폰 섹션 -->
  <section id="coupon-history" class="coupon-history">
  <h2>쿠폰 발급</h2>
  <div style="height: auto;">
      <div class="coupons-section">
      
      </div>            
  </div>
              
  <div style="display: flex;justify-content: center; margin: 5px; margin-top: 50px;">
      <ul class="couponUsagePagination">
      
      </ul>
  </div>
  </section>
  <section id="coupon-history" class="coupon-history">
  <h2>쿠폰 내역</h2>
	<div style="height: auto;">
      <table>
          <thead>
              <tr>
                  <th>쿠폰 번호</th>
                  <th>쿠폰명</th>
                  <th>사용 여부</th>
                  <th>발급일자</th>
                  <th>소멸일자</th>
                  <th>사용일자</th>
              </tr>
          </thead>
          <tbody id="couponBody">
              
          </tbody>
      </table>
  </div>
  <div style="display: flex;justify-content: center; margin: 5px; margin-bottom: 27px; margin-top: 50px;">
     <ul class="couponPagination">
     
     </ul>
 </div>
 </section>
</main>
 <!-- ===============================혜택 관리 <쿠폰> 영역 E =====================================-->  
 
  <!-- ===============================혜택 관리 <포인트> 영역 S =====================================-->  
<main class="main-content" id="pointConent" style="display: none;">
 <div class="points-summary">
					<p><strong>총 구매 적립 포인트 : </strong> <span id="totalPurchasePoints">0</span> P</p>
					<p><strong>총 리뷰 적립 포인트 : </strong> <span id="totalReviewPoints">0</span> P</p>
					<p><strong>차감된 포인트 : </strong> <span id="miustPoints">0</span> P</p>
					<p><strong>남은 포인트 : </strong> <span id="remainingPoints">0</span> P</p>
 </div>
<section id="coupon-history" class="coupon-history">
		<h2>구매 포인트 내역</h2>
    <div style="height: auto;">
     <table>
        <thead>
            <tr>
                <th>포인트 번호</th>
                <th>구매 상품</th>
                <th>포인트</th>
                <th>발급일</th>
                <th>차감일</th>
            </tr>
        </thead>
        <tbody id="pointBody">
            
        </tbody>
    </table>
    </div>
    <div style="display: flex;justify-content: center; margin: 5px; margin-top: 50px;">
        <ul class="pointPagination">
        
        </ul>
    </div>
</section> 
<section id="coupon-history" class="coupon-history">
		<h2>리뷰 포인트 내역</h2>
    <div style="height: auto;">
     <table>
        <thead>
            <tr>
                <th>포인트 번호</th>
                <th>상품이름</th>
                <th>포인트</th>
                <th>발급일</th>
                <th>만료일</th>
            </tr>
        </thead>
        <tbody id="reviewPointBody">
            
        </tbody>
    </table>
    </div>
    <div style="display: flex;justify-content: center; margin: 5px; margin-top: 50px;">
        <ul class="reviewPointPagination">
        
        </ul>
    </div>
</section>         
</main>
<!-- ===============================혜택 관리 <포인트> 영역 E =====================================-->  


<!-- ==============================메인 영역 S ====================================== -->
<main class="main-content" id="mainContent">
    <!-- 헤더 섹션 -->
    <div class="header">
        <div class="profile">
            <div class="avatar"></div>
            <span class="username"><strong id="userName"></strong>님 안녕하세요.</span>
        </div>
        <div class="points-coupons">
            <div class="points">
                <span>포인트</span>
                <span class="amount" id="myPoint"></span>
            </div>
            <div class="coupons">
                <span>쿠폰</span>
                <span class="amount" id="myCoupon"></span>
            </div>
        </div>
    </div>

    <!-- 주문 진행 상태 섹션 -->
    <section class="order-status-section">
        <h2>진행 중인 주문</h2>
        <div class="order-progress">
            <div class="step">
                <span class="circle" id="patmentWating">0</span>
                <span class="label">입금대기</span>
            </div>
            <div class="arrow">→</div>
            <div class="step">
                <span class="circle" id="paymentCompleted">0</span>
                <span class="label">결제완료</span>
            </div>
            <div class="arrow">→</div>
            <div class="step">
                <span class="circle" id="orderDelivery">0</span>
                <span class="label">상품준비중</span>
            </div>
            <div class="arrow">→</div>
            <div class="step">
                <span class="circle" id="orderShipping">0</span>
                <span class="label">배송중</span>
            </div>
            <div class="arrow">→</div>
            <div class="step">
                <span class="circle" id="orderCompleted">0</span>
                <span class="label">배송완료</span>
            </div>
            <div class="arrow">→</div>
            <div class="step">
                <span class="circle" id="completed">0</span>
                <span class="label">구매확정</span>
            </div>
        </div>
        <div class="order-summary">
            <div>취소 <span>0건</span></div>
            <div>교환 <span>0건</span></div>
            <div>반품 <span>0건</span></div>
        </div>
    </section>


    <!-- 포인트 및 쿠폰 내역 -->
    <section id="coupon-history" class="coupon-history">
        <h2>Review</h2>
         <!--================ 쿠폰내역 영역============= -->
        <div style="height: auto;">
            <table>
                <thead>
                    <tr>
                        <th style="width: 50px;">NO</th>
                        <th style="width: 350px;">CONTENT</th>
                        <th>NAME</th>
                        <th style="width: 141px;">REGISTRATION DATE</th>
                        <th>SCORE</th>
                    </tr>
                </thead>
                <tbody id="reviewBody">
                    
                </tbody>
            </table>
        </div>
        <div style="display: flex;justify-content: center; margin: 5px; margin-bottom: 27px; margin-top: 50px;">
            <ul class="reviewPagination">
            
            </ul>
        </div>         
    </section>
</main>
<!-- ============================== 메인 영역 E ====================================== -->

 
     
 <!-- ==============================주문 관리 영역 S ====================================== -->
   <main class="main-content" id="orderManagement" style="display: none;">
    <div class="search-section">
        <h2>기간 검색</h2>
        <form id="search-form">
        		<div class="preset-buttons">
                <button type="button" data-period="today" id="today">오늘</button>
                <button type="button" data-period="1month" id="1month">1개월</button>
                <button type="button" data-period="3months" id="3months">3개월</button>
                <button type="button" data-period="6months" id="6months">6개월</button>
            </div>
            <label for="start-date">시작일자:</label>
            <input type="date" id="start-date" name="start-date">
            <label for="end-date">종료일자:</label>
            <input type="date" id="end-date" name="end-date">
            <button type="button" id="searchInputDays">검색</button>
        </form>
    </div>

    <div class="order-list">
        <h2>주문 내역</h2> <pre>(상품을 클릭하여 주문의 상세 내역을 확인해보세요.)</pre>
        <div style="height: 100px;">
        <table>
            <thead>
                <tr>
                    <th>주문일자</th>
                    <th>결제일자</th>
                    <th>이미지</th>
                    <th>상품정보</th>
                    <th>물품</th>
                    <th>상품구매금액</th>
                    <th>주문처리상태</th>
                </tr>
            </thead>
            <!-- 주문 리스트 -->
            <tbody id="orderBodyList">
            
            </tbody>
        </table>
        <div style="display: flex;justify-content: center; margin: 5px;margin-top: 50px;align-items: center;">
        	<ul class="myOrderInfoPagination">
        	
					</ul>
      	</div>
        </div>
    </div>
</main>
<!-- ==============================주문 관리 영역 E ====================================== -->

<!-- ==============================나의 정보 관리 영역 S ====================================== -->
<main class="main-content" id="myInfoManagement" style="display: none;">
        <section class="profile-info">
            <h2>나의 회원정보</h2>
            <div class="profile-card" style="display: flex; flex-direction: column; width: 100%">
                <img src="<c:out value='${ loginUser.userPath }' default='${contextPath}/resources/images/defaultProfile.png' />" alt="프로필 사진" class="profile-img">
                <div class="profile-details" style="width: 80%; font-size: 19px;margin-bottom: 45px;">
                    <p><strong>이름 :&nbsp;&nbsp;</strong><strong id="usrNameInfo">${loginUser.userName}</strong></p>
                    <p><strong>닉네임 :&nbsp;&nbsp;</strong><strong id="nickNameInfo">${loginUser.nickName}</strong></p>
                    <p><strong>이메일 :&nbsp;&nbsp;</strong><strong id="emailInfo">${loginUser.email}</strong></p>
                    <p><strong>전화번호 :&nbsp;&nbsp;</strong><strong id="phoneInfo">${loginUser.phone}</strong></p>
                    <p><strong>생년월일 :&nbsp;&nbsp;</strong><strong id="dayOfBirthdayInfo">${loginUser.birthDate}</strong></p>      
                    <p><strong>주소 :&nbsp;&nbsp;</strong><strong id="addressInfo">${loginUser.streetAddress}&nbsp;${loginUser.address}&nbsp; ${loginUser.otherAddress}&nbsp;${loginUser.addressDatail}</strong></p>
                </div>
                <div style="width: 100%;display: flex;justify-content: flex-end;">
                   <button type="button" id="myInfoModify" style="border-radius: 21px;">정보 수정</button>                    
                </div>
            </div>
        </section>
        <section class="profile-edit" style="display: none;">
            <h2>회원정보 수정</h2>
            <form id="profileForm" style="display: flex;flex-direction: column;">
            		<label for="name">프로필:</label>(이미지를 클릭하세요)
            		<img src="<c:out value='${loginUser.userPath}' default='${contextPath}/resources/images/defaultProfile.png'/>" alt="프로필 사진" id="profileChange" style="cursor: pointer;" class="profile-img" onclick="$('#profileImgFile').click();">
            		<input type="file" name="proFile" id="profileImgFile" value="" style="display: none;" accept="image/*">
            		
                <label for="name">이름:</label>
                <input type="text" name="userName" value="${loginUser.userName}" required>
                
                <label for="name">닉네임:</label>
                <input type="text" name="nickName" value="${loginUser.nickName}" required>
                
                <label for="email">이메일:</label>
                <div>
                		<input type="text" name="mail" required>
				            <span class="a">@</span>
				            <input type="text" name="email" required>
                		<select name="mailslc" id="mailSelect">
				                <option id="self" value="">직접입력</option>
				                <option value="naver.com">naver.com</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="daum.com">daum.com</option>
				                <option value="yahoo.com">yahoo.com</option>
				            </select>
				            <button type="button" id="myBtn2" style="border-radius: 22px;">인증하기</button>
                </div>
                <label for="phone">전화번호:</label>
                <input type="tel" name="phone" value="${loginUser.phone}" placeholder="예)010-0000-0000" required>
                
                <label for="name">생년월일:</label>
                <input type="text" name="birthDate" value="${loginUser.birthDate}" placeholder="예)00/00/00" required>
                
                <label for="name">주소:</label>
                <div>
                	<div>
		                <input type="text" id="sample6_postcode" placeholder="우편번호"  style="width: 470px" name="streetAddress" value="${loginUser.streetAddress}" required>
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 130px"><br>
									</div>
									<div>
										<input type="text" style="width: 604px;" id="sample6_address" placeholder="주소" name="address" value="${loginUser.address}" required><br>
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 400px;" name="addressDatail" value="${loginUser.addressDatail}" required>
										<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width: 200px;" name="otherAddress" value="${loginUser.otherAddress}">
									</div>
                </div>
                <div style="width: 100%; display: flex;justify-content: flex-end;">
	               <button type="button" style="width: 104px;border-radius: 22px;" onclick="handlePrompt()">수정하기</button>
                </div>
            </form>
        </section>
    </main>
<!-- ==============================나의 정보 관리 영역 E ====================================== -->


    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

<!-- 이메일 인증 모달 -->
 <!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">이메일 인증</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      	
      	<div style="margin:120px">
		    <div style="margin-bottom: 10px">
		        <h6 style="width: 305px; ">입력하신 이메일로 인증번호가 발송되었습니다.<br> 아래 입력칸에 인증 번호를 입력해주세요.<br> (시간이 소요될 수 있습니다. 잠시만 기다려주세요..)</h6>
		    </div>
		    <div style="text-align: center;">
		        <input type="text" id="checkMessage" value="">
				    <button id="checkBtn">확인</button>
		    </div>
		</div>
		
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
    
  </div>
</div>

<!-- 주문관리 - 주문상세보기 모달 -->
<div id="myModal" class="modal">
			<!-- 주문 상품 상세보기 모달 -->
     <div class="modal-content">
     	  <span class="close">&times;</span>
        <h2>주문 상세 정보</h2>
        <div class="order-details">
        
        </div>
        <div class="related-products">
            <h3>주문 상품</h3>
            <div class="grid-container">
            
            </div>
        </div>
    </div>
</div>

<script>
//모달 닫기 함수
function closeModal() {
    $('.modal').hide();
}

$(document).on("click", ".close", function(){
    closeModal();
});

$(window).on("click", function(event) {
    if ($(event.target).hasClass("modal")) {
        closeModal();
    }
});


$(document).ready(function() {
    $('.sidebar li > a').click(function(e) {
        e.preventDefault(); 
        
        var $submenu = $(this).next('ul');
        
        if ($submenu.length) {
            if ($submenu.hasClass('hidden')) {
                $submenu.removeClass('hidden').addClass('active');
            } else {
                $submenu.removeClass('active').addClass('hidden');
            }
        }
    });
});



$(document).on("click", "#points", function(){
	$("#myInfoManagement").css("display", "none");
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "block");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "none");
})
$(document).on("click", "#coupons", function(){
	$("#myInfoManagement").css("display", "none");
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#couponContent").css("display", "block");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "none");
	
})

//리뷰 불러오기
function reviewLoad(page){
	$.ajax({
		url:"${contextPath}/product/selectMyReview.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			if(response.reviewList.length > 0){
				let reviewList = response.reviewList;
				let pi = response.pi;
				
				let html = '';
				reviewList.forEach(function(item){
					let rating = item.rating == 5 ? "★★★★★" : item.rating == 4 ? "★★★★☆" : item.rating == 3 ? "★★★☆☆" : item.rating == 2 ? "★★☆☆☆" : "★☆☆☆☆";
					html += '<tr style="cursor:pointer;" onclick="productDetail(' + item.productNo + ')">'
					html += '			<td>' + item.reviewNo + '</td>'
					html += '			<td>' + item.reviewContent + '</td>'
					html += '			<td>' + item.nickName + '</td>'
					html += '			<td>' + item.reviewPostDt + '</td>'
					html += '			<td class="review-stars">' + rating + '</td>'
					html += '</tr>'					
				})
				
				
				$("#reviewBody").html(html);
				reviewPagination(pi);
			}else{
				$("#reviewBody").html("<tr><td colspan='5' style='text-align:center;'>작성하신 리뷰 목록이 없습니다.</td></tr>");
			}

		},
		error:function(){
			
		}
		
	})
}

//프로필이미지 변경
$(document).ready(function(){
	
	$("#profileImgFile").on("change", function(evt){
	
		if(this.files.length != 0){ //현재 선택한 파일이 있을 경우
			
			let formData = new FormData();
			formData.append("uploadFile", this.files[0]);
			
			$.ajax({
				url:"${contextPath}/member/userModifyProfileImg.do",
				type:"post",
				data:formData,
				processData:false,
				contentType:false,
				success:function(result){
					if(result.success == true){
						let profile = result.memberDto.userPath;
						
						$("#profileChange").prop("src", profile);
						
					}
					
						
				},
				error:function(){
						console.log("프로필이미지 변경용 ajax 통신 실패");
				}
				
			})
			
		}
		
	})
})


//수정하기 버튼 클릭시
function handlePrompt(){
	
	 let passwordCheck = prompt('비밀번호를 입력하세요.');
	 
	 $.ajax({
		 url:"${contextPath}/member/checkPassword.do",
		 type:"post",
		 data:{passwordCheck:passwordCheck},
		 success:function(response){
			 
			 if(response == 1){
				 
				 $.ajax({
					 url:"${contextPath}/member/userModifyProfile.do",
					 type:"post",
					 data:$("#profileForm").serialize(),
					 success:function(response){
						 alert("정보 수정이 완료되었습니다.");			
						 
						 
					 },
					 error:function(){
						 console.log("ajax 회원 정보수정 실패");
					 }
					 
				 })
				 
			 }else{
				 alert("비밀번호가 틀립니다. 다시입력해주세요.");
			 }
			 
		 },
		 error:function(){
			 
		 }
	 })
	 
}


//정보 수정 버튼 클릭시 
$(document).on("click", "#myInfoModify", function(){
	
	$(".profile-edit").css("display", "block");
	
	let emails = "${loginUser.email}";
	let arr = emails.split("@");
	let mail = arr[0];
	let email = arr[1];
	$("input[type='text'][name='mail']").val(mail);
	$("input[type='text'][name='email']").val(email);
	
})

$(document).on("click", "#info-management", function(){
	$("#myInfoManagement").css("display", "block");
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "none");
})


$(document).on("click", "#today, #1month, #3months, #6months", function(){
	//let buttonId = $(this).attr('id');
	let type = $(this).data("period");
	
	$("#today, #1month, #3months, #6months").css("background", "");
	$(this).css("background", "#ff8194");

	
	dayButton(type, 1);
	
})

$(document).on("click", "#searchInputDays", function(){
	
	daySearch(1);
	
})

//버튼날짜
function dayButton(type, page){
	
	$.ajax({
		url:"${contextPath}/pay/selectDays.do",
		type:"get",
		data:{
			type:type,
			page:page
		},
		success:function(response){
			//console.log(JSON.stringify(response));
			let orderList = response.orderList;
			
			let html = '';
			orderList.forEach(function(item){
				let items = [item.orderNo, item.orderProductNo];
				let orderPrice = parseFloat(item.orderProductAmount) * parseFloat(item.productPrice);
				let orderState = item.orderState == "1" ? "결제완료" :  item.orderState == "2" ? "배송준비중" : item.orderState == "3" ? "배송중" : "배송완료"; 
				html += '<tr  id="openModalBtn" onclick="openModal(\'' + items + '\')">';
				html += '    <td>' + item.orderDate + '</td>';
				html += '    <td>' + item.paymentDate + '</td>';
				html += '    <td><img src="${contextPath}' + item.productThumbnailPath + '" alt="상품 이미지"></td>';
				html += '    <td>' + item.orderProductName.concat( item.orderType > 1 ? " 외 " + (item.orderType-1) + "개" : "" ) + '</td>';
				html += '    <td>' + item.orderType + '</td>';
				html += '    <td>' + item.orderTotalPrice + '</td>';
				html += '    <td>' + orderState + '</td>';
				html += '</tr>';
				
			})
			if(orderList.length > 0){
				$("#orderBodyList").html(html);				
			}else{
				$("#orderBodyList").html("<tr><td colspan='7' style='text-align:center;'>검색 결과가 없습니다.</td></tr>");
			}
			
			dayButtonPagination(type, response.pi);
			
			
			
			
		},
		error:function(){
			
		}
	})
	
}

//버튼 검색
function daySearch(page){
	
	let startDate = $("#start-date").val();
	let endDate = $("#end-date").val();
	$.ajax({
		url:"${contextPath}/pay/selectDays.do",
		type:"get",
		data:{
			startDate:startDate,
			endDate:endDate,
			page:page
		},
		success:function(response){
			console.log(JSON.stringify(response));
			
			let orderList = response.orderList;
			
			let html = '';
			orderList.forEach(function(item){
				let items = [item.orderNo, item.orderProductNo];
				let orderPrice = parseFloat(item.orderProductAmount) * parseFloat(item.productPrice);
				let orderState = item.orderState == "1" ? "결제완료" :  item.orderState == "2" ? "배송준비중" : item.orderState == "3" ? "배송중" : "배송완료"; 
				html += '<tr  id="openModalBtn" onclick="openModal(\'' + items + '\')">';
				html += '    <td>' + item.orderDate + '</td>';
				html += '    <td>' + item.paymentDate + '</td>';
				html += '    <td><img src="${contextPath}' + item.productThumbnailPath + '" alt="상품 이미지"></td>';
				html += '    <td>' + item.orderProductName.concat( item.orderType > 1 ? " 외 " + (item.orderType-1) + "개" : "" ) + '</td>';
				html += '    <td>' + item.orderType + '</td>';
				html += '    <td>' + item.orderTotalPrice + '</td>';
				html += '    <td>' + orderState + '</td>';
				html += '</tr>';
				
			})
			if(orderList.length > 0){
				$("#orderBodyList").html(html);				
			}else{
				$("#orderBodyList").html("<tr><td colspan='7' style='text-align:center;'>검색 결과가 없습니다.</td></tr>");
			}
			

			daySearchPagination(response.pi);
			
			
		},
		error:function(){
			
		}
	})
	
}




$(document).on("click", "#order-management", function(){
	
	$("#mainContent").css("display", "none");
	$("#orderManagement").css("display", "block");
	$("#myInfoManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "none");
	
	myOrderInfo(1);
})


function myOrderInfo(page){
	
	$.ajax({
		url:"${contextPath}/pay/selectMyOrderInfo.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			let orderList = response.orderList;
			
			let html = '';
			orderList.forEach(function(item){
				let items = [item.orderNo, item.orderProductNo];
				let orderPrice = parseFloat(item.orderProductAmount) * parseFloat(item.productPrice);
				let orderState = item.orderState == "1" ? "결제완료" :  item.orderState == "2" ? "배송준비중" : item.orderState == "3" ? "배송중" : "배송완료"; 
				html += '<tr  id="openModalBtn" onclick="openModal(\'' + items + '\')">';
				html += '    <td>' + item.orderDate + '</td>';
				html += '    <td>' + item.paymentDate + '</td>';
				html += '    <td><img src="${contextPath}' + item.productThumbnailPath + '" alt="상품 이미지"></td>';
				html += '    <td>' + item.orderProductName.concat( item.orderType > 1 ? " 외 " + (item.orderType-1) + "개" : "" ) + '</td>';
				html += '    <td>' + item.orderType + '</td>';
				html += '    <td>' + item.orderTotalPrice + '</td>';
				html += '    <td>' + orderState + '</td>';
				html += '</tr>';
				
			})
			
			if(orderList.length > 0){
				$("#orderBodyList").html(html);				
			}else{
				$("#orderBodyList").html("<tr><td colspan='7' style='text-align:center;'>주문하신 상품 내역이 없습니다.</td></tr>");
			}
			
			myOrderInfoPagination(response.pi);
			
			
		},
		error:function(){
			
		}
	})
	
}


//모달 열기 함수
function openModal(items) {
	
  document.getElementById("myModal").style.display = "block";

  let arrOrder = items.toString().split(",");
  
  $.ajax({
  	url:"${contextPath}/pay/selectOrderDetail.do",
  	type:"get",
  	data:{
				orderNo:arrOrder[0],
				orderProductNo:arrOrder[1]
			},
			success: function(response) {
			    let order = response.order;

			    //alert(JSON.stringify(order)); response가 object로 출력됬을때 

			    let detailHtml = '';

			    // 주문 번호 추가
			    detailHtml += '<p><strong>주문 번호:</strong> ' + order[0].orderNo + '</p>';

			    // 주문자 정보 추가
			    detailHtml += '<p><strong>주문자 이름:</strong> ' + order[0].orderName + '</p>';
			    detailHtml += '<p><strong>주문자 연락처:</strong> ' + (order[0].orerPhone == null ? "없음" : order[0].orerPhone) + '</p>';
			    detailHtml += '<p><strong>주문자 이메일:</strong> ' + (order[0].orderEmail == null ? "없음" : order[0].orderEmail) + '</p>';
			    detailHtml += '<p><strong>배송 주소:</strong> ' + order[0].orderDetail  + '</p>';
			    detailHtml += '<p><strong>배송시 요청사항:</strong> ' + (order[0].orderRequest == null ? "없음" : order[0].orderRequest)  + '</p>';

			    // 주문 상세 정보를 .order-details 요소에 삽입
			    $(".order-details").html(detailHtml);

			    let html = '';
			    // 다른 상품 목록 추가
			    order.forEach(function(item){
			    	  	html += '<div class="grid-item">';
				        html += '    <img src="${contextPath}' + item.productThumbnailPath + '">';
				        html += '    <div class="product-info">';
				        html += '        <p><strong>상품명: &nbsp;</strong>' + item.orderProductName + '</p>';
				        html += '        <p><strong>수량: &nbsp;</strong>' + (item.orderProductAmount + "개") + '</p>';
				        html += '        <p><strong>가격: &nbsp;</strong>' + (parseFloat(item.productPrice) * item.orderProductAmount).toLocaleString('ko-KR') + '</p>';
				        html += '    </div>';
				        html += '</div>';
			    })
			      
			    

			    $(".grid-container").html(html);
			    
		},
  	error:function(){
  		
  	}
  	
  })
  
}




$(document).on("click", "#info-mainContent", function(){
	
	$("#mainContent").css("display", "block");
	$("#orderManagement").css("display", "none");
	$("#myInfoManagement").css("display", "none");
	$("#couponContent").css("display", "none");
	$("#pointConent").css("display", "none");
	$("#change-password-content").css("display", "none");
	$("#delete-account-content").css("display", "none");
	
	
})



$(document).ready(function(){
	
	$.ajax({
		url:"${contextPath}/pay/selectMyPoint.do",
		type:"get",
		success:function(response){
			
			let earnPoint = response.earnPoint;
			let reviewPoint = response.reviewWriterPoint;
      let PointMinusAmount = response.PointMinusAmount;
      let sumPoint = (earnPoint + reviewPoint) - PointMinusAmount;
      let point = sumPoint.toString().replace(/[,-]/g, ''); 
      
      let coupon = response.couponList;
			
      //메인 포인트 출력
      let netPoint = parseFloat(point).toLocaleString('ko-KR');
			$("#myPoint").html(point == 0 ? 0 : netPoint + "P");
			$("#myCoupon").html(coupon.length == 0 ? 0 : coupon.length.toString() + "개");
			
			//혜택관리 - 포인트 출력
			$("#totalPurchasePoints").html(earnPoint.toLocaleString('ko-KR') == "0" ? "0" : earnPoint.toLocaleString('ko-KR')); //총 구매 적립 포인트
			$("#totalReviewPoints").html(reviewPoint.toLocaleString('ko-KR') == "0" ? "0" : reviewPoint.toLocaleString('ko-KR')); // 총 리뷰 적립 포인트
			$("#miustPoints").html(PointMinusAmount.toLocaleString('ko-KR') == "0" ? "0" : PointMinusAmount.toLocaleString('ko-KR')); // 남은 포인트
			$("#remainingPoints").html(netPoint == "0" ? "0" : netPoint); // 남은 포인트
			
			
			
			if(response.orderMap){
				$("#patmentWating").html();
				$("#paymentCompleted").html(response.orderMap.PAYMENT_COMPLETED);
				$("#orderDelivery").html(response.orderMap.ORDER_DELIVERY);
				$("#orderShipping").html(response.orderMap.ORDER_SHIPPING);
				$("#orderCompleted").html(response.orderMap.ORDER_COMPLETED);
				$("#completed").html();
			}
			
			
			
		},
		error:function(){
			
		}
	})
	
})



$(document).ready(function(){
	couponloadPage(1);
	pointloadPage(1);
	couponUsageloadPage(1);
	reviewLoad(1);
	reviewPointloadPage(1);
})

function reviewPointloadPage(page){
	
	$.ajax({
		url:"${contextPath}/pay/selectMyPage.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			if(response.pointReviewList.length > 0){
				
				let pointReviewList = response.pointReviewList; //쿠폰리스트
				let reviewPi = response.reviewPi;
				
				let rPointHtml = '';
				pointReviewList.forEach(function(item){
					
				 rPointHtml += '<tr style="cursor:pointer;" onclick="productDetail(' + item.productNo + ')">';
				rPointHtml += '    <td>' + item.pointNo + '</td>';
				rPointHtml += '    <td>' + (item.proName == null ? "" : item.proName) + '</td>';
				rPointHtml += '		<td style="color:blue;">' + "+".concat(item.reviewWriterPoint.toLocaleString('ko-KR') + "P") + '</td>';
				rPointHtml += '    <td>' + (item.pointIssueDt == null ? "" : item.pointIssueDt) + '</td>';
				rPointHtml += '    <td>' + item.pointExpiryDt + '</td>';
				rPointHtml += '</tr>';
				
				})
				
				
				$("#reviewPointBody").html(rPointHtml);
				reviewPointPagination(reviewPi);				
			}else{
				$("#reviewPointBody").html("<tr><td colspan='5' style='text-align:center;'>적립한 리뷰 포인트 내역이 없습니다.</td></tr>");
			}
			
		},
		error:function(){
			
		}
		
	})
}
function productDetail(no){
	location.href="${contextPath}/product/detail.page?productNo=" + no;
}

function couponUsageloadPage(page){
	
	$.ajax({
		url:"${contextPath}/pay/selectMyPage.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			let couponList = response.couponList; //쿠폰리스트
			let couponUsagePi = response.couponUsagePi;
			
			html = '';
			couponList.forEach(function(item){
				let couponNo = (item.couponSerialNumber == "CPW001" ? "10% 할인" : "");
				let couponName = (item.couponSerialNumber == "CPW001" ? "가입축하쿠폰" : "");
				html += '<div class="coupon">';
				html += '    <div class="coupon-title">' + couponNo + '</div>';
				html += '    <div class="coupon-description">' + couponName + '</div>';
				html += '    <button class="coupon-button ' + (item.couponIssueDt != null ? "disabled" : "active") + '">' + (item.couponIssueDt != null ? "발급" : "미발급") + '</button>';
				html += '</div>';
			})
			
			if(couponList.length > 0){
				$(".coupons-section").html(html);
				renderCouponUsagePagination(couponUsagePi);								
			}
		
			
		},
		error:function(){
			
		}
		
	})
}


function couponloadPage(page){
	$.ajax({
		url:"${contextPath}/pay/selectMyPage.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			let couponList = response.couponList; //쿠폰리스트
			let couponPi = response.couponPi;
			let pointList = response.pointList; //포인트리스트
			let pointPi = response.pointPi;
			let userName = response.userName; //이름
			
			$("#userName").html(userName);
			
			
			couponHtml = '';
			couponList.forEach(function(item){
				couponHtml += '<tr>';
				couponHtml += '    <td>' + item.couponSerialNumber + '</td>';
				couponHtml += '    <td>' + item.couponName + '</td>';
				couponHtml += '    <td>' + (item.couponStatus == "Y" ? "미사용" : "사용") + '</td>';
				couponHtml += '    <td>' + item.couponIssueDt + '</td>';
				couponHtml += '    <td>' + item.couponExprityDt + '</td>';
				couponHtml += '    <td>' + (item.couponUsageDt == null ? "" : item.couponUsageDt) + '</td>';
				couponHtml += '</tr>';				
			})
			if(couponList.length > 0){
				$("#couponBody").html(couponHtml);
				renderCouponPagination(couponPi);				
			}else{
				$("#couponBody").html("<tr><td colspan='6' style='text-align:center;'>쿠폰 내역이 없습니다.</td></tr>");
			}
			
		},
		error:function(){
			
		}
		
	})
}


function pointloadPage(page){
	
	$.ajax({
		url:"${contextPath}/pay/selectMyPage.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			let pointList = response.pointList; //포인트리스트
			let pointPi = response.pointPi;
			let userName = response.userName; //이름
			
			pointHtml = '';
			pointList.forEach(function(item){
				
			pointHtml += '<tr>';
			pointHtml += '    <td>' + item.pointNo + '</td>';
			pointHtml += '    <td>' + (item.proName == null ? "" : item.proName) + '</td>';
			
			if(item.pointIssueDt != null){
				pointHtml += '    <td style="color:blue;">' + "+".concat(item.earnPoint.toLocaleString('ko-KR') + "P") + '</td>';
			}else{
				pointHtml += '    <td style="color:red;">' + "-".concat(item.earnPoint.toLocaleString('ko-KR') + "P") + '</td>';
			}
			
			pointHtml += '    <td>' + (item.pointIssueDt == null ? "" : item.pointIssueDt) + '</td>';
			pointHtml += '    <td>' + (item.pointUsageDt == null ? "" : item.pointUsageDt) + '</td>';
			pointHtml += '</tr>';
			})
			
			if(pointList.length > 0){
				$("#pointBody").html(pointHtml);
				renderPointPagination(pointPi);				
			}else{
				$("#pointBody").html("<tr><td colspan='5' style='text-align:center;'>구매하신 포인트 내역이 없습니다.</td></tr>");

			}
			
		},
		error:function(){
			
		}
		
	})
}

function renderCouponUsagePagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='renderCouponUsagePagination(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='renderCouponUsagePagination(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='renderCouponUsagePagination(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.couponUsagePagination').html("");
       $('.couponUsagePagination').append(html);
		}else{
			$('.couponUsagePagination').html("");
		}
   
}

function renderCouponPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='couponloadPage(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='couponloadPage(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='couponloadPage(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.couponPagination').html("");
       $('.couponPagination').append(html);
		}else{
			$('.couponPagination').html("");
		}
   
}


function renderPointPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='pointloadPage(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='pointloadPage(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='pointloadPage(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.pointPagination').html("");
       $('.pointPagination').append(html);
		}else{
			$('.pointPagination').html("");
		}
   
}


function myOrderInfoPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='myOrderInfo(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='myOrderInfo(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='myOrderInfo(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.myOrderInfoPagination').html(html);
		}else{
			$('.myOrderInfoPagination').html("");
		}
   
}

function dayButtonPagination(type, pi) {
    var html = '';
    if (pi.listCount !== 0) {
        
        // Previous button
        if (pi.currentPage === 1) {
            html += '<button class="page bt" disabled>이전</button>';
        } else {
            html += '<button class="page bt" onclick="dayButton(\'' + type + '\', ' + (pi.currentPage - 1) + ')">이전</button>';
        }
        
        // Page number buttons
        for (var i = pi.startPage; i <= pi.endPage; i++) {
            if (i === pi.currentPage) {
                html += '<button class="page" disabled active>' + i + '</button>';
            } else {
                html += '<button class="page" onclick="dayButton(\'' + type + '\', ' + i + ')">' + i + '</button>';
            }
        }
        
        // Next button
        if (pi.currentPage === pi.maxPage) {
            html += '<button class="page bt" disabled>다음</button>';
        } else {
            html += '<button class="page bt" onclick="dayButton(\'' + type + '\', ' + (pi.currentPage + 1) + ')">다음</button>';
        }
        
        $('.myOrderInfoPagination').html(html);
    } else {
        $('.myOrderInfoPagination').html('');
    }
}

function daySearchPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='daySearch(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='daySearch(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='daySearch(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.myOrderInfoPagination').html(html);
		}else{
			$('.myOrderInfoPagination').html("");
		}
   
}

function reviewPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='reviewLoad(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='reviewLoad(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='reviewLoad(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.reviewPagination').html(html);
		}else{
			$('.reviewPagination').html("");
		}
   
}

function reviewPointPagination(pi) {
    let html = '';
		if(pi.listCount != 0){
			
       if (pi.currentPage == 1) {
           html += "<button class='page bt' disabled>이전</button>";
       } else {
           html += "<button class='page bt' onclick='reviewPointloadPage(" + (pi.currentPage - 1) + ")'>이전</button>";
       }

       // 페이지 번호 버튼 렌더링
       for (let i = pi.startPage; i <= pi.endPage; i++) {
           if (i == pi.currentPage) {
               html += '<button class="page" disabled active>' + (i) + '</button>';
           } else {
               html += "<button class='page'" + (pi.currentPage == i ? "disabled active" : "")  + " onclick='reviewPointloadPage(" + i + ")'>" + (i) + "</button>";
           }
       }

       // Next 버튼 렌더링
       if (pi.currentPage == pi.maxPage) {
           html += "<button class='page bt' disabled>다음</button>";
       } else {
           html +=  "<button class='page bt' onclick='reviewPointloadPage(" + (pi.currentPage + 1) + ")'>다음</button>";
       }

       $('.reviewPointPagination').html(html);
		}else{
			$('.reviewPointPagination').html("");
		}
   
}

</script>
<!-- ------------------------------------이메일 인증 스크립트------------------------------ -->
<script>

$(document).on("change", "#mailSelect", function() {
	
    var selectedValue = $(this).val();
    
    $("input[type='text'][name='email']").val(selectedValue);
    
    var selectedOption = $(this).find("option:selected");
    
    if (selectedOption.attr("id") === "self") {
    	$("input[type='text'][name='email']").focus();
    }
});


$(document).on("click", "#myBtn2", function(event){
	
	event.preventDefault();
  event.stopPropagation();
	
	
	var mail = $("input[type='text'][name='mail']").val().trim();
  var email = $("input[type='text'][name='email']").val().trim();
  var mails = mail.concat("@" + email).trim();
  //@뒤에 글자사이에 . 이 있는지 없는 확인 정규식
	var regex = /^(\w+\.)+\w+$/;
	
	if( mail.length != 0 && email.length !== 0 && regex.test(email) ){
		$("#myModal2").modal({backdrop: false});
		
		$.ajax({
			url:"${contextPath}/mail/mailSend.do",
			type:"post",
			data:"mail=" + mails + "&distinction=sign",
			success:function(response){
				console.log("ajax통신 성공");
			},
			error:function(request){
				console.log("ajax통신 오류");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n");
			}
		})
		
	}else{
		alert("이메일 형식에 맞지 않습니다. 다시 입력해주세요.");
	}

})



$(document).on("click", "#checkBtn", function(){
		
		var message = $("#checkMessage").val();
		console.log(message);
		
		$.ajax({
			url:"${contextPath}/mail/mailCheck.do",
			type:"get",
			data:{
				userNumber:message
			},
			success:function(response){
				console.log("response = " + response);
				if(response == true){
					 $("input[type='text'][name='mail']").attr("readonly", "true");
					 $("input[type='text'][name='email']").attr("readonly", "true");
					 $("#mailSelect").attr("disabled", "true");
					 alert("이메일 인증이 완료되었습니다.");
					 $("#myModal2").modal('hide');
					 $("#but4").css("disabled", "block");
					 
				}else{
					alert("인증 번호가 틀립니다. 다시 입력해주세요.");
				}
				
			},
			error:function(){
				console.log("ajax통신 오류");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		})
	
	
})
</script>
 <!-- ---------------------------------------------------------------------------------- -->
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

</html>