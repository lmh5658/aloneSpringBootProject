<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style>

body *{
  font-family: "Hi Melody", sans-serif;
  font-weight: 400;
  font-style: normal;
}
body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9; /* 조금 더 밝은 배경색 */
    color: #333;
}

header {
    background-color: #ff6f61;
    color: #fff;
    padding: 20px 0;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;
    z-index: 1000;
}

header img {
    height: 60px; /* 로고 크기를 줄여서 공간을 더 확보 */
    vertical-align: middle;
}

header h1 {
    margin: 10px 0;
    font-size: 2.2em; /* 제목 폰트 크기 조정 */
    font-weight: 700;
    letter-spacing: 1px; /* 제목에 약간의 글자 간격 추가 */
}

nav {
    background-color: #444; /* 다크 그레이 색상으로 변경 */
    color: #fff;
    padding: 15px 0;
    text-align: center;
    position: sticky;
    top: 0;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

nav a {
    color: #fff;
    margin: 0 20px; /* 링크 사이에 여백을 더 추가 */
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease, transform 0.3s ease; /* 링크에 스케일 효과 추가 */
}

nav a:hover {
    color: #ff6f61;
    text-decoration: underline;
    transform: scale(1.1); /* 호버 시 링크 확대 효과 */
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 20px auto;
}

.banner {
    background: url('dog-banner.jpg') no-repeat center center;
    background-size: cover;
    height: 320px; /* 배너 높이를 약간 증가 */
    text-align: center;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 3em;
    font-weight: 700;
    border-radius: 15px; /* 배너의 모서리를 둥글게 */
    margin-bottom: 40px; /* 배너 아래 여백 추가 */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 그림자 강도를 증가 */
    overflow: hidden; /* 배너 이미지가 벗어나지 않도록 */
}

.section {
    padding: 40px 20px; /* 여백을 상하로 추가 */
    background: #fff;
    border-radius: 12px; /* 섹션의 모서리를 둥글게 */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* 그림자 강도를 증가 */
    margin-bottom: 40px; /* 섹션 간 여백을 더 추가 */
}

.section h2 {
    font-size: 2.2em; /* 섹션 제목 폰트 크기 조정 */
    border-bottom: 4px solid #ff6f61;
    padding-bottom: 12px; /* 제목 아래 여백 증가 */
    margin-bottom: 20px;
    color: #ff6f61;
    font-weight: 700;
    text-transform: uppercase; /* 제목 대문자로 변환 */
}

.posts h3, .gallery h3 {
    font-size: 1.8em; /* 제목 폰트 크기 조정 */
    margin-bottom: 15px;
    color: #333;
}

.posts p, .gallery p {
    font-size: 1.2em; /* 본문 폰트 크기 증가 */
    line-height: 1.8; /* 줄 간격 증가 */
    margin-bottom: 20px;
    color: #555;
}

footer {
    background-color: #444; /* 다크 그레이 색상으로 변경 */
    color: #fff;
    text-align: center;
    padding: 20px;
    border-top: 4px solid #ff6f61;
    box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
}

footer p {
    margin: 0;
    font-size: 0.9em;
}
.modalLogin{cursor: pointer;}
</style>
</head>
<body>


  	<header id="home">
        <img src="dog-logo.png" alt="강아지 커뮤니티 로고">
        <h1>도란도란</h1>
    </header>
    <nav style="display: flex; justify-content: space-between;">
    		<div style="display: flex;width: 100%; justify-content: center;margin-left: 104px;">
	        <a href="${contextPath}/">도란으로</a>
	        <a href="${contextPath}/community/doranMain.page">홈</a>
	        <a href="${contextPath}/community/board.do?type=J">자유게시판</a>
	        <a href="#profile">강아지 정보</a>
    		</div>
    		<div><img alt="" src=""></div>
        <div style="width: 129px;">
	        <c:choose>
	        	<c:when test="${ empty loginUser }">
	        		<a class="modalLogin" data-toggle="modal" data-target="#myModal">로그인</a>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#">${ loginUser.nickName }</a>
	        	</c:otherwise>
	        </c:choose>
        </div>
    </nav>
    
    
 <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭시 보임) -->
 <div class="modal fade" id="myModal">
     <div class="modal-dialog modal-sm">
         <div class="modal-content">
         <!-- Modal Header -->
         <div class="modal-header">
             <h4 class="modal-title">Login</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button> 
         </div>

         <form action="${ contextPath }/member/signin.do" method="post">
             <!-- Modal Body -->
             <div class="modal-body">
                 <label for="userId" class="mr-sm-2">ID :</label>
                 <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId" required> <br>
                 <label for="userPwd" class="mr-sm-2">Password:</label>
                 <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd" required>
             </div>
             
             <!-- Modal footer -->
             <div class="modal-footer">
                 <button type="submit" class="btn btn-primary">로그인</button>
                 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
             </div>
         </form>
         </div>
     </div>
 </div>
<script>
$(document).ready(function(){
    var alertMessage = "${alert}";
    if (alertMessage != "") {
        alert(alertMessage);
    }
});
</script>

</body>
</html>