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

.file-preview {
    margin-top: 10px;
    text-align: center;
}

.file-preview img {
    max-width: 100%;
    max-height: 300px;
    border-radius: 6px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
	<div class="container">
	<section class="post-form" style=" height: 700px;">
       <h2>새 게시글 작성</h2>
      <form id="postForm" method="post" action="${contextPath}/community/insertWriter.do" enctype="multipart/form-data">
      		<input type="hidden" name="postType" value="J">
          <input type="text" id="postTitle" name="postTitle" placeholder="제목" required style="width: 98%;">
          <textarea id="postContent" name="postContent" placeholder="내용" rows="5" required style="width: 98%; resize: none; height: 300px;"></textarea>
          <input type="file" name='uploadFiles' id="fileInput" onchange="readURL(this);" multiple accept="image/gif, image/jpeg, image/png">
          <div id="filePreview" class="file-preview" style="display: flex; height: 130px;">
          	<img id="previewImage" src="">
          </div>
          <div style="display: flex;justify-content: flex-end;">
          	<c:choose>
	          	<c:when test="${ empty loginUser }">
		          	<button onclick="loginForm();">게시하기</button>
	          	</c:when>
	          	<c:otherwise>
		          	<button type="submit">게시하기</button>
	          	</c:otherwise>
          	</c:choose>
          </div>
      </form>
  </section>
  </div>


<Script>

function loginForm(){
	$("#")
}

function readURL(obj) {
    // 파일 확장자 추출
    var file_kind = obj.value.lastIndexOf('.');
    var file_name = obj.value.substring(file_kind + 1, obj.value.length);
    var file_type = file_name.toLowerCase();

    // 허용되는 이미지 파일 확장자 목록
    var check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp'];

    // 파일 확장자가 허용된 목록에 없는 경우
    if (check_file_type.indexOf(file_type) === -1) {
        alert('이미지 파일만 선택할 수 있습니다.');
        // 파일 입력 필드를 초기화하기 위해 새로운 노드를 추가
        var parent_Obj = obj.parentNode;
        var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);
        return false;
    }

    // 파일 입력이 있을 때
    if (obj.files && obj.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById("previewImage").src = e.target.result;
        }
        reader.readAsDataURL(obj.files[0]);
    } else {
        document.getElementById("previewImage").src = "";
    }
}

</Script>
</body>
</html>