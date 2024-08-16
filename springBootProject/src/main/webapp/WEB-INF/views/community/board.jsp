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
    color: #ff6f61;
    border-bottom: 2px solid #ff6f61;
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
    background-color: #ff6f61;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #e65c50;
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
    background-color: #ff6f61;
    color: #fff;
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

</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
	 <div style=" display: flex; justify-content: center;align-items: center;">
        <h2>자유게시판</h2>
    </div>
    
    <div class="container">
        <section class="post-list" style="height: 811px; margin-bottom: 109px;">
        		<div style="display: flex; justify-content: flex-end;"><button onclick="writer();">작성하기</button> </div>
	            <h2>게시글 목록</h2>
            <div id="postsContainer">
            	<table>
                <thead>
                    <tr>
                        <th style="width: 75px;">글 번호</th>
                        <th style="width: 488px;">제목</th>
                        <th style="width: 200px;">작성자</th>
                        <th>조회수</th>
                        <th>날짜</th>
                        <th style="width: 90px;">첨부파일</th>
                    </tr>
                </thead>
                <tbody id="postsContainer">
                	<c:choose>
		            	  	<c:when test="${ not empty list }">
		                		<c:forEach var="list" items="${ list }">
		                    	<tr onclick="location.href='${contextPath}/community/${ loginUser.userNo == list.writerNo ?  'detail.page' : 'increase.do' }?postNo=' + ${ list.postNo } + '&postType=J';">
		                    		<input type="hidden" class="postNo" name="postNo" value="${ list.postNo }">
		                    		<td>${ list.postNo }</td>
			                    	<td>${ list.postTitle }</td>
			                    	<td>${ list.writerNickName }</td>
			                    	<td>${ list.postCount }</td>
			                    	<td>${ list.postUploadDt }</td>
			                    	<td> <c:choose>
													        <c:when test="${list.fileStatus > 0}">
													            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder2-open" viewBox="0 0 16 16">
													                <path d="M1 3.5A1.5 1.5 0 0 1 2.5 2h2.764c.958 0 1.76.56 2.311 1.184C7.985 3.648 8.48 4 9 4h4.5A1.5 1.5 0 0 1 15 5.5v.64c.57.265.94.876.856 1.546l-.64 5.124A2.5 2.5 0 0 1 12.733 15H3.266a2.5 2.5 0 0 1-2.481-2.19l-.64-5.124A1.5 1.5 0 0 1 1 6.14zM2 6h12v-.5a.5.5 0 0 0-.5-.5H9c-.964 0-1.71-.629-2.174-1.154C6.374 3.334 5.82 3 5.264 3H2.5a.5.5 0 0 0-.5.5zm-.367 1a.5.5 0 0 0-.496.562l.64 5.124A1.5 1.5 0 0 0 3.266 14h9.468a1.5 1.5 0 0 0 1.489-1.314l.64-5.124A.5.5 0 0 0 14.367 7z"/>
													            </svg>
													        </c:when>
													        <c:otherwise>
													        </c:otherwise>
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
            	<div style="display: flex;justify-content: center;margin-top: 20px;">
            	 <div class="pagination">
 
            	  	<c:if test="${ not empty list }">
						        	<ul class="pagination">
											  <li class="page-item ${ pi.currentPage == 1 ?  'disabled' : ''}"><a class="page-link" href="${contextPath}/community/board.do?type=${type}&page=${ pi.currentPage - 1}">이전</a></li>
											  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												  <li class="page-item ${ pi.currentPage == p ? 'disabled active' : '' }">
												  	<a class="page-link" href="${contextPath}/community/board.do??type=${type}&page=${p}">${ p }</a>
												  </li>
												</c:forEach>
											  <li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/community/board.do??type=${type}&page=${ pi.currentPage + 1 }">다음</a></li>
											</ul>  
            	  	</c:if>
            	  	
            	 </div>
            	</div>
            
            </div>
        </section>
    </div>

<script>
function writer(){
	location.href="${contextPath}/community/writerForm.page";	
}
</script>




</body>
</html>