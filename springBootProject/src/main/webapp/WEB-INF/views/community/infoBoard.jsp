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
/* 기본 스타일 설정 */


header {
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
}

.logo {
    font-size: 24px;
    font-weight: bold;
}

nav {
    display: flex;
    align-items: center;
}

nav input[type="text"] {
    padding: 5px;
    border-radius: 4px;
    border: 1px solid #ddd;
    margin-right: 10px;
}

nav button {
    background: none;
    border: none;
    margin-left: 10px;
    cursor: pointer;
    font-size: 16px;
}

/* 메인 피드 스타일 */
main {
    padding: 20px;
}

.feed {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
    gap: 48px;
}

.post {
    background-color: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.post img {
    height: 100%;
    width: 100%;
}

.post-info {
   margin-top: 10px;
}

.description {
    margin: 10px 0;
    font-size: 16px;
    font-weight: bold;
}

.actions {
display: flex;
    justify-content: flex-end;
    gap: 10px;
    height: 18px;
}

.actions button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
}

.actions button:hover {
    background-color: #0056b3;
}

/* 푸터 스타일 */
footer {
    background-color: #ffffff;
    border-top: 1px solid #e0e0e0;
    text-align: center;
    padding: 10px;
    position: fixed;
    width: 100%;
    bottom: 0;
}
svg{
	cursor: pointer;
}
#writer_btn{
border: none;
    background: #d5e9fd;
    padding: 10px;
    width: 100px;
    border-radius: 10px;
}
#writer_btn:hover{
	background: #c1dbf5;
}
.noimage{
    text-align: center;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: nowrap;
    flex-direction: column;
    cursor: pointer;
}




/* 스타일 정의 */


.post-header {
display: flex;
    align-items: center;
    justify-content: flex-end;
    margin-bottom: 14px;
}

.profile-image {
    border-radius: 50%;
    width: 40px;
    height: 40px;
    object-fit: cover;
    margin-right: 10px;
}


.nickname {
    font-weight: bold;
}

.noimage {
    margin-bottom: 10px;
}

.post-info {
    display: flex;
    flex-direction: column;
}

.actions {
    display: flex;
    align-items: center;
}

.like_button, .bi-instagram {
    cursor: pointer;
}

</style>
</head>
<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
<body>
      <nav style="background: #ffffff;display: flex;justify-content: flex-end;">
          <input type="text" placeholder="검색" style="width: 300px;">
      </nav>
      
<main>
		 <div>
				<select name="select" id="select" style="width: 99px;height: 33px;border: 1px solid #dddddd;">
					<option value="POST_NO" >최신순</option>
					<option value="POST_LIKE">좋아요순</option>
				</select>
		</div>
		<div style="display: flex;width: 100%;justify-content: flex-end;margin-bottom: 30px;">
			<button id="writer_btn" type="button" onclick="writer();">작성하기</button>			
		</div>
     <section class="feed">
     	
     	
     </section>
     <div style="display: flex; justify-content: center; margin-top: 50px;">
         <div class="pagination" style="">
         </div>
     </div>
     <ul class="sns">
			  <li class="kakaotalk">
			  <a href="#n">카톡</a>
			  </li>
			</ul>
</main>
</body>

<script>
$("#select").on("change", function(){
	selectChange(1);
})

function selectChange(page){
	
	$.ajax({
		url:"${contextPath}/community/selectOption.do",
		type:"get",
		data:{
			select:$("#select").val(),
			type:"I"
		},
		success:function(response){
			let htmlContent = '';
			
			response.list.forEach(function(item) {
						
			  // 첫 번째 <img> 태그의 시작과 끝 인덱스를 찾기
		    let firstImgStart = item.postContent.indexOf("<img");
		    let firstImgEnd = item.postContent.indexOf(">", firstImgStart);
		    
        htmlContent += '<article class="post">';
        htmlContent += '    <div class="post-header">';
        htmlContent += '        <img src="' + item.userPath + '" alt="Profile Image" class="profile-image" style="height:40px; width:40px;">';
        htmlContent += '        <span class="nickname">' + item.writerNickName + '</span>';
        htmlContent += '    </div>';
        htmlContent += '    <div class="noimage" data-no="' + item.postNo + '" data-type="' + item.postType + '">';
            
        if (firstImgStart != -1) {
            htmlContent += item.postContent.substring(firstImgStart, firstImgEnd + 1);
        } else {
            htmlContent += '<svg style="color: #6c757d;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16"><path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/><path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/></svg><br>NO IMAGE';
        }

        htmlContent += '    </div>';
        htmlContent += '    <div class="post-info">';
        htmlContent += '        <p class="description">' + item.postTitle + '</p>';
        htmlContent += '        <div class="actions">';
        let likeButtonStyle = ("${loginUser}" != "") ? 'style="color:' + (response.likeList.includes(item.postNo) ? 'rgba(255, 7, 7, 0.57)' : 'rgb(51, 51, 51)') + '"' : '';
        htmlContent += '            <svg class="like_button" ' + likeButtonStyle + ' xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
        htmlContent += '                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>';
        htmlContent += '            </svg>';
        htmlContent += '            <b class="likeCounter">' + item.postLike + '</b>';
        htmlContent += '                <svg class="kakaotalk" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">';
        htmlContent += '                    <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"/>';
        htmlContent += '                </svg>';

        htmlContent += '        </div>';
        htmlContent += '    </div>';
	      htmlContent += '</article>';

		});
			
			if (response.list.length > 0) {
			    $(".feed").html(htmlContent);
			    selectOptionPaging(response.pi);
			}
			
		},
		error:function(){
			
		}
		
	})
}


function selectOptionPaging(pi){
	
	 var html = '';

	    if (pi.listCount > 0) {
	        if (pi.currentPage === 1) {
	            html += "<button class='page bt' disabled>이전</button>";
	        } else {
	            html += "<button class='page bt' onclick='selectChange(" + (pi.currentPage - 1) + ")'>이전</button>";
	        }

	        for (var i = pi.startPage; i <= pi.endPage; i++) {
	            if (i === pi.currentPage) {
	                html += "<button class='page active' disabled>" + i + "</button>";
	            } else {
	                html += "<button class='page' onclick='selectChange(" + i + ")'>" + i + "</button>";
	            }
	        }

	        if (pi.currentPage === pi.maxPage) {
	            html += "<button class='page bt' disabled>다음</button>";
	        } else {
	            html += "<button class='page bt' onclick='selectChange(" + (pi.currentPage + 1) + ")'>다음</button>";
	        }
	    }

	    $('.pagination').html(html);
	
}




</script>
<script>
$(document).ready(function(){
	infoBoardLoad(1);
});

function infoBoardLoad(page){
	$.ajax({
		url:"${contextPath}/community/ajaxInfoBoard.do",
		type:"get",
		data:{page:page},
		success:function(response){
				let htmlContent = '';
				
				response.list.forEach(function(item) {
							
				  // 첫 번째 <img> 태그의 시작과 끝 인덱스를 찾기
			    let firstImgStart = item.postContent.indexOf("<img");
			    let firstImgEnd = item.postContent.indexOf(">", firstImgStart);
			    
	        htmlContent += '<article class="post">';
	        htmlContent += '    <div class="post-header">';
	        htmlContent += '        <img src="' + item.userPath + '" alt="Profile Image" class="profile-image" style="height:40px; width:40px;">';
	        htmlContent += '        <span class="nickname">' + item.writerNickName + '</span>';
	        htmlContent += '    </div>';
	        htmlContent += '    <div class="noimage" data-no="' + item.postNo + '" data-type="' + item.postType + '">';
	            
	        if (firstImgStart != -1) {
	            htmlContent += item.postContent.substring(firstImgStart, firstImgEnd + 1);
	        } else {
	            htmlContent += '<svg style="color: #6c757d;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16"><path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/><path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/></svg><br>NO IMAGE';
	        }

	        htmlContent += '    </div>';
	        htmlContent += '    <div class="post-info">';
	        htmlContent += '        <p class="description">' + item.postTitle + '</p>';
	        htmlContent += '        <div class="actions">';
	        let likeButtonStyle = ("${loginUser}" != "") ? 'style="color:' + (response.likeList.includes(item.postNo) ? 'rgba(255, 7, 7, 0.57)' : 'rgb(51, 51, 51)') + '"' : '';
	        htmlContent += '            <svg class="like_button" ' + likeButtonStyle + ' xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
	        htmlContent += '                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>';
	        htmlContent += '            </svg>';
	        htmlContent += '            <b class="likeCounter">' + item.postLike + '</b>';
	        htmlContent += '                <svg class="kakaotalk" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">';
	        htmlContent += '                    <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"/>';
	        htmlContent += '                </svg>';

	        htmlContent += '        </div>';
	        htmlContent += '    </div>';
		      htmlContent += '</article>';

			});

				// `response.list`가 비어있지 않은 경우, HTML 콘텐츠를 `.feed` 요소에 삽입하고 페이지네이션을 로드합니다.
				if (response.list.length > 0) {
				    $(".feed").html(htmlContent);
				    infoBoardLoadPagenation(response.pi);
				}
				/*
				// 좋아요 버튼 색상 업데이트
				if (response.likeList) {
				    console.log(response.likeList);
				    $(".like_button").each(function() {
				        let likeList = response.likeList;
				        for (let i = 0; i < response.list.length; i++) {
				            if (likeList.includes(response.list[i].postNo)) {
				            	let postNo = response.list[i].postNo
				            	css("color", "rgba(255, 7, 7, 0.57)");
				            }
				        }
				    });
				}
				*/
			
			
			
		},
		error:function(){
			
		}
	})
}


	


$(document).on("click", ".noimage", function(){
	
	let postNo = $(this).data("no");
	let postType= $(this).data("type");
	location.href="${contextPath}/community/detail.page?postNo=" + postNo + "&postType=" + postType;
})




function infoBoardLoadPagenation(pi){
	
	 var html = '';

	    if (pi.listCount > 0) {
	        if (pi.currentPage === 1) {
	            html += "<button class='page bt' disabled>이전</button>";
	        } else {
	            html += "<button class='page bt' onclick='infoBoardLoad(" + (pi.currentPage - 1) + ")'>이전</button>";
	        }

	        for (var i = pi.startPage; i <= pi.endPage; i++) {
	            if (i === pi.currentPage) {
	                html += "<button class='page active' disabled>" + i + "</button>";
	            } else {
	                html += "<button class='page' onclick='infoBoardLoad(" + i + ")'>" + i + "</button>";
	            }
	        }

	        if (pi.currentPage === pi.maxPage) {
	            html += "<button class='page bt' disabled>다음</button>";
	        } else {
	            html += "<button class='page bt' onclick='infoBoardLoad(" + (pi.currentPage + 1) + ")'>다음</button>";
	        }
	    }

	    $('.pagination').html(html);
	
}

function writer(){
	if("${loginUser}" == ""){
		$("#myModal").modal('show');
	}else{
		 location.href='${contextPath}/community/writerForm.page?type=I';
	}
}


$(document).on("click", ".like_button", function(){
	 var $this = $(this);
	console.log($(this).css("color"));
	console.log($(this).length);
	
	if("${loginUser}" == ""){
		 $("#myModal").modal("show");
	}else{
		
		let postNo = $(this).closest(".post").find(".noimage").data("no");

		if($(this).css("color") == "rgb(51, 51, 51)"){
			$.ajax({
 				url:"${contextPath}/community/udpateLike.do",
	 			type:"post",
	 			data:{postNo:postNo},
	 			success:function(response){
	 				$this.css("color", "rgba(255, 7, 7, 0.57)");
	 				
	 				let postCount = response;
	 				$this.closest(".post").find(".likeCounter").html(postCount == 0 ? "" : postCount);
	 				
	 			},
	 			error:function(){
	 				
	 			}
 			})
		}else if($(this).css("color") == "rgba(255, 7, 7, 0.57)"){
			$.ajax({
	 			url:"${contextPath}/community/delteLike.do",
	 			type:"post",
	 			data:{postNo:postNo},
	 			success:function(response){
	 				$this.css("color", "rgb(51, 51, 51)");
	 				
	 				let postCount = response;
	 				$this.closest(".post").find(".likeCounter").html(postCount == 0 ? "" : postCount);
	 			},
	 			error:function(){
	 				
	 			}
 			})
		}
		
	}
	
})
</script>

	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
/*
$(document).on("click", ".btnKakao", function(){
	let title = $(this).data("title");
	let content = $(this).data("content");
	let kakao = 'kakao';
	fn_sendFB(kakao, title, content);
})



function fn_sendFB(kakao, title, content) {
var thisUrl = document.URL;
var snsTitle = "2021 웹진 [봄]";
    // 사용할 앱의 JavaScript 키 설정
    if (!Kakao.isInitialized()) {
    Kakao.init('f5fb251a62d19d3f09c42218629ae62d');
		};	
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
        container: '.btnKakao', // HTML에서 작성한 ID값
        objectType: 'feed',
        content: {
        title: title, // 보여질 제목
        description: content, // 보여질 설명
        imageUrl: thisUrl, // 콘텐츠 URL
        link: {
            mobileWebUrl: thisUrl,
            webUrl: thisUrl
        }
        }
    });
}
*/
</script>
</html>