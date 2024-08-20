<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table *{margin:5px;}
  table{width:100%;}
</style>
</head>
<body>

	<!-- 이쪽에 메뉴바 포함 할꺼임 -->
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <div class="content">
      <br><br>
      <div class="innerOuter">
          <h2>게시글 상세보기</h2>
          <br>
          
          <a class="btn btn-secondary" style="float:right" href="${ contextPath }/board/list.do">목록으로</a>
          <br><br>
          
          <table id="contentArea" align="center" class="table">
              <tr>
                  <th width="100">제목</th>
                  <td colspan="3">${ board.boardTitle }</td>
              </tr>
              <tr>
                  <th>작성자</th>
                  <td>${ board.boardWriter }</td>
                  <th>작성일</th>
                  <td>${ board.registDt }</td>
              </tr>
              <tr>
                  <th>첨부파일</th>
                  <td colspan="3">
                  	<c:forEach var="at" items="${ board.attachList }">
                      <a href="C:\${ contextPath }${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a> <br>
                    </c:forEach>
                  </td>
              </tr>
              <tr>
                  <th>내용</th>
                  <td colspan="3"></td>
              </tr>
              <tr>
                  <td colspan="4">
                  	<p style="height:150px">${ board.boardContent }</p>
                  </td>
              </tr>
          </table>
          <br>

					<c:if test="${ loginUser.userId eq board.boardWriter }">
	          <form id="frm" action="" method="post" align="center">
	          	<input type="hidden" name="no" value="${ board.boardNo }">
              <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
              <button type="submit" class="btn btn-primary" onclick="frmSubmit(1);">수정하기</button>
              <button type="submit" class="btn btn-danger" onclick="frmSubmit(2);">삭제하기</button>
	          </form><br><br>
	          <script>
	          	function frmSubmit(num){
	          		$("#frm").attr("action", num==1 ? "${contextPath}/board/modifyForm.page" 
	          																		: "${contextPath}/board/remove.do");
	          	}
	          </script>
					</c:if>



          <table id="replyArea" class="table" align="center">
              <thead>
             			<c:choose> 
             				<c:when test="${ empty loginUser }">
		                  <tr>
		                      <th colspan="2">
		                          <textarea class="form-control" readonly id="content" cols="55" rows="2" style="resize:none; width:100%">로그인후 이용가능한 서비스입니다.</textarea>
		                      </th>
		                      <th style="vertical-align: middle"><button class="btn btn-secondary disabled">등록하기</button></th>
		                  </tr>
                  	</c:when>
                  	<c:otherwise>
		                  <tr>
		                      <th colspan="2">
		                          <textarea class="form-control" id="replyContent" cols="55" rows="2" style="resize:none; width:100%"></textarea>
		                      </th>
		                      <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="ajaxInsertReply();">등록하기</button></th>
		                  </tr>
                  	</c:otherwise>
                  </c:choose>
                  <tr>
                     <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                  </tr>
              </thead>
              <tbody>
              		<!--  
                  <tr>
                      <th>user02</th>
                      <td>댓글입니다.너무웃기다앙</td>
                      <td>2020-04-10</td>
                  </tr>
                  -->
              </tbody>
          </table>
      </div>
      
      <script>
      	
      	$(document).ready(function(){
      		ajaxReplyList();
      		
      		// 동적으로 만들어진 요소에 이벤트 걸때 => 이벤트 메소드방식 안됨
      		//$(".removeReply").click(function(){
      		//$(".removeReply").on("click", function(){
      		$(document).on("click", ".removeReply", function(){
      			
      			console.log("삭제할댓글번호", $(this).data("replyno"));
      			
      			// 해당 댓글 삭제용 ajax요청
      			$.ajax({
      				url:"${contextPath}/board/removeReply.do",
      				type:"get",
      				data:"no=" + $(this).data("replyno"),
      				success:function(result){
      					if(result == "SUCCESS"){
      						ajaxReplyList();
      					}
      				}
      			})
      			
      			
      		})
      		
      	})
      	
      	// 댓글 ajax로 작성 요청하는 function
      	function ajaxInsertReply(){
      		
      		if($("#replyContent").val().trim().length != 0){
      			
      			$.ajax({
      				url:"${contextPath}/board/registReply.do",
      				type:"post",
      				data:{
      					replyContent:$("#replyContent").val(),
      					refBoardNo:${board.boardNo}
      				},
      				success:function(result){
      					if(result == "SUCCESS"){
      						$("#replyContent").val("");
      						ajaxReplyList();
      					}else if(result == "FAIL"){
      						alertify.alert("댓글 작성 서비스", "다시 입력해주세요.");
      					}
      				},error:function(){
      					console.log("댓글 작성용 ajax 통신 실패");
      				}
      			})
      			
      		}else{
      			alertify.alert("댓글 작성 서비스", "다시 입력해주세요.");
      		}
      		
      	}
      
      	// 현재 게시글의 댓글 리스트를 ajax로 조회해서 뿌리는 function
      	function ajaxReplyList(){
      		
      		// 비동기식으로 "/board/replyList.do" url요청 
      		// 요청처리 결과로 조회된 댓글리스트를 응답데이터로 받기
      		// 해당 응답데이터 가지고 댓글 한개당 하나의 tr요소로 만들어서
      		// tbody 영역에 뿌리기 
      		// + 댓글 갯수도 수정
      		$.ajax({
      			url:"${contextPath}/board/replyList.do",
      			type:"get",
      			data:"no=${board.boardNo}",
      			success:function(resData){ // [{}, {}, {}, ..]
      			
      				$("#rcount").text(resData.length);
      			
      				let tr = "";
      				for(let i=0; i<resData.length; i++){
      					tr += "<tr>"
      								+	 "<th>" + resData[i].replyWriter + "</th>"
      								+	 "<td>" + resData[i].replyContent + "</td>"
      								+	 "<td>" + resData[i].registDt;
      					
 								// 현재로그인한 회원이 해당 댓글의 작성자일 경우
      					if(resData[i].replyWriter == '${loginUser.userId}')	{
      						tr += "<button class='btn btn-sm btn-danger removeReply' data-replyno='" + resData[i].replyNo + "'>삭제</button>"
      					}		
      								
      					tr += 	"</td>"
      							 + "</tr>";
      				}
      				
      				$("#replyArea tbody").html(tr);
      			
      			},error:function(){
      				console.log("댓글 목록 조회용 ajax통신 실패");
      			}
      		})
      		
      	}
      </script>
      
      <br><br>
  </div>

  <!-- 이쪽에 푸터바 포함할꺼임 -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>