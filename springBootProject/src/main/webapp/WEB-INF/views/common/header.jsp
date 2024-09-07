<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="${ contextPath }/resources/css/common.css" rel="stylesheet">

<script src="${ contextPath }/resources/alertify/js/alertify.min.js"></script>
<link href="${ contextPath }/resources/alertify/css/alertify.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/alertify/css/default.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/alertify/css/semantic.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

<style>
body *{
  font-family: "Hi Melody", sans-serif;
  font-weight: 400;
  font-style: normal;
}
#header_1_right a{color: gray;}

#header_1_center {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}
#header_1_center input{border: 0px;}

#header_1_center .search-container {
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 25px;
    overflow: hidden;
    padding-right: 10px;
    
}

#header_1_center .search-select {
    border: none;
    padding: 10px;
    margin-left: 17px;
    width: 100px;
}

#svgDiv svg{cursor: pointer;}
#header{
    position: sticky;
    top: 0px;
    padding: 5px;
    z-index: 10;
    background-color: white;
    height: 217px;
    width: 100%;
}

body {
    font-family: Arial, sans-serif;
}

/* 모달 배경 */
.modal-backdrop {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 999;
}

/* 모달 창 */
.modals {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 87%;
    max-width: 566px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    z-index: 1000;
    padding: 8px;
}


/* 모달 내용 */
.modal-contents {
    padding: 20px;
    position: relative;
}
.modal-contents h2{
    align-items: center;
    display: flex;
    justify-content: center;
}

/* 닫기 버튼 */
.close {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
}
</style>
</head>
<body>

<script>
$(document).ready(function() {
    var alertMsg = "${alertMsg}";
    var historyBackYN = "${historyBackYN}";

    if (alertMsg !== "") { // 어떤 메세지 문구가 존재할 경우
        // 페이지 로드 시 모달 열기
        $('#welcomeModal').fadeIn();
        $('#modalBackdrop').fadeIn();

        // 모달 닫기
        $('.close, #modalBackdrop').on('click', function() {
            $('#welcomeModal').fadeOut();
            $('#modalBackdrop').fadeOut();
        });

        // 추가 조건: 히스토리 백 수행
        if (historyBackYN === "Y") {
            alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
            history.back();
        }
    }
    
});
</script>

<!-- 회원가입 환영메세지 모달창 -->
<!-- 모달 배경 -->
<div id="modalBackdrop" class="modal-backdrop"></div>

<!-- 모달 창 -->
<div id="welcomeModal" class="modals" style="height: 402px;">
    <div class="modal-contents">
        <span class="close">&times;</span>
        <div style="text-align: center;">
	        <h7>안녕하세요, ${NickName}님! 저희 Pet Connect에 회원 가입해 주셔서 감사합니다.<br> 
	         다양한 커뮤니티 활동과 유용한 정보를 통해 더 많은 즐거움을 경험하실 수 있습니다.  <br>
	         🎁 구매 시 [10% 할인] 쿠폰이 마이페이지에 준비되어 있습니다. 지금 확인해 보세요!</h7>
        </div>
				<div style="display: flex;flex-direction: column;align-items: center; justify-content: center; position: relative; margin-top: 31px;">
				<img style="width: 200px;" src="${contextPath}/resources/images/free-sticker-gift-box-6931311.png" alt="https://www.flaticon.com/kr/free-stickers/">
				<a href="https://www.flaticon.com/kr/free-stickers/" title="강아지 스티커">강아지 스티커 제작자: MrHamster - Flaticon</a>
				</div>	
    </div>
</div>

	<div id="header">
	
     <div id="header_1" style="height: 139px;">
         <div id="header_1_left" style="display: flex;justify-content: center;align-items: center;font-size: 39px;gap: 14px;">
            <b style="font-weight: bold;color: #f6d3ca;">Pet Connect</b> <b style="font-size: 43px;color: #9fb8cc;">#</b> 
         </div>
         <div id="header_1_center">
         		<div class="search-container" style="height: 57px;width: 700px;display: flex;flex-direction: row;justify-content: space-between;">
			        <select class="search-select">
			            <option value="all">통합검색</option>
			        </select>
			        <!-- 검색어영역 -->
			    	</div>
			    	
         </div>
         <div id="header_1_right" style="display: flex;flex-direction: column; font-size: 15px;">
         	<div>
         		<c:choose>
         			<c:when test="${ empty loginUser }">
		             <a href="${ contextPath }/member/signup.page">회원가입</a> | 
		             <a href="${ contextPath }/member/loginPage.page">로그인</a> |
		             <a href="${ contextPath }/member/loginPage.page">주문배송</a>
              </c:when>
              <c:otherwise>
		             <span>${ loginUser.nickName }님</span> &nbsp;|&nbsp;
		             <a href="${ contextPath }/member/myPage.page">마이페이지</a> |
		             <a href="${ contextPath }/member/signout.do">로그아웃</a> |
		             <a href="${ contextPath }/member/myPage.page">주문배송</a>
             	</c:otherwise>
            </c:choose>
          </div> 
          <div style="display: flex; height: 100%; width: 100%; flex-direction: row; justify-content: space-evenly; align-items: center;">
          	<svg onclick=" ${ not empty loginUser} ? location.href='${contextPath}/product/cart.page' : location.href='${contextPath}/member/loginPage.page'" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16" style="cursor: pointer;">
						  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l.5 2H5V5zM6 5v2h2V5zm3 0v2h2V5zm3 0v2h1.36l.5-2zm1.11 3H12v2h.61zM11 8H9v2h2zM8 8H6v2h2zM5 8H3.89l.5 2H5zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
						</svg>
						<svg onclick="location.href='${contextPath}/member/${ empty loginUser ? 'loginPage.page' : 'myPage.page'}'" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" style="cursor: pointer;">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
						</svg>
          </div> 
         </div>
     </div>
     <div>
         <ul style="display: flex; justify-content: space-around; list-style: none; font-size: 22px;">
             <li><a href="/">메인</a></li>           
             <li><a href="${ contextPath }/product/list.do">전체</a></li>
             <li><a href="${ contextPath }/product/catProductList.do">고양이</a></li>
             <li><a href="${ contextPath }/product/dogProductList.do">강아지</a></li>
             <li><a href="${ contextPath }/community/doranMain.page">Pet Connect</a></li>
         </ul>
     </div>
 </div>

 <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭시 보임) 
 <div class="modal fade" id="loginModal">
     <div class="modal-dialog modal-sm">
         <div class="modal-content">
         
         <div class="modal-header">
             <h4 class="modal-title">Login</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button> 
         </div>
         <form action="${ contextPath }/member/signin.do" method="post">
             
             <div class="modal-body">
                 <label for="userId" class="mr-sm-2">ID :</label>
                 <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId" required> <br>
                 <label for="userPwd" class="mr-sm-2">Password:</label>
                 <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd" required>
             </div>
             
             
             <div class="modal-footer">
                 <button type="submit" class="btn btn-primary">로그인</button>
                 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
             </div>
         </form>
         </div>
     </div>
 </div>
-->
<script>
$(document).ready(function(){
	//현재 페이지의 전체 URL
   let fullUrl = window.location.href;

    // 현재 페이지의 호스트 주소 (프로토콜 + 호스트)
   let baseUrl = window.location.origin;

    // 호스트 주소를 제외한 경로 부분
   let path = fullUrl.substring(baseUrl.length);
    
	let html = '';
    if(path.includes("/product/list.do") || path.includes("/product/dogProductList.do") || path.includes("/product/catProductList.do")){
			html += '<input type="text" id="searchProduct" class="search-input" placeholder="검색어를 입력하세요" style="width: 500px; height: 40px">'
    }else{
			html += '<input type="text" id="allProductSearch" class="search-input" placeholder="검색어를 입력하세요" style="width: 500px; height: 40px">'
    }
    $(html).insertAfter(".search-select");
    console.log(path == "/product/list.do" || path == "/product/dogProductList.do" || path == "/product/dogProductList.do" );
    
    
})

$(document).on("keyup", "#allProductSearch", function(ev) {
    let search = $(this).val().trim().replace(/[,.]/g, '');
    if (ev.key === "Enter") {
		    
        location.href = "${contextPath}/product/allProductSearch.do?search=" + search;
       
    }
});
</script>








</body>
</html>