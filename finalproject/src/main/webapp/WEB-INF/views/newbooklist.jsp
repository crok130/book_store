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
          gap: 3rem;
          align-items: center;
        }

        .nav-menu a {
          text-decoration: none;
          color: var(--color-text-secondary);
          font-weight: 400;
          font-size: 0.95rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          position: relative;
          padding: 0.5rem 0;
        }

        .nav-menu a::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 0;
          width: 0;
          height: 2px;
          background: var(--color-sage);
          transition: width 0.3s ease;
        }

        .nav-menu a:hover {
          color: var(--color-charcoal);
        }

        .nav-menu a:hover::after {
          width: 100%;
        }

        .user-actions {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .btn {
          padding: 0.75rem 1.5rem;
          border: 2px solid transparent;
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          text-decoration: none;
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }

        .btn-primary {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .btn-primary:hover {
          background: var(--color-deep-blue);
          transform: translateY(-1px);
          box-shadow: var(--shadow-medium);
        }

        .btn-outline {
          background: transparent;
          color: var(--color-charcoal);
          border-color: rgba(45, 52, 54, 0.2);
        }

        .btn-outline:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          border-color: var(--color-charcoal);
          transform: translateY(-1px);
        }

        /* Hero Section */
        .hero-section {
          background: linear-gradient(135deg, var(--color-deep-blue) 0%, var(--color-charcoal) 100%);
          color: var(--color-warm-white);
          padding: 4rem 0;
          text-align: center;
          position: relative;
          overflow: hidden;
        }

        .hero-section::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.4;
        }

        .hero-content {
          position: relative;
          z-index: 2;
        }

        .hero-title {
          font-family: var(--font-serif);
          font-size: 3rem;
          margin-bottom: 1rem;
          font-weight: 600;
          letter-spacing: -0.02em;
          line-height: 1.2;
        }

        .hero-subtitle {
          font-size: 1.2rem;
          margin-bottom: 2rem;
          opacity: 0.85;
          font-weight: 300;
          max-width: 600px;
          margin-left: auto;
          margin-right: auto;
          line-height: 1.6;
        }

        /* Filters */
        .filters-section {
          background: var(--color-warm-white);
          padding: 2rem 0;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .filters-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-wrap: wrap;
          gap: 1.5rem;
        }

        .search-filter {
          flex: 1;
          max-width: 400px;
        }

        .search-input {
          width: 100%;
          padding: 0.8rem 1rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-sm);
          font-size: 1rem;
          outline: none;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
          color: var(--color-text-primary);
          font-family: var(--font-sans);
        }

        .search-input::placeholder {
          color: var(--color-text-secondary);
          font-style: italic;
        }

        .search-input:focus {
          border-color: var(--color-sage);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
        }

        .filter-group {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .filter-label {
          font-weight: 600;
          color: var(--color-charcoal);
          font-size: 0.95rem;
        }

        .filter-select {
          padding: 0.6rem 0.8rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-sm);
          background: var(--color-warm-white);
          color: var(--color-text-primary);
          font-size: 0.9rem;
          outline: none;
          transition: all 0.3s ease;
          cursor: pointer;
          font-family: var(--font-sans);
        }

        .filter-select:focus {
          border-color: var(--color-sage);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
        }

        /* Books Section */
        .books-section {
          padding: 4rem 0;
          background: var(--color-warm-white);
        }

        .section-title {
          font-family: var(--font-serif);
          font-size: 2.5rem;
          margin-bottom: 3rem;
          color: var(--color-charcoal);
          font-weight: 600;
          letter-spacing: -0.02em;
        }

        .books-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
          gap: 2.5rem;
        }

        .book-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          overflow: hidden;
          box-shadow: var(--shadow-soft);
          transition: all 0.4s ease;
          cursor: pointer;
          border: 1px solid rgba(156, 175, 158, 0.1);
          position: relative;
        }

        .book-card::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: linear-gradient(135deg, rgba(156, 175, 158, 0.05), rgba(212, 165, 116, 0.05));
          opacity: 0;
          transition: opacity 0.3s ease;
          z-index: 1;
        }

        .book-card:hover::before {
          opacity: 1;
        }

        .book-card:hover {
          transform: translateY(-8px) scale(1.02);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .book-image {
          width: 100%;
          height: 280px;
          object-fit: cover;
          transition: transform 0.4s ease;
          position: relative;
          z-index: 2;
        }

        .book-card:hover .book-image {
          transform: scale(1.05);
        }

        .book-info {
          padding: 1.5rem;
          position: relative;
          z-index: 2;
        }

        .book-badge {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          padding: 0.3rem 0.8rem;
          border-radius: 15px;
          font-size: 0.7rem;
          font-weight: 600;
          display: inline-block;
          margin-bottom: 0.8rem;
          letter-spacing: 0.5px;
          text-transform: uppercase;
        }

        .book-title {
          font-family: var(--font-serif);
          font-size: 1.2rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: var(--color-charcoal);
          line-height: 1.4;
          letter-spacing: -0.01em;
        }

        .book-author {
          color: var(--color-text-secondary);
          margin-bottom: 1rem;
          font-size: 0.9rem;
          font-weight: 400;
        }

        .book-price {
          font-size: 1.3rem;
          font-weight: 700;
          color: var(--color-terracotta);
          margin-bottom: 1rem;
          letter-spacing: -0.01em;
        }

        .book-rating {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.85rem;
        }

        .stars {
          color: var(--color-accent-gold);
          font-size: 0.9rem;
        }

        .rating-text {
          color: var(--color-text-secondary);
          font-weight: 500;
        }

        /* Pagination */
        .pagination-section {
          padding: 3rem 0;
          text-align: center;
          background: var(--color-warm-white);
        }

        .pagination {
          display: flex;
          justify-content: center;
          align-items: center;
          gap: 0.5rem;
        }

        .page-btn {
          padding: 0.8rem 1.2rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          background: var(--color-warm-white);
          color: var(--color-charcoal);
          text-decoration: none;
          border-radius: var(--border-radius-sm);
          transition: all 0.3s ease;
          font-weight: 500;
        }

        .page-btn:hover,
        .page-btn.active {
          background: var(--color-sage);
          color: var(--color-warm-white);
          border-color: var(--color-sage);
        }

        .page-btn.disabled {
          opacity: 0.5;
          cursor: not-allowed;
        }

        .page-btn.disabled:hover {
          background: var(--color-warm-white);
          color: var(--color-charcoal);
          border-color: rgba(156, 175, 158, 0.2);
        }

        /* Footer */
        .footer {
          background: linear-gradient(135deg, #1A1F2E 0%, var(--color-charcoal) 100%);
          color: var(--color-warm-white);
          padding: 4rem 0 2rem;
        }

        .footer-content {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
          gap: 3rem;
          margin-bottom: 3rem;
        }

        .footer-section h3 {
          margin-bottom: 1.5rem;
          color: var(--color-warm-white);
          font-family: var(--font-serif);
          font-weight: 600;
          font-size: 1.2rem;
          letter-spacing: -0.01em;
        }

        .footer-section ul {
          list-style: none;
        }

        .footer-section ul li {
          margin-bottom: 0.75rem;
        }

        .footer-section ul li a {
          color: rgba(254, 253, 251, 0.7);
          text-decoration: none;
          transition: all 0.3s ease;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .footer-section ul li a:hover {
          color: var(--color-warm-white);
          transform: translateX(5px);
        }

        .footer-bottom {
          border-top: 1px solid rgba(254, 253, 251, 0.1);
          padding-top: 2rem;
          text-align: center;
          color: rgba(254, 253, 251, 0.6);
          font-size: 0.9rem;
        }

        /* User Menu Dropdown */
        .user-menu {
          position: relative;
        }

        .user-greeting {
          background: transparent;
          color: var(--color-charcoal);
          padding: 0.75rem 1.5rem;
          border: 2px solid rgba(45, 52, 54, 0.2);
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .user-greeting:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          border-color: var(--color-charcoal);
          transform: translateY(-1px);
        }

        .user-dropdown {
          position: absolute;
          top: 100%;
          right: 0;
          background: var(--color-warm-white);
          border: 1px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-sm);
          box-shadow: var(--shadow-strong);
          min-width: 180px;
          opacity: 0;
          visibility: hidden;
          transform: translateY(-10px);
          transition: all 0.3s ease;
          z-index: 1000;
          margin-top: 0.5rem;
        }

        .user-dropdown.show {
          opacity: 1;
          visibility: visible;
          transform: translateY(0);
        }

        .dropdown-item {
          display: block;
          padding: 0.75rem 1.5rem;
          color: var(--color-text-secondary);
          text-decoration: none;
          font-size: 0.9rem;
          font-weight: 400;
          transition: all 0.3s ease;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .dropdown-item:last-child {
          border-bottom: none;
        }

        .dropdown-item:hover {
          background: var(--color-cream);
          color: var(--color-charcoal);
          transform: translateX(5px);
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

          .hero-title {
            font-size: 2rem;
          }

          .filters-content {
            flex-direction: column;
            align-items: stretch;
          }

          .filter-group {
            justify-content: center;
          }

          .books-grid {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
          }

          .pagination {
            flex-wrap: wrap;
          }

          .user-dropdown {
            right: auto;
            left: 0;
          }
        }
	</style>
</head>
<body>
      <div>
        {/* Header */}
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/App.tsx" class="logo">BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/App.tsx">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#" style="color: var(--color-charcoal);">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="/components/BookExchangePage.tsx">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/LoginPage.tsx" class="btn btn-outline">로그인</a>
                <a href="/components/RegisterPage.tsx" class="btn btn-primary">회원가입</a>
                {/* 로그인 후 */}
                <div class="user-menu">
                  <div class="user-greeting" onclick="toggleDropdown()">
                    홍길동님 반갑습니다 ▼
                  </div>
                  <div class="user-dropdown">
                    <a href="#" class="dropdown-item">로그아웃</a>
                    <a href="/components/ChatPage.tsx" class="dropdown-item">채팅</a>
                    <a href="/components/CartPage.tsx" class="dropdown-item">장바구니</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>

        {/* Hero Section */}
        <section class="hero-section">
          <div class="container">
            <div class="hero-content">
              <h1 class="hero-title">새로 출간된 도서</h1>
              <p class="hero-subtitle">
                방금 출간된 신선한 이야기들을 만나보세요.<br/>
                세상에 새롭게 태어난 문학의 향기를 느껴보시길 바랍니다.
              </p>
            </div>
          </div>
        </section>

        {/* Filters */}
        <section class="filters-section">
          <div class="container">
            <div class="filters-content">
              <div class="search-filter">
                <input 
                  type="text" 
                  class="search-input" 
                  placeholder="도서명이나 저자명을 입력하세요..."
                />
              </div>
              <div class="filter-group">
                <span class="filter-label">카테고리:</span>
                <select class="filter-select">
                  <option>전체 카테고리</option>
                  <option>소설/에세이</option>
                  <option>경영/경제</option>
                  <option>과학/기술</option>
                  <option>예술/디자인</option>
                  <option>자기계발</option>
                  <option>IT/컴퓨터</option>
                  <option>아동/청소년</option>
                </select>
              </div>
              <div class="filter-group">
                <span class="filter-label">정렬:</span>
                <select class="filter-select">
                  <option>출간일순</option>
                  <option>인기순</option>
                  <option>평점순</option>
                  <option>가격낮은순</option>
                  <option>가격높은순</option>
                </select>
              </div>
            </div>
          </div>
        </section>

        {/* Books Section */}
        <section class="books-section">
          <div class="container">
            <h2 class="section-title">신간 도서 전체 목록</h2>
            <div class="books-grid">
              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=500&fit=crop"
                  alt="달러구트 꿈 백화점 2"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">달러구트 꿈 백화점 2</h3>
                  <p class="book-author">이미예</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="book-price">14,220원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=500&fit=crop"
                  alt="아버지의 해방일지"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
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
                  src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=500&fit=crop"
                  alt="트렌드 코리아 2025"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">트렌드 코리아 2025</h3>
                  <p class="book-author">김난도</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">16,200원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400&h=500&fit=crop"
                  alt="원피스 107권"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">원피스 107권</h3>
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
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=500&fit=crop"
                  alt="클린 아키텍처"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">클린 아키텍처</h3>
                  <p class="book-author">로버트 C. 마틴</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.7/5)</span>
                  </div>
                  <div class="book-price">33,300원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=500&fit=crop"
                  alt="부의 추월차선"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">부의 추월차선</h3>
                  <p class="book-author">엠제이 드마코</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.4/5)</span>
                  </div>
                  <div class="book-price">17,100원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=500&fit=crop"
                  alt="불편한 편의점 2"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">불편한 편의점 2</h3>
                  <p class="book-author">김호연</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">13,500원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1599185186578-0ba91c2a15c0?w=400&h=500&fit=crop"
                  alt="미래를 읽는 기술"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">미래를 읽는 기술</h3>
                  <p class="book-author">김상균</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">15,300원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1549964336-ce406285ffc4?w=400&h=500&fit=crop"
                  alt="호모 데우스 2025"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">호모 데우스 2025</h3>
                  <p class="book-author">유발 하라리</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.6/5)</span>
                  </div>
                  <div class="book-price">18,900원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1666281269793-da06484657e8?w=400&h=500&fit=crop"
                  alt="AI 시대의 교육"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">AI 시대의 교육</h3>
                  <p class="book-author">이주호</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(3.9/5)</span>
                  </div>
                  <div class="book-price">19,800원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1580121441575-41bcb5c6b47c?w=400&h=500&fit=crop"
                  alt="리팩토링 2판"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">리팩토링 2판</h3>
                  <p class="book-author">마틴 파울러</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="book-price">38,700원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1660479123634-2c700dfbbbdb?w=400&h=500&fit=crop"
                  alt="우주의 비밀"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">우주의 비밀</h3>
                  <p class="book-author">닐 디그래스 타이슨</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">22,500원</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Pagination */}
        <section class="pagination-section">
          <div class="container">
            <div class="pagination">
              <a href="#" class="page-btn disabled">‹ 이전</a>
              <a href="#" class="page-btn active">1</a>
              <a href="#" class="page-btn">2</a>
              <a href="#" class="page-btn">3</a>
              <a href="#" class="page-btn">4</a>
              <a href="#" class="page-btn">5</a>
              <span class="page-btn">...</span>
              <a href="#" class="page-btn">12</a>
              <a href="#" class="page-btn">다음 ›</a>
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