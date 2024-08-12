<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<tr>
  <th class="text-center" scope="row">* 처리내용</th>
  <td class="" colspan="3">
    <th:block th:if="${lastAnswer.status == 'E'}">
      <span th:text="${lastAnswer.body}"></span>
      <input type="hidden" name="questionId" id="questionId" th:value="${qDto.questionId}">
    </th:block>
    <th:block th:if="${lastAnswer.status != 'E'}">
        <textarea id="answer" name="body" class="form-control" rows="3" 
        placeholder="처리내용을 입력해주세요." required></textarea>
      <input type="hidden" name="questionId" id="questionId" th:value="${qDto.questionId}">
    </th:block>
  </td>
</tr>

<script>
	function insertAnswer(event) {
	    if (!$("#answer").val()) {
	        alert("내용을 입력하세요.");
	    } else {
	        var aDto = {
	            status : $("#status").val(),
	            body : $("#answer").val(),
	            questionId : $("#questionId").val(),
	       		 emailTitle: document.getElementById('emailTitle').value,
	             emailAddr: document.getElementById('emailAddr').value,
	             emailContent: $("#answer").val()
	        };
	        showLoading(); // 로딩화면 표시

	        $.ajax({
	            url : "/board/addAnswer.do",
	            data : aDto,
	            type : 'POST',
	            success : function(result) {
	                if (aDto.status === 'E') {
	  	              alert('이메일이 발송되었습니다.');
	                   location.reload();
	                } else {
		                getAnswer();
		                $("#answer").val("");
		            }
	            },
	            error: function(error) {
		              console.error(error);
		              alert('이메일 발송에 실패하였습니다.');
		            },
	            complete: function() {
	                hideLoading(); // ajax 완료 후 로딩화면 숨기기
	            }
	        })
	    }
	}
</script>

</body>
</html>