<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content">
		<br><br>
		
		<div class="innerOuter">
		
			<h4></h4>
			
			<br><br>
			
			<!-- 
			<c:if test="${ not empty loginUser }">
				<a class="btn btn-secondary" href="${ contextPath }/chat/room.page">채팅방 입장</a>
			</c:if>
			-->
			
		</div>
		
		<br><br>
		
		<div class="innerOuter">
		
			<h4>오늘의 pick</h4>
			
			<br><br>
			
			<!-- 
			<c:if test="${ not empty loginUser }">
				<a class="btn btn-secondary" href="${ contextPath }/chat/room.page">채팅방 입장</a>
			</c:if>
			-->
			
		</div>
		
		
		<br><br>
	</div>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
</body>
</html>