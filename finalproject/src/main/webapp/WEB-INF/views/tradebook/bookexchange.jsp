<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <jsp:include page="../common/header.jsp"/>

        {/* Hero Section */}
        <section class="hero-section">
          <div class="container">
            <div class="hero-content">
              <span class="exchange-icon">🔄</span>
              <h1 class="hero-title">책의 순환</h1>
              <p class="hero-subtitle">
                이미 읽은 책에도 새로운 생명을 불어넣어 보세요.<br/>
                당신의 책이 다른 이에게 새로운 감동이 될 수 있습니다.
              </p>
            </div>
          </div>
        </section>

        {/* Stats Section */}
        <section class="stats-section">
          <div class="container">
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-number">1,247</div>
                <div class="stat-label">교환 가능한 책</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">892</div>
                <div class="stat-label">성공한 교환</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">523</div>
                <div class="stat-label">활성 사용자</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">4.8</div>
                <div class="stat-label">평균 만족도</div>
              </div>
            </div>
          </div>
        </section>

        {/* Filter Section */}
        <section class="filter-section">
          <div class="container">
            <div class="filter-content">
              <div class="search-filter">
                <input 
                  type="text" 
                  class="search-input" 
                  placeholder="책 제목이나 저자명으로 검색하세요..."
                />
              </div>
              <div class="filter-group">
                <span class="filter-label">지역:</span>
                <select class="filter-select">
                  <option>전체 지역</option>
                  <option>서울</option>
                  <option>부산</option>
                  <option>대구</option>
                  <option>인천</option>
                  <option>광주</option>
                  <option>대전</option>
                  <option>울산</option>
                </select>
              </div>
              <div class="filter-group">
                <span class="filter-label">상태:</span>
                <select class="filter-select">
                  <option>전체 상태</option>
                  <option>최상</option>
                  <option>양호</option>
                  <option>보통</option>
                </select>
              </div>
              <div class="filter-group">
                <span class="filter-label">정렬:</span>
                <select class="filter-select">
                  <option>최신순</option>
                  <option>인기순</option>
                  <option>거리순</option>
                </select>
              </div>
            </div>
          </div>
        </section>

        {/* Category Section */}
        <section class="category-section">
          <div class="container">
            <div class="category-filters">
              <a href="#" class="category-pill active">전체</a>
              <a href="#" class="category-pill">소설/에세이</a>
              <a href="#" class="category-pill">경영/경제</a>
              <a href="#" class="category-pill">과학/기술</a>
              <a href="#" class="category-pill">예술/디자인</a>
              <a href="#" class="category-pill">자기계발</a>
              <a href="#" class="category-pill">IT/컴퓨터</a>
              <a href="#" class="category-pill">아동/청소년</a>
            </div>
          </div>
        </section>

        {/* Books Section */}
        <section class="books-section">
          <div class="container">
            <h2 class="section-title">교환 대기 중인 책들</h2>
            <p class="section-subtitle">독자들이 사랑으로 키운 책들이 새로운 주인을 기다리고 있습니다</p>
            
            <div class="books-grid">
              <a href="/components/BookExchangeDetailPage.tsx" class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=300&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">달러구트 꿈 백화점</h3>
                  <p class="book-author">이미예</p>
                  <span class="book-condition">최상</span>
                  <div class="owner-info">
                    <div class="owner-avatar">김</div>
                    <div class="owner-details">
                      <div class="owner-name">김독서</div>
                      <div class="owner-location">서울 강남구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"반지의 제왕 시리즈나 판타지 소설"</div>
                  </div>
                </div>
              </a>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop"
                  alt="세이노의 가르침"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">세이노의 가르침</h3>
                  <p class="book-author">세이노</p>
                  <span class="book-condition fair">양호</span>
                  <div class="owner-info">
                    <div class="owner-avatar">조</div>
                    <div class="owner-details">
                      <div class="owner-name">조성장</div>
                      <div class="owner-location">경기 수원시</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"부의 추월차선이나 투자 관련 도서"</div>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=300&fit=crop"
                  alt="불편한 편의점"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">불편한 편의점</h3>
                  <p class="book-author">김호연</p>
                  <span class="book-condition">최상</span>
                  <div class="owner-info">
                    <div class="owner-avatar">한</div>
                    <div class="owner-details">
                      <div class="owner-name">한이야기</div>
                      <div class="owner-location">충남 천안시</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"따뜻한 감동을 주는 한국 소설"</div>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1549964336-ce406285ffc4?w=400&h=300&fit=crop"
                  alt="사피엔스"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">사피엔스</h3>
                  <p class="book-author">유발 하라리</p>
                  <span class="book-condition">최상</span>
                  <div class="owner-info">
                    <div class="owner-avatar">박</div>
                    <div class="owner-details">
                      <div class="owner-name">박역사</div>
                      <div class="owner-location">대구 중구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"호모 데우스나 21 레슨스"</div>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=300&fit=crop"
                  alt="클린 코드"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">클린 코드</h3>
                  <p class="book-author">로버트 C. 마틴</p>
                  <span class="book-condition">양호</span>
                  <div class="owner-info">
                    <div class="owner-avatar">강</div>
                    <div class="owner-details">
                      <div class="owner-name">강개발</div>
                      <div class="owner-location">대전 유성구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"리팩토링이나 디자인 패턴 관련 서적"</div>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1599185186578-0ba91c2a15c0?w=400&h=300&fit=crop"
                  alt="1984"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">1984</h3>
                  <p class="book-author">조지 오웰</p>
                  <span class="book-condition fair">양호</span>
                  <div class="owner-info">
                    <div class="owner-avatar">정</div>
                    <div class="owner-details">
                      <div class="owner-name">정문학</div>
                      <div class="owner-location">인천 남동구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"동물농장이나 올더스 헉슬리의 멋진 신세계"</div>
                  </div>
                </div>
              </div>
            </div>
              <div class="more-button-container">
                <button class="more-btn">
                  더보기 📚
                </button>
            </div>
          </div>
        </section>

        {/* Footer */}
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