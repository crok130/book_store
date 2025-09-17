<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
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

        .nav-menu a:hover,
        .nav-menu a.active {
          color: var(--color-charcoal);
        }

        .nav-menu a:hover::after,
        .nav-menu a.active::after {
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
          padding: 6rem 0 8rem;
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

        .exchange-icon {
          font-size: 4rem;
          margin-bottom: 2rem;
          display: block;
          opacity: 0.9;
        }

        .hero-title {
          font-family: var(--font-serif);
          font-size: 3.5rem;
          margin-bottom: 1.5rem;
          font-weight: 600;
          letter-spacing: -0.02em;
          line-height: 1.2;
        }

        .hero-subtitle {
          font-size: 1.25rem;
          margin-bottom: 2rem;
          opacity: 0.85;
          font-weight: 300;
          max-width: 700px;
          margin-left: auto;
          margin-right: auto;
          line-height: 1.6;
        }

        .create-post-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.75rem;
          background: rgba(254, 253, 251, 0.2);
          color: var(--color-warm-white);
          padding: 1.25rem 2.5rem;
          border-radius: 50px;
          text-decoration: none;
          font-weight: 600;
          font-size: 1.1rem;
          letter-spacing: -0.01em;
          transition: all 0.4s ease;
          backdrop-filter: blur(20px);
          border: 2px solid rgba(255, 255, 255, 0.3);
          margin-top: 1rem;
        }

        .create-post-btn:hover {
          background: rgba(254, 253, 251, 0.3);
          transform: translateY(-3px);
          box-shadow: var(--shadow-strong);
          border-color: rgba(255, 255, 255, 0.5);
        }

        /* Stats Section */
        .stats-section {
          background: var(--color-warm-white);
          padding: 4rem 0;
        }

        .stats-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          gap: 2rem;
        }

        .stat-card {
          text-align: center;
          padding: 2rem;
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-soft);
          transition: all 0.4s ease;
          border: 1px solid rgba(156, 175, 158, 0.1);
        }

        .stat-card:hover {
          transform: translateY(-8px);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .stat-number {
          font-family: var(--font-serif);
          font-size: 2.5rem;
          font-weight: 700;
          color: var(--color-terracotta);
          margin-bottom: 0.5rem;
          letter-spacing: -0.02em;
        }

        .stat-label {
          color: var(--color-text-secondary);
          font-size: 1rem;
          font-weight: 400;
        }

        /* Filter Section */
        .filter-section {
          background: rgba(254, 253, 251, 0.95);
          backdrop-filter: blur(20px);
          padding: 2rem 0;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
          position: sticky;
          top: 84px;
          z-index: 999;
        }

        .filter-content {
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
          padding: 1rem 1.25rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
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
          letter-spacing: -0.01em;
        }

        .filter-select {
          padding: 0.8rem 1rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
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

        /* Category Pills */
        .category-section {
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          padding: 3rem 0;
        }

        .category-filters {
          display: flex;
          gap: 1rem;
          justify-content: center;
          flex-wrap: wrap;
        }

        .category-pill {
          padding: 0.8rem 1.5rem;
          background: var(--color-warm-white);
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: 25px;
          color: var(--color-text-secondary);
          text-decoration: none;
          font-weight: 500;
          font-size: 0.9rem;
          transition: all 0.3s ease;
          cursor: pointer;
          letter-spacing: -0.01em;
        }

        .category-pill:hover,
        .category-pill.active {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          border-color: var(--color-sage);
          transform: translateY(-2px);
          box-shadow: var(--shadow-soft);
        }

        /* Books Section */
        .books-section {
          padding: 4rem 0;
          background: var(--color-warm-white);
        }

        .section-title {
          text-align: center;
          font-family: var(--font-serif);
          font-size: 2.75rem;
          margin-bottom: 1rem;
          color: var(--color-charcoal);
          font-weight: 600;
          letter-spacing: -0.02em;
        }

        .section-subtitle {
          text-align: center;
          font-size: 1.1rem;
          color: var(--color-text-secondary);
          margin-bottom: 3rem;
          font-weight: 300;
          max-width: 500px;
          margin-left: auto;
          margin-right: auto;
        }

        .books-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
          gap: 2.5rem;
          margin-top: 3rem;
        }

        .exchange-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          overflow: hidden;
          box-shadow: var(--shadow-soft);
          transition: all 0.4s ease;
          cursor: pointer;
          border: 1px solid rgba(156, 175, 158, 0.1);
          position: relative;
        }

        .exchange-card::before {
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

        .exchange-card:hover::before {
          opacity: 1;
        }

        .exchange-card:hover {
          transform: translateY(-12px) scale(1.02);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .exchange-badge {
          position: absolute;
          top: 1rem;
          left: 1rem;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          padding: 0.4rem 1rem;
          border-radius: 20px;
          font-size: 0.75rem;
          font-weight: 600;
          z-index: 10;
          letter-spacing: 0.5px;
          text-transform: uppercase;
        }

        .book-image {
          width: 100%;
          height: 240px;
          object-fit: cover;
          transition: transform 0.4s ease;
          position: relative;
          z-index: 2;
        }

        .exchange-card:hover .book-image {
          transform: scale(1.05);
        }

        .exchange-info {
          padding: 2rem;
          position: relative;
          z-index: 2;
        }

        .book-title {
          font-family: var(--font-serif);
          font-size: 1.3rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: var(--color-charcoal);
          line-height: 1.4;
          letter-spacing: -0.01em;
        }

        .book-author {
          color: var(--color-text-secondary);
          margin-bottom: 1rem;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .book-condition {
          display: inline-block;
          background: linear-gradient(135deg, var(--color-sage) 0%, var(--color-muted-green) 100%);
          color: var(--color-warm-white);
          padding: 0.3rem 0.8rem;
          border-radius: 15px;
          font-size: 0.75rem;
          font-weight: 600;
          margin-bottom: 1rem;
          letter-spacing: 0.5px;
        }

        .book-condition.fair {
          background: linear-gradient(135deg, var(--color-terracotta) 0%, #C19660 100%);
        }

        .book-condition.poor {
          background: linear-gradient(135deg, #D66853 0%, #B8574A 100%);
        }

        .owner-info {
          display: flex;
          align-items: center;
          gap: 0.8rem;
          margin-bottom: 1rem;
        }

        .owner-avatar {
          width: 36px;
          height: 36px;
          border-radius: 50%;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          display: flex;
          align-items: center;
          justify-content: center;
          color: var(--color-warm-white);
          font-weight: 600;
          font-size: 0.9rem;
        }

        .owner-details {
          flex: 1;
        }

        .owner-name {
          font-weight: 600;
          color: var(--color-charcoal);
          font-size: 0.95rem;
          margin-bottom: 0.2rem;
        }

        .owner-location {
          color: var(--color-text-secondary);
          font-size: 0.85rem;
        }

        .wants-section {
          border-top: 1px solid rgba(156, 175, 158, 0.2);
          padding-top: 1rem;
          margin-top: 1rem;
        }

        .wants-label {
          font-size: 0.85rem;
          color: var(--color-text-secondary);
          margin-bottom: 0.5rem;
          font-weight: 500;
        }

        .wants-text {
          font-size: 0.9rem;
          color: var(--color-charcoal);
          font-style: italic;
          line-height: 1.5;
        }

        .more-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          padding: 1rem 2rem;
          border-radius: var(--border-radius-lg);
          text-decoration: none;
          font-weight: 600;
          font-size: 1rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          box-shadow: var(--shadow-soft);
          margin-top: 3rem;
        }

        .more-btn:hover {
          background: linear-gradient(135deg, var(--color-muted-green), var(--color-deep-blue));
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
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
            font-size: 2.5rem;
          }

          .filter-content {
            flex-direction: column;
            align-items: stretch;
          }

          .filter-group {
            justify-content: center;
          }

          .books-grid {
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
          }

          .category-filters {
            justify-content: flex-start;
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
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/App.tsx" class="logo">BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/App.tsx">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="/components/BookExchangePage.tsx" class="active">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
        <c:choose>
            <c:when test="${empty sessionScope.userInfo}">
                <a href="${path}/meber/login" class="btn btn-outline">로그인</a>
                <a href="${path}/member/register" class="btn btn-primary">회원가입</a>
           	</c:when>
           	<c:otherwise>
                <div class="user-menu">
                  <div class="user-greeting" onclick="toggleDropdown()">
                    ${userInfo.member_nickname}님 반갑습니다 ▼
                  </div>
                  <div class="user-dropdown">
                    <a href="#" class="dropdown-item">로그아웃</a>
                    <a href="${path}/chat/chatDetail" class="dropdown-item">채팅</a>
                    <a href="${path}/payment/cart" class="dropdown-item">장바구니</a>
                  </div>
                </div>
          	</c:otherwise>
       	</c:choose> 
              </div>
            </div>
          </div>
        </header>

        <section class="hero-section">
          <div class="container">
            <div class="hero-content">
              <span class="exchange-icon">🔄</span>
              <h1 class="hero-title">책의 순환</h1>
              <p class="hero-subtitle">
                이미 읽은 책에도 새로운 생명을 불어넣어 보세요.<br/>
                당신의 책이 다른 이에게 새로운 감동이 될 수 있습니다.
              </p>
              <a href="/components/BookExchangeCreatePage.tsx" class="create-post-btn">
                📝 교환 글 작성하기
              </a>
            </div>
          </div>
        </section>

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
                <a class="more-btn" href="${path}/tradebook/list">
                  더보기 📚
                </a>
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
</body>
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
</html>