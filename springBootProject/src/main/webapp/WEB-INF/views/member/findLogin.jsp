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

/* styles.css */
body {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.main-container {
		padding: 2rem;
    border-radius: 15px;
    width: 455px;
    text-align: center;
    height: 578px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.tabs {
    display: flex;
    justify-content: center;
    margin-bottom: 1rem;
}

.tab-button {
    background: #ff6f61; /* Coral color for buttons */
    color: #fff;
    border: none;
    border-radius: 10px;
    padding: 0.75rem 1.5rem;
    cursor: pointer;
    font-size: 1rem;
    margin: 0 0.5rem;
    transition: background-color 0.3s, transform 0.2s;
}

.tab-button.active {
    background-color: #ff4d4d; /* Darker coral for active tab */
}

.tab-button:hover {
    background-color: #ff4d4d; /* Darker coral for hover effect */
    transform: scale(1.05);
}

.tab-content {
    display: none;
}

.tab-content.active {
    display: block;
}

h1 {
    margin-bottom: 1.5rem;
    color: #ff6f61; /* Coral color for titles */
    font-size: 1.8rem;
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
    border: 1px solid #ddd;
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 1rem;
    background: #f9f9f9;
}

.input-group input::placeholder {
    color: #888;
}

.input-group input:focus {
    border-color: #ff6f61;
    outline: none;
}

.submit-btn {
    width: 30%;
    padding: 0.75rem;
    background-color: #ff6f61; /* Coral color for buttons */
    border: none;
    color: #fff;
    font-size: 10px;
    border-radius: 10px;
    cursor: pointer;
    height: 48px;
}

.submit-btn:hover {
    background-color: #ff4d4d; /* Darker coral color for hover effect */
}

.back-link {
    display: block;
    color: #ff6f61; /* Coral color for back link */
    text-decoration: none;
    margin-top: 1rem;
    font-size: 0.9rem;
    transition: color 0.3s;
}

.back-link:hover {
    color: #ff4d4d; /* Darker coral color for hover effect */
    text-decoration: underline;
}



</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

  <div class="main-container">
        <div class="tabs">
            <button class="tab-button" data-target="#find-username">아이디 찾기</button>
            <button class="tab-button" data-target="#find-password">비밀번호 찾기</button>
        </div>

        <div id="find-username" class="tab-content">
            <h1>아이디 찾기</h1>
                <div class="input-group">
                    <label for="name-username">이름</label>
                    <input type="text" id="name-username" name="userName" required placeholder="이름을 입력하세요">
                </div>
                <div class="input-group">
                    <label for="email-username">이메일 주소</label>
	                 <div class="input-group" style="display: flex; flex-wrap: nowrap; flex-direction: row; align-content: flex-start; align-items: baseline;">
		                  <input type="email" id="email-username" name="email" required placeholder="이메일 주소를 (@포함)입력하세요.">
		                  <button class="submit-btn findLogin">인증번호 받기</button>
	                 </div>
                </div>
            		<div class="input-group check_mail" style="display: none;">
	                  <input type="email" id="mailNumberId" required placeholder="인증번호를 입력하세요." >
	                  <button class="submit-btn verifyCode">확인</button>
                </div>
                <div class="input-group find_id" style="display: none;">
                		<label for="id_user">
                		가입한 회원 아이디 : <span id="id_user"></span>
                		</label>
                		<label for="id_enrollDt">
                		가입 일자 : <span id="id_enrollDt"></span>
                		</label>
             	  </div>
        </div>

        <div id="find-password" class="tab-content">
            <h1>비밀번호 찾기</h1>
            	<form id="findPwdForm">
                <div class="input-group">
                    <label for="username-password">아이디</label>
                    <input type="text" id="username-password" name="userId" required placeholder="아이디를 입력하세요">
                </div>
                <div class="input-group">
                    <label for="name-password">이름</label>
                    <input type="text" id="name-password" name="userName" required placeholder="이름을 입력하세요">
                </div>
                <div class="input-group" style="display: flex; flex-wrap: nowrap; flex-direction: row; align-content: flex-start; align-items: baseline;">
		                  <input type="email" id="email-password" name="email" required placeholder="이메일 주소를 (@포함)입력하세요.">
		                  <button class="submit-btn findLoginPwd">인증번호 받기</button>
	              </div>
	            </form>
        </div>

        <a href="${contextPath}/member/loginPage.page" class="back-link">로그인 페이지로 돌아가기</a>
    </div>


 <script>
//=====================아이디찾기==========================
 $(document).on("click", ".findLogin", function() {
    // 첫 번째 AJAX 요청: 아이디 찾기
   $.ajax({
       url: "${contextPath}/member/findUser.do",
       type: "POST",
       data: {
    	   userName:$("#name-username").val().trim(),
    	   email:$("#email-username").val().trim(),
    	   type:"${type}"
       },
       success: function(response) {
    	   
           if (response.idCheck == 0) {
               alert("일치하는 회원정보가 없습니다.");
           } else {
               $(".check_mail").css("display", "block");
               $("#mailNumber").focus();
               alert("입력하신 이메일로 요청하신 인증번호를 발송했습니다.");
               // 두 번째 AJAX 요청: 이메일로 인증번호 발송
               $.ajax({
                   url: "${contextPath}/mail/mailSend.do",
                   type: "post",
                   data: { 
                	   mail: $("input[type='email'][name='email']").val(),
                	   type: "${type}",
                	   distinction:"id"
                	 },
                   success: function(response) {
                	   	
                	   	if(response.success == true){
                	   		console.log("success : true");
                	   	}

                       
                   },
                   error: function() {
                       alert("이메일 발송 중 오류가 발생했습니다.");
                   }
                   
               });
           }
       },
       error: function() {
           alert("아이디 찾기 중 오류가 발생했습니다.");
       }
   });
});

	// 이메일 인증번호 확인 및 아이디 찾기
$(document).on("click", ".verifyCode", function() {
	
    $.ajax({
        url: "${contextPath}/mail/mailCheck.do",
        type: "get",
        data: { userNumber: $("#mailNumberId").val() },
        success: function(response) {
            if (response == false) {
                alert("입력하신 인증번호가 틀립니다. <br> 다시 확인해주세요.");
            } else {
            	
                $(".check_mail").css("display", "none");
                $(".find_id").css("display", "block");
                
                $.ajax({
                    url: "${contextPath}/member/findUser.do",
                    type: "POST",
                    data: {
                 	   userName:$("#name-username").val().trim(),
                 	   email:$("#email-username").val().trim(),
                 	   type:"${type}"
                    },
                    success: function(response) {
                    	console.log("회원아이디 :>>>" + response.userId);
                        $("#id_user").html("<b>&nbsp;" + response.userId + "</b><br>");
                        $("#id_enrollDt").html("<b>&nbsp;" + response.enrollDt + "</b><br>");
                    },
                    error: function() {
                        alert("아이디 조회 중 오류가 발생했습니다.");
                    }
                    
                });
            }
        },
        error: function() {
            alert("인증번호 확인 중 오류가 발생했습니다.");
        }
    });
    
});
//=====================비밀번호찾기==========================
	
var type = "${type}"

$(document).on("click", ".findLoginPwd", function(event) {
	event.preventDefault();
   // 첫 번째 AJAX 요청: 비밀번호 찾기
  $.ajax({
      url: "${contextPath}/member/findUser.do",
      type: "post",
      data: $("#findPwdForm").serialize() + "&type=" + type,
      success: function(response) {
   	   
	          if (response.idCheck == 1) {
              alert("입력하신 이메일로 인증번호를 발송했습니다.");
              // 두 번째 AJAX 요청: 이메일로 인증번호 발송
             	ajaxSendMail();
	          } else {
	              alert("일치하는 회원정보가 없습니다.");
          	}
      },	
      error: function() {
          alert("아이디 찾기 중 오류가 발생했습니다.");
      }
  });
});

function ajaxSendMail(){
	
	 $.ajax({
         url: "${contextPath}/mail/mailSend.do",
         type: "post",
         data: { 
      	   mail: $("#email-password").val(),
      	   type: type,
   	     	 distinction:"pwd"
      	 	},
         success: function(response) {
      	 		distinction(response.number, type);
         },
         error: function() {
         }
         
   });
}

function distinction(pwd, type){
	
	//세번째 AJAX 요청 : 임시비밀번호로 비밀번호 변경
   	$.ajax({
   			url: "${contextPath}/member/findPwdChange.do",
  			type:"post",
  			data:$("#findPwdForm").serialize() + "&type=" + type + "&changePwd=" + pwd,
  			success:function(response){
  				console.log("change=>" + response);
  			},
  			error:function(xhr, status, error){
  				console.error("Error during password change:", status, error);
  			}
		})
}


$(document).ready(function() {
    let type = "${type}";
    
    if (type === "id") {
        showSection('#find-username');
    } else {
        showSection('#find-password');
    }
});

$('.tab-button').click(function() {
    const target = $(this).data('target');
    showSection(target);
});

function showSection(sectionId) {
    $('.tab-content').removeClass('active');
    $('.tab-button').removeClass('active');
    $(sectionId).addClass('active');
    $(`.tab-button[data-target="${sectionId}"]`).addClass('active');
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>