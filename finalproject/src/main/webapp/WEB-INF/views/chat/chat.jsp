<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/chat.css">
</head>
<body>
     <div class="chat-container">
        <a href="/components/BookExchangePage.tsx" class="back-btn">
          ← 교환 목록으로
        </a>

        {/* Sidebar */}
        <div class="sidebar">
          <div class="sidebar-header">
            <h2 class="sidebar-title">대화</h2>
            <p class="sidebar-subtitle">책 교환 관련 대화들</p>
          </div>
          
          <div class="chat-list">
            <div class="chat-item active">
              <div class="chat-item-header">
                <span class="chat-user-name">김문학</span>
                <span class="chat-time">오후 2:30</span>
              </div>
              <div class="chat-book-info">"달러구트 꿈 백화점" 교환</div>
              <div class="chat-last-message">네, 그럼 내일 2시에 만나요!</div>
            </div>

            <div class="chat-item">
              <div class="chat-item-header">
                <span class="chat-user-name">박독서</span>
                <div class="unread-badge">2</div>
              </div>
              <div class="chat-book-info">"클린 코드" 교환</div>
              <div class="chat-last-message">사진으로 상태 확인 가능할까요?</div>
            </div>

            <div class="chat-item">
              <div class="chat-item-header">
                <span class="chat-user-name">이책사랑</span>
                <span class="chat-time">어제</span>
              </div>
              <div class="chat-book-info">"불편한 편의점" 교환</div>
              <div class="chat-last-message">정말 감동적인 책이었어요! 추천 감사해요 ✨</div>
            </div>

            <div class="chat-item">
              <div class="chat-item-header">
                <span class="chat-user-name">최소설가</span>
                <span class="chat-time">2일 전</span>
              </div>
              <div class="chat-book-info">"세이노의 가르침" 교환</div>
              <div class="chat-last-message">홍대 근처에서 만날 수 있을까요?</div>
            </div>

            <div class="chat-item">
              <div class="chat-item-header">
                <span class="chat-user-name">정북러버</span>
                <span class="chat-time">3일 전</span>
              </div>
              <div class="chat-book-info">"원피스 106권" 교환</div>
              <div class="chat-last-message">만화책도 교환하시는군요! 관심있어요</div>
            </div>

            <div class="chat-item">
              <div class="chat-item-header">
                <span class="chat-user-name">한문학도</span>
                <span class="chat-time">1주일 전</span>
              </div>
              <div class="chat-book-info">"아버지의 해방일지" 교환</div>
              <div class="chat-last-message">좋은 책 교환해주셔서 감사했습니다</div>
            </div>
          </div>
        </div>

        {/* Main Chat Area */}
        <div class="chat-main">
          <div class="chat-header">
            <div class="chat-header-info">
              <div class="chat-avatar" style="position: relative;">
                김
                <div class="online-status"></div>
              </div>
              <div class="chat-user-info">
                <h3>김문학</h3>
                <div class="chat-book-title">"달러구트 꿈 백화점" 교환 문의</div>
              </div>
              <div class="chat-actions">
                <button class="action-btn" title="통화">📞</button>
                <button class="action-btn" title="더보기">⋯</button>
                <button class="complete-trade-btn" onclick="completeTrade()">
                  ✅ 거래완료
                </button>
              </div>
            </div>
          </div>

          <div class="chat-messages">
            {/* 첫 만남 및 관심 표현 */}
            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">안녕하세요! 달러구트 꿈 백화점 교환 가능한가요? 정말 읽고 싶었던 책이에요 😊</div>
                  <div class="message-time">어제 오후 9:15</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">네, 안녕하세요! 교환 가능합니다. 어떤 책으로 교환하실 건가요?</div>
                  <div class="message-time">어제 오후 9:23</div>
                </div>
              </div>
            </div>

            {/* 책 상태 및 교환 조건 협의 */}
            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">저는 "미드나잇 라이브러리"로 교환하고 싶어요. 작년에 새로 샀고 한 번만 읽어서 상태 매우 좋습니다! 혹시 달러구트는 어떤 상태인가요?</div>
                  <div class="message-time">어제 오후 9:25</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">오 미드나잇 라이브러리! 정말 읽고 싶었던 책이에요 ✨ 달러구트는 밑줄이나 필기 전혀 없고, 모서리도 깨끗합니다. 사진 보내드릴까요?</div>
                  <div class="message-time">어제 오후 9:30</div>
                </div>
              </div>
            </div>

            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">아 사진까지는 괜찮아요! 말씀해주신 것만으로도 충분히 신뢰가 됩니다 😄 언제 만나실 수 있나요?</div>
                  <div class="message-time">어제 오후 9:35</div>
                </div>
              </div>
            </div>

            {/* 만남 약속 */}
            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">내일(토요일) 오후 2시쯤 어떠세요? 강남역 근처가 편하실까요?</div>
                  <div class="message-time">어제 오후 9:40</div>
                </div>
              </div>
            </div>

            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">완벽해요! 강남역 2번 출구 스타벅스는 어떠세요? 거기서 2시에 만나요 ☕</div>
                  <div class="message-time">어제 오후 9:42</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">좋습니다! 그럼 내일 2시에 강남역 2번 출구 스타벅스에서 만나요. 미드나잇 라이브러리 들고 가시면 되죠?</div>
                  <div class="message-time">어제 오후 9:45</div>
                </div>
              </div>
            </div>

            {/* 당일 확인 */}
            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">안녕하세요! 오늘 2시 약속 잊지 않으셨죠? 지금 출발합니다 🚇</div>
                  <div class="message-time">오늘 오후 1:30</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">네! 저도 곧 출발해요. 달러구트 꼼꼼히 포장해서 가져갑니다 📚</div>
                  <div class="message-time">오늘 오후 1:35</div>
                </div>
              </div>
            </div>

            {/* 거래 완료 후 */}
            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">오늘 만나서 정말 반가웠어요! 달러구트 벌써 설레서 빨리 읽어보고 싶네요 ✨ 좋은 책 교환해주셔서 감사합니다!</div>
                  <div class="message-time">오늘 오후 3:15</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">저도 감사해요! 미드나잇 라이브러리 오늘밤부터 읽어볼게요 📖 다음에 또 좋은 책으로 교환해요!</div>
                  <div class="message-time">오늘 오후 3:18</div>
                </div>
              </div>
            </div>

            {/* 추가 소통 */}
            <div class="message">
              <div class="message-avatar">김</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">혹시 책 추천도 해주실 수 있나요? 비슷한 감성의 책이 있다면 알려주세요 😊</div>
                  <div class="message-time">오늘 오후 3:20</div>
                </div>
              </div>
            </div>

            <div class="message own">
              <div class="message-avatar">나</div>
              <div class="message-content">
                <div class="message-bubble">
                  <div class="message-text">좋아요! "언어의 온도"나 "곰탕" 추천드려요. 둘 다 따뜻하고 감성적인 이야기들이에요. 나중에 이 책들도 교환할 수 있어요!</div>
                  <div class="message-time">오늘 오후 3:25</div>
                </div>
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
                ></textarea>
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
      <script>
        // Auto-resize textarea
        const messageInput = document.querySelector('.message-input');
        messageInput.addEventListener('input', function() {
          this.style.height = 'auto';
          this.style.height = Math.min(this.scrollHeight, 120) + 'px';
        });

        // Send message on Enter (but not Shift+Enter)
        messageInput.addEventListener('keydown', function(e) {
          if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            // Send message logic here
            console.log('Sending message:', this.value);
            this.value = '';
            this.style.height = 'auto';
          }
        });

        // Chat item selection
        document.querySelectorAll('.chat-item').forEach(item => {
          item.addEventListener('click', function() {
            document.querySelector('.chat-item.active')?.classList.remove('active');
            this.classList.add('active');
          });
        });

        // Complete trade function
        function completeTrade() {
          const btn = document.querySelector('.complete-trade-btn');
          if (btn.classList.contains('completed')) return;
          
          if (confirm('거래를 완료하시겠습니까? 완료 후에는 되돌릴 수 없습니다.')) {
            btn.innerHTML = '✅ 거래완료됨';
            btn.classList.add('completed');
            
            // Add system message to chat
            const messagesContainer = document.querySelector('.chat-messages');
            const systemMessage = document.createElement('div');
            systemMessage.innerHTML = `
              <div style="text-align: center; margin: 2rem 0; padding: 1rem; background: rgba(156, 175, 158, 0.1); border-radius: 12px; color: var(--color-text-secondary); font-style: italic;">
                🎉 거래가 성공적으로 완료되었습니다! 
              </div>
            `;
            messagesContainer.appendChild(systemMessage);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
          }
        }

        // Make function global
        window.completeTrade = completeTrade;
      </script>
</html>