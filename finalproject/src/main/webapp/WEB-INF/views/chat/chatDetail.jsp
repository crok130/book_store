<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginUserNum" value="${sessionScope.userInfo.member_num}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/chatDetail.css">
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
    <style>
      /* 긴 메시지도 한 개의 말풍선 안에서 줄바꿈/개행 유지 */
      .message-text { white-space: pre-wrap; overflow-wrap: anywhere; word-break: break-word; }
    </style>
</head>
<body>

      <div class="chat-container">
        <a href="${path}/tradebook/bookexchange" class="back-btn">
          ← 교환 목록으로
        </a>
  
        <div class="sidebar">
          <div class="sidebar-header">
            <h2 class="sidebar-title">대화</h2>
            <p class="sidebar-subtitle">책 교환 관련 대화들</p>
          </div>
          
           <div class="chat-list">
             <div class="chat-item">
               <div class="chat-item-header">
                 <span class="chat-user-name">김문학</span>
                 <span class="chat-time">오후 2:30</span>
               </div>
               <div class="chat-book-info">"달러구트 꿈 백화점" 교환</div>
               <div class="chat-last-message">네, 그럼 내일 2시에 만나요!</div>
             </div>
            <div class="empty-state" id="empty-state" style="display: none;">
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
      
      <script>
        const CURRENT_USER_NUM = ${loginUserNum != null ? loginUserNum : 0};
        // 공통 시간 포맷터: '오전/오후 h:mm'
        function formatKoreanTime(ts) {
          if (!ts) return '';
          const d = new Date(ts);
          if (isNaN(d.getTime())) return ts; // 파싱 불가하면 원문 표시
          let h = d.getHours();
          const m = d.getMinutes();
          const period = h >= 12 ? '오후' : '오전';
          const displayH = h % 12 === 0 ? 12 : h % 12;
          return period + ' ' + displayH + ':' + String(m).padStart(2, '0');
        }

		// ===== STOMP WebSocket 연결 관리 =====
		let stompClient = null;
		let currentRoomId = null;
		// 최근 내가 전송한 메시지(중복 에코 제거용)
		let recentSelfMessages = [];

		function connectSocket() {
			if (stompClient && stompClient.connected) return;
			const socket = new SockJS('${path}/ws-stomp');
			stompClient = Stomp.over(socket);
			stompClient.debug = null;
			// 연결 안정성 향상을 위한 하트비트
			stompClient.heartbeat = { outgoing: 10000, incoming: 10000 };
			stompClient.connect({}, function() {
				console.log('STOMP connected');
				if (currentRoomId) subscribeRoom(currentRoomId);
			}, function(err) {
				console.error('STOMP error', err);
				// 짧은 지연 후 재연결 시도
				setTimeout(function(){ if (!stompClient || !stompClient.connected) connectSocket(); }, 2000);
			});
		}

		function subscribeRoom(roomId) {
			if (!stompClient || !stompClient.connected) return;
			// 같은 방이라도 재연결 직후 구독이 없을 수 있으므로 확인
			if (currentRoomId === roomId && stompClient.subscriptions && stompClient.subscriptions['sub-' + currentRoomId]) return;
			if (currentRoomId && stompClient.subscriptions && stompClient.subscriptions['sub-' + currentRoomId]) {
				stompClient.subscriptions['sub-' + currentRoomId].unsubscribe();
			}
			currentRoomId = roomId;
			ensureChatUI();
			const sub = stompClient.subscribe('/topic/chat.' + roomId, function(msg) {
				console.log('RECV:', msg.body);
				try {
					const data = JSON.parse(msg.body || '{}');
					// 내가 방금 보낸 메시지의 에코는 중복 표시 방지
					if (data && Number(data.sender_member_num) === Number(CURRENT_USER_NUM)) {
						const now = Date.now();
						recentSelfMessages = recentSelfMessages.filter(m => now - m.t < 2000);
						if (recentSelfMessages.some(m => m.text === (data.message_content || ''))) {
							return;
						}
					}
					appendIncomingMessage(data);
				} catch(e) { console.error(e); }
			});
			stompClient.subscriptions = stompClient.subscriptions || {};
			stompClient.subscriptions['sub-' + roomId] = sub;
		}

		function sendMessageOverStomp(text) {
			if (!stompClient || !stompClient.connected) { console.warn('WS 미연결'); connectSocket(); return; }
			if (!currentRoomId) { console.warn('방 선택 필요'); return; }
			const payload = {
				chatroom_num: currentRoomId,
				sender_member_num: CURRENT_USER_NUM,
				message_content: text,
				sent_at: new Date().toISOString()
			};
			stompClient.send('/app/chat/' + currentRoomId, {}, JSON.stringify(payload));
			// 전송 즉시 화면에 반영하여 F5 없이 보이도록
			appendIncomingMessage(payload);
			recentSelfMessages.push({ text, t: Date.now() });
		}

		function appendIncomingMessage(msg) {
			let messagesContainer = document.getElementById('chat-messages') || document.querySelector('.chat-messages');
			if (!messagesContainer) {
				ensureChatUI();
				messagesContainer = document.getElementById('chat-messages') || document.querySelector('.chat-messages');
			}
			// 다른 방 메시지는 무시
			if (msg.chatroom_num && currentRoomId && Number(msg.chatroom_num) !== Number(currentRoomId)) {
				return;
			}
			if (!messagesContainer) return;
			const isMine = (msg.sender_member_num === CURRENT_USER_NUM);
			const item = document.createElement('div');
			item.className = 'message' + (isMine ? ' own' : '');
			item.innerHTML =
				'<div class="message-avatar">' + (isMine ? '나' : '상대') + '</div>' +
				'<div class="message-content">' +
					'<div class="message-bubble">' +
						'<div class="message-text">' + (msg.message_content || '') + '</div>' +
						'<div class="message-time">' + formatKoreanTime(msg.sent_at) + '</div>' +
					'</div>' +
				'</div>';
			messagesContainer.appendChild(item);
			messagesContainer.scrollTop = messagesContainer.scrollHeight;
		}

		// 헤더/메시지 영역이 존재하도록 보장
		function ensureChatUI() {
			let chatHeader = document.getElementById('chat-header') || document.querySelector('.chat-header');
			if (chatHeader && chatHeader.classList && chatHeader.classList.contains('chat-header')) {
				chatHeader.removeAttribute('class');
				chatHeader.setAttribute('id', 'chat-header');
			}
			let messagesContainer = document.getElementById('chat-messages') || document.querySelector('.chat-messages');
			if (messagesContainer && messagesContainer.classList && messagesContainer.classList.contains('chat-messages')) {
				messagesContainer.removeAttribute('class');
				messagesContainer.setAttribute('id', 'chat-messages');
			}
		}

		// 초기에는 연결하지 않음. 채팅 아이템 클릭 시에만 연결/구독한다.
		fetch("chatAside")
		.then(res => {
			console.log("Response status:", res.status);
			if (!res.ok) {
				throw new Error(`HTTP error! status: ${res.status}`);
			}
			return res.json();
		})
		.then(data => {
			console.log("받은 데이터:", data);
			
			const chatList = document.querySelector('.chat-list');
			const emptyState = document.getElementById('empty-state');
			const existingChatItem = chatList.querySelector('.chat-item');
			
			// 데이터가 있고 배열이 비어있지 않으면
			if (data && data.length > 0) {
				// 기존 하드코딩된 채팅 아이템 제거
				if (existingChatItem) {
					existingChatItem.remove();
				}
				
				// 빈 상태 숨기기
				emptyState.style.display = 'none';
				
				// 새로운 채팅 아이템들 생성
				data.forEach(chat => {
					const chatItem = document.createElement('div');
					chatItem.className = 'chat-item';
					
					// 시간 포맷팅 함수
					const formatTime = (timestamp) => {
						if (!timestamp) return '시간 없음';
						const date = new Date(timestamp);
						const hours = date.getHours();
						const minutes = date.getMinutes();
						const period = hours >= 12 ? '오후' : '오전';
						const displayHours = hours > 12 ? hours - 12 : (hours === 0 ? 12 : hours);
						return `${period} ${displayHours}:${minutes.toString().padStart(2, '0')}`;
					};
					
					chatItem.innerHTML = 
						'<div class="chat-item-header">' +
							'<span class="chat-user-name">' + (chat.opponent_nickname || '알 수 없음') + '</span>' +
							'<span class="chat-time">' + formatTime(chat.sent_at) + '</span>' +
						'</div>' +
						'<div class="chat-book-info">"' + (chat.tradebook_title || '책 제목 없음') + '" 교환</div>' +
						'<div class="chat-last-message">' + (chat.message_content || '메시지 없음') + '</div>';
					
					// 클릭 이벤트 추가
					chatItem.addEventListener('click', function() {
						document.querySelector('.chat-item.active')?.classList.remove('active');
						this.classList.add('active');
						
						// 먼저 현재 방을 지정해 전송 가드를 통과하도록 함
						currentRoomId = Number(chat.chatroom_num);
						// 웹소켓 연결 및 구독을 먼저 수행
						connectSocket();
						subscribeRoom(currentRoomId);
						// 채팅 헤더 업데이트
						updateChatHeader(chat);
						// 메시지 로드
						loadChatMessages(chat.chatroom_num);
					});
					
					chatList.appendChild(chatItem);
				});
			} else {
				// 데이터가 없거나 빈 배열이면
				// 기존 하드코딩된 채팅 아이템 제거
				if (existingChatItem) {
					existingChatItem.remove();
				}
				// 빈 상태 보여주기
				emptyState.style.display = 'block';
			}
		})
		.catch(err => {
			console.error("에러 발생:", err);
			// 에러 발생 시 빈 상태 표시
			const existingChatItem = document.querySelector('.chat-item');
			if (existingChatItem) {
				existingChatItem.remove();
			}
			document.getElementById('empty-state').style.display = 'block';
		});
		
		// 채팅 헤더 업데이트 함수
		function updateChatHeader(chat) {
			let chatHeader = document.getElementById('chat-header') || document.querySelector('.chat-header');
			// 선택 시 class -> id로 전환
			if (chatHeader && chatHeader.classList && chatHeader.classList.contains('chat-header')) {
				chatHeader.removeAttribute('class');
				chatHeader.setAttribute('id', 'chat-header');
			}
			
			// 헤더 내용을 동적으로 변경
			chatHeader.innerHTML = 
				'<div class="chat-header-info">' +
					'<div class="chat-avatar" style="position: relative;">' +
						(chat.opponent_nickname || '알 수 없음').charAt(0) +
						'<div class="online-status"></div>' +
					'</div>' +
					'<div class="chat-user-info">' +
						'<h3>' + (chat.opponent_nickname || '알 수 없음') + '</h3>' +
						'<div class="chat-book-title">"' + (chat.tradebook_title || '책 제목 없음') + '" 교환 문의</div>' +
					'</div>' +
					'<div class="chat-actions">' +
						'<button class="action-btn" title="통화">📞</button>' +
						'<button class="action-btn" title="더보기">⋯</button>' +
						'<button class="complete-trade-btn" data-chatroom="' + chat.chatroom_num + '" data-tradebook="' + chat.tradebook_num + '" onclick="completeTrade()">' +
							'✅ 거래완료' +
						'</button>' +
					'</div>' +
				'</div>';
		}
		
		// 메시지 로드 함수
		function loadChatMessages(chatroomNum) {
			let messagesContainer = document.getElementById('chat-messages') || document.querySelector('.chat-messages');
			// 선택 시 class -> id로 전환
			if (messagesContainer && messagesContainer.classList && messagesContainer.classList.contains('chat-messages')) {
				messagesContainer.removeAttribute('class');
				messagesContainer.setAttribute('id', 'chat-messages');
			}
			// 기존 내용 제거
			messagesContainer.innerHTML = '';
			
			fetch('chatcontent?chatroom_num=' + encodeURIComponent(chatroomNum))
				.then(res => {
					if (!res.ok) throw new Error('HTTP ' + res.status);
					return res.json();
				})
				.then(list => {
					if (!Array.isArray(list)) list = [];
					list.forEach(msg => {
						const isMine = (msg.sender_member_num === CURRENT_USER_NUM);
						const item = document.createElement('div');
						item.className = 'message' + (isMine ? ' own' : '');
						item.innerHTML =
							'<div class="message-avatar">' + (isMine ? '나' : '상대') + '</div>' +
							'<div class="message-content">' +
								'<div class="message-bubble">' +
									'<div class="message-text">' + (msg.message_content || '') + '</div>' +
									'<div class="message-time">' + formatKoreanTime(msg.sent_at) + '</div>' +
								'</div>' +
							'</div>';
						messagesContainer.appendChild(item);
					});
					messagesContainer.scrollTop = messagesContainer.scrollHeight;
				})
				.catch(err => {
					console.error('chatcontent error', err);
				});
		}
      </script>
</body>
   <script>
        // Auto-resize textarea
        const messageInput = document.querySelector('.message-input');
        // Remove any incidental whitespace on focus
        messageInput.addEventListener('focus', function() {
          if (this.value && this.value.trim() !== this.value) {
            this.value = this.value.trim();
          }
        });
        messageInput.addEventListener('input', function() {
          this.style.height = 'auto';
          this.style.height = Math.min(this.scrollHeight, 120) + 'px';
        });

        // Send message on Enter (but not Shift+Enter)
        messageInput.addEventListener('keydown', function(e) {
          if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            const text = (this.value || '').trim();
            if (!text) return;
            // 서버로 전송만 수행 (낙관적 UI 제거: 에코 수신으로 단일 말풍선 유지)
            if (!(stompClient && stompClient.connected && currentRoomId)) { console.warn('방 선택/연결 후 전송'); return; }
            sendMessageOverStomp(text);
            console.log('Sending message:', text);
            this.value = '';
            this.style.height = 'auto';
          }
        });

        // Send button click
        document.querySelector('.send-btn')?.addEventListener('click', function() {
          const ta = document.querySelector('.message-input');
          const text = (ta?.value || '').trim();
          if (!text) return;
          // 서버 전송만 수행 (낙관적 UI 제거)
          if (!(stompClient && stompClient.connected && currentRoomId)) { console.warn('방 선택/연결 후 전송'); return; }
          sendMessageOverStomp(text);
          ta.value = '';
          ta.style.height = 'auto';
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
            const messagesContainer = document.getElementById('chat-messages') || document.querySelector('.chat-messages');
            if (messagesContainer) {
              const systemMessage = document.createElement('div');
              systemMessage.innerHTML = '<div style="text-align: center; margin: 2rem 0; padding: 1rem; background: rgba(156, 175, 158, 0.1); border-radius: 12px; color: var(--color-text-secondary); font-style: italic;">🎉 거래가 성공적으로 완료되었습니다!</div>';
              messagesContainer.appendChild(systemMessage);
              messagesContainer.scrollTop = messagesContainer.scrollHeight;
            }

            // 교환 상태 업데이트 (tradebook_trade = 'n')
            const targetBtn = document.querySelector('.complete-trade-btn');
            const tradebook_num = targetBtn ? targetBtn.getAttribute('data-tradebook') : null;
            console.log(tradebook_num);
            if (tradebook_num) {
              fetch('${path}/chat/complete?tradebook_num=' + tradebook_num, {
                method: 'PUT'
              }).then(res => res.json)
              .then(data => {
           			console.log(data);  
              }).cath(err => {
            	  	console.log(err);
              });
         	}
          }
        }

        // Make function global
        window.completeTrade = completeTrade;
     </script>
</html>
 