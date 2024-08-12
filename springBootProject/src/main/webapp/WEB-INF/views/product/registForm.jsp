<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="${ contextPath }/resources/js/common.js"></script>

  <div align="center">
    <form action="${ contextPath }/notice/regist.do" method="post" enctype="multipart/form-data">
      제목 : <input type="text" name="noticeTitle"> <br>
      내용 : <textarea name="noticeContent"></textarea> <br>
      첨부파일 : <input type="file" class="file" name="uploadFiles" multiple> <br><br>
      
      <button type="submit">등록</button>
    </form>
  </div>
</body>
</html>