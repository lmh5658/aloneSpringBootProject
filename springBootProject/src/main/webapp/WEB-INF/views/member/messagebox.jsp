<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <main>
        <div id="received" class="tab-content">
            <h2>받은 쪽지 목록</h2>
            <ul>
                <li>쪽지 1: 내용</li>
                <li>쪽지 2: 내용</li>
                <!-- 여기에 받은 쪽지 항목을 추가합니다. -->
            </ul>
        </div>

        <div id="sent" class="tab-content">
            <h2>보낸 쪽지 목록</h2>
            <ul>
                <li>쪽지 1: 내용</li>
                <li>쪽지 2: 내용</li>
                <!-- 여기에 보낸 쪽지 항목을 추가합니다. -->
            </ul>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 쪽지함 서비스</p>
    </footer>

    <script>
        function showTab(tabId) {
            // 모든 탭 콘텐츠 숨기기
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => {
                tab.classList.remove('active');
            });

            // 클릭된 탭 콘텐츠 보이기
            document.getElementById(tabId).classList.add('active');
        }

        // 기본적으로 받은 쪽지함 탭을 보여줍니다.
        document.addEventListener('DOMContentLoaded', () => {
            showTab('received');
        });
    </script>
</body>
</html>