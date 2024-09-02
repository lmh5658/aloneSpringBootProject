<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /*
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    font-size: 13px;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    font-size: 13px;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    .but4{cursor: pointer;}
  */  
.smallfont{font-size:0.8em;}
.nocheck{display:none;}
.usable{color:green;}
.unusable{color:red;}


    p{
    font-size: 0.7em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
     td{
    border-bottom: 1px dotted gray;
    }

/* 기본 스타일 */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
}

/* 콘텐츠 스타일 */
.content {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px;
}

/* 제목 스타일 */
.innerOuter h2 {
    text-align: center;
    color: #2c3e50;
    font-size: 2.5em;
    margin-bottom: 30px;
}

/* 폼 컨테이너 스타일 */
.container {
    display: flex;
    flex-direction: column;
}

/* 폼 요소 스타일 */
.insert table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 10px 20px;
}

.insert td {
    padding: 10px;
    vertical-align: top;
}

.insert .col1 {
    font-weight: 600;
    color: #34495e;
}

.insert .col2 {
    color: #7f8c8d;
}

input[type="text"],
input[type="password"],
input[type="email"],
select {
    width: 100%;
    padding: 12px;
    border: 1px solid #bdc3c7;
    border-radius: 5px;
    font-size: 1em;
    box-sizing: border-box;
    transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
select:focus {
    border-color: #3498db;
    outline: none;
}

input[type="text"]::placeholder,
input[type="password"]::placeholder {
    color: #95a5a6;
}

/* 버튼 스타일 */
input[type="button"],
button {
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="button"] {
    background-color: #ecf0f1;
    color: #34495e;
}

input[type="button"]:hover {
    background-color: #bdc3c7;
}

button {
    background-color: #3498db;
    color: #fff;
}

button:hover {
    background-color: #2980b9;
}

/* 버튼 상태 */
.but3 {
    background-color: #ecf0f1;
    color: #34495e;
}

.but4 {
    background-color: #3498db;
    color: #fff;
}

.but4:disabled {
    background-color: #bdc3c7;
    cursor: not-allowed;
}

/* 결과 메시지 스타일 */
.nocheck {
    font-size: 0.9em;
    color: #e74c3c;
}

.smallfont {
    font-size: 0.8em;
}

/* 주소 입력 스타일 */
#sample6_postcode,
#sample6_address,
#sample6_detailAddress,
#sample6_extraAddress {
    margin-bottom: 10px;
}

#sample6_postcode,
#sample6_address {
    display: inline-block;
    width: calc(100% - 50px);
}

#sample6_detailAddress,
#sample6_extraAddress {
    width: calc(100% - 50px);
}

input[type="button"] {
    background-color: #e67e22;
    color: #fff;
}

input[type="button"]:hover {
    background-color: #d35400;
}
.create{
    display: flex;
    justify-content: center;
    gap: 72px;
}

#sample6_extraAddress{
	width: 260px;
}
#sample6_postcode{
width: 241px;
}
.content button, input[type='button']{
border-radius: 14px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="content" style="height: auto;">
	    <br><br>
	    <div>
	        <h2 style="text-align: center;">회원가입</h2>
	        <br>
	
	         <form method="post" action="${contextPath}/member/signup.do" id="signup_form">
				      <div class="container">
				    <div class="insert">
				    
				   <table>
				    <tr>
				        <td class="col1">이름</td>
				        <td class="col2"><input type="text" name="userName" id="userName" maxlength="5" required>
				        	<div id="nameCheck_result" class="nocheck smallfont"></div>
				        </td>
				    </tr>
				   	<tr>
				        <td class="col1">닉네임</td>
				        <td class="col2">
				        	<input type="text" name="nickName" id="nickName" maxlength="10" required>
				        	<div id="neckCheck_result" class="nocheck smallfont"></div>
				        </td>
				    </tr>
				   
				    <tr>
				        <td class="col1">아이디</td>
				        <td class="col2">
				            <input type="text" id="userId" name="userId" maxlength="15" required>
				            <div id="idCheck_result" class="nocheck smallfont"></div>
				        </td>
				    </tr>
				    <tr>
				        <td class="col1">비밀번호</td>
				        <td class="col2">
				            <input type="password" name="userPwd" id="userPwd" maxlength="20" required>
				            <div id="pwdCheck_result" class="nocheck smallfont"></div>
				        </td>
				    </tr>
				    <tr>
				        <td class="col1">비밀번호 확인</td>
				        <td class="col2"><input type="password" name="checkPwd" id="checkPwd" maxlength="20" required>
	                <div id="pwdEqualCheck_result" class="nocheck smallfont"></div>
	              </td>
				    </tr>
				    <tr>
				        <td class="col1">생년 월일</td>
				        <td class="col2"><input type="text" name="birthDate" maxlength="16" placeholder="예)92/12/01"></td>
				    </tr>
				    <tr>
				        <td class="col1">휴대 전화번호</td>
				        <td class="col2"><input type="text" name="phone" maxlength="16" placeholder="예)010-0000-0000"></td>
				    </tr>
				    <tr>
				        <td class="col1">이메일</td>
				        <td class="col2">
				            <input type="text" name="mail" style="width: 150px;" required>
				            <span class="a">@</span>
				            <input type="text" name="email" style="width: 150px;" required>
				            <select name="mailslc" id="mailSelect"  style="width: 150px;">
				                <option id="self" value="">직접입력</option>
				                <option value="naver.com">naver.com</option>
				                <option value="gmail.com">gmail.com</option>
				                <option value="daum.com">daum.com</option>
				                <option value="yahoo.com">yahoo.com</option>
				            </select>
				            <button type="button" id="myBtn2">인증하기</button>
				        </td>
				     </tr>
				   	 <tr>
				   	 			<td style="border-bottom:none;"></td>
				   	 			<td id="mailCheck_tr" style="display: none;">
						        <input style="width: 200px;" type="text" id="checkMessage" value="" placeholder="인증번호를 입력하세요.">
								    <button id="checkBtn" type="button">확인</button>
							    </td>	
				     </tr>
				     <tr>
				     		<td class="col1">주소</td>
				     		<td>
				        <input type="text" id="sample6_postcode" placeholder="우편번호" name="streetAddress">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소" name="address" required><br>
								<input type="text" id="sample6_detailAddress" name="addressDatail" placeholder="상세주소" style="width: 400px;" required>
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="otherAddress">
								</td>
				    </tr>
				    </table>
				    
				  </div>
				 
					  <div class="create">
					    
					        <input class="but3" type="button" value="가입취소" onclick="location.href='${contextPath}/'">
					        <button class="but4" id="signup_button" type="submit" disabled>회원가입</button>
					    
					  </div>
				  </div>
				  </form>
	    </div>
	    <br><br>
	</div>
	


				    
<!-- ------------------------------------이메일 인증 스크립트------------------------------ -->
<script>
$("#signup_button").on("click", function(){
		event.preventDefault();
    let checkButton = $("#checkBtn");
    if(checkButton.prop("disabled") == false) {  // 맞으면 true
        alert("이메일 인증이 완료되지 않았습니다.");
        return;
    }else{
    	$("#signup_form").submit();
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
		$.ajax({
			url:"${contextPath}/member/emailCheck.do",
			type:"post",
			data:{mails:mails},
			async:false, //동기식으로 진행
			success:function(response){
				if(response > 0){
					alert("중복된 이메일입니다. 다시 확인해주세요.");
				}else{
					
					alert("입력하신 이메일로 인증번호가 발송되었습니다.");
					$("#mailCheck_tr").css("display", "block");
					
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
					
				}
			},
			error:function(){
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
					 alert("이메일 인증이 완료되었습니다.");
					 $("input[type='text'][name='mail']").attr("readonly", "true");
					 $("input[type='text'][name='email']").attr("readonly", "true");
					 $("#checkMessage").attr("readonly", "true");
					 $("#mailSelect").attr("readonly", "true");
					 $("#but4").attr("disabled", "true");
					 $("#myBtn2").attr("disabled", "true");
					 $("#checkBtn").attr("disabled", "true");
					 
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
  


<script>
$(document).ready(function(){
 	 
})



</script>

<script>
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
<!-- ---------------------------------------------------------------------------------------------- -->
	<script>
	
		let idResult = false;
		let pwdResult = false;
		let pwdEqualResult = false;
		let nameResult = false;
	
	
		$(document).ready(function(){
			
			$("#signup_form input[name=nickName]").on("keyup", function(){ // id check start
				
				let regExp = /^[a-zA-Z0-9가-힣]{2,10}$/; // 아이디형식 : 영문자,숫자 5~12자 
				
				if( $(this).val().trim().length == 0 ){ 
					// case 1
					neckNameResult = checkPrint("#neckCheck_result", "usable unusable", "nocheck", "");
				}else{
					if( regExp.test( $(this).val() ) ){ 
						
						// case 2 (아이디 중복체크 => ajax)
						$.ajax({
							url:"${contextPath}/member/nickNamecheck.do",
							type:"get",
							async:false, // 동기식으로 처리되도록 하는 속성 (순차적으로 진행)
							data:"checkNickName=" + $(this).val(),
							success:function(result){
								if(result == "YYYYY"){
									neckNameResult = checkPrint("#neckCheck_result", "nocheck unusable", "usable", "사용가능한 닉네임입니다.");
								}else if(result == "NNNNN"){
									neckNameResult = checkPrint("#neckCheck_result", "nocheck usable", "unusable", "중복된 닉네임이 존재합니다. 다시 입력해주세요.");
								}								
							},error:function(){
								console.log("아이디 중복체크용 ajax 통신 실패");
							}
						}) // ajax end
						
					}else{ 
						// case 3
						neckNameResult = checkPrint("#neckCheck_result", "nocheck usable", "unusable", "2글자이상 특수문자 제외한 문자로 작성해주세요.");
					}
				}
				
				validate();
				
			}) // id check end
			
			
			$("#signup_form input[name=userId]").on("keyup", function(){ // id check start
				
				let regExp = /^[a-z\d]{5,12}$/; // 아이디형식 : 영문자,숫자 5~12자 
				
				if( $(this).val().trim().length == 0 ){ 
					// case 1
					idResult = checkPrint("#idCheck_result", "usable unusable", "nocheck", "");
				}else{
					if( regExp.test( $(this).val() ) ){ 
						
						// case 2 (아이디 중복체크 => ajax)
						$.ajax({
							url:"${contextPath}/member/idcheck.do",
							type:"get",
							async:false, // 동기식으로 처리되도록 하는 속성 (순차적으로 진행)
							data:"checkId=" + $(this).val(),
							success:function(result){
								if(result == "YYYYY"){
									idResult = checkPrint("#idCheck_result", "nocheck unusable", "usable", "사용가능한 아이디입니다.");
								}else if(result == "NNNNN"){
									idResult = checkPrint("#idCheck_result", "nocheck usable", "unusable", "중복된 아이디가 존재합니다. 다시 입력해주세요.");
								}								
							},error:function(){
								console.log("아이디 중복체크용 ajax 통신 실패");
							}
						}) // ajax end
						
					}else{ 
						// case 3
						idResult = checkPrint("#idCheck_result", "nocheck usable", "unusable", "영문, 숫자 포함 5~12자리로 작성해주세요.");
					}
				}
				
				validate();
				
			}) // id check end
			
			
			$("#signup_form input[name=userPwd]").on("keyup", function(){ // pwd check start
				
				let regExp = /^[a-z\d!@#$%^&*]{8,15}$/;
				
				if( $(this).val().trim().length == 0 ){
					pwdResult = checkPrint("#pwdCheck_result", "usable unusable", "nocheck", "");
				}else{
					if( regExp.test($(this).val()) ){
						pwdResult = checkPrint("#pwdCheck_result", "nocheck unusable", "usable", "사용가능한 비밀번호입니다.");
					}else{
						pwdResult = checkPrint("#pwdCheck_result", "nocheck usable", "unusable", "영문자, 숫자, 특수문자로 8~15자로 작성해주세요.");
					}
				}
				
				validate();
				
			}) // pwd check end
			
			
			$("#signup_form input[id=checkPwd]").on("keyup", function(){ // pwd equal check start
				
				if( $(this).val().trim().length == 0 ){
					pwdEqualResult = checkPrint("#pwdEqualCheck_result", "usable unusable", "nocheck", "");
				}else{
					if( $(this).val() == $("#signup_form input[name=userPwd]").val() ){
						pwdEqualResult = checkPrint("#pwdEqualCheck_result", "nocheck unusable", "usable", "비밀번호가 일치합니다.");
					}else{
						pwdEqualResult = checkPrint("#pwdEqualCheck_result", "nocheck usable", "unusable", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
					}
				}
			
				validate();
				
			}) // pwd equal check end
			
			
			$("#signup_form input[name=userName]").on("keyup", function(){ // name check start
				
				let regExp = /^[가-힣]{2,5}$/;
				
				if( $(this).val().trim().length == 0 ){
					nameResult = checkPrint("#nameCheck_result", "usable unusable", "nocheck", "");
				}else{
					if( regExp.test($(this).val()) ){
						nameResult = checkPrint("#nameCheck_result", "nocheck unusable", "usable", "사용가능한 이름입니다.");
					}else{
						nameResult = checkPrint("#nameCheck_result", "nocheck usable", "unusable", "한글로 2~5자로 작성해주세요.");
					}
				}
				
				validate();
				
			}) // name check end
			
		})
		
		
		function checkPrint(selector, rmClassNm, addClassNm, msg){
			$(selector).removeClass(rmClassNm).addClass(addClassNm).text(msg);
			return addClassNm == "usable" ? true : false;
		}
		
		// submit 버튼 활성화 / 비활성화 스크립트
		function validate(){
			console.log(idResult, pwdResult, pwdEqualResult, nameResult, neckNameResult);
			if(idResult && pwdResult && pwdEqualResult && nameResult && neckNameResult){
				$("#signup_button").removeAttr("disabled");
			}else{
				$("#signup_button").attr("disabled", true);
			}
		}
		
		
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>