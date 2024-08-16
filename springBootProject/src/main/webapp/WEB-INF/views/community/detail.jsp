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
    width: 90%;
    max-width: 800px;
    margin: 0 auto;
    font-family: Arial, sans-serif;
    padding: 20px;
}

/* 게시글 스타일 */
.post {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.post-title {
    margin: 0;
    font-size: 28px;
    color: #333;
}

.post-content {
    margin-top: 10px;
    font-size: 18px;
    color: #555;
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
    background-color: #218838;
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


</style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
		
<div class="container">
        <!-- 게시글 -->
        <div class="post">
            <h1 class="post-title">게시글 제목</h1>
            <p class="post-content">게시글 내용이 여기에 들어갑니다. 게시글에 대한 설명과 내용을 적습니다.</p>
        </div>

        <!-- 댓글 목록 -->
        <h2>댓글</h2>
        <div class="comments-section">
        
						 
            
        </div>
        
        
        <!-- 페이징영역 -->
	       <c:if test="${ not empty commentList }">
	      	 <div style="display: flex; justify-content: center; align-items: center;">
						 <ul class="pagination">
						 
        		 </ul>
	        </div>
				 </c:if>
				
				
				
        <!-- 댓글 작성 폼 -->
        <div class="comment-form-container">
            <h2>댓글 작성</h2>
            <form class="comment-form">
                <textarea id="commentContent" placeholder="댓글을 입력하세요." rows="4"></textarea>
                <button type="submit" class="submit-comment">등록</button>
            </form>
        </div>
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
    
    if (content === '') {
        alert('댓글을 입력하세요.');
    } else {
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
                	alert("댓글이 성공적으로 등록되었습니다.");
	                $("#commentContent").html(''); // 댓글 작성 폼 초기화
	                renderComments(response); // 전체 댓글 다시 렌더링                	
                }
            },
            error: function(response) {
                console.log("AJAX 통신 실패 =>" + response);
            }
        });
    }
});

// 대댓글 폼 제출 처리
$(document).on('click', '.submit-reply', function(e) {
    e.preventDefault(); // 폼 제출 방지
    
    let refGroup = $(this).closest(".reply-form").data("ref");
    let content = $(this).closest(".reply-form").find(".replyContent").val().trim();
    let id = $(this).closest(".reply-form").find(".reply-form-content").data("id");
    
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
    let content = reply.find(".replyContent").val().trim();
    let id = reply.find(".reply-form-content").data("id");
    
    //같은 그룹에 있는 클릭한 요소의 같은 형제들의 id값알아오는 스크립트
    let arr = [];  
		$(this).closest(".replies").nextAll('.replies').each(function() {
	     
	     let dataRef = $(this).find(".reply-form-form").data("ref");
	     
	     if (dataRef === refGroup) {
	    	 
	         arr.push($(this).data("no")); 
	     }
	     
	 });
    
		
    let refOrder = $(this).closest(".replies").next('.replies').find(".reply-header").data("order");
    
    console.log("refOrder =>" + refOrder);
    console.log("형제 id = >" + arr);
    
    if (content === '') {
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
                arr: arr
                
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

// 댓글 작성 폼 토글 처리
$(document).on('click', '.reply-button', function() {
    $('.reply-form, .reply-form-form').not($(this).closest('.comment, .replies').find('.reply-form, .reply-form-form')).hide();
    $(this).closest('.comment, .replies').find('.reply-form, .reply-form-form').toggle();
    
    
});




// 댓글과 대댓글을 렌더링하는 함수
function renderComments(comment) {
	
		let comments = comment.list;
		let pi = comment.pi;
		let login = "${loginUser.userNo}";
    var html = '<div class="comments">'; // 모든 댓글을 감싸는 div를 추가합니다.
    let keys = comment.key;

    arrKey.push(keys);
    
    for (let i = 0; i < comments.length; i++) {
    	
    	var style = comments[i].userNo != login ? 'style="display:none;"' : '';
    	
        if (comments[i].parentNum == 0 && comments[i].refOrder == 0) {
            html += '<div class="comment">';
            html += '  <div class="comment-header">';
            html += '    <strong class="user-nickname">' + comments[i].userNickName + '</strong>';
            html += '    <p class="comment-content">' + comments[i].content + '</p>';
            html += '    <span class="comment-date">' + comments[i].registDt + '</span>';
            html += '    <div class="comment-actions"' +  style + '>';
            html += '      <button class="reply-button">답글쓰기</button>';
            html += '      <button class="edit-comment">수정</button>';
            html += '      <button class="delete-comment">삭제</button>';
            html += '    </div>';
            html += '  </div>';
            html += '  <div class="reply-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="reply-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="대댓글을 입력하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-reply">등록</button>';
            html += '    </form>';
            html += '  </div>';
            
        }

        if (comments[i].parentNum != 0) {
        	
        	let marginStyle = arrKey.includes(comments[i].id) ? 'style="margin-left: 20px;"' : '';
        	html += '  <div class="replies" data-no="' + comments[i].id + '" ' + marginStyle + '>'; 
            html += '    <div class="reply">';
            html += '      <div class="reply-header" data-order="' + comments[i].refOrder + '">';
            html += '        <strong class="user-nickname">' + comments[i].userNickName + '</strong>';
            html += '        <p class="reply-content">' + comments[i].content + '</p>';
            html += '        <span class="reply-date">' + comments[i].registDt + '</span>';
            html += '        <div class="reply-actions" ' +  style + '>';
            html += '          <button class="edit-reply">수정</button>';
            html += '          <button class="delete-reply">삭제</button>';
            html += '          <button class="reply-button">답글쓰기</button>';
            html += '        </div>';
            html += '      </div>';
            html += '    </div>';
            
            html += '  <div class="reply-form-form" style="display: none;" data-ref="' + comments[i].refGroup + '">';
            html += '    <form class="reply-form-content" data-id="' + comments[i].id + '">';
            html += '      <textarea placeholder="대댓글을 입력하세요." rows="4" class="replyContent"></textarea>';
            html += '      <button type="submit" class="submit-reply-reply">등록</button>';
            html += '    </form>';
            html += '  </div>';
            
            html += '  </div>'; // replies div 닫기
            
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




// 댓글 수정 버튼 클릭 시 수정 처리
$(document).on('click', '.edit-comment', function() {
    var $comment = $(this).closest('.comment');
    var $content = $comment.find('.comment-content');
    var newContent = prompt('댓글을 수정하세요:', $content.text());

    if (newContent !== null) {
        $content.text(newContent);
        console.log('댓글 수정:', newContent);
        // 서버에 수정된 내용 전송 로직 추가 가능
    }
});

// 댓글 삭제 버튼 클릭 시 삭제 처리
$(document).on('click', '.delete-comment', function() {
    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
        $(this).closest('.comment').remove();
        console.log('댓글 삭제');
        // 서버에 삭제 요청 로직 추가 가능
    }
});

// 대댓글 수정 버튼 클릭 시 수정 처리
$(document).on('click', '.edit-reply', function() {
    var $reply = $(this).closest('.reply');
    var $content = $reply.find('.reply-content');
    var newContent = prompt('대댓글을 수정하세요:', $content.text());

    if (newContent !== null) {
        $content.text(newContent);
        console.log('대댓글 수정:', newContent);
        // 서버에 수정된 내용 전송 로직 추가 가능
    }
});

// 대댓글 삭제 버튼 클릭 시 삭제 처리
$(document).on('click', '.delete-reply', function() {
    if (confirm('정말로 이 대댓글을 삭제하시겠습니까?')) {
        $(this).closest('.reply').remove();
        console.log('대댓글 삭제');
        // 서버에 삭제 요청 로직 추가 가능
    }
});
</script> 


</body>


</html>