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
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.post-title {
    font-size: 2em;
    margin: 0;
    color: #333;
}
.post-meta {
    font-size: 0.9em;
    color: #666;
    margin-bottom: 15px;
}
.post-meta span {
    margin-right: 15px;
}
.post-content {
    font-size: 1.1em;
    color: #444;
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

.submit-edit {
    background-color: #fb8ce89e;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 6px 12px;
    cursor: pointer;
    font-size: 14px;
}

.submit-reply:hover {
    background-color: #218838;
}

.submit-edit:hover {
    background-color: #e996db78;
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

</style>
</head>

<body>
    
		<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
		
<div class="container">

        <!-- 게시글 S-->
         <div class="post">
		        <h1 class="post-title">${ board[0].postTitle }</h1>
		        <div class="post-meta">
		            <span>작성일: ${ board[0].postUploadDt }</span>
		            <span>닉네임: ${ board[0].writerNickName }</span>
		        </div>
		        <div class="post-image">
		        		<c:forEach var="item" items="${ attachList }">
		            	<img src="${item.filePath}/${item.filesystemName}" alt="게시글 이미지">
		            </c:forEach>
		        </div>
		        <p class="post-content">${ board[0].postContent }</p>
			    </div>
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
                <button type="submit" class="submit-comment">등록</button>
            </form>
        </div>
        <!-- 댓글 작성 폼 E -->
</div>

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
            boardNo: "${board[0].postNo}",
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
    let loginCheck = "${ loginUser == "" }";
    if(loginCheck == true){
    	
    	$("#myModal").modal("show");
    	
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
 	                    boardNo: "${board[0].postNo}",
 	                    reply: "부모댓글"
 	                },
 	                success: function(response) {
 	                    console.log('댓글 등록:', response);
 	                    if(response != null){
 	    	                $("#commentContent").val("");
 	    	                renderComments(response); // 전체 댓글 다시 렌더링                	
 	                    }
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
    
    
    let loginCheck = "${ loginUser == "" }";
    
    	 if (content === '') {
    	        alert('대댓글을 입력하세요.');
  	    } else {
  	        $.ajax({
  	            url: "${contextPath}/community/insertComment.do",
  	            type: "post",
  	            data: {
  	                id: id,
  	                boardNo: "${board[0].postNo}",
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
  	               
  	            },
  	            error: function() {
  	                console.log("AJAX 통신 실패");
  	            }
  	        });
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
    
    
    	if (content.trim() === '') {
            alert('댓글을 입력하세요.');
       } else {
           $.ajax({
               url: "${contextPath}/community/insertComment.do",
               type: "post",
               dataType:"json",
               data: {
                   id: id,
                   boardNo: "${board[0].postNo}",
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
                  
               },
               error: function() {
                   console.log("AJAX 통신 실패");
               }
           });
       }
    	
    
    
});

//-----------------------버튼 스크립트 S----------------------------------
$(document).on('click', '.reply-button', function() {
		let toName1 = "┖─" + $(this).closest(".comment").find(".user-nickname").text();
		let toName2 = "┖─" + $(this).closest(".replies").find(".user-nickname").text();
    console.log("toName : >>" + toName2);
    
	
    // 현재 클릭한 버튼이 속한 댓글/대댓글에서 reply-form, reply-form-form 선택
    var $currentForm = $(this).closest('.comment, .replies').find('.reply-form, .reply-form-form');

    // 동일한 댓글/대댓글 내에서만 폼이 토글되도록 수정
    if ($currentForm.is(":visible")) {
        $currentForm.hide(); // 이미 열려 있으면 숨기기
    } else {
        // 현재 댓글/대댓글 내에서 모든 폼을 숨기고 선택된 폼만 보이기
        $(this).closest('.comment, .replies').find('.reply-form, .reply-form-form').hide();
        $currentForm.show();
        $(this).closest('.comment').find('.replyContent').val(toName1);
        $(this).closest('.replies').find('.replyContent').val(toName2);
    }
});

// 댓글 수정 버튼 클릭 시
$(document).on("click", ".edit-comment", function() {
		let toName = "┖─" + $(this).closest(".comment").find(".user-nickname").text();
    console.log("toName : >>" + toName);
	
    var $editForms = $(this).closest('.comment').find('.edit-form');
    
    if ($editForms.is(":visible")) {
        $editForms.hide(); // 이미 열려 있으면 숨깁니다.
    } else {
        // 현재 댓글 내에서만 모든 폼 숨기고 선택된 폼만 보이기
        $(this).closest('.comment').find('.reply-form, .reply-form-form, .edit-form').hide();
        $editForms.show();
        $(this).closest('.comment').find('.replyContent').val(toName);
    }
    
    
});

// 대댓글 수정 버튼 클릭 시
$(document).on("click", ".edit-reply", function() {
		let toName = "┖" + $(this).closest(".replies").find(".user-nickname").text();
    var $editForm = $(this).closest('.replies').find('.edit-form-form');
    
    if ($editForm.is(":visible")) {
        $editForm.hide(); // 이미 열려 있으면 숨깁니다.
    } else {
        // 현재 대댓글 내에서만 모든 폼 숨기고 선택된 폼만 보이기
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
    var html = '<div class="comments">';

    
    for (let i = 0; i < comments.length; i++) {
    	
    	var style = comments[i].userNo != login ? 'style="display:none;"' : '';
    	let buttonStyle = comments[i].delYN == "N";
    	
        if (comments[i].parentNum == 0 && comments[i].refOrder == 0) {
        	
            html += '<div class="comment">';
            html += '  <div class="comment-header">';
            html += '    <strong class="user-nickname">' + comments[i].userNickName + '</strong>';
            html += '    <p class="comment-content">' + (buttonStyle ? comments[i].content : "<b style='color:gray'>삭제된 댓글입니다.</b>")  + '</p>';
            html += '    <span class="comment-date">' + timeForToday(comments[i].registDt) + '</span>';
            html += '    <div ' + (buttonStyle ? "" : "style='display:none;'") +' class="comment-actions"' +  style + '>';
            html += '      <button class="reply-button">답글쓰기</button>';
            html += '      <button class="edit-comment">수정</button>';
            html += '      <button class="delete-comment">삭제</button>';
            html += '    </div>';
            
            html += '  <div class="edit-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="edit-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="댓글을 수정하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-edit">수정</button>';
            html += '    </form>';
            html += '  </div>';
            
            
            html += '  <div class="reply-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
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
            html += '        <strong class="user-nickname" data-step="' + comments[i].step  + '">' + comments[i].userNickName + '</strong>';
            html += '        <p class="reply-content">' + (buttonStyle ? comments[i].content : "<b style='color:gray'>삭제된 댓글입니다.</b>")  + '</p>';
            html += '        <span class="reply-date">' + timeForToday(comments[i].registDt) + '</span>';
            html += '        <div ' + (buttonStyle ? "" : "style='display:none;'") + 'class="reply-actions" ' +  style + '>';
            html += '          <button class="reply-button">답글쓰기</button>';
            html += '          <button class="edit-reply">수정</button>';
            html += '          <button class="delete-reply">삭제</button>';
            html += '        </div>';
            html += '      </div>';
            html += '    </div>';
            
            html += '  <div class="edit-form-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="edit-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="댓글을 수정하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-edit-edit">수정</button>';
            html += '    </form>';
            html += '  </div>';
            
            html += '  <div class="reply-form-form" style="display: none;" data-step="' + comments[i].step  + '" data-ref="' + comments[i].refGroup + '">';
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

function paging(pi){
	
	let htmlPI = '';
	
	if(pi.listCount != 0){
		
   if (pi.currentPage == 1) {
	   htmlPI += "<button class='page bt' disabled>이전</button>";
   } else {
	   htmlPI += "<button class='page bt' onclick='loadPage(" + (pi.currentPage - 1) + ")'>이전</button>";
   }

   // 페이지 번호 버튼 렌더링
   for (let i = 1; i <= pi.endPage; i++) {
       if (i == pi.currentPage) {
    	   htmlPI += '<button class="page" disabled active>' + (i) + '</button>';
       } else {
    	   htmlPI += "<button class='page'" + (pi.currenPage == i ? "disabled active" : "")  + " onclick='loadPage(" + i + ")'>" + (i) + "</button>";
       }
   }

   // Next 버튼 렌더링
   if (pi.currentPage == pi.maxPage) {
	   htmlPI += "<button class='page bt' disabled>다음</button>";
   } else {
	   htmlPI +=  "<button class='page bt' onclick='loadPage(" + (pi.currentPage + 1) + ")'>다음</button>";
   }

   $('.pagination').html(htmlPI);
   
   
	}else{
		
		$('.pagination').html("");
		
	}
	
	

}


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
    				boardNo:"${board[0].postNo}"
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
        	data:"id=" + id + "&boardNo=" + "${board[0].postNo}",
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
						boardNo: "${board[0].postNo}" 
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
        	data:"id=" + id + "&boardNo=" + "${board[0].postNo}",
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


</body>


</html>