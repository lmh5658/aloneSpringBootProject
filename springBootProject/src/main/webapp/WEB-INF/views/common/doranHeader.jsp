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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<!-- 웹소켓 undefind 오류 연결 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

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
    width: 100%;
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

#messageModal .modal-content {
    border-radius: 1rem; /* 모달의 모서리 둥글게 */
}
.modal-header {
    border-bottom: none; /* 헤더와 본문 사이의 구분선 제거 */
}
.modal-body {
    padding: 2rem; /* 본문에 여유 공간 추가 */
}
.reply-form {
    display: none; /* 초기에는 숨김 */
}
.list-group-item {
    border: 1px solid #ddd; /* 항목에 경계선 추가 */
    border-radius: 0.5rem; /* 항목의 모서리 둥글게 */
}
.list-group-item:hover {
    background-color: #f8f9fa; /* 항목에 호버 효과 추가 */
}
.reply-btn {
    cursor: pointer; /* 버튼의 커서 모양 변경 */
}
.reply-form textarea {
    resize: none; /* 텍스트 영역의 크기 조절 비활성화 */
}

 .modal-dialog {
    width: 800px; /* 원하는 너비로 설정 */
    max-width: none; /* 최대 너비 제한 제거 */
}

#messageModal .modal-content{
    height: 630px; /* 원하는 높이로 설정 */
    overflow-y: auto; /* 내용이 모달을 넘칠 경우 스크롤 표시 */
}


/* 스윙 애니메이션 적용 */
.bell-swing {
  animation: swing 2s infinite;
  transform-origin: top center;
}

/* 스윙 애니메이션 키프레임 */
@keyframes swing {
  20% {
    transform: rotate(15deg);
  }
  40% {
    transform: rotate(-10deg);
  }
  60% {
    transform: rotate(5deg);
  }
  80% {
    transform: rotate(-5deg);
  }
  100% {
    transform: rotate(0deg);
  }
}




    #messageModal .modal-content {
        border-radius: 10px;
        overflow: hidden;
    }
    .modal-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6;
    }
    .modal-footer {
        background-color: #f8f9fa;
        border-top: 1px solid #dee2e6;
    }
    .nav-pills .nav-link {
        border-radius: 0;
        padding: 10px;
        color: #495057;
        border-left: 3px solid transparent;
        transition: border-color 0.3s, background-color 0.3s;
    }
    .nav-pills .nav-link.active {
        background-color: #e9ecef;
        border-color: #0d6efd;
        color: #0d6efd;
    }
    .list-group-item {
        border: none;
        border-bottom: 1px solid #dee2e6;
        cursor: pointer;
    }
    .list-group-item:last-child {
        border-bottom: none;
    }
    .list-group-item .text-muted {
        margin-left: auto;
    }
    .pagination {
        margin: 0;
    }

  .message-list-container {
        height: calc(100vh - 200px);
        overflow-y: auto;
        position: relative;
    }

    .pagination {
        position: sticky;
        bottom: 0;
        background-color: #fff; 
        padding: 10px;
    }

    .message-detail {
        display: none;
    }
    
/* 탭 콘텐츠 영역에 스크롤바를 추가하는 스타일 */
        .tab-pane-scroll {
            max-height: 500px; /* 원하는 최대 높이로 설정하세요 */
            overflow-y: auto;  /* 수직 스크롤바를 추가 */
        }

        /* 전체 콘텐츠 영역의 높이 설정 (옵션) */
        .tab-content {
            height: calc(100vh - 100px); /* 상단 메뉴 및 하단 여백을 고려하여 조정 */
        }
        
          .custom-badge {
        padding: 0.25rem 0.75rem;
        font-size: 0.875rem;
        font-weight: 500;
        line-height: 1;
        border-radius: 0.375rem;
    }
.badge {
    position: absolute;
    top: -5px;
    right: -5px;
    background-color: red;
    color: white;
    padding: 2px 6px;
    border-radius: 50%;
    font-size: 10px;
    line-height: 1;
}
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
	        		<div style="display: flex; justify-content: flex-start;">
							<div style="position: relative; display: inline-block;">
							    <svg id="bell" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="" viewBox="0 0 16 16"
							         data-bs-toggle="modal" data-bs-target="#messageModal">
							        <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
							    </svg>
							    <span class="badge" id="badge"></span> <!-- 알림 숫자 표시 -->
							</div>
	        		<div>
	        			<a href="#">${ loginUser.nickName }</a>
	        		</div>
	        		</div>
	        	</c:otherwise>
	        </c:choose>
        </div>
        
    </nav>
    <div id="tost_message" style="display: flex; justify-content: flex-end;">
		</div>
    
    
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
<!--============================ 쪽지리스트 S ============================-->
<script>
$(document).ready(function(){
	loadMessage(1);
})

function handleToastClick(){
	loadMessage(1);
}

function loadMessage(page){
	
	$.ajax({
		url:"${contextPath}/community/ajaxSelectMessage.do",
		type:"get",
		data:{page:page},
		success:function(response){
			
			//받은 쪽지 리스트
			let receivePi = response.piReceive;
			let receiveList = response.receiveList;
			//보낸 쪽지 리스트
			let sendPi = response.piSend;
			let sendList = response.sendList;
			
			//휴지통 리스트
			let collectPi = response.piCollect;
			let collectList = response.collectList;
			
			//읽지 않은 리스트
			let readCount = response.readCount;
			
			let receiveHtml = '';
			if (receiveList.length > 0) {
			    receiveList.forEach(function(item, index) {
			        const messageId = 'receivedMessage' + (index + 1);
			        const messageStatusId = 'receivedMessageStatus' + (index + 1);

			        receiveHtml += '<li class="list-group-item d-flex flex-column" data-no="' + item.messageNo + '" onclick="toggleMessageDetail(\'' + messageId + '\')">';
			        receiveHtml += '    <div class="d-flex justify-content-between align-items-center mb-2">';
			        receiveHtml += '        <div class="d-flex align-items-center">';
			        receiveHtml += '            <div class="me-2">';
			        receiveHtml += '                <span class="fw-normal">보낸 사람 : ' + item.sendNickName + "(" + item.sendId.substring(0, 3) + '*'.repeat(item.sendId.length - 3) + ")" + '</span> | ';
			        receiveHtml += '                ' + (item.content.length >= 10 ? item.content.substring(0, 10) + "...." : item.content);
			        receiveHtml += '            </div>';
			        receiveHtml += '        </div>';
			        receiveHtml += '        <div class="d-flex align-items-center dataRead">';
			        receiveHtml += '            <span class="' + (item.dateRead != null ? 'text-primary' : 'text-secondary') + ' fw-normal">';
			        receiveHtml += '                ' + (item.dateRead != null ? '읽음' : '안읽음') + '';
			        receiveHtml += '            </span>';
			        receiveHtml += '            <small class="text-muted ms-2">' + timeForToday(item.dateSend) + '</small>';
			        receiveHtml += '        </div>';
			        receiveHtml += '    </div>';
			        receiveHtml += '    <div id="' + messageId + '" class="message-detail" style="display: none; margin-top: 10px; padding-top: 10px; border-top: 1px solid #ddd;" data-send="' + item.sendId + '">';
			        receiveHtml += '        <div class="mb-2">';
			        receiveHtml += '            <span class="fw-bold">보낸 사람:</span> <span class="fw-normal">' + item.sendNickName + "(" + item.sendId.substring(0, 3) + '*'.repeat(item.sendId.length - 3) + ")" + '</span>';
			        receiveHtml += '        </div>';
			        receiveHtml += '        <div class="mb-2">';
			        receiveHtml += '            <span class="fw-bold">제목:</span> <span class="fw-normal">' + item.title + '</span>';
			        receiveHtml += '        </div>';
			        receiveHtml += '        <div class="mb-2">';
			        receiveHtml += '            <span class="fw-bold">내용:</span>';
			        receiveHtml += '            <p class="fw-normal">' + item.content + '</p>';
			        receiveHtml += '        </div>';
			        receiveHtml += '        <div class="d-flex justify-content-end mt-2">';
			        receiveHtml += '            <button class="btn btn-outline-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#replyModal" onclick="reply(\'' + item.sendId + '\');">답장</button>';
			        receiveHtml += '            <button class="btn btn-outline-secondary btn-sm" onclick="moveToTrash(\'' + item.messageNo + '\')">보관</button>';
			        receiveHtml += '            <button class="btn btn-outline-danger btn-sm me-2" onclick="deleteSendMessage(\'' + item.messageNo + '\')">삭제</button>';
			        receiveHtml += '        </div>';
			        receiveHtml += '    </div>';
			        receiveHtml += '</li>';

			    });
			} else {
			    receiveHtml = '<li class="list-group-item">받은 쪽지가 없습니다.</li>';
			}

			$("#receivedMessageList").html(receiveHtml);
			receivePaging(receivePi);

			let sendHtml = '';
			if (sendList.length > 0) {
			    sendList.forEach(function(item, index) {
			        const messageId = 'sentMessage' + (index + 1);
			        const messageStatusId = 'sentMessageStatus' + (index + 1);

			        sendHtml += '<li class="list-group-item d-flex flex-column" data-no="' + item.messageNo + '" onclick="toggleMessageDetail(\'' + messageId + '\')">';
			        sendHtml += '    <div class="d-flex justify-content-between align-items-center mb-2">';
			        sendHtml += '        <div class="d-flex align-items-center">';
			        sendHtml += '            <div class="me-2">';
			        sendHtml += '                <span class="fw-normal">받는 사람 : ' + item.receiveNickName + "(" + item.receiveId.substring(0, 3) + '*'.repeat(item.receiveId.length - 3) + ")" + '</span> | ';
			        sendHtml += '                ' + (item.content.length >= 10 ? item.content.substring(0, 10) + "...." : item.content);
			        sendHtml += '            </div>';
			        sendHtml += '        </div>';
			        sendHtml += '        <div class="d-flex align-items-center">';
							//회신여부
			        if (item.msgCollect == 'Y') {
			            sendHtml += '<span>회신됨</span>&nbsp;&nbsp;';
			        }

			        sendHtml += '            <span class="receiveRead ' + (item.dateRead != null ? 'text-primary' : 'text-secondary') + ' fw-normal">';
			        sendHtml += '                ' + (item.dateRead != null ? '읽음' : '안읽음') + '';
			        sendHtml += '            </span>';
			        sendHtml += '            <small class="text-muted ms-2">' + timeForToday(item.dateSend) + '</small>';
			        sendHtml += '        </div>';
			        sendHtml += '    </div>';
			        sendHtml += '    <div id="' + messageId + '" class="message-detail" style="display: none; margin-top: 10px; padding-top: 10px; border-top: 1px solid #ddd;" data-sendId="' + item.receiveId + '">';
			        sendHtml += '        <div class="mb-2">';
			        sendHtml += '            <span class="fw-bold">받는 사람:</span> <span class="fw-normal">' + item.receiveNickName + "(" + item.receiveId.substring(0, 3) + '*'.repeat(item.receiveId.length - 3) + ")" + '</span>';
			        sendHtml += '        </div>';
			        sendHtml += '        <div class="mb-2">';
			        sendHtml += '            <span class="fw-bold">제목:</span> <span class="fw-normal">' + item.title + '</span>';
			        sendHtml += '        </div>';
			        sendHtml += '        <div class="mb-2">';
			        sendHtml += '            <span class="fw-bold">내용:</span>';
			        sendHtml += '            <p class="fw-normal">' + item.content + '</p>';
			        sendHtml += '        </div>';

			        sendHtml += '        <div class="d-flex justify-content-end">';
			        sendHtml += '            <button class="btn btn-outline-danger btn-sm me-2" onclick="collectMessage(\'' + item.messageNo + '\')">회수</button>';
			        sendHtml += '            <button class="btn btn-outline-danger btn-sm me-2" onclick="deleteReceiveMessage(\'' + item.messageNo + '\')">삭제</button>';
			        sendHtml += '        </div>';
			        sendHtml += '    </div>';
			        sendHtml += '</li>';


			    });
			} else {
			    sendHtml += '<li class="list-group-item">보낸 쪽지가 없습니다.</li>';
			}

			$("#sentMessageList").html(sendHtml);
			sendPaging(sendPi);

			
			
			let collectHtml = '';
			if (collectList.length > 0) {
					collectList.forEach(function(item, index) {
			        const messageId = 'trashMessage' + (index + 1);

			        collectHtml += '<li class="list-group-item d-flex flex-column" data-no="' + item.messageNo + '" onclick="toggleMessageDetail(\'' + messageId + '\')">';
			        collectHtml += '    <div class="d-flex justify-content-between align-items-center mb-2">';
			        collectHtml += '        <div class="d-flex align-items-center">';
			        collectHtml += '            <div class="me-2">';
			        collectHtml += '                <span class="fw-normal">' + item.receiveId + '</span> - ';
			        collectHtml += '                ' + (item.content.length >= 10 ? item.content.substring(0, 10) + "...." : item.content);
			        collectHtml += '            </div>';
			        collectHtml += '        </div>';
			        collectHtml += '        <div class="d-flex align-items-center">';
			        collectHtml += '            <small class="text-muted">' + timeForToday(item.dateSend) + '</small>';
			        collectHtml += '        </div>';
			        collectHtml += '    </div>';
			        collectHtml += '    <div id="' + messageId + '" class="message-detail" style="display: none; margin-top: 10px; padding-top: 10px; border-top: 1px solid #ddd;" data-sendId="' + item.receiveId + '">';
			        collectHtml += '        <div class="mb-2">';
			        collectHtml += '            <h6 class="fw-normal">제목: ' + item.title + '</h6>';
			        collectHtml += '            <p>내용: ' + item.content + '</p>';
			        collectHtml += '            <p>받는 사람: ' + item.receiveId + '</p>';
			        collectHtml += '        </div>';
			        collectHtml += '        <div class="d-flex justify-content-end">';
			        collectHtml += '            <button class="btn btn-outline-danger btn-sm" onclick="deleteMessage(\'' + item.messageNo +'\')">삭제</button>';
			        collectHtml += '        </div>';
			        collectHtml += '    </div>';
			        collectHtml += '</li>';

			    });
			} else {
				collectHtml += '<li class="list-group-item">보관함에 담긴 쪽지가 없습니다.</li>';
			}

			$("#trashMessageList").html(collectHtml);
			collectPaging(collectPi);


		},
		error:function(){
			console.log("ajax통신 오류");
		}
		
		
	})
	
}

function collectPaging(pi){
	
	let htmlPI = '';
	
	if(pi.listCount != 0){
		
   if (pi.currentPage == 1) {
	   htmlPI += "<button class='page bt' disabled>이전</button>";
   } else {
	   htmlPI += "<button class='page bt' onclick='loadMessage(" + (pi.currentPage - 1) + ")'>이전</button>";
   }

   // 페이지 번호 버튼 렌더링
   for (let i = pi.startPage; i <= pi.endPage; i++) {
       if (i == pi.currentPage) {
    	   htmlPI += '<button class="page" disabled active>' + (i) + '</button>';
       } else {
    	   htmlPI += "<button class='page' onclick='loadMessage(" + i + ")'>" + (i) + "</button>";
       }
   }

   // Next 버튼 렌더링
   if (pi.currentPage == pi.maxPage) {
	   htmlPI += "<button class='page bt' disabled>다음</button>";
   } else {
	   htmlPI +=  "<button class='page bt' onclick='loadMessage(" + (pi.currentPage + 1) + ")'>다음</button>";
   }

   $('#collectPaging').html(htmlPI);
   
   
	}else{
		
		$('#collectPaging').html("");
		
	}
	
}


function receivePaging(pi){
	
	let htmlPI = '';
	
	if(pi.listCount != 0){
		
   if (pi.currentPage == 1) {
	   htmlPI += "<button class='page bt' disabled>이전</button>";
   } else {
	   htmlPI += "<button class='page bt' onclick='loadMessage(" + (pi.currentPage - 1) + ")'>이전</button>";
   }

   // 페이지 번호 버튼 렌더링
   for (let i = pi.startPage; i <= pi.endPage; i++) {
       if (i == pi.currentPage) {
    	   htmlPI += '<button class="page" disabled active>' + (i) + '</button>';
       } else {
    	   htmlPI += "<button class='page' onclick='loadMessage(" + i + ")'>" + (i) + "</button>";
       }
   }

   // Next 버튼 렌더링
   if (pi.currentPage == pi.maxPage) {
	   htmlPI += "<button class='page bt' disabled>다음</button>";
   } else {
	   htmlPI +=  "<button class='page bt' onclick='loadMessage(" + (pi.currentPage + 1) + ")'>다음</button>";
   }

   $('#receivePaging').html(htmlPI);
   
   
	}else{
		
		$('#receivePaging').html("");
		
	}
	
}

function sendPaging(pi){
	
	let htmlPI = '';
	
	if(pi.listCount != 0){
		
   if (pi.currentPage == 1) {
	   htmlPI += "<button class='page bt' disabled>이전</button>";
   } else {
	   htmlPI += "<button class='page bt' onclick='loadMessage(" + (pi.currentPage - 1) + ")'>이전</button>";
   }

   // 페이지 번호 버튼 렌더링
   for (let i = pi.startPage; i <= pi.endPage; i++) {
       if (i == pi.currentPage) {
    	   htmlPI += '<button class="page" disabled active>' + (i) + '</button>';
       } else {
    	   htmlPI += "<button class='page' onclick='loadMessage(" + i + ")'>" + (i) + "</button>";
       }
   }

   // Next 버튼 렌더링
   if (pi.currentPage == pi.maxPage) {
	   htmlPI += "<button class='page bt' disabled>다음</button>";
   } else {
	   htmlPI +=  "<button class='page bt' onclick='loadMessage(" + (pi.currentPage + 1) + ")'>다음</button>";
   }

   $('#sendPaging').html(htmlPI);
   
   
	}else{
		
		$('#sendPaging').html("");
		
	}
	
}

</script>
<!-- ============================ 쪽지리스트 E ============================ -->
<!-- 답장 클릭시 모달창 -->
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="replyModalLabel">답장</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 받는 사람 아이디 입력 필드 추가 -->
                <div class="mb-2">
                    <label for="recipientId" class="form-label">받는 사람 : </label>
                    <input type="text" class="form-control" id="recipientId" value="" readonly>
                    <input type="hidden" id="received">
                </div>
                <!-- 제목 입력 필드 -->
                <div class="mb-2">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" placeholder="제목을 입력하세요" id="replyTitle">
                </div>
                <!-- 내용 입력 필드 -->
                <div class="mb-2">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" placeholder="답장 내용을 입력하세요" id="replyContent" rows="5"></textarea>
                </div>
            </div>
						<div class="modal-footer">
						    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="replyBack">뒤로가기</button>
						    <button type="button" class="btn btn-primary" id="replys">보내기</button>
						</div>
        </div>
    </div>
</div>


<!-- ===================== 쪽지 알람 스크립트 S ============================ -->
<script>


/*
function onClose(){
	location.href = "${contextPath}";
}
*/

//notifySend 메시지 전송 영역----------------------------------------------


//새로운 쪽지 보내기
$(document).on("click", '#sendBtn', function(e){
	
    //var modal = $('#nav-compose').has(e.target); //포함여부확인
    let modal = $(this).closest("#v-pills-compose");
    //var type = '70';
    var receiveId = modal.find('#recipient').val();
    var content = modal.find('#messageContent').val();
    var title = modal.find("#messageTitle").val();
    
    // 전송한 정보를 db에 저장	
    if(confirm("정말로 쪽지를 보내시겠습니까?")){
    		 $.ajax({
             url: '${contextPath}/member/nickNamecheck.do',
             type: 'get',
             dataType: 'text',
             data: {
             		receiveId: receiveId,
                 content: content,
                 title: title
             },
             success: function(response){
            	 
                 if(response == "YYYYY"){
                	 
                     $.ajax({
                         url: '${contextPath}/member/insertSend.do',
                         type: 'post',
                         dataType: 'text',
                         data: {
                         		receiveId: receiveId,
                             content: content,
                             title: title
                         },
                         success: function(data){    // db전송 성공시 실시간 알림 전송
                        	 
                        	  
                             // 소켓에 전달되는 메시지
                             // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                             //socket.send(message);	
                         		socket.send(data);
                          
                             alert("쪽지 보내기를 완료했습니다.");
                             modal.find('#recipient').val("");
                             modal.find('#messageTitle').val("");
                             modal.find('#messageContent').val("");
                             loadMessage(1);
                         },
                      		error:function(){
                      			console.log("ajax통신 오류");
                      		}
                         
                     });
                 }else{
                	 alert("존재하지 않는 회원입니다. 다시 확인해주세요.");
                 }
                 
             },
          		error:function(){
          			console.log("ajax통신 오류");
          		}
         });

    	}

});

function reply(sendId) {
	
    $('#replyModal').modal('show');
    $("#recipientId").val(sendId);
    $("#received").val(sendId);
    
    console.log("Reply to:", sendId);
}

function maskId(sendId) {
    if (sendId.length > 3) {
        return sendId.substring(0, 3) + '*'.repeat(sendId.length - 3);
    }
    return sendId; 
}

//답장 보내기
$(document).on("click", "#replys", function(){
		
    //let type = '70';
    let title = $("#replyTitle").val();
    let content = $('#replyContent').val();
    let receiveId = $('#received').val();
    let $this = $(this);
    
    // 전송한 정보를 db에 저장	
    if(confirm("정말로 쪽지를 보내시겠습니까?")){
    		 $.ajax({
             url: '${contextPath}/member/nickNamecheck.do',
             type: 'get',
             dataType: 'text',
             data: {
             		receiveId: receiveId,
                 content: content,
                 title: title
             },
             success: function(response){
            	 
                 if(response == "YYYYY"){
                	 
                     $.ajax({
                         url: '${contextPath}/member/insertSend.do',
                         type: 'post',
                         dataType: 'text',
                         data: {
                         		receiveId: receiveId,
                             content: content,
                             title: title
                         },
                         success: function(data){    // db전송 성공시 실시간 알림 전송
                        	 
                        	  
                             // 소켓에 전달되는 메시지
                             // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                             //socket.send(message);	
                         		socket.send(data);
                          
                             alert("쪽지 보내기를 완료했습니다.");
                             $("#replyTitle").val("");
                             $('#replyContent').val("");
                             loadMessage(1);
                            
                         },
                      		error:function(){
                      			console.log("ajax통신 오류");
                      		}
                         
                     });
                 }else{
                	 alert("존재하지 않는 회원입니다. 다시 확인해주세요.");
                 }
                 
             },
          		error:function(){
          			console.log("ajax통신 오류");
          		}
         });

    	}
    
    
});



//========상태업데이트========

//받은 쪽지 삭제
function deleteReceiveMessage(messageNo) {
	
    if (confirm('쪽지를 삭제하시겠습니까?')) {
    	
        $.ajax({
            url: "${contextPath}/member/updateMessage.do", 
            type: "get",
            data: { 
            	messageNo: messageNo,
            	type: "receive"
            },
            success: function(response) {
            		
                if (response == "SUCCESS") {
                    alert("삭제가 완료되었습니다.");
                    loadMessage(1);
                }else{
                	console.log("success : fail");
                }
                
            },
            error: function(xhr, status, error) {
                console.log("ajax통신 오류 =>" + status + "///" + error);
            }
            
        });
    }
}
//보낸 쪽지 삭제
function deleteSendMessage(messageNo) {
	
    if (confirm('쪽지를 삭제하시겠습니까?')) {
    	
        $.ajax({
            url: "${contextPath}/member/updateMessage.do", 
            type: "get",
            data: { 
            	messageNo: messageNo,
            	type: "send"
            },
            success: function(response) {
            		
                if (response == "SUCCESS") {
                    alert("삭제가 완료되었습니다.");
                    loadMessage(1);
                }else{
                	console.log("success : fail");
                }
                
            },
            error: function(xhr, status, error) {
                console.log("ajax통신 오류 =>" + status + "///" + error);
            }
            
        });
    }
}

//보관함에 담기 쪽지 삭제
function deleteMessage(messageNo) {
	
    if (confirm('쪽지를 삭제하시겠습니까?')) {
    	
        $.ajax({
            url: "${contextPath}/member/updateMessage.do", 
            type: "get",
            data: { 
            	messageNo: messageNo,
            	type: "deleteCustody"
            },
            success: function(response) {
            		
                if (response == "SUCCESS") {
                    alert("삭제가 완료되었습니다.");
                    loadMessage(1);
                }else{
                	console.log("success : fail");
                }
                
            },
            error: function(xhr, status, error) {
                console.log("ajax통신 오류 =>" + status + "///" + error);
            }
            
        });
    }
}

function moveToTrash(messageNo) {
	
		 if (confirm('쪽지를 보관하시겠습니까?')) {
	    	
	        $.ajax({
	            url: "${contextPath}/member/updateMessage.do", 
	            type: "get",
	            data: { 
	            	messageNo: messageNo,
	            	type: "custody"
	            },
	            success: function(response) {
	            		
	                if (response == "SUCCESS") {
	                    loadMessage(1);
	                }else{
	                	console.log("success : fail");
	                }
	                
	            },
	            error: function(xhr, status, error) {
	                console.log("ajax통신 오류 =>" + status + "///" + error);
	            }
	            
	        });
	    }
		/*
    var messageElement = document.getElementById(messageId);
    if (messageElement) {
        messageElement.style.display = 'none'; // 메시지를 숨기고
        // 추가적인 휴지통 로직 필요
    }
    */
}

function collectMessage(messageNo){
	
	console.log(messageNo);
		if (confirm('쪽지를 회신하시겠습니까?')) {
			    	
	        $.ajax({
	            url: "${contextPath}/member/updateMessage.do",
	            type: "get",
	            data: { 
	            	messageNo: messageNo,
	            	type: "collect"
	            },
	            success: function(response) {
	            		
	                if (response == "SUCCESS") {
	                    loadMessage(1);
	                }else if(response == "FAIL"){
	                	 alert("읽은 상태이므로 회신이 불가합니다.");
	                }
	                
	            },
	            error: function(xhr, status, error) {
	                console.log("ajax통신 오류 =>" + status + "///" + error);
	            }
	            
	        });
			 
		}
	
	
}


// 답장보내기 모달창 뒤로가기 스크립트
$("#replyBack").on("click", function(){
	$("#messageModal").modal("show");
})


function toggleMessageDetail(messageId) {
    var detail = document.getElementById(messageId);
    detail.style.display = detail.style.display === 'none' || detail.style.display === '' ? 'block' : 'none';
}

function toggleReplyForm(formId) {
    var form = document.getElementById(formId);
    form.style.display = form.style.display === 'none' || form.style.display === '' ? 'block' : 'none';
}



function restoreMessage(messageId) {
    var messageElement = document.getElementById(messageId);
    if (messageElement) {
        messageElement.style.display = 'block'; // 메시지를 보이게 함
        // 추가적인 복원 로직 필요
    }
}
//-----------------------------------------------------------------------


function timeForToday(value) {
	
    const today = new Date();
    const timeValue = new Date(value);

    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
        return betweenTime + '분전';
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
        return betweenTimeHour + '시간전';
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
        return betweenTimeDay + '일전';
    }

    return Math.floor(betweenTimeDay / 365) + '년전';
 }

</script>

<script>
var socket = null;
$(document).ready(function(){
	
	socket = new SockJS("${contextPath}/common");

	socket.onmessage = onMessage;
})

//나에게 메세지가 왔을 때 실행되는 function
function onMessage(evt){ // evt : 웹소켓에서 클라이언트에게 보내준 데이터
	// new TextMessage객체로 보내준 텍스트메세지 값
	
		console.log("evt", evt);
		console.log("evt.data", evt.data);
		
    let data = evt.data.split(",");
    
    let messageNo = data[0];
    let sendId = data[1];
    let receiveId = data[2];
    let title = data[3];
    let content = data[4];
    let sendNickName = data[5];
    let dateSend = data[6];
    let dateRead = data[7];
    let count = data[8];
    
    let repeatCount = Math.max(sendId.length - 3, 0);
    let maskedId = sendId.substring(0, 3) + '*'.repeat(repeatCount);
    
    console.log("data : >>>>" + data);
    
    //=====읽음 update====//
    if(data != null && data.length == 4){
    	
    	let msgNo = data[0];
    	let count = data[3];
    	
    	$("#badge").html(count > 0 ? count : "");
    	
    	if(count > 0) {
    	    $("#bell").removeClass("bell-hidden");
    	    $("#bell").addClass("bi bi-bell bell-swing");
    	} else {
    	    $("#bell").removeClass("bi bi-bell bell-swing");
    	    $("#bell").addClass("bell-hidden"); 
    	}

    	$("#sentMessageList").children(".list-group-item").each(function() {
    	    if ($(this).data("no") == msgNo) {
    	        let $receiveRead = $(this).find(".receiveRead");
    	        if ($receiveRead.text().trim() == "안읽음") {
    	            $receiveRead.html("읽음");
    	            $receiveRead.removeClass();
    	            $receiveRead.addClass("receiveRead text-primary fw-normal"); 
    	        }
    	        
    	    }
    	});
    	
    }
    	
    if(data != null && data.length == 9){
    	
			$("#badge").html(count > 0 ? count : "");
    	if(count > 0) {
    	    $("#bell").removeClass("bell-hidden");
    	    $("#bell").addClass("bi bi-bell bell-swing");
    	} else {
    	    $("#bell").removeClass("bi bi-bell bell-swing");
    	    $("#bell").addClass("bell-hidden"); 
    	}		
    	// toast
        let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
        toast += 	"<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
        toast += 	"<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
        toast += 	"<span aria-hidden='true' class='hide'>&times;</span></button>";
        toast += 	"</div> <div class='toast-body' onclick='handleToastClick()' data-bs-toggle='modal' data-bs-target='#messageModal'><b>"+ sendNickName + "(" + maskedId + ")" +  "님의 쪽지가 도착 했어요!<br><b> 제목 :</b>" + title + "<br></div></div>";
        $("#tost_message").append(toast);   // msgStack div에 생성한 toast 추가
        $(".toast").toast({"animation": true, "autohide": false});
        $('.toast').toast('show');

        // 10초 뒤에 토스트를 숨기기
        setTimeout(function() {
            $('.toast').toast('hide');
        }, 10000); // 10000 밀리초 = 10초
        
        
        let receiveHtml = '';
        receiveHtml += '<li class="list-group-item d-flex flex-column" data-no="' + messageNo + '" onclick="toggleMessageDetail(\'' + messageNo + '\')">';
        receiveHtml += '    <div class="d-flex justify-content-between align-items-center mb-2">';
        receiveHtml += '        <div class="d-flex align-items-center">';
        receiveHtml += '            <div class="me-2">';
        receiveHtml += '                <span class="fw-normal">보낸 사람 : ' + sendNickName + "(" + maskedId + ")" + '</span> | ';
        receiveHtml += '                ' + (content.length >= 10 ? content.substring(0, 10) + "...." : content);
        receiveHtml += '            </div>';
        receiveHtml += '        </div>';
        receiveHtml += '        <div class="d-flex align-items-center dataRead">';
        receiveHtml += '            <span class="text-secondary fw-normal">안읽음</span>';
        receiveHtml += '            <small class="text-muted ms-2">' + timeForToday(dateSend) + '</small>';
        receiveHtml += '        </div>';
        receiveHtml += '    </div>';
        receiveHtml += '    <div id="' + messageNo + '" class="message-detail" style="display: none; margin-top: 10px; padding-top: 10px; border-top: 1px solid #ddd;" data-send="' + sendId + '">';
        receiveHtml += '        <div class="mb-2">';
        receiveHtml += '            <span class="fw-bold">보낸 사람:</span> <span class="fw-normal">' + sendNickName + "(" + maskedId + ")" + '</span>';
        receiveHtml += '        </div>';
        receiveHtml += '        <div class="mb-2">';
        receiveHtml += '            <span class="fw-bold">제목:</span> <span class="fw-normal">' + title + '</span>';
        receiveHtml += '        </div>';
        receiveHtml += '        <div class="mb-2">';
        receiveHtml += '            <span class="fw-bold">내용:</span>';
        receiveHtml += '            <p class="fw-normal">' + content + '</p>';
        receiveHtml += '        </div>';
        receiveHtml += '        <div class="d-flex justify-content-end mt-2">';
        receiveHtml += '            <button class="btn btn-outline-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#replyModal" onclick="reply(\'' + sendId + '\');">답장</button>';
        receiveHtml += '            <button class="btn btn-outline-secondary btn-sm" onclick="moveToTrash(\'' + messageNo + '\')">보관</button>';
        receiveHtml += '            <button class="btn btn-outline-danger btn-sm me-2" onclick="deleteReceiveMessage(\'' + messageNo + '\')">삭제</button>';
        receiveHtml += '        </div>';
        receiveHtml += '    </div>';
        receiveHtml += '</li>';
       
        if($("#receivedMessageList").children().eq(0).text() == "받은 쪽지가 없습니다."){
        	$("#receivedMessageList").html("");
        	$("#receivedMessageList").prepend(receiveHtml);
        }else{
        	$("#receivedMessageList").prepend(receiveHtml);
        }
        
    	
    	
    }
 	
    

};

$("#tost_message").on("click", ".hide", function(){
    $(this).closest('.toast').toast('hide');
});

//====================상태업데이트 스크립트========================
//쪽지 읽음 표시
$(document).on("click", ".list-group-item", function(){

	let messageNo = $(this).data("no");
	let $this = $(this);
	if($(this).find(".dataRead").children().eq(0).text().trim() == '안읽음'){
		
		$.ajax({
			url:"${contextPath}/member/updateMessage.do",
			type:"get",
			data: { 
	      	messageNo: messageNo,
	      	type: "read"
	  },
			success:function(response){
				
				let html = '<span class="text-primary fw-normal">읽음</span>';

	       if ($this.find(".dataRead").children().eq(0).text().trim() == '안읽음') {
	           // '안읽음' 표시를 제거하고 '읽음' 표시 추가
	           $this.find(".dataRead").children().eq(0).remove();
	           $this.find(".dataRead").prepend(html); // '읽음' 표시를 추가
	       }
	       socket.send(response);
	       
			},
			error:function(){
				console.log("ajax통신 실패");
			}
			
		})
	}
	
})
</script>







<!-- ===================== 쪽지 알람 스크립트 E ============================ -->


<!-- 네이버 쪽지함 스타일 모달 -->
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="messageModalLabel">쪽지함</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex">
                    <!-- 왼쪽 메뉴 -->
                    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="width: 200px;">
                        <button class="nav-link active" id="v-pills-received-tab" data-bs-toggle="pill" data-bs-target="#v-pills-received" type="button" role="tab" aria-controls="v-pills-received" aria-selected="true">
                            받은 쪽지함
                        </button>
                        <button class="nav-link" id="v-pills-sent-tab" data-bs-toggle="pill" data-bs-target="#v-pills-sent" type="button" role="tab" aria-controls="v-pills-sent" aria-selected="false">
                            보낸 쪽지함
                        </button>
                        <button class="nav-link" id="v-pills-compose-tab" data-bs-toggle="pill" data-bs-target="#v-pills-compose" type="button" role="tab" aria-controls="v-pills-compose" aria-selected="false">
                            새 쪽지 작성
                        </button>
                        <button class="nav-link" id="v-pills-trash-tab" data-bs-toggle="pill" data-bs-target="#v-pills-trash" type="button" role="tab" aria-controls="v-pills-trash" aria-selected="false">
                            쪽지 보관함
                        </button>
                    </div>
			 						<!-- 오른쪽 콘텐츠 영역 -->
			            <div class="col-md-9">
			                <div class="tab-content flex-grow-1" id="v-pills-tabContent">
			                    <!-- 받은 쪽지함 -->
			                    <div class="tab-pane fade show active tab-pane-scroll" id="v-pills-received" role="tabpanel" aria-labelledby="v-pills-received-tab">
			                        <div class="d-flex justify-content-between align-items-center mb-3">
			                            <h6 class="mb-0">받은 쪽지함</h6>
			                        </div>
			                        <ul class="list-group" id="receivedMessageList">
			                            <!-- 예시 쪽지 -->
			                        </ul>
			                        <div class="d-flex justify-content-center align-items-center mt-3">
			                            <ul class="pagination" id="receivePaging">
			                                <!-- 페이징 버튼 -->
			                            </ul>
			                        </div>
			                    </div>
			
			                    <!-- 보낸 쪽지함 -->
			                    <div class="tab-pane fade tab-pane-scroll" id="v-pills-sent" role="tabpanel" aria-labelledby="v-pills-sent-tab">
			                        <div class="d-flex justify-content-between align-items-center mb-3">
			                            <h6 class="mb-0">쪽지 보관함</h6>
			                        </div>
			                        <ul class="list-group" id="sentMessageList">
			                            <!-- 예시 보낸 쪽지 -->
			                        </ul>
			                        <div class="d-flex justify-content-center align-items-center mt-3">
			                            <ul class="pagination" id="sendPaging">
			                                <!-- 페이징 버튼 -->
			                            </ul>
			                        </div>
			                    </div>
			
			                    <!-- 새 쪽지 작성 -->
			                    <div class="tab-pane fade" id="v-pills-compose" role="tabpanel" aria-labelledby="v-pills-compose-tab">
			                        <h6 class="mb-3">새 쪽지 작성</h6>
			                        <form id="newMessageForm">
			                            <div class="mb-3">
			                                <label for="recipient" class="form-label"></label>
			                                <input type="text" class="form-control" id="recipient" placeholder="아이디를 입력하세요." required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="messageTitle" class="form-label">제목</label>
			                                <input type="text" class="form-control" id="messageTitle" placeholder="제목을 입력하세요" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="messageContent" class="form-label">쪽지 내용</label>
			                                <textarea class="form-control" id="messageContent" rows="5" placeholder="쪽지 내용을 입력하세요" required></textarea>
			                            </div>
			                            <button type="button" class="btn btn-primary w-100" id="sendBtn">보내기</button>
			                        </form>
			                    </div>
			
			                    <!-- 휴지통 -->
			                    <div class="tab-pane fade tab-pane-scroll" id="v-pills-trash" role="tabpanel" aria-labelledby="v-pills-trash-tab">
			                        <div class="d-flex justify-content-between align-items-center mb-3">
			                            <h6 class="mb-0">보관함</h6>
			                        </div>
			                        <ul class="list-group" id="trashMessageList">
			                            <!-- 예시 휴지통 메시지 -->
			                        </ul>
			                        <div class="d-flex justify-content-center align-items-center mt-3">
			                            <ul class="pagination" id="collectPaging">
			                                <!-- 페이징 버튼 -->
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			                    
			                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</div>

<script>

</script>






</body>
</html>