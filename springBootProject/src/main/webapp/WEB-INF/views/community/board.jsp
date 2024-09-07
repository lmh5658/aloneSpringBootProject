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
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
}

header {
    background-color: #ff6f61;
    color: #fff;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

header h1 {
    margin: 0;
    font-size: 2.5em;
    font-weight: 700;
}

.container {
    width: 90%;
    max-width: 800px;
    margin: 20px auto;
}

.post-form, .post-list {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-bottom: 20px;
}

.post-form h2, .post-list h2 {
    font-size: 1.8em;
    color: #365779;
    border-bottom: 2px solid #365779;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 10px;
    font-size: 1em;
}

button {
 		border-radius: 30px;
    background-color: #d5e9fd;
    color: #74b9ff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-size: 19px;
}



.post {
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
}

.post:last-child {
    border-bottom: none;
}

.post h3 {
    margin: 0 0 10px;
    font-size: 1.5em;
    color: #333;
}

.post p {
    margin: 0;
    font-size: 1.1em;
    color: #555;
}


.post-list table {
    width: 100%;
    border-collapse: collapse;
    
}


.post-list th, .post-list td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    text-align: center;
}

.post-list th {
background-color: #7a90a7;
    color: #ffffff;
    font-size: 1.1em;
}

.post-list tr:nth-child(even) {
    background-color: #f9f9f9;
}

.post-list tr:hover {
    background-color: #f1f1f1;
}
#postsContainer td{
    height: 14px;
    cursor: pointer;
}


/* 추가적인 CSS 스타일링 */
.container {
    padding: 20px;
}

.post-list {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 8px;
    background-color: #f9f9f9;
}

 button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}


#searchInput, #categoryFilter {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

#searchInput {
    width: 346px;
    height: 40px;
    
}

</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
	 <div style=" display: flex; justify-content: center;align-items: center; margin: 30px;">
        <h2>자유게시판</h2>
    </div>
    
    <div class="container">
    <section class="post-list" style="height: 811px; margin-bottom: 109px;">
        <div style="display: flex; flex-direction: column;">
            <div style="display: flex;align-items: baseline;justify-content: center;flex-direction: row; width: 100%">
                <div style="display: flex;align-items: baseline;justify-content: center; width: 80%; margin-left:179px;">
	                <select id="categoryFilter" style="margin-left: 20px;">
	                    <option value="TOTAL">통합검색</option>
	                    <option value="POST_TITLE">제목</option>
	                    <option value="WRITER_NICKNAME">작성자</option>
	                </select>
	                <input type="text" id="searchInput" placeholder="검색을 입력하세요." >
	                <button type="button" id="search_btn" style="height: 40px;display: flex;align-items: center;background: #7a90a7;color: white;">검색</button>                
                </div>
                <div style="width: 20%;display: flex;justify-content: flex-end;";>
	                <button onclick="writer();" style="border-radius: 10px;background: #365779;color: white;">작성하기</button>
                </div>
                <script>
                	$("#search_btn").on("click", function(){
                		filterPosts(1);
                	})
                	
                	$("#searchInput").on("keyup", function(ev){
                		if(ev.key == "Enter"){
                			filterPosts(1);
                		}
                	})
                
                	function filterPosts(page){
                		let type = "J";
                		let search = $("#searchInput").val();
                		let category = $("#categoryFilter").val();
                		$.ajax({
                			url:"${contextPath}/community/selectSearch.do",
                			type:"post",
                			data:{
                				search:search,
                				category:category,
                				page:page,
                				type:type
                			},
                			success:function(response){
                				
                				let list = response.list;
                				let pi = response.pi;
                				
                				let html = '';
                				list.forEach(function(item){
	                				html += '<tr class="detail" data-no="' + item.writerNo + '" data-post="' + item.postNo + '">';
	                				html += '    <input type="hidden" class="postNo" name="postNo" value="' + item.postNo + '">';
	                				html += '    <input type="hidden"  class="no_info">';
	                				html += '    <td>' + item.postNo + '</td>';
	                				html += '    <td>' + item.postTitle + '</td>';
	                				html += '    <td>' + item.writerNickName + '</td>';
	                				html += '    <td>' + item.postCount + '</td>';
	                				html += '    <td>' + item.postUploadDt + '</td>';
	                				html += '    <td>';
	                				if(item.fileStatus > 0){
	                					html += '        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">';
		                				html += '       <path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7z"/>';
		                				html += '       </svg>';
	                				}
	                				html += '    </td>';
	                				html += '</tr>';
                				})
												if(list.length > 0){
	                				$("#postsTableBody").html(html);
	                				communitySearch(pi);													
												}else{
													$("#postsTableBody").html('<td colspan="6">검색한 목록이 없습니다.</td>');
												}
                				
                			},
                			error:function(){
                				
                			}
                			
                		})
                		
                	}
                	
                	$(document).on("click", ".detail", function(){
                		let writerNo = $(this).data("no");
                		let postNo = $(this).data("post");
                		let loginUserNo = "${loginUser.userNo}";
                		let type = "${type}";
                		//게시글 클릭시 내가 작성한 글은 조회수가 오르지 않게 url설정을 다르게 함
                		if(loginUserNo == writerNo){
	                		location.href="${contextPath}/community/detail.page?postNo=" + postNo + "&postType=" + type;                			
                		}else{
                			//redirect로 다시 detail
                			location.href="${contextPath}/community/increase.do?postNo=" + postNo + "&postType=" + type; 
                		}
                 })
                	

                	 function communitySearch(pi) {
                		    var html = '';

                		    if (pi.listCount > 0) {
                		        // Previous button
                		        if (pi.currentPage === 1) {
                		            html += "<button class='page bt' disabled>이전</button>";
                		        } else {
                		            html += "<button class='page bt' onclick='filterPosts(" + (pi.currentPage - 1) + ")'>이전</button>";
                		        }

                		        // Page number buttons
                		        for (var i = pi.startPage; i <= pi.endPage; i++) {
                		            if (i === pi.currentPage) {
                		                html += "<button class='page active' disabled>" + i + "</button>";
                		            } else {
                		                html += "<button class='page' onclick='filterPosts(" + i + ")'>" + i + "</button>";
                		            }
                		        }

                		        // Next button
                		        if (pi.currentPage === pi.maxPage) {
                		            html += "<button class='page bt' disabled>다음</button>";
                		        } else {
                		            html += "<button class='page bt' onclick='filterPosts(" + (pi.currentPage + 1) + ")'>다음</button>";
                		        }
                		    }

                		    $('.pagination').html(html);
                		}
                </script>
            </div>
            <h2>게시글 목록</h2>
            <div id="postsContainer">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 84px;">글 번호</th>
                            <th style="width: 488px;">제목</th>
                            <th style="width: 200px;">작성자</th>
                            <th>조회수</th>
                            <th>댓글수</th>
                            <th>날짜</th>
                            <th style="width: 90px;">첨부파일</th>
                        </tr>
                    </thead>
                    <tbody id="postsTableBody">
                        <c:choose>
                            <c:when test="${ not empty list }">
                                <c:forEach var="list" items="${ list }">
                                    <tr onclick="location.href='${contextPath}/community/${ loginUser.userNo == list.writerNo ?  'detail.page' : 'increase.do' }?postNo=${ list.postNo }&postType=${ list.postType == 'G' ? 'G' : type }'">
                                        <input type="hidden" class="postNo" name="postNo" value="${ list.postNo }">
                                        <input type="hidden" class="postType"  value="${ list.postType }">
                                        <td>${ list.postType == 'G' ? '【공지】' : list.postNo }</td>
                                        <td>${ list.postTitle }</td>
                                        <td>${ list.writerNickName }</td>
                                        <td>${ list.postCount }</td>
                                        <td>${ list.postComment }</td>
                                        <td>${ list.postUploadDt }</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${list.fileStatus > 0}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">
                                                        <path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7z"/>
                                                    </svg>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6">게시판 목록이 존재하지 않습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                   
                    
                </table>
                <div style="display: flex; justify-content: center; margin-top: 50px;">
                    <div class="pagination" style="">
                        <c:if test="${ not empty list }">
                            <ul class="pagination">
                                <li class="page-item ${ pi.currentPage == 1 ?  'disabled' : ''}"><a class="page-link" href="${contextPath}/community/board.do?type=${type}&page=${ pi.currentPage - 1}">이전</a></li>
                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <li class="page-item ${ pi.currentPage == p ? 'disabled active' : '' }">
                                        <a class="page-link" href="${contextPath}/community/board.do?type=${type}&page=${p}">${ p }</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/community/board.do?type=${type}&page=${ pi.currentPage + 1 }">다음</a></li>
                            </ul>  
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>

document.addEventListener('DOMContentLoaded', function() {
    let tableBody = document.getElementById('postsTableBody');
    let rows = tableBody.getElementsByTagName('tr');
    
    for (let i = 0; i < rows.length; i++) {
        let postTypeElements = rows[i].getElementsByClassName('postType');
        
        if (postTypeElements.length > 0 && postTypeElements[0].value === 'G') {
            rows[i].style.color = 'red';
        }
    }
});




function writer(){
	if("${loginUser}" == ""){
		$("#myModal").modal('show');
	}else{
		location.href="${contextPath}/community/writerForm.page?type=J";			
	}
}
 	
</script>




</body>
</html>