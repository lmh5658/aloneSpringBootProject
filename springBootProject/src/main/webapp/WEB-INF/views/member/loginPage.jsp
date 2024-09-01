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

body {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.login-container {
    background: #ffffff;
    padding: 2rem;
    border-radius: 15px;
    width: 455px;
    text-align: center;
    height: auto;
}

.logo {
    width: 100px;
    height: auto;
    margin-bottom: 1rem;
}

.login-container h1 {
    margin-bottom: 1.5rem;
    color: #f97ca99c;
    font-size: 2.8rem;
    font-weight: 600;
    letter-spacing: 1px;
}

.input-group {
    margin-bottom: 1rem;
    text-align: left;
}

.input-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #444; /* Darker text for better readability */
}

.input-group input {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd; /* Light border for input fields */
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 1rem;
    background: #f4f4f4; /* Slightly darker background for input */
}

.input-group input::placeholder {
    color: #888; /* Darker placeholder color for better visibility */
}

.input-group input:focus {
    border-color: #ff6f61; /* Coral color for focus state */
    outline: none;
}

.login-btn {
    width: 100%;
    padding: 0.75rem;
    background-color: #ff6f61; /* Coral color for button */
    border: none;
    color: #fff;
    font-size: 1.1rem;
    border-radius: 10px;
    cursor: pointer;
    margin-bottom: 1rem;
    transition: background-color 0.3s, transform 0.2s;
}

.login-btn:hover {
    background-color: #ff4d4d; /* Slightly darker coral for hover */
    transform: scale(1.05);
}

.links {
    margin-top: 1rem;
}

.links a {
    display: block;
    color: #ff6f61; /* Coral color for links */
    text-decoration: none;
    margin: 0.5rem 0;
    font-size: 0.9rem;
    transition: color 0.3s;
}

.links a:hover {
    color: #ff4d4d; /* Darker coral color for hover */
    text-decoration: underline;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	

    <div class="login-container"">
        <h1>로그인</h1>
        <form id="loginInfo_form">
            <div class="input-group">
                <label for="username">아이디</label>
                 
                <input type="text" id="userId" name="userId" required>
                
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="userPwd" name="userPwd" required>
            </div>
            <button type="button" class="login-btn">로그인</button>
        </form>
        <div class="links">
            <a href="${contextPath}/member/findLogin.do?type=id" class="link">아이디 찾기</a>
            <a href="${contextPath}/member/findLogin.do?type=pwd" class="link">비밀번호 찾기</a>
            <a href="${contextPath}/member/signup.page" class="link">회원가입</a>
        </div>
    </div>
    
<script>

//클릭 및 키 입력 이벤트 처리
$(document).on("click", ".login-btn", function() {
    performLogin();
});

$(document).on("keydown", "#userPwd", function(ev) {
    if (ev.key === "Enter") {
        performLogin();
    }
});

var previousUrl = document.referrer;
$(document).ready(function(){
})
function performLogin() {
    $.ajax({
        url: "${contextPath}/member/loginSignin.do",
        type: "post",
        data: $("#loginInfo_form").serialize(),
        success: function(response) {
            // 로그인 성공 시 처리
            if(response.success == true){
            	location.href=previousUrl;
            	alert(response.nickName + "님 환영합니다.");
            	console.log("이전 주소 : " + previousUrl);
            }else{
            	alert("로그인 실패하였습니다. \n 아이디 및 비밀번호를 다시 확인해주세요.");
            }
            
        },
        error: function(xhr, status, error) {
            // 로그인 실패 시 처리
            console.error("Login failed:", status, error);
        }
    });
}



</script>
</body>
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>