<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&display=swap');
        
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        :root {
          --color-sage: #9CAF9E;
          --color-cream: #F8F6F0;
          --color-charcoal: #2D3436;
          --color-warm-white: #FEFDFB;
          --color-terracotta: #D4A574;
          --color-deep-blue: #364958;
          --color-accent-gold: #D4A574;
          --color-muted-green: #8FA685;
          --color-soft-beige: #E8E3D8;
          --color-text-primary: #2D3436;
          --color-text-secondary: #636E72;
          --color-text-muted: #74B9FF;
          
          --font-serif: 'Crimson Text', Georgia, serif;
          --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
          
          --shadow-soft: 0 4px 20px rgba(45, 52, 54, 0.06);
          --shadow-medium: 0 8px 30px rgba(45, 52, 54, 0.08);
          --shadow-strong: 0 15px 50px rgba(45, 52, 54, 0.12);
          
          --border-radius-sm: 8px;
          --border-radius-md: 12px;
          --border-radius-lg: 16px;
        }

        body {
          font-family: var(--font-sans);
          line-height: 1.7;
          color: var(--color-text-primary);
          background: linear-gradient(135deg, var(--color-warm-white) 0%, var(--color-cream) 100%);
          letter-spacing: -0.01em;
          height: 100vh;
          overflow: hidden;
        }

        .chat-container {
          display: flex;
          height: 100vh;
        }

        /* Sidebar */
        .sidebar {
          width: 320px;
          background: var(--color-warm-white);
          border-right: 1px solid rgba(156, 175, 158, 0.2);
          display: flex;
          flex-direction: column;
          box-shadow: var(--shadow-soft);
        }

        .sidebar-header {
          padding: 2rem;
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
          background: linear-gradient(135deg, var(--color-deep-blue) 0%, var(--color-charcoal) 100%);
          color: var(--color-warm-white);
        }

        .sidebar-title {
          font-family: var(--font-serif);
          font-size: 1.5rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          letter-spacing: -0.01em;
        }

        .sidebar-subtitle {
          font-size: 0.9rem;
          opacity: 0.8;
          font-weight: 300;
        }

        .chat-list {
          flex: 1;
          overflow-y: auto;
          padding: 1rem 0;
        }

        .chat-item {
          padding: 1rem 1.5rem;
          cursor: pointer;
          transition: all 0.3s ease;
          border-left: 3px solid transparent;
          position: relative;
        }

        .chat-item:hover {
          background: rgba(156, 175, 158, 0.05);
          border-left-color: var(--color-sage);
        }

        .chat-item.active {
          background: rgba(156, 175, 158, 0.1);
          border-left-color: var(--color-sage);
        }

        .chat-item-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 0.5rem;
        }

        .chat-user-name {
          font-weight: 600;
          color: var(--color-charcoal);
          font-size: 0.95rem;
        }

        .chat-time {
          font-size: 0.75rem;
          color: var(--color-text-secondary);
        }

        .chat-book-info {
          font-size: 0.85rem;
          color: var(--color-terracotta);
          margin-bottom: 0.3rem;
          font-style: italic;
        }

        .chat-last-message {
          font-size: 0.85rem;
          color: var(--color-text-secondary);
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        .unread-badge {
          background: var(--color-terracotta);
          color: var(--color-warm-white);
          border-radius: 50%;
          font-size: 0.7rem;
          font-weight: 600;
          padding: 0.2rem 0.5rem;
          min-width: 1.2rem;
          text-align: center;
        }

        /* Main Chat Area */
        .chat-main {
          flex: 1;
          display: flex;
          flex-direction: column;
          background: var(--color-warm-white);
        }

        .chat-header {
          padding: 1.5rem 2rem;
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
          background: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .chat-header-info {
          display: flex;
          align-items: center;
          gap: 1rem;
        }

        .chat-avatar {
          width: 50px;
          height: 50px;
          border-radius: 50%;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          display: flex;
          align-items: center;
          justify-content: center;
          color: var(--color-warm-white);
          font-size: 1.2rem;
          font-weight: 600;
        }

        .chat-user-info h3 {
          font-family: var(--font-serif);
          font-size: 1.2rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 0.2rem;
        }

        .chat-book-title {
          font-size: 0.9rem;
          color: var(--color-terracotta);
          font-style: italic;
        }

        .chat-actions {
          margin-left: auto;
          display: flex;
          gap: 0.5rem;
        }

        .action-btn {
          padding: 0.5rem;
          border: none;
          background: transparent;
          color: var(--color-text-secondary);
          cursor: pointer;
          border-radius: var(--border-radius-sm);
          transition: all 0.3s ease;
          font-size: 1.2rem;
        }

        .action-btn:hover {
          background: rgba(156, 175, 158, 0.1);
          color: var(--color-charcoal);
        }

        .complete-trade-btn {
          padding: 0.75rem 1.5rem;
          background: linear-gradient(135deg, var(--color-terracotta), var(--color-accent-gold));
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-lg);
          cursor: pointer;
          font-weight: 600;
          font-size: 0.9rem;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          margin-left: 1rem;
        }

        .complete-trade-btn:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
          background: linear-gradient(135deg, #C19660, #B8935F);
        }

        .complete-trade-btn.completed {
          background: var(--color-muted-green);
          cursor: not-allowed;
        }

        .complete-trade-btn.completed:hover {
          transform: none;
          box-shadow: none;
        }

        /* Chat Messages */
        .chat-messages {
          flex: 1;
          overflow-y: auto;
          padding: 2rem;
          background: linear-gradient(135deg, var(--color-warm-white) 0%, var(--color-cream) 100%);
        }

        .message {
          margin-bottom: 1.5rem;
          display: flex;
          gap: 1rem;
        }

        .message.own {
          flex-direction: row-reverse;
        }

        .message-avatar {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          display: flex;
          align-items: center;
          justify-content: center;
          color: var(--color-warm-white);
          font-size: 0.9rem;
          font-weight: 600;
          flex-shrink: 0;
        }

        .message.own .message-avatar {
          background: linear-gradient(135deg, var(--color-terracotta), var(--color-accent-gold));
        }

        .message-content {
          max-width: 60%;
        }

        .message-bubble {
          background: var(--color-warm-white);
          padding: 1rem 1.25rem;
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-soft);
          border: 1px solid rgba(156, 175, 158, 0.1);
          position: relative;
        }

        .message.own .message-bubble {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
        }

        .message-text {
          margin-bottom: 0.5rem;
          line-height: 1.6;
        }

        .message-time {
          font-size: 0.75rem;
          opacity: 0.7;
        }

        .message.own .message-time {
          opacity: 0.8;
          color: rgba(254, 253, 251, 0.8);
        }

        /* Chat Input */
        .chat-input {
          padding: 1.5rem 2rem;
          border-top: 1px solid rgba(156, 175, 158, 0.15);
          background: var(--color-warm-white);
        }

        .input-container {
          display: flex;
          gap: 1rem;
          align-items: flex-end;
        }

        .input-wrapper {
          flex: 1;
          position: relative;
        }

        .message-input {
          width: 100%;
          min-height: 50px;
          max-height: 120px;
          padding: 0.75rem 3rem 0.75rem 1rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-lg);
          font-size: 0.95rem;
          font-family: var(--font-sans);
          resize: none;
          outline: none;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
        }

        .message-input:focus {
          border-color: var(--color-sage);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
        }

        .message-input::placeholder {
          color: var(--color-text-secondary);
          font-style: italic;
        }

        .attach-btn {
          position: absolute;
          right: 0.75rem;
          top: 50%;
          transform: translateY(-50%);
          background: none;
          border: none;
          color: var(--color-text-secondary);
          cursor: pointer;
          padding: 0.25rem;
          border-radius: var(--border-radius-sm);
          transition: all 0.3s ease;
        }

        .attach-btn:hover {
          color: var(--color-charcoal);
          background: rgba(156, 175, 158, 0.1);
        }

        .send-btn {
          padding: 0.75rem 1.5rem;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-lg);
          cursor: pointer;
          font-weight: 600;
          font-size: 0.9rem;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .send-btn:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        .send-btn:disabled {
          opacity: 0.5;
          cursor: not-allowed;
          transform: none;
          box-shadow: none;
        }

        /* Back Button */
        .back-btn {
          position: fixed;
          top: 2rem;
          left: 2rem;
          z-index: 1000;
          background: rgba(254, 253, 251, 0.9);
          backdrop-filter: blur(20px);
          border: 1px solid rgba(156, 175, 158, 0.2);
          color: var(--color-charcoal);
          padding: 0.75rem 1rem;
          border-radius: var(--border-radius-lg);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          transition: all 0.3s ease;
          text-decoration: none;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .back-btn:hover {
          background: var(--color-warm-white);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        /* Online Status */
        .online-status {
          width: 10px;
          height: 10px;
          background: #10B981;
          border-radius: 50%;
          border: 2px solid var(--color-warm-white);
          position: absolute;
          bottom: 0;
          right: 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
          .sidebar {
            position: absolute;
            left: -320px;
            top: 0;
            height: 100%;
            z-index: 999;
            transition: left 0.3s ease;
          }

          .sidebar.open {
            left: 0;
          }

          .chat-main {
            width: 100%;
          }
        }
    </style>

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
                <button class="attach-btn" title="파일 첨부">📎</button>
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