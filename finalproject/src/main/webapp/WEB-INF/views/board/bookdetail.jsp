<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
    <jsp:include page="../common/header.jsp"/>


        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="/App.tsx">홈</a>
              <span class="breadcrumb-separator">></span>
              <a href="#">소설/에세이</a>
              <span class="breadcrumb-separator">></span>
              <span>달러구트 꿈 백화점</span>
            </nav>
          </div>
        </section>

  
        <section class="product-detail">
          <div class="container">
            <div class="product-content">
              <div class="product-image-section">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="product-image"
                />
              </div>

              <div class="product-info">
                <div class="product-badge">베스트셀러</div>
                <h1 class="product-title">달러구트 꿈 백화점</h1>
                <p class="product-author">이미예 지음 | 팩토리나인 | 2020년 07월</p>

                <div class="product-rating">
                  <div class="stars">★★★★☆</div>
                  <div class="rating-info">
                    <span>4.2점</span>
                    <span>•</span>
                    <span>리뷰 1,248개</span>
                  </div>
                </div>

                <div class="product-price">
                  <span class="price-current">13,320원</span>
                  <span class="price-original">14,800원</span>
                  <span class="price-discount">10%</span>
                </div>

                <div class="product-options">
                  <div class="option-group">
                    <label class="option-label">수량</label>
                    <div class="quantity-selector">
                      <button class="quantity-btn">-</button>
                      <input type="number" class="quantity-input" value="1" min="1" />
                      <button class="quantity-btn">+</button>
                    </div>
                  </div>
                </div>

                <div class="action-buttons">
                  <button class="btn-large btn-buy">구매하기</button>
                  <button class="btn-large btn-cart">장바구니 담기</button>
                </div>

                <div class="product-features">
                  <div class="features-grid">
                    <div class="feature-item">
                      <span class="feature-icon">🚚</span>
                      <span class="feature-text">무료배송</span>
                    </div>
                    <div class="feature-item">
                      <span class="feature-icon">📦</span>
                      <span class="feature-text">당일발송</span>
                    </div>
                    <div class="feature-item">
                      <span class="feature-icon">🔄</span>
                      <span class="feature-text">교환/반품</span>
                    </div>
                    <div class="feature-item">
                      <span class="feature-icon">💳</span>
                      <span class="feature-text">카드할인</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>


        <section class="product-description">
          <div class="container">
            <h2 class="description-title">책 소개</h2>
            <div class="description-content">
              <p>
                '달러구트 꿈 백화점'은 잠들어야만 입장할 수 있는 신비한 백화점에서 벌어지는 이야기를 담은 판타지 소설입니다. 
                열일곱 살 소녀 페니가 우연히 발견한 이 곳에서 꿈을 사고파는 신비로운 경험을 하게 됩니다.
              </p>
              <br />
              <p>
                잠들어야만 갈 수 있는 신비한 곳, 달러구트 꿈 백화점! 그곳에서는 온갖 꿈들이 기다리고 있습니다. 
                날아다니는 꿈, 맛있는 음식이 나오는 꿈, 좋아하는 사람과 함께하는 꿈 등 원하는 꿈은 뭐든 살 수 있어요.
              </p>
              <br />
              <p>
                하지만 모든 꿈에는 그에 맞는 가격이 있고, 때로는 예상치 못한 부작용도 따라옵니다. 
                페니는 이 백화점에서 아르바이트를 하며 다양한 고객들과 만나고, 꿈의 진정한 의미를 깨달아 갑니다.
              </p>
            </div>

            <div class="product-specs">
              <h3 class="specs-title">상품 정보</h3>
              <table class="specs-table">
                <tbody>
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
                    <td>2020년 07월 01일</td>
                  </tr>
                  <tr>
                    <td>페이지</td>
                    <td>304쪽</td>
                  </tr>
                  <tr>
                    <td>크기</td>
                    <td>128 × 188 × 20mm</td>
                  </tr>
                  <tr>
                    <td>무게</td>
                    <td>310g</td>
                  </tr>
                  <tr>
                    <td>ISBN</td>
                    <td>9791189909284</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </section>


        <section class="reviews-section">
          <div class="container">
            <div class="reviews-header">
              <h2 class="reviews-title">고객 리뷰</h2>
            </div>

            <div class="review-summary">
              <div class="summary-rating">
                <span class="summary-score">4.2</span>
                <div class="summary-stars">★★★★☆</div>
                <div class="summary-count">1,248개 리뷰</div>
              </div>

              <div class="rating-bars">
                <div class="rating-bar">
                  <span class="bar-label">5★</span>
                  <div class="bar-progress">
                    <div class="bar-fill bar-fill-60"></div>
                  </div>
                  <span class="bar-count">749</span>
                </div>
                <div class="rating-bar">
                  <span class="bar-label">4★</span>
                  <div class="bar-progress">
                    <div class="bar-fill bar-fill-25"></div>
                  </div>
                  <span class="bar-count">312</span>
                </div>
                <div class="rating-bar">
                  <span class="bar-label">3★</span>
                  <div class="bar-progress">
                    <div class="bar-fill bar-fill-10"></div>
                  </div>
                  <span class="bar-count">125</span>
                </div>
                <div class="rating-bar">
                  <span class="bar-label">2★</span>
                  <div class="bar-progress">
                    <div class="bar-fill bar-fill-3"></div>
                  </div>
                  <span class="bar-count">37</span>
                </div>
                <div class="rating-bar">
                  <span class="bar-label">1★</span>
                  <div class="bar-progress">
                    <div class="bar-fill bar-fill-2"></div>
                  </div>
                  <span class="bar-count">25</span>
                </div>
              </div>
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
              <p>&copy; 2024 BookStore. All rights reserved. | 사업자등록번호: 123-45-67890</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>