<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/chatDetail.css">
</head>
<body>
<body>

      <div class="chat-container">
        <a href="#" class="back-btn">
          ← 교환 목록으로
        </a>
  
        <div class="sidebar">
          <div class="sidebar-header">
            <h2 class="sidebar-title">대화</h2>
            <p class="sidebar-subtitle">책 교환 관련 대화들</p>
          </div>
          
          <div class="chat-list">
            <div class="empty-state">
              <div class="empty-state-icon">💬</div>
              <div class="empty-state-title">아직 대화가 없습니다</div>
              <div class="empty-state-description">책 교환을 시작하면 여기에 대화가 표시됩니다</div>
            </div>
          </div>
        </div>

        <div class="chat-main">
          <div class="chat-header">
            <div class="no-chat-selected">
              대화를 선택해주세요
            </div>
          </div>
          <div class="chat-messages">
            <div class="messages-empty-state">
              <div class="messages-empty-icon">📚</div>
              <div class="messages-empty-title">대화를 시작해보세요!</div>
              <div class="messages-empty-description">
                좋은 책으로 교환하고 새로운 이야기를 나눠보세요
              </div>
            </div>
          </div>
          <div class="chat-input">
            <div class="input-container">
              <div class="input-wrapper">
                <textarea 
                  class="message-input" 
                  placeholder="메시지를 입력하세요..."
                  rows="1"
                >
                </textarea>
                <button class="attach-btn" title="사진 첨부">📷</button>
              </div>
              <button class="send-btn">
                전송 ✈️
              </button>
            </div>
          </div>
        </div>
      </div>
</body>
</html>