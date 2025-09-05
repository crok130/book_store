<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
        }

        .container {
          max-width: 1280px;
          margin: 0 auto;
          padding: 0 2rem;
        }

        /* Header */
        .header {
          background: rgba(254, 253, 251, 0.95);
          backdrop-filter: blur(20px);
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
          position: sticky;
          top: 0;
          z-index: 1000;
          transition: all 0.3s ease;
        }

        .header-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1.5rem 0;
        }

        .logo {
          font-family: var(--font-serif);
          font-size: 2rem;
          font-weight: 600;
          color: var(--color-charcoal);
          text-decoration: none;
          letter-spacing: -0.02em;
          display: flex;
          align-items: center;
          gap: 0.75rem;
        }

        .logo::before {
          content: '📖';
          font-size: 1.5rem;
        }

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 2rem;
        }

        .nav-menu a {
          text-decoration: none;
          color: #666;
          font-weight: 500;
          transition: color 0.3s ease;
        }

        .nav-menu a:hover {
          color: #2c3e50;
        }

        .user-actions {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .btn {
          padding: 0.6rem 1.2rem;
          border: none;
          border-radius: 6px;
          cursor: pointer;
          font-weight: 500;
          transition: all 0.3s ease;
          text-decoration: none;
          display: inline-block;
        }

        .btn-primary {
          background: #2c3e50;
          color: white;
        }

        .btn-primary:hover {
          background: #34495e;
        }

        .btn-outline {
          background: transparent;
          color: #2c3e50;
          border: 2px solid #2c3e50;
        }

        .btn-outline:hover {
          background: #2c3e50;
          color: white;
        }

        /* Breadcrumb */
        .breadcrumb {
          background: #fff;
          padding: 1rem 0;
          border-bottom: 1px solid #e9ecef;
        }

        .breadcrumb-nav {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
          color: #666;
        }

        .breadcrumb-nav a {
          color: #667eea;
          text-decoration: none;
          transition: color 0.3s ease;
        }

        .breadcrumb-nav a:hover {
          color: #5a6fd8;
        }

        .breadcrumb-separator {
          color: #999;
        }

        /* Product Detail */
        .product-detail {
          background: white;
          padding: 3rem 0;
        }

        .product-content {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 3rem;
          margin-bottom: 3rem;
        }

        .product-image-section {
          display: flex;
          justify-content: center;
          align-items: flex-start;
        }

        .product-image {
          max-width: 400px;
          width: 100%;
          height: auto;
          border-radius: 12px;
          box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .product-info {
          padding: 2rem 0;
        }

        .product-badge {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          padding: 0.4rem 1rem;
          border-radius: 20px;
          font-size: 0.8rem;
          font-weight: 600;
          display: inline-block;
          margin-bottom: 1rem;
        }

        .product-title {
          font-size: 2.2rem;
          font-weight: 700;
          color: #2c3e50;
          margin-bottom: 0.5rem;
          line-height: 1.3;
        }

        .product-author {
          font-size: 1.1rem;
          color: #666;
          margin-bottom: 1rem;
        }

        .product-rating {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 1.5rem;
        }

        .stars {
          color: #f39c12;
          font-size: 1.2rem;
        }

        .rating-info {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
          color: #666;
        }

        .product-price {
          margin-bottom: 2rem;
        }

        .price-current {
          font-size: 2rem;
          font-weight: 700;
          color: #e74c3c;
          margin-right: 1rem;
        }

        .price-original {
          font-size: 1.2rem;
          color: #999;
          text-decoration: line-through;
          margin-right: 0.5rem;
        }

        .price-discount {
          background: #e74c3c;
          color: white;
          padding: 0.2rem 0.5rem;
          border-radius: 4px;
          font-size: 0.8rem;
          font-weight: 600;
        }

        .product-options {
          margin-bottom: 2rem;
        }

        .option-group {
          margin-bottom: 1.5rem;
        }

        .option-label {
          display: block;
          margin-bottom: 0.5rem;
          font-weight: 600;
          color: #2c3e50;
        }

        .quantity-selector {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          margin-bottom: 1.5rem;
        }

        .quantity-btn {
          width: 40px;
          height: 40px;
          border: 2px solid #e9ecef;
          background: white;
          border-radius: 6px;
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: center;
          font-weight: 600;
          transition: all 0.3s ease;
        }

        .quantity-btn:hover {
          border-color: #667eea;
          background: #f8f9fa;
        }

        .quantity-input {
          width: 60px;
          height: 40px;
          text-align: center;
          border: 2px solid #e9ecef;
          border-radius: 6px;
          font-weight: 600;
          outline: none;
        }

        .quantity-input:focus {
          border-color: #667eea;
        }

        .action-buttons {
          display: flex;
          gap: 1rem;
          margin-bottom: 2rem;
        }

        .btn-large {
          flex: 1;
          padding: 1rem 2rem;
          font-size: 1.1rem;
          font-weight: 600;
          border-radius: 8px;
          cursor: pointer;
          transition: all 0.3s ease;
          border: none;
        }

        .btn-buy {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
        }

        .btn-buy:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-cart {
          background: white;
          color: #667eea;
          border: 2px solid #667eea;
        }

        .btn-cart:hover {
          background: #667eea;
          color: white;
          transform: translateY(-2px);
        }

        .product-features {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 10px;
          margin-bottom: 2rem;
        }

        .features-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          gap: 1rem;
        }

        .feature-item {
          text-align: center;
          padding: 0.5rem;
        }

        .feature-icon {
          font-size: 1.5rem;
          margin-bottom: 0.5rem;
          display: block;
        }

        .feature-text {
          font-size: 0.8rem;
          color: #666;
          font-weight: 500;
        }

        /* Product Description */
        .product-description {
          background: white;
          padding: 3rem 0;
          border-top: 1px solid #e9ecef;
        }

        .description-title {
          font-size: 1.8rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 2rem;
        }

        .description-content {
          line-height: 1.8;
          color: #555;
          margin-bottom: 2rem;
        }

        .product-specs {
          background: #f8f9fa;
          padding: 2rem;
          border-radius: 10px;
        }

        .specs-title {
          font-size: 1.3rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1.5rem;
        }

        .specs-table {
          width: 100%;
        }

        .specs-table tr {
          border-bottom: 1px solid #e9ecef;
        }

        .specs-table td {
          padding: 0.8rem 0;
          vertical-align: top;
        }

        .specs-table td:first-child {
          font-weight: 600;
          color: #2c3e50;
          width: 120px;
        }

        .specs-table td:last-child {
          color: #666;
        }

        /* Reviews Section */
        .reviews-section {
          background: white;
          padding: 3rem 0;
          border-top: 1px solid #e9ecef;
        }

        .reviews-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 2rem;
        }

        .reviews-title {
          font-size: 1.8rem;
          font-weight: 600;
          color: #2c3e50;
        }

        .review-summary {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 2rem;
          padding: 1.5rem;
          background: #f8f9fa;
          border-radius: 10px;
        }

        .summary-rating {
          text-align: center;
        }

        .summary-score {
          font-size: 2.5rem;
          font-weight: 700;
          color: #2c3e50;
          display: block;
        }

        .summary-stars {
          color: #f39c12;
          font-size: 1.2rem;
          margin: 0.5rem 0;
        }

        .summary-count {
          font-size: 0.9rem;
          color: #666;
        }

        .rating-bars {
          flex: 1;
          margin-left: 2rem;
        }

        .rating-bar {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 0.5rem;
        }

        .bar-label {
          font-size: 0.9rem;
          color: #666;
          width: 20px;
        }

        .bar-progress {
          flex: 1;
          height: 6px;
          background: #e9ecef;
          border-radius: 3px;
          overflow: hidden;
        }

        .bar-fill {
          height: 100%;
          background: #f39c12;
          border-radius: 3px;
        }

        .bar-fill-60 {
          width: 60%;
        }

        .bar-fill-25 {
          width: 25%;
        }

        .bar-fill-10 {
          width: 10%;
        }

        .bar-fill-3 {
          width: 3%;
        }

        .bar-fill-2 {
          width: 2%;
        }

        .bar-count {
          font-size: 0.8rem;
          color: #666;
          width: 30px;
        }

        /* Footer */
        .footer {
          background: #1a252f;
          color: white;
          padding: 3rem 0 2rem;
        }

        .footer-content {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
          margin-bottom: 2rem;
        }

        .footer-section h3 {
          margin-bottom: 1rem;
          color: white;
          font-weight: 600;
        }

        .footer-section ul {
          list-style: none;
        }

        .footer-section ul li {
          margin-bottom: 0.5rem;
        }

        .footer-section ul li a {
          color: #bbb;
          text-decoration: none;
          transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
          color: white;
        }

        .footer-bottom {
          border-top: 1px solid #333;
          padding-top: 2rem;
          text-align: center;
          color: #bbb;
        }

        /* Responsive */
        @media (max-width: 768px) {
          .header-content {
            flex-direction: column;
            gap: 1rem;
          }

          .nav-menu {
            gap: 1rem;
          }

          .product-content {
            grid-template-columns: 1fr;
            gap: 2rem;
          }

          .product-title {
            font-size: 1.8rem;
          }

          .action-buttons {
            flex-direction: column;
          }

          .features-grid {
            grid-template-columns: repeat(2, 1fr);
          }

          .review-summary {
            flex-direction: column;
            text-align: center;
          }

          .rating-bars {
            margin-left: 0;
            margin-top: 1rem;
          }
        }
    </style>
<body>
       <div>
        {/* Header */}
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/App.tsx" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/App.tsx">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/LoginPage.tsx" class="btn btn-outline">로그인</a>
                <a href="/components/RegisterPage.tsx" class="btn btn-primary">회원가입</a>
              </div>
            </div>
          </div>
        </header>

        {/* Breadcrumb */}
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

        {/* Product Detail */}
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

        {/* Product Description */}
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

        {/* Reviews Section */}
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

        {/* Footer */}
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