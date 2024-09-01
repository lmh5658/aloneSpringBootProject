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
/* 전체 바디 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4; /* 페이지 배경색 */
    color: #333; /* 기본 텍스트 색상 */
}

/* 컨테이너 스타일 */
.container {
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto; /* 가운데 정렬 */
}



/* 인기글 베너 스타일 */
.bannere {
    margin-bottom: 20px;
}

.popular-posts {
display: flex;
    flex-direction: row;
    gap: 15px;
    background: #ffffff;
    padding: 20px;
}

.post-card {
    background: #ffffff;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.post-title {
    font-size: 1.1em;
    margin-bottom: 5px;
}

.post-description {
    font-size: 0.9em;
    color: #555;
}

.post-meta {
    margin-top: 10px;
}

/* 섹션 스타일 */
.section {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 */
    flex: 1; /* Flexbox로 균등하게 배치 */
   
}

/* 섹션 헤더 스타일 */
.section h2 {
    font-size: 1.5em;
    margin-bottom: 15px;
    color: #333; /* 헤더 텍스트 색상 */
}

/* 최신 게시글 목록 스타일 */
.latest-posts ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.latest-posts li {
    margin-bottom: 10px;
}

.latest-posts a {
    text-decoration: none;
    color: #00796b; /* 링크 색상 */
    font-size: 1em;
}

.latest-posts a:hover {
    text-decoration: underline;
    color: #004d40; /* 링크 호버 색상 */
}

</style>
</head>
  	<jsp:include page="/WEB-INF/views/common/doranHeader.jsp" />
<body>
    <div class="container">
        <!-- 날씨 정보를 표시할 베너 추가 -->
        <div class="bannere">
            <div><h2>인기글</h2></div>
            <div class="popular-posts">
                <c:forEach var="item" items="${likeList}" varStatus="varStatus">
                    <div class="post-card" style="cursor: pointer;width: 32%;" onclick="location.href='${contextPath}/community/${loginUser.userNo == item.writerNo ? 'detail.page' : 'increase.do'}?postNo=${item.postNo}&postType=${item.postType}'">
                        <b style="color: red;">인기글TOP${varStatus.index + 1}</b>
                        <h3 class="post-title">제목 : ${item.postTitle}</h3>
                        <div class="post-meta">
                            <span class="likes">👍 ${item.postLike}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div style="display: flex;height: 500px;gap: 29px;flex-wrap: nowrap;flex-direction: column;">
            <div class="section">
                <h2>공지사항</h2>
                <div class="latest-posts" style=" height: 298px;">
                    <ul>
                        <c:forEach var="item" items="${noticeList}">
                            <li><a href="${contextPath}/community/${item.writerNo == loginUser.userNo ? 'detail.page' : 'increase.do'}?postNo=${item.postNo}&postType=G">${item.postTitle}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="forum" class="section">
                <h2>자유게시판</h2>
                <div class="latest-posts" style=" height: 298px;">
                    <ul>
                        <c:forEach var="item" items="${boardList}">
                            <li><a href="${contextPath}/community/${item.writerNo == loginUser.userNo ? 'detail.page' : 'increase.do'}?postNo=${item.postNo}&postType=J">${item.postTitle}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="info" class="section">
                <h2>강아지 정보</h2>
                <div class="latest-posts" style=" height: 298px;">
                    <ul>
                        <c:forEach var="item" items="${infoList}">
                            <li><a href="${contextPath}/community/${item.writerNo == loginUser.userNo ? 'detail.page' : 'increase.do'}?postNo=${item.postNo}&postType=I">${item.postTitle}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
$.ajax({
	url:"${contextPath}/weather/apiWeather.do",
	type:"get",
	dataType: "json",
	contentType: "application/json",
	caches:false,
	success:function(response){
		
     let items = JSON.stringify(response.response.body.items.item);
     let parseItem = JSON.parse(items);
    
     let tmp = parseItem[0].fcstValue; 
     let today = parseItem[0].baseDate; //오늘날짜
     let sky = parseItem[5].fcstValue; //하늘
     let pop = parseItem[7].fcstValue; //강수확률
     
     let skyWeather = ""; //오늘 하늘상태
     let popWeather = ""; //오늘 강수확률
     if(sky >= 0 && sky <=5){
    	 skyWeather = "맑음";
     }else if(sky >= 6 && sky <=8){
    	 skyWeather = "구름많음";
     }else{
    	 skyWeather = "흐림";    	 
     }
     
     if(pop >= 50){
    	 popWeather = "오늘은 강수확률이" + pop +"% 입니다. ";
    	 $(".rain").html(popWeather);
     }
     
     console.log(parseItem);
     console.log(tmp);
     console.log(today);
     console.log(skyWeather);
     console.log(popWeather);

		
     
		
		
		
		
	},
	error:function(){
		
	}
})
</script>
<script>
$(document).ready(function(){
    $(".post-description").each(function(){
        let $this = $(this);
        let text = $this.text();
        if (text.length > 20) {
            let truncatedText = text.substring(0, 20) + "...";
            $this.text(truncatedText);
        }
    });
    
    $(".post-title").each(function(){
        let $this = $(this);
        let text = $this.text();
        if (text.length > 35) {
            let titleText = text.substring(0, 35) + "...";
            $this.text(titleText);
        }
    });
    
});
</script>

</html>