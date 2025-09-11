<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../common/header.jsp"/>

       
        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="${path}">홈</a>
              <span class="breadcrumb-separator">›</span>
              <a href="${path}/tradebook/bookexchange">책 교환</a>
              <span class="breadcrumb-separator">›</span>
              <span>달러구트 꿈 백화점</span>
            </nav>
          </div>
        </section>

       
        <section class="detail-container">
          <div class="container">
            <div class="detail-content">
              <div class="book-image-section">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
              </div>

              <div class="book-info-section">
                <div class="exchange-status">교환 가능</div>
                
                <h1 class="book-title">달러구트 꿈 백화점</h1>
                <p class="book-author">이미예 지음 | 팩토리나인 | 2020년 07월</p>

                <div class="book-condition">
                  <div class="condition-badge">상태 좋음</div>
                  <span class="condition-text">거의 새 책 수준, 밑줄이나 필기 없음</span>
                </div>

                <div class="book-description">
                  <h3 class="description-title">📖 교환자 한마디</h3>
                  <p class="description-text">
                    정말 재미있게 읽었던 책입니다! 상상력이 풍부하고 따뜻한 이야기라 
                    많은 분들이 읽어보셨으면 좋겠어요. 책 상태도 매우 깨끗하니 안심하고 교환하세요. 
                    이 책을 통해 꿈의 의미와 소중함에 대해 다시 생각해볼 수 있었습니다.
                  </p>
                </div>

                <div class="owner-section">
                  <h3 class="owner-title">👤 교환 제안자</h3>
                  <div class="owner-info">
                    <div class="owner-avatar">김</div>
                    <div class="owner-details">
                      <div class="owner-name">김독서님</div>
                      <div class="owner-location">📍 서울 강남구</div>
                      <div class="owner-rating">
                        <span class="stars">★★★★★</span>
                        <span>4.8점 (15회 교환)</span>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="action-buttons">
                  <button class="btn-large btn-exchange">
                    🔄 교환 신청하기
                  </button>
                  <a href="/components/ChatPage.tsx" class="btn-large btn-chat">
                    💬 채팅하기
                  </a>
                </div>
              </div>
            </div>

            <div class="exchange-conditions">
              <h3 class="conditions-title">📋 교환 조건</h3>
              
              <div class="condition-item">
                <div class="condition-icon">📚</div>
                <div class="condition-content">
                  <div class="condition-label">희망 교환 도서</div>
                  <div class="condition-value">소설, 에세이, 자기계발서 등 장르 무관하지만 가급적 깨끗한 상태의 책을 원합니다. 특히 판타지나 SF 소설을 선호합니다.</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">📍</div>
                <div class="condition-content">
                  <div class="condition-label">교환 방식</div>
                  <div class="condition-value">직거래 (강남구 일대 카페에서 만남) 또는 택배거래 가능합니다. 직거래 시 교통비는 각자 부담입니다.</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">⏰</div>
                <div class="condition-content">
                  <div class="condition-label">교환 가능 시간</div>
                  <div class="condition-value">평일 저녁 7시 이후, 주말 오후 2시~8시 사이 협의 가능합니다. 급하지 않으니 서로 편한 시간에 만나요.</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">💝</div>
                <div class="condition-content">
                  <div class="condition-label">추가 사항</div>
                  <div class="condition-value">책갈피와 독서 노트 함께 드려요! 이 책에 대한 제 감상과 인상 깊었던 구절들을 정리해두었습니다.</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        
        <section class="book-details-section">
          <div class="container">
            <h2 class="details-title">상세 정보</h2>
            <div class="details-grid">
              <div class="detail-card">
                <h3 class="detail-card-title">📋 도서 정보</h3>
                <table class="specs-table">
                  <tbody>
                    <tr>
                      <td>제목</td>
                      <td>달러구트 꿈 백화점</td>
                    </tr>
                    <tr>
                      <td>저자</td>
                      <td>이미예</td>
                    </tr>
                    <tr>
                      <td>출판사</td>
                      <td>팩토리나인</td>
                    </tr>
                    <tr>
                      <td>출간일</td>
                      <td>2020년 07월</td>
                    </tr>
                    <tr>
                      <td>페이지</td>
                      <td>304쪽</td>
                    </tr>
                    <tr>
                      <td>ISBN</td>
                      <td>9791189909284</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="detail-card">
                <h3 class="detail-card-title">🔄 교환 히스토리</h3>
                <ul class="exchange-history">
                  <li class="history-item">
                    <div class="history-icon">📝</div>
                    <div class="history-content">
                      <div class="history-text">교환 글이 등록되었습니다</div>
                      <div class="history-date">2024년 1월 15일</div>
                    </div>
                  </li>
                  <li class="history-item">
                    <div class="history-icon">👁️</div>
                    <div class="history-content">
                      <div class="history-text">47명이 관심을 표시했습니다</div>
                      <div class="history-date">지속적으로</div>
                    </div>
                  </li>
                  <li class="history-item">
                    <div class="history-icon">💬</div>
                    <div class="history-content">
                      <div class="history-text">3건의 채팅 문의가 있었습니다</div>
                      <div class="history-date">최근 1주일</div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </section>

    
        <footer class="footer">
          <div class="container">
            <div class="footer-content">
              <div class="footer-section">
                <h3>교환 안내</h3>
                <ul>
                  <li><a href="#">교환 방법</a></li>
                  <li><a href="#">안전 거래</a></li>
                  <li><a href="#">분쟁 해결</a></li>
                  <li><a href="#">FAQ</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">청소년보호정책</a></li>
                  <li><a href="#">회원혜택</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>고객센터</h3>
                <ul>
                  <li><a href="#">고객문의</a></li>
                  <li><a href="#">교환 문의</a></li>
                  <li><a href="#">신고하기</a></li>
                  <li><a href="#">사용자 가이드</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>커뮤니티</h3>
                <ul>
                  <li><a href="#">독서 모임</a></li>
                  <li><a href="#">북클럽</a></li>
                  <li><a href="#">리뷰 나누기</a></li>
                  <li><a href="#">추천 도서</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 북스토어. 모든 문학적 여정을 함께합니다. | 사업자등록번호: 123-45-67890</p>
            </div>
          </div>
        </footer>
      </div>

      <script>

        function toggleDropdown() {
          const dropdown = document.querySelector('.user-dropdown');
          dropdown.classList.toggle('show');
        }

        // 외부 클릭시 드롭다운 닫기
        document.addEventListener('click', function(event) {
          const userMenu = document.querySelector('.user-menu');
          const dropdown = document.querySelector('.user-dropdown');
          
          if (!userMenu.contains(event.target)) {
            dropdown.classList.remove('show');
          }
        });

      </script>
</body>
</html>