<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="common/header.jsp"/>

        <section class="search-section">
          <div class="container">
            <div class="search-content">
              <h1 class="search-title">문학의 향기가 머무는 곳</h1>
              <p class="search-subtitle">소중한 이야기들이 새로운 주인을 기다리고 있습니다</p>
              <form class="search-form">
                <input 
                  type="text" 
                  class="search-input" 
                  placeholder="도서명, 저자명, 혹은 마음에 드는 구절을 입력해보세요..."
                />
                <button type="submit" class="search-btn">탐색하기</button>
              </form>
            </div>
          </div>
        </section>

        <section class="recommended-section">
          <div class="container">
            <h2 class="recommended-title">추천 도서</h2>
            <p class="recommended-subtitle">큐레이터가 엄선한 감각적이고 깊이 있는 작품들</p>
            <div class="recommended-grid">
              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=300&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">베스트셀러</div>
                  <h3 class="recommended-book-title">달러구트 꿈 백화점</h3>
                  <p class="recommended-book-author">이미예</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="recommended-book-price">13,320원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop"
                  alt="세이노의 가르침"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">신간</div>
                  <h3 class="recommended-book-title">세이노의 가르침</h3>
                  <p class="recommended-book-author">세이노</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="recommended-book-price">6,480원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=300&fit=crop"
                  alt="불편한 편의점"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">인기</div>
                  <h3 class="recommended-book-title">불편한 편의점</h3>
                  <p class="recommended-book-author">김호연</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="recommended-book-price">12,600원</div>
                </div>
              </div>

              <div class="recommended-card">
                <img 
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=300&fit=crop"
                  alt="클린 코드"
                  class="recommended-image"
                />
                <div class="recommended-info">
                  <div class="recommended-badge">IT 추천</div>
                  <h3 class="recommended-book-title">클린 코드</h3>
                  <p class="recommended-book-author">로버트 C. 마틴</p>
                  <div class="recommended-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.6/5)</span>
                  </div>
                  <div class="recommended-book-price">31,500원</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section class="categories-section">
          <div class="container">
            <h2 class="section-title">문학의 세계로</h2>
            <p class="section-subtitle">각 장르마다 독특한 매력과 깊이를 담고 있습니다</p>
            <div class="categories-grid">
              <div class="category-card">
                <div class="category-icon">📖</div>
                <div class="category-name">소설/에세이</div>
              </div>
              <div class="category-card">
                <div class="category-icon">💼</div>
                <div class="category-name">경영/경제</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🔬</div>
                <div class="category-name">과학/기술</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🎨</div>
                <div class="category-name">예술/디자인</div>
              </div>
              <div class="category-card">
                <div class="category-icon">👶</div>
                <div class="category-name">아동/청소년</div>
              </div>
              <div class="category-card">
                <div class="category-icon">🎯</div>
                <div class="category-name">자기계발</div>
              </div>
              <div class="category-card">
                <div class="category-icon">💻</div>
                <div class="category-name">IT/컴퓨터</div>
              </div>
            </div>
          </div>
        </section>

        <section class="featured-section">
          <div class="container">
            <h2 class="section-title">독자들의 사랑</h2>
            <p class="section-subtitle">시간이 흘러도 변하지 않는 가치를 인정받은 작품들</p>
            <div class="books-grid">
              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop&crop=face"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">달러구트 꿈 백화점</h3>
                  <p class="book-author">이미예</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">13,320원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=600&fit=crop"
                  alt="세이노의 가르침"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">세이노의 가르침</h3>
                  <p class="book-author">세이노</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="book-price">6,480원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop"
                  alt="불편한 편의점"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">불편한 편의점</h3>
                  <p class="book-author">김호연</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="book-price">12,600원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400&h=600&fit=crop"
                  alt="원피스 106권"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">원피스 106권</h3>
                  <p class="book-author">오다 에이치로</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.9/5)</span>
                  </div>
                  <div class="book-price">4,500원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=600&fit=crop"
                  alt="아버지의 해방일지"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">아버지의 해방일지</h3>
                  <p class="book-author">정지아</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.1/5)</span>
                  </div>
                  <div class="book-price">14,400원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop"
                  alt="트렌드 코리아 2024"
                  class="book-image"
                />
                <div class="book-info">
                  <h3 class="book-title">트렌드 코리아 2024</h3>
                  <p class="book-author">김난도</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">16,200원</div>
                </div>
              </div>
            </div>
          <div class="more-button-container">
            <a class="more-btn" href="${path}/board/list">
              더보기 📚
            </a>
          </div>
          </div>
        </section>

        <section class="exchange-promo-section">
          <div class="container">
            <div class="exchange-promo-content">
              <div class="exchange-promo-text">
                <span class="exchange-icon">🔄</span>
                <h2 class="exchange-promo-title">책의 순환</h2>
                <p class="exchange-promo-description">
                  이미 읽은 책에도 새로운 생명을 불어넣어 보세요.<br/>
                  당신의 책이 다른 이에게 새로운 감동이 될 수 있습니다.
                </p>
                <div class="exchange-stats">
                  <div class="exchange-stat">
                    <span class="stat-number">1,247</span>
                    <span class="stat-label">교환 가능한 책</span>
                  </div>
                  <div class="exchange-stat">
                    <span class="stat-number">892</span>
                    <span class="stat-label">성공한 교환</span>
                  </div>
                </div>
                <a href="${path}/tradebook/bookexchange" class="exchange-cta-btn">
                  순환의 여행 시작하기 →
                </a>
              </div>
              <div class="exchange-promo-visual">
                <div class="exchange-books">
                  <div class="exchange-book-card">
                    <img 
                      src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=200&h=260&fit=crop"
                      alt="교환 가능한 책"
                      class="exchange-book-img"
                    />
                  </div>
                  <div class="exchange-arrow">⇄</div>
                  <div class="exchange-book-card">
                    <img 
                      src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=200&h=260&fit=crop"
                      alt="교환 가능한 책"
                      class="exchange-book-img"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section class="newsletter-section">
          <div class="container">
            <div class="newsletter-content">
              <h2 class="newsletter-title">문학적 영감을 전해드립니다</h2>
              <p class="newsletter-text">신간 소식과 작가의 깊은 이야기, 독서 모임 소식을 정기적으로 받아보세요</p>
            <form class="newsletter-form">
              <input 
                type="email" 
                class="newsletter-input" 
                placeholder="이메일 주소를 남겨주세요"
              />
              <button type="submit" class="newsletter-btn">구독하기</button>
            </form>
            </div>
          </div>
        </section>

        <footer class="footer">
          <div class="container">
            <div class="footer-content">
              <div class="footer-section">
                <h3>고객센터</h3>
                <ul>
                  <li><a href="#">고객문의</a></li>
                  <li><a href="#">주문/배송 조회</a></li>
                  <li><a href="#">반품/교환</a></li>
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
                  <li><a href="admin/write">관리자페이지</a>
                </ul>
              </div>
              <div class="footer-section">
                <h3>회사소개</h3>
                <ul>
                  <li><a href="#">회사정보</a></li>
                  <li><a href="#">인재채용</a></li>
                  <li><a href="#">제휴문의</a></li>
                  <li><a href="#">광고문의</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>SNS</h3>
                <ul>
                  <li><a href="#">인스타그램</a></li>
                  <li><a href="#">페이스북</a></li>
                  <li><a href="#">유튜브</a></li>
                  <li><a href="#">네이버 블로그</a></li>
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