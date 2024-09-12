<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>

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
	<section class="post-form" style="height: auto;margin: 89px 0px;">
       <h2>새 게시글 작성</h2>
     
      <form id="postForm" method="post" action="${contextPath}/community/updateWriter.do" enctype="multipart/form-data">
      		<input type="hidden" name="postType" value="${board.postType}">
      		<input type="hidden" name="postNo" value="${board.postNo}">
      		<input type="hidden" name="writerNickName" value="${loginUser.nickName}">
          <input type="text" id="postTitle" value="${board.postTitle}" name="postTitle" placeholder="제목" required style="width: 98%;">
          
          <!-- 에디터영역 -->
          <div id="postContent">
          	
          </div>
          <input type="hidden" name="postContent">
          
          <!-- 기존첨부파일 -->
          <c:if test="${board.postType eq 'G' or board.postType eq 'J'}">
	          <div style="padding: 15px;"><c:if test="${ not empty board.attachList }"><b>*기존첨부파일</b></c:if>
		          <c:forEach var="at" items="${board.attachList}">
		          	<div>
		          		<a href="${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a>
		          		<span class="origin_del" data-fileno="${ at.fileNo }" style="cursor: pointer;">X</span>
		          	</div>
		          </c:forEach>
	          </div>
          </c:if>
          <input type="hidden" id="fileDelNo" name="fileDelNo" value="">
          <input type="file" name='uploadFiles' id="fileInput" multiple accept="image/*" style="cursor: pointer;">
          <div style="display: flex;justify-content: flex-end;">
		         <button type="button" id="modifyForm">게시하기</button>
          </div>
      </form>
      
  </section>
  </div>
  
<!-- TUI 에디터 JS CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
var imageURL;
const editor = new toastui.Editor({
    el: document.querySelector('#postContent'), // 에디터를 적용할 요소 (컨테이너)
    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
    //initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
    previewStyle: 'vertical',
    hideModeSwitch: false,
    hooks: {
    	addImageBlobHook: (blob, callback) => {
    		// blob : Java Script 파일 객체
    		//console.log(blob);
    		const formData = new FormData();
        formData.append('image', blob);
        formData.append("uri", window.location.pathname);
        fileImage(formData);
    	  
    	}
    }
    // editor.getHtml()을 사용해서 에디터 내용 수신
    //document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
    // 콘솔창에 표시
    //console.log(editor.getHTML());
    // 마크다운 프리뷰 스타일 (tab || vertical)
});

function fileImage(formData){
	$.ajax({
   		url: '${contextPath}/community/editorImageUpload.do',
   		type: 'POST',
   		data: formData,
 	    async: false,
 	    processData: false,
 	    contentType: false,
   		success: function(data) {
   		  imageURL = "${contextPath}" + data.filePath + "/" + data.filesystemName;
   			//console.log('ajax 이미지 업로드 성공');
   			callback(imageURL, "image");
   		},
   		error: function(e) {
   			//console.log('ajax 이미지 업로드 실패');
   			//console.log(e.abort([statusText]));
   			
   			callback('image_load_fail', '사진 대체 텍스트 입력');
   		}
   	});
}



//기존 내용
$(document).ready(function(){
	let boardContent = '${ board.postContent }';
	editor.setHTML(boardContent);
})
</script>


<script>
var arr = [];
$(document).on("click", ".origin_del", function(){
	$(this).closest("div").remove();
	arr.push($(this).data("fileno"));
	console.log(arr);
	$("#fileDelNo").val(arr);
	console.log(	$("#fileDelNo").val() );
})



$(document).on("click", "#modifyForm", function(){
	//console.log("EDiter: " + $("#postContent").find("."));
	let postContent = editor.getHTML();
	$("input[type='hidden'][name='postContent']").val(postContent);
	$("#fileDelNo").val(arr);
	
	$("#postForm").submit();
})



</script>
</body>
</html>