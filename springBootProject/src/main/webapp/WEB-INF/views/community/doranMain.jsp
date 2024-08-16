<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<style>

</style>
</head>
<body>

  	<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
    <div class="container">
    
        <div class="banner">
            사진 넣기
        </div>
        <div class="section">
            <h2>공지사항</h2>
            <p>여기에 최신 소식과 공지사항이 표시됩니다.</p>
        </div>
        <div id="forum" class="section">
            <h2>자유게시판</h2>
            <p>강아지와 관련된 모든 이야기를 나누는 공간입니다.</p>
        </div>
        <div id="info" class="section">
            <h2>강아지 정보</h2>
            <p>품종 가이드와 건강 관리, 훈련 및 행동에 관한 정보.</p>
        </div>
    </div>

</body>
</html>