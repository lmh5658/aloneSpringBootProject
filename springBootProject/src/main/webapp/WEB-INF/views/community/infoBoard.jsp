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
    background: #365779;
    padding: 10px;
    width: 100px;
    border-radius: 10px;
    color: #ffffff;
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
.noimage img{
	border-radius: 19px;
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
.pagination button{
    padding: 9px;
    height: 40px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
<script>
$(document).ready(function(){
	if("${alertMessage}" != ""){
		alert("게시글 등록에 성공하였습니다.");
	}
})
</script>
      <nav style="background: #ffffff;display: flex;justify-content: space-between;">
      <div>
				<select name="select" id="select" style="width: 99px;height: 33px;border: 1px solid #dddddd; margin-left: 28px;">
					<option value="POST_NO" >최신순</option>
					<option value="POST_LIKE">좋아요순</option>
				</select>
			</div>
          <input type="text" placeholder="검색" id="infoSearch" style="width: 300px;">
      </nav>
      
<main style="padding: 36px;">
		<div style="display: flex;width: 100%;justify-content: flex-end;margin-bottom: 30px;">
			<button id="writer_btn" type="button" onclick="writer();">작성하기</button>			
		</div>
     <section class="feed">
     	
     	
     </section>
     <div style="display: flex; justify-content: center; margin-top: 50px;">
         <div class="pagination" style="">
         </div>
     </div>
</main>
</body>

<script>
$("#infoSearch").on("keyup", function(ev){
	if (ev.which == 13) {
			infoSearch(1);
	}
})

function infoSearch(page){
	$.ajax({
		url:"${contextPath}/community/selectInfoSearch.do",
		type:"get",
		data:{
			search:$("#infoSearch").val(),
			page:page
		},
		success:function(response){
			
			let htmlContent = '';
			
			response.list.forEach(function(item) {
						
			  // 첫 번째 <img> 태그의 시작과 끝 인덱스를 찾기
		    let firstImgStart = item.postContent.indexOf("<img");
		    let firstImgEnd = item.postContent.indexOf(">", firstImgStart);
		    let profileImg = (item.userPath == null ? '/upload/image/defaultProfile.png' : item.userPath);
		    
        htmlContent += '<article class="post">';
        htmlContent += '    <div class="post-header">';
        htmlContent += '        <img src="' + profileImg + '" alt="Profile Image" class="profile-image" style="height:40px; width:40px;">';
        htmlContent += '        <span class="nickname">' + item.writerNickName + '</span>';
        htmlContent += '    </div>';
        htmlContent += '    <div class="noimage" data-no="' + item.postNo + '" data-type="' + item.postType + '" data-writer="' + item.writerNo +'">';
            
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
        htmlContent += '					  <svg style="cursor:auto" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">';
        htmlContent += '  						<path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>';
        htmlContent += '						</svg>';
        htmlContent += '            <b>' + item.postComment + '</b>';
        htmlContent += '						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">';
        htmlContent += '  						<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/>';
        htmlContent += '						</svg>';
        htmlContent += '        </div>';
        htmlContent += '    </div>';
	      htmlContent += '</article>';

		 });
			
			if (response.list.length > 0) {
			    $(".feed").html(htmlContent);
			    selectSearchPaging(response.pi);
			}else{
				$(".feed").html("");
				$('.pagination').html("");
			}
			
		},
		error:function(){
			
		}
	})
} 

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
		    let profileImg = (item.userPath == null ? '/upload/image/defaultProfile.png' : item.userPath);
		    
        htmlContent += '<article class="post">';
        htmlContent += '    <div class="post-header">';
        htmlContent += '        <img src="' + profileImg + '" alt="Profile Image" class="profile-image" style="height:40px; width:40px;">';
        htmlContent += '        <span class="nickname">' + item.writerNickName + '</span>';
        htmlContent += '    </div>';
        htmlContent += '    <div class="noimage" data-no="' + item.postNo + '" data-type="' + item.postType + '" data-writer="' + item.writerNo +'">';
            
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
        htmlContent += '               <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>';
        htmlContent += '            </svg>';
        htmlContent += '            <b class="likeCounter">' + item.postLike + '</b>';
        htmlContent += '					  <svg style="cursor:auto" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">';
        htmlContent += '  						<path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>';
        htmlContent += '						</svg>';
        htmlContent += '            <b>' + item.postComment + '</b>';
        htmlContent += '						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">';
        htmlContent += '  						<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/>';
        htmlContent += '						</svg>';
        htmlContent += '        </div>';
        htmlContent += '    </div>';
	      htmlContent += '</article>';

		});
			
			if (response.list.length > 0) {
			    $(".feed").html(htmlContent);
			    selectOptionPaging(response.pi);
			}else{
				$(".feed").html("");
				$('.pagination').html("");
			}
			
		},
		error:function(){
			
		}
		
	})
}

function selectSearchPaging(pi){
	
	 var html = '';

	    if (pi.listCount > 0) {
	        if (pi.currentPage === 1) {
	            html += "<button class='page bt' disabled>이전</button>";
	        } else {
	            html += "<button class='page bt' onclick='infoSearch(" + (pi.currentPage - 1) + ")'>이전</button>";
	        }

	        for (var i = pi.startPage; i <= pi.endPage; i++) {
	            if (i === pi.currentPage) {
	                html += "<button class='page active' disabled>" + i + "</button>";
	            } else {
	                html += "<button class='page' onclick='infoSearch(" + i + ")'>" + i + "</button>";
	            }
	        }

	        if (pi.currentPage === pi.maxPage) {
	            html += "<button class='page bt' disabled>다음</button>";
	        } else {
	            html += "<button class='page bt' onclick='infoSearch(" + (pi.currentPage + 1) + ")'>다음</button>";
	        }
	    }

	    $('.pagination').html(html);
	
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
			    let profileImg = (item.userPath == null ? '/upload/image/defaultProfile.png' : item.userPath);
			    
	        htmlContent += '<article class="post">';
	        htmlContent += '    <div class="post-header">';
	        htmlContent += '        <img src="' + profileImg + '" alt="Profile Image" class="profile-image" style="height:40px; width:40px;">';
	        htmlContent += '        <span class="nickname">' + item.writerNickName + '</span>';
	        htmlContent += '    </div>';
	        htmlContent += '    <div class="noimage" data-no="' + item.postNo + '" data-type="' + item.postType + '" data-writer="' + item.writerNo +'">';
	            
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
	        htmlContent += '								<svg style="cursor:auto" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">';
	        htmlContent += '  								  <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>';
	        htmlContent += '								</svg>';
	        htmlContent += '            <b>' + item.postComment + '</b>';
	        htmlContent += '						<svg style="cursor:auto" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">';
	        htmlContent += '  						<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/>';
	        htmlContent += '						</svg>';
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
	let writer = $(this).data("writer");
	if("${loginUser.userNo}" == writer){
		location.href="${contextPath}/community/detail.page?postNo=" + postNo + "&postType=" + postType;		
	}else{
		location.href="${contextPath}/community/increase.do?postNo=" + postNo + "&postType=" + postType;
	}
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

	

</html>