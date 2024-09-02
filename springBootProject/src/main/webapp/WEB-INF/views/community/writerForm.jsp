<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
	<section class="post-form" style=" height: auto;">
       <h2>새 게시글 작성</h2>
      <form id="postForm" method="post" action="${contextPath}/community/insertWriter.do" enctype="multipart/form-data">
      		<input type="hidden" name="postType" value="${type}">
          <input type="text" id="postTitle" name="postTitle" placeholder="제목" required style="width: 98%;">
          
          <div id="postContent">
          <!-- 에디터영역 -->

          </div>
          <input type="hidden" name="postContent">
          <div>
		        <input type="file" name='uploadFiles' id="fileInput" onchange="readURL(this);" multiple accept="image/gif, image/jpeg, image/png">
		        <c:if test="${type eq 'G' }">
		          <div>
			          <input type="text" id="locationName" name="locationName" placeholder="추천 장소를 검색하세요." style="width: 400px;">
			 					<div id="map" style="width: 400px; height: 300px;"></div>
		          </div>
	          </c:if>
          </div>
	          
          <div style="display: flex;justify-content: flex-end; margin-top: 27px;">
		         <button type="button" id="writerForm" style="border-radius: 9px;">게시하기</button>
          </div>
          
      </form>
  </section>
  
  </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script> 
<script>
var place;
$("#locationName").on("keypress", function(ev){
    if (ev.which == 13) {  // Enter 키가 눌렸는지 확인
        ps.keywordSearch($(this).val(), placesSearchCB); 
    }
});
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
// 마커를 생성하고 지도에 표시합니다
var marker = new kakao.maps.Marker({
    map: map,
    position: new kakao.maps.LatLng(place.y, place.x) 
});

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
    infowindow.open(map, marker);
});

}
</script>
 
<!-- TUI 에디터 JS CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>
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
        let imageURL;
    		const formData = new FormData();
        formData.append('image', blob);
        formData.append("uri", window.location.pathname);
    	  
   			$.ajax({
           		url: '${contextPath}/community/editorImageUpload.do',
           		type: 'POST',
           		data: formData,
         	    async: false,
         	    processData: false,
         	    contentType: false,
           		success: function(data) {
           		  imageURL = data.filePath + "/" + data.filesystemName;
           			//console.log('ajax 이미지 업로드 성공');
           			callback(imageURL, "");
           		},
           		error: function(e) {
           			//console.log('ajax 이미지 업로드 실패');
           			//console.log(e.abort([statusText]));
           			
           			callback('image_load_fail', '사진 대체 텍스트 입력');
           		}
           	});
    	}
    }
    // editor.getHtml()을 사용해서 에디터 내용 수신
    //document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
    // 콘솔창에 표시
    //console.log(editor.getHTML());
    // 마크다운 프리뷰 스타일 (tab || vertical)
});


</script>
<script>
$(document).ready(function(){
	console.log(editor.getHTML());
	
	
	
	
	
})
</script>

<script>
$(document).on("click", "#writerForm", function(){
	//console.log("EDiter: " + $("#postContent").find("."));
	let postContent = editor.getHTML();
	$("input[type='hidden'][name='postContent']").val(postContent);
	$()
	$("#postForm").submit();
})



function readURL(obj) {

	console.log($("#postContent").find(".toastui-editor-contents").html());
	console.log($("#postContent").find(".ProseMirror toastui-editor-contents").html());
	/*
    // 파일 확장자 추출
    var file_kind = obj.value.lastIndexOf('.');
    var file_name = obj.value.substring(file_kind + 1, obj.value.length);
    var file_type = file_name.toLowerCase();
		
    console.log(obj.files.length);
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

    let html = '';
    // 파일 입력이 있을 때
    if (obj.files && obj.files.length > 0) {
    		for(let i=0; i<obj.files.length; i++){
    			html += '<img id="previewImage' + (i + 1) + '" src="">';
    		}	
    		$("#previewImage").after(html);
        var reader = new FileReader();
        reader.onload = function(e) {
            for(let i=0; i<obj.files.length; i++){
                document.getElementById("previewImage" + i).src = e.target.result;
            }
        }
        for(let i=0; i<obj.files.length; i++){
            reader.readAsDataURL(obj.files[i]);
        }
        
    } else {
        document.getElementById("previewImage").src = "";
    }
	*/
}

</script>
</body>
</html>