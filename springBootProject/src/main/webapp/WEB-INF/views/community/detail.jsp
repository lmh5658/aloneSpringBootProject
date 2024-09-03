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
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
    font-family: Arial, sans-serif;
    padding: 20px;
}

/* 게시글 스타일 */
.post {
    max-width: 1176px;
    margin: 20px auto;
    padding: 41px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
}
.post-title {
    font-size: 2em;
    margin: 0;
    color: #333;
    padding-bottom: 26px;
}
.post-meta {
    font-size: 19px;
    color: #666;
    margin-bottom: 15px;
    display: flex;
    justify-content: space-between;
}
.post-meta span {
    margin-right: 15px;
}
.post-content {
    font-size: 1.1em;
    color: #444;
    min-height: 150px;
}
.post-image {
    margin: 20px 0;
    text-align: center;
}
.post-image img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

/* 댓글 목록 */
.comments-section {
    margin-bottom: 20px;
}

.comments {
    border-top: 1px solid #ddd;
    padding-top: 10px;
}

.comment {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    background-color: #f9f9f9;
    margin-bottom: 15px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.comment-header {
    display: flex;
    flex-direction: column;
}

.user-nickname {
    font-weight: bold;
    color: #333;
}

.comment-content {
    margin: 5px 0;
    font-size: 16px;
    color: #666;
}

.comment-date {
    font-size: 14px;
    color: #999;
    margin-top: 5px;
}

.comment-actions {
    margin-top: 10px;
    display: flex;
    gap: 10px;
}

.reply-button, .edit-comment, .delete-comment {
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 6px 12px;
    cursor: pointer;
    font-size: 14px;
}

.reply-button:hover, .edit-comment:hover, .delete-comment:hover {
    background-color: #0056b3;
}

.edit-comment, .delete-comment {
    background-color: #ffc107;
}

.edit-comment:hover {
    background-color: #e0a800;
}

.delete-comment {
    background-color: #dc3545;
}

.delete-comment:hover {
    background-color: #c82333;
}

/* 대댓글 폼 */
.reply-form {
    margin-top: 10px;
    padding: 10px;
    border-top: 1px solid #ddd;
    background-color: #ffffff;
    border-radius: 5px;
}

.reply-form-content textarea {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
}

.submit-reply {
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 6px 12px;
    cursor: pointer;
    font-size: 14px;
}
.submit-reply:hover {
  background-color: #84b5e9a3;
}
.submit-reply-reply:hover{
	background-color: #84b5e9a3;
}

/* 대댓글 박스 */
.replies {
    margin-top: 10px;
    padding-left: 20px;
    border-left: 3px solid #ddd;
}

.reply {
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 10px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.reply-header {
    display: flex;
    flex-direction: column;
}

.reply-content {
    font-size: 14px;
    color: #666;
}

.reply-date {
    font-size: 12px;
    color: #999;
    margin-top: 5px;
}

.reply-actions {
    margin-top: 10px;
    display: flex;
    gap: 10px;
}

.edit-reply, .delete-reply {
    background-color: #ffc107;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 6px 12px;
    cursor: pointer;
    font-size: 14px;
}

.edit-reply:hover {
    background-color: #e0a800;
}

.delete-reply {
    background-color: #dc3545;
}

.delete-reply:hover {
    background-color: #c82333;
}

/* 댓글 작성 폼 */
.comment-form-container {
    border-top: 1px solid #ddd;
    padding-top: 20px;
}

.comment-form {
    display: flex;
    flex-direction: column;
}

.comment-form textarea {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
}

.submit-comment {
    align-self: flex-end;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 8px 16px;
    cursor: pointer;
    font-size: 14px;
}

.submit-comment:hover {
    background-color: #0056b3;
}
.edit-form .replyContent{
		width: 583px;
    resize: none;
}
.edit-form-form .replyContent{
		width: 583px;
    resize: none;
}    
.edit-form-content{
    display: flex;
    align-items: flex-end;
    margin: 17px;
}

.comment * {
    font-size: 16px; /* 글자 크기 조정 */
    color: gray;
}
.replies *{
    font-size: 16px; /* 글자 크기 조정 */
    color: gray;
}

.comment button{
    font-size: 15px; /* 글자 크기 조정 */
    color: white;
}
.replies button{
    font-size: 15px; /* 글자 크기 조정 */
    color: white;
}

.comment .comment-content{
	  font-size: 18px; /* 글자 크기 조정 */
    color: black;
}
.replies .reply-content{
	  font-size: 18px; /* 글자 크기 조정 */
    color: black;
}
.submit-reply-reply{
	color:black;
}

#grate{
display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
}
#greate{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border: 1px solid #d3cbcb;
    padding: 7px;
    border-radius: 10px;
    width: 77px;
}
.submit-reply{
background: #84b5e9;
}
.submit-reply-reply{
	border:none;
	background: #84b5e9;
	color: black;
	padding: 8px;
  border-radius: 8px;
  width: 52px;
}
#modify_button{
    border: none;
    background: #84b5e9;
    padding: 10px 20px;
    border-radius: 17px;
    color: white;
}
#delete_button{
    border: none;
    background: #e98484;
    padding: 10px 20px;
    border-radius: 17px;
    color: white;
}

#modify_button:hover{
    background: #84b5e9ad;
}
#delete_button:hover{
    background: #e98484b0;
}
#attach_div{
border: 1px solid #ced4da;
    padding: 10px;
    border-radius: 10px;
    width: 500px;
    margin-top: 54px;
}

.submit-edit-edit, .submit-edit{
    border: none;
    width: 49px;
    padding: 7px;
    border-radius: 10px;
    background: pink;
}
.submit-edit-edit:hover{
	background: #ffc0cbb3;
}
.submit-edit:hover {
  background: #ffc0cbb3;
}
.edit-form .replyContent {
    resize: none;
    border: 1px solid #dddddd;
}

.edit-form-form .replyContent{
resize: none;
    border: 1px solid #dddddd;
}
 .reply {
      position: relative; /* 버튼과 메시지 박스를 이 기준으로 배치 */
    }
  .comment-header {
      position: relative; /* 버튼과 메시지 박스를 이 기준으로 배치 */
    }

    .message_btn {
      width: 51px;
      border: none;
      background: none;
      position: relative; /* 메시지 박스를 버튼 기준으로 위치시키기 위해 */
    }

    .message-box {
      position: absolute; /* 버튼을 기준으로 절대 위치 설정 */
      border: 1px solid black;
      width: 72px; /* 적절한 너비 설정 */
      height: 25px; /* 적절한 높이 설정 */
      background: #f9f9f9;
      display: none; /* 초기 상태에서 숨김 */
      z-index: 1000; /* 버튼 위에 위치하도록 설정 */
      right: 0; /* 버튼의 오른쪽으로 위치 조정 */
      bottom: -30px; /* 버튼 아래쪽으로 위치 조정 (버튼 높이와 간격 조정) */
      cursor: pointer;
      background: rgb(132, 181, 233);
    color: white;
    border: 1px solid #adb5bd;
    }
</style>
</head>

<body>
    
		<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
		
<div class="container">

        <!-- 게시글 S-->
         <div class="post">
	         	<div style="display: flex;justify-content: space-between;">
	         	  <div>
					        <h1 class="post-title">제목:&nbsp;${ board.postTitle }</h1>
			         </div>
	        		<div>
	        			<button id="kakao-link-btn" style="border: none;background: none;">
	        			<svg style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
								  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"/>
								</svg>Kakao공유
								</button>
		        	</div>
	         	</div>
		        <div class="post-meta">
		        		<div>
			            <span>닉네임:&nbsp;&nbsp;${ board.writerNickName }</span><br>		        		
			            <span>작성일:&nbsp;&nbsp;${ board.postUploadDt }</span>
		        		</div>
		        		<div>
		        			<span>조회수:&nbsp;&nbsp;${ board.postCount } </span>
		        		</div>
		        </div>
		        <div class="post-image">
		        	<c:if test="${ not empty attachList }">
		        		<c:forEach var="item" items="${ attachList }">
		            	<img src="${item.filePath}/${item.filesystemName}">
			            </c:forEach>
		        	</c:if>
		        </div>
		        <div class="post-content">
		        	 <c:out value="${board.postContent}" escapeXml="false" />
		        </div>
		        <c:if test="${not empty board.locationName and board.postType eq 'G' }">
			        <div id="map" style="width: 400px; height: 300px;"></div>
		        </c:if>
		        <div id="grate">
		        		<div id="greate">
		        			<div>
										<svg id="like_button" style="cursor: pointer; ${checkLike == 1 ? 'color:rgba(255, 7, 7, 0.57)' : 'rgb(51, 51, 51)'}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
										  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
										</svg>
		        			</div>
		        			<div>
										좋아요&nbsp;<strong style="font-weight: bold;" id="likeCounter">${ board.postLike == 0 ? "" : board.postLike }</strong>
		        			</div>
		        		</div>
		        		
		        </div>
		        <div id="attach_div">
			          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">
			          	<path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7z"/>
	              </svg><c:if test="${ empty board.attachList }">  첨부파일없음</c:if><br>
			        	<c:forEach var="at" items="${ board.attachList }">
				        	<a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a><br>
			        	</c:forEach>
		        </div>
			    </div>
	    		<div>
						<button type="button" id="history_button" style="border: none;background: #f9f9f9;"> ←뒤로가기</button>
					</div>
			    <c:if test="${ loginUser.userNo == board.writerNo }">
						<div style="display: flex;justify-content: flex-end;gap: 23px;">
							<button type="button" id="modify_button">수정</button>
							<button type="button" id="delete_button">삭제</button>
						</div>
			    </c:if>
			    
			    <script>
			    	$("#modify_button").on("click", function(){
			    		location.href="${contextPath}/community/modifyForm.page?postNo=${board.postNo}&postType=${board.postType}";
			    	})
			    	$("#delete_button").on("click", function(){
			    		if(confirm("게시글을 삭제 하시겠습니까?")){
			    		 location.href="${contextPath}/community/deleteBoard.do?postNo=${board.postNo}&postType=${board.postType}";			    			
			    		}
			    	})
			    </script>
				<!-- 게시글 E-->
				
        <!-- 댓글 목록 S -->
        <h2>댓글</h2>
        <div class="comments-section">
        
						 
            
        </div>
        <!-- 댓글 목록 E -->
        
        <!-- 페이징영역 S -->
	      	 <div style="display: flex; justify-content: center; align-items: center;">
						 <ul class="pagination">
						 
        		 </ul>
	        </div>
				<!-- 페이징영역 E -->
				
				
        <!-- 댓글 작성 폼 S -->
        <div class="comment-form-container">
            <h2>댓글 작성</h2>
            <form class="comment-form">
                <textarea id="commentContent" placeholder="댓글을 입력하세요." rows="4"></textarea>
                <button type="button" class="submit-comment" style="background: #84b5e9;">등록</button>
            </form>
        </div>
        <!-- 댓글 작성 폼 E -->
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script> 
<script>
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
$(document).ready(function(){
	let search = "${board.locationName}";
ps.keywordSearch(search, placesSearchCB); 	
})

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
// 마커를 생성하고 지도에 표시합니다
var marker = new kakao.maps.Marker({
    map: map,
    position: new kakao.maps.LatLng(place.y, place.x) 
});

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
    infowindow.open(map, marker);
});

}
</script>
<script>
$("#history_button").on("click", function() {
    history.back();
});

$("#like_button").on("click", function(){
	console.log($("#like_button").css("color"));
	
	if("${loginUser}" == ""){
		$("#myMoal").modal("show");
	}else{
		
		console.log( $(this).css("color"));
		let postNo = "${board.postNo}";
		
		if($("#like_button").css("color") == "rgb(51, 51, 51)"){
			$.ajax({
 			url:"${contextPath}/community/udpateLike.do",
 			type:"post",
 			data:{postNo:postNo},
 			success:function(response){
 				$("#like_button").css("color", "rgba(255, 7, 7, 0.57)");
 				
 				let likeCount = response;
 				$("#likeCounter").html(likeCount == 0 ? "" : likeCount);
 				
 			},
 			error:function(){
 				
 			}
 		})
		}else if($("#like_button").css("color") == "rgba(255, 7, 7, 0.57)"){
			$.ajax({
 			url:"${contextPath}/community/delteLike.do",
 			type:"post",
 			data:{postNo:postNo},
 			success:function(response){
 				$("#like_button").css("color", "rgb(51, 51, 51)");
 				
 				let likeCount = response;
 				$("#likeCounter").html(likeCount == 0 ? "" : likeCount);
 			},
 			error:function(){
 				
 			}
 		})
		}
		
	}
	
})
</script>

<script>
var arrKey = [];

localStorage.setItem('arrKey', JSON.stringify(arrKey));
let arr = JSON.parse(localStorage.getItem('arrKey')) || [];
//페이지 진입시 리스트 뿌려주기
$(document).ready(function(){

	loadPage(1);
	 
})

function loadPage(page){
	
	$.ajax({
        url: "${contextPath}/community/ajaxCommentSelect.do",
        type: "get",
        data: {
            boardNo: "${board.postNo}",
            page:page
        },
        success: function(response) {
            console.log('댓글 등록:', response);
            
            if(response != ""){
            	$("#commentContent").html(''); // 댓글 작성 폼 초기화
                
                renderComments(response); // 전체 댓글 다시 렌더링  
            }
                 
        },
        error: function(response) {
            console.log("AJAX 통신 실패 =>" + response);
        }
    });
	
}


$(document).on('click', '.submit-comment', function(e) {
    e.preventDefault(); // 폼 제출 방지
    
    let content = $("#commentContent").val().trim();
    //로그인체크
   
    if("${ loginUser}" == ""){
    	
    	$("#myModal").modal('show');
    	
    }else{
    	
    	if (content === '') {
            alert('댓글을 입력하세요.');
        } else {
        		if(confirm("댓글을 등록하시겠습니까?")){
        			 $.ajax({
 	                url: "${contextPath}/community/insertComment.do",
 	                type: "post",
 	                data: {
 	                    content: content,
 	                    refOrder: 0,
 	                    step: 0,
 	                    parentNum: 0,
 	                    boardNo: "${board.postNo}",
 	                    reply: "부모댓글"
 	                },
 	                success: function(response) {
 	                    console.log('댓글 등록:', response);

 	                    if(response != null){
 	    	                $("#commentContent").val("");
 	    	                renderComments(response); // 전체 댓글 다시 렌더링                	
 	                    }
 	                    
 	                    $.ajax({
 	                    	url:"${contextPath}/member/userSearch.do",
 	                    	type:"get",
 	                    	data:{
 	                    		userNo:"${board.writerNo}",
 	                    		postType:"${board.postType}",
 	                      	postNo:"${board.postNo}"
 	                    	},
 	                  		success:function(response){
 	                  			socket.send("" + "," + "${board.writerNickName}" + "," + response + "," + "${board.postType}" + "," + "${board.postNo}");
 	                  		},
 	                  		error:function(){
 	                  			
 	                  		}
 	                    })
 	                    
 	                },
 	                error: function(response) {
 	                    console.log("AJAX 통신 실패 =>" + response);
 	                }
        	     });
        			 
        		}else{
        			
        		}
           
        }
    	
    }
    
});

// 대댓글 폼 제출 처리
$(document).on('click', '.submit-reply', function(e) {
    e.preventDefault(); // 폼 제출 방지
    let refGroup = $(this).closest(".reply-form").data("ref");
    let content = $(this).closest(".reply-form").find(".replyContent").val().trim();
    let id = $(this).closest(".reply-form").find(".reply-form-content").data("id");
    let nickName = $(this).closest(".reply-form").data("name");
    
    let loginCheck = ("${loginUser}" == "");
    if(loginCheck == false){
    	 if (content === '') {
 	        alert('대댓글을 입력하세요.');
	    } else {
	        $.ajax({
	            url: "${contextPath}/community/insertComment.do",
	            type: "post",
	            data: {
	                id: id,
	                boardNo: "${board.postNo}",
	                refGroup: refGroup,
	                content: content,
	                reply: "대댓글"
	            },
	            success: function(response) {
	            	
	            	if(response != null){
	            		 console.log('대댓글 등록:', response);
	            		 
		                $(this).closest(".reply-form").find(".replyContent").val(''); // 대댓글 폼 초기화
		                $(this).closest(".reply-form").hide(); // 대댓글 폼 숨기기
		                renderComments(response); // 전체 댓글 다시 렌더링
	            	}
	            	
	            	  $.ajax({
                   	url:"${contextPath}/member/userIdSearch.do",
                   	type:"get",
                   	data:{
                   		nickName:nickName,
                   		postType:"${board.postType}",
                   		postNo:"${board.postNo}"
                   	},
                 		success:function(response){
                 			socket.send("" + "," + nickName + "," + response + "," + "${board.postType}" + "," + "${board.postNo}" + "," + "");
                 		},
                 		error:function(){
                 			
                 		}
                  })
                  
	            },
	            error: function() {
	                console.log("AJAX 통신 실패");
	            }
	        });
	    }
    }else{
    	$("#myModal").modal('show');
    }
    	
   
   
});

//대대대대대댓글 폼 제출 처리
$(document).on('click', '.submit-reply-reply', function(e) {
    e.preventDefault(); // 폼 제출 방지
    
    let reply = $(this).closest(".reply-form-form");
    
    let refGroup = reply.data("ref");
    let content = reply.find(".replyContent").val();
    let id = reply.find(".reply-form-content").data("id");
    let step = reply.data("step");
    let refOrder = $(this).closest(".replies").find(".reply-header").data("order");
    let nickName = $(this).closest(".reply-form-form").data("name");
    
    	if (content.trim() === '') {
            alert('댓글을 입력하세요.');
       } else {
           $.ajax({
               url: "${contextPath}/community/insertComment.do",
               type: "post",
               dataType:"json",
               data: {
                   id: id,
                   boardNo: "${board.postNo}",
                   refGroup: refGroup,
                   content: content,
                   reply: "대대대댓글",
                   refOrder: refOrder,
                   step: step
                   //arr: arr
                   
               },
               success: function(response) {
               	
               	if(response != null){
               		 console.log('대댓글 등록:', response);
               		 
   	                $(this).closest(".reply-form").find(".replyContent").val(''); // 대댓글 폼 초기화
   	                $(this).closest(".reply-form").hide(); // 대댓글 폼 숨기기
   	                renderComments(response); // 전체 댓글 다시 렌더링
               	}
               	
                $.ajax({
                   	url:"${contextPath}/member/userIdSearch.do",
                   	type:"get",
                		data:{
                   		nickName:nickName,
                   		postType:"${board.postType}",
                   		postNo:"${board.postNo}"
                   	},
                 		success:function(response){
                 			socket.send("" + "," + nickName + "," + response + "," + "${board.postType}" + "," + "${board.postNo}" + "," + "");
                 		},
                 		error:function(){
                 			
                 		}
                })
                  
               },
               error: function() {
                   console.log("AJAX 통신 실패");
               }
           });
       }
    	
    
    
});

//-----------------------버튼 스크립트 S----------------------------------
$(document).on('click', '.reply-button', function() {
		let toName1 = "@" + $(this).closest(".comment").find(".user-nickname").text();
		let toName2 = "@" + $(this).closest(".replies").find(".user-nickname").text();
    console.log("toName : >>" + toName2);
    
    var $currentForm = $(this).closest('.comment, .replies').find('.reply-form, .reply-form-form');

    if ($currentForm.is(":visible")) {
        $currentForm.hide(); 
    } else {
        $(this).closest('.comment, .replies').find('.reply-form, .reply-form-form').hide();
        $currentForm.show();
        $(this).closest('.comment').find('.replyContent').val(toName1);
        $(this).closest('.replies').find('.replyContent').val(toName2);
    }
});

// 댓글 수정 버튼 클릭 시
$(document).on("click", ".edit-comment", function() {
		let toName = "@" + $(this).closest(".comment").find(".user-nickname").text();
    console.log("toName : >>" + toName);
	
    var $editForms = $(this).closest('.comment').find('.edit-form');
    
    if ($editForms.is(":visible")) {
        $editForms.hide(); 
    } else {
        $(this).closest('.comment').find('.reply-form, .reply-form-form, .edit-form').hide();
        $editForms.show();
        $(this).closest('.comment').find('.replyContent').val(toName);
    }
    
    
});

// 대댓글 수정 버튼 클릭 시
$(document).on("click", ".edit-reply", function() {
		let toName = "@" + $(this).closest(".replies").find(".user-nickname").text();
    var $editForm = $(this).closest('.replies').find('.edit-form-form');
    
    if ($editForm.is(":visible")) {
        $editForm.hide();
    } else {
        $(this).closest('.replies').find('.reply-form, .reply-form-form, .edit-form-form').hide();
        $editForm.show();
        $(this).closest('.replies').find('.replyContent').val(toName);
    }
});

//-------------------------버튼스크립트 E-----------------------------------

// 댓글과 대댓글을 렌더링하는 함수
function renderComments(comment) {
    let comments = comment.list;
    let pi = comment.pi;
    let login = "${loginUser.userNo}";
    var loginCheck = "${loginUser}" == "" ? 'style="display:none;"' : '';

    var html = '<div class="comments">';
    for (let i = 0; i < comments.length; i++) {
        var style = comments[i].userNo != login ? 'style="display:none;"' : '';
        let buttonStyle = comments[i].delYN == "N";

        if (comments[i].parentNum == 0 && comments[i].refOrder == 0) {
            html += '<div class="comment">';
            html += '  <div class="comment-header">';
            html += '   <button class="message_btn">';
            html += '    <strong class="user-nickname">' + comments[i].userNickName + '</strong>';
            html += '  	</button>';
            html += '    <div class="message-box" data-writerno="' + comments[i].userNo + '" data-name="' + comments[i].userNickName + '" style="left: 26px;top: 18px;" data-bs-toggle="modal" data-bs-target="#messageModal" data-button-class="nav-link active">쪽지보내기</div>';	
            html += '    <p class="comment-content">' + (buttonStyle ? comments[i].content : "<b style='color:gray'>삭제된 댓글입니다.</b>") + '</p>';
            html += '    <span class="comment-date">' + timeForToday(comments[i].registDt) + '</span>';
            html += '    <div ' + (buttonStyle ? "" : "style='display:none;'") + ' class="comment-actions"' + loginCheck + '>';
            html += '      <button class="reply-button" data-id="' + comments[i].id + '">답글쓰기</button>';
            html += '      <button class="edit-comment"' + style + '>수정</button>';
            html += '      <button class="delete-comment"' + style + '>삭제</button>';
            html += '    </div>';
            html += '  <div class="edit-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="edit-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="댓글을 수정하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-edit"' + style + '>수정</button>';
            html += '    </form>';
            html += '  </div>';
            html += '  <div class="reply-form" data-name="' + comments[i].userNickName + '" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="reply-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="대댓글을 입력하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-reply">등록</button>';
            html += '    </form>';
            html += '  </div>';
            html += '  </div>';
        }

        if (comments[i].parentNum != 0) {
            html += '  <div class="replies" data-no="' + comments[i].id + '">';
            html += '    <div class="reply">';
            html += '      <div class="reply-header" data-order="' + comments[i].refOrder + '">';
            html += '      <button class="message_btn">';
            html += '        <strong class="user-nickname" data-step="' + comments[i].step + '">' + comments[i].userNickName + '</strong>';
            html += '      </button>';
            html += '      <div class="message-box" data-writerno="' + comments[i].userNo + '" data-name="' + comments[i].userNickName + '" style="left: 37px;top: 27px;" data-bs-toggle="modal" data-bs-target="#messageModal">쪽지보내기</div>';
            html += '      <p class="reply-content">' + (buttonStyle ? comments[i].content : "<b style='color:gray'>삭제된 댓글입니다.</b>") + '</p>';
            html += '      <span class="reply-date">' + timeForToday(comments[i].registDt) + '</span>';
            html += '      <div ' + (buttonStyle ? "" : "style='display:none;'") + ' class="reply-actions"' + loginCheck + '>';
            html += '        <button class="reply-button" data-id="' + comments[i].id + '">답글쓰기</button>';
            html += '        <button class="edit-reply"' + style + '>수정</button>';
            html += '        <button class="delete-reply"' + style + '>삭제</button>';
            html += '      </div>';
            html += '     </div>';
            html += '    </div>';
            html += '  <div class="edit-form-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="edit-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="댓글을 수정하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-edit-edit"' + style + '>수정</button>';
            html += '    </form>';
            html += '  </div>';
            html += '  <div class="reply-form-form" data-name="' + comments[i].userNickName + '" style="display: none;" data-step="' + comments[i].step + '" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="reply-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="대댓글을 입력하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-reply-reply">등록</button>';
            html += '    </form>';
            html += '  </div>';
            html += ' </div>';
        }

        if (comments[i].parentNum == 0 && comments[i].refOrder == 0) {
            html += '</div>'; // comment div 닫기
        }
    }

    html += '</div>'; // comments div 닫기

    $('.comments-section').html(html);

    paging(pi);
}

// 닉네임 클릭시 쪽지보내기 모달나타는 스크립트---------------------
var modal = new bootstrap.Modal(document.getElementById('messageModal'));
$(document).on('click', '.message-box', function() {
	
    let writerNo = $(this).data("writerno");
    let nickName = $(this).data("name");
    console.log(nickName);
	   modal.show();
    
    $('#v-pills-compose-tab').click();
    $("#recipient").val(nickName);
});

$(document).on("click", ".btn-close", function(){
    modal.hide();
});
  
$(document).on("click", ".message_btn", function() {
    var messageBox = $(this).next('.message-box'); // 버튼 바로 다음에 위치한 .message-box 선택
    if (messageBox.css('display') == "none") {
      $(".message-box").css("display", "none");
      messageBox.css("display", "block"); // 이미 보이는 상태이면 숨김
    } else {
    	messageBox.css("display", "none"); // 다른 모든 쪽지 박스 숨김
    }
});

//------------------------------------------------

function paging(pi) {
    let htmlPI = '';

    if (pi.listCount != 0) {
        if (pi.currentPage == 1) {
            htmlPI += "<button class='page bt' disabled>이전</button>";
        } else {
            htmlPI += "<button class='page bt' data-page='" + (pi.currentPage - 1) + "'>이전</button>";
        }

        // 페이지 번호 버튼 렌더링
        for (let i = 1; i <= pi.endPage; i++) {
            if (i == pi.currentPage) {
                htmlPI += '<button class="page" data-page="' + i + '" disabled>' + (i) + '</button>';
            } else {
                htmlPI += "<button class='page' data-page='" + i + "'>" + (i) + "</button>";
            }
        }

        // Next 버튼 렌더링
        if (pi.currentPage == pi.maxPage) {
            htmlPI += "<button class='page bt' disabled>다음</button>";
        } else {
            htmlPI += "<button class='page bt' data-page='" + (pi.currentPage + 1) + "'>다음</button>";
        }

        $('.pagination').html(htmlPI);
    } else {
        $('.pagination').html("");
    }
}

$(document).on('click', '.page', function(event) {
    const page = $(this).data('page');
    if (page) {
		    event.stopPropagation(); // 클릭 이벤트 전파 방지
        loadPage(page);
    }
});

$(document).on("click", ".message_btn", function(){
	
})


//댓글 수정 버튼 클릭 시 수정 처리
$(document).on('click', '.submit-edit', function(e) {
	  e.preventDefault();
    var $comment = $(this).closest('.edit-form');
    
    var $content = $comment.find('.replyContent').val();
		let id = $comment.find(".edit-form-content").data("id");
		
		
    if ( $content.trim != "" ) {
					
    		$.ajax({
    			url:"${contextPath}/community/updateComment.do",
    			type:"post",
    			data:{
    				id:id,
    				content:$content,
    				boardNo:"${board.postNo}"
    			},
    			success:function(response){
    				
    				if(response != ""){
    					alert("댓글 수정이 완료되었습니다.");
    					renderComments(response); // 전체 댓글 다시 렌더링
    				}else{
    					console.log("success 실패")
    				}
    					
    					
    			},
    			error:function(){
    				console.log("ajax통신 오류");
    			}
    			
    		});
        // 서버에 수정된 내용 전송 로직 추가 가능
    }else{
    	alert("내용이 없습니다 다시 작성해주세요.");
    }
    
});

// 댓글 삭제 버튼 클릭 시 삭제 처리
$(document).on('click', '.delete-comment', function() {
	
		let id = $(this).closest(".comment").find(".edit-form-content").data("id");
    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
        $.ajax({
        	url:"${contextPath}/community/updateDeleteComment.do",
        	type:"get",
        	data:"id=" + id + "&boardNo=" + "${board.postNo}",
        	success:function(response){
        		if(response != ""){
							alert("댓글이 정상적으로 삭제되었습니다.");
							renderComments(response); // 전체 댓글 다시 렌더링
						}else{
							console.log("success 실패")
						}
					
        	},
        	error:function(){
        		console.log("ajax통신 오류");
        	}
        })

    }
});



//대댓글 수정 버튼 클릭 시 수정 처리
$(document).on('click', '.submit-edit-edit', function(e) {
	
		e.preventDefault();
    let reply = $(this).closest('.replies');
    let content = reply.find('.replyContent').val();
    let id = reply.find(".edit-form-content").data("id");
    
    console.log("content>>" + content);
		console.log("id>>" + id);
		
    if ( content.trim != "" ) {
		
				$.ajax({
					url:"${contextPath}/community/updateComment.do",
					type:"post",
					data:{
						id: id,
						content: content,
						boardNo: "${board.postNo}" 
					},
					success:function(response){
						
						if(response != ""){
							alert("댓글이 정상적으로 수정되었습니다.");
							renderComments(response); // 전체 댓글 다시 렌더링
						}else{
							console.log("success 실패")
						}	
						
					},
					error:function(){
						console.log("ajax통신 오류");
					}
					
				});
				
		}else{
			alert("내용이 없습니다 다시 작성해주세요.");
		}
});


// 대댓글 삭제 버튼 클릭 시 삭제 처리
$(document).on('click', '.delete-reply', function() {
	
		let $reply = $(this).closest('.replies');
		let id = $reply.find(".edit-form-content").data("id");
		
    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
        $.ajax({
        	url:"${contextPath}/community/updateDeleteComment.do",
        	type:"get",
        	data:"id=" + id + "&boardNo=" + "${board.postNo}",
        	success:function(response){
        		if(response != ""){
							alert("댓글이 정상적으로 삭제되었습니다.");
							renderComments(response); // 전체 댓글 다시 렌더링
						}else{
							console.log("success 실패")
						}
					
        	},
        	error:function(){
        		console.log("ajax통신 오류");
        	}
        })

    }
});

//시간조회 스크립트
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



<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  Kakao.init('${kakaoKey}');
</script>
<script>
/*
const content = {
	  title: "${board.postTitle}",
	  description:"likecount: ${board.postLike} commentCount: ${board.postComment}",
	  imageUrl: '',
	  link: {
	    mobileWebUrl: 'https://developers.kakao.com',
	    androidExecParams: 'test',
	  },
}
*/
Kakao.Link.createDefaultButton({
  container: '#kakao-link-btn',
  objectType: 'feed', 
  content: {
    title: "${board.postTitle}",
	  description:"좋아요수 ${board.postLike} 댓글수 ${board.postComment}",
    imageUrl: '',
    link: {
      mobileWebUrl: 'https://developers.kakao.com',
      androidExecParams: 'test',
    },
  }
  /*
  buttons: [
    {
      title: '웹으로 이동',
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
      },
    },
    {
      title: '앱으로 이동',
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
      },
    },
  ],
  */
})
</script>


</body>


</html>