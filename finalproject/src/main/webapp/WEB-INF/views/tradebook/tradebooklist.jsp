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
          background: linear-gradient(135deg, var(--color-sage) 0%, var(--color-muted-green) 100%);
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
          background: url("data:image/svg+xml,%3Csvg width='80' height='80' viewBox='0 0 80 80' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3z' stroke='%23ffffff' stroke-width='1' stroke-opacity='0.1'/%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.3;
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
          opacity: 0.9;
          font-weight: 300;
          max-width: 600px;
          margin-left: auto;
          margin-right: auto;
          line-height: 1.6;
        }

        /* Stats */
        .stats {
          display: flex;
          justify-content: center;
          gap: 3rem;
          margin-top: 2rem;
        }

        .stat {
          text-align: center;
        }

        .stat-number {
          display: block;
          font-family: var(--font-serif);
          font-size: 2rem;
          font-weight: 700;
          margin-bottom: 0.5rem;
          letter-spacing: -0.02em;
        }

        .stat-label {
          font-size: 0.95rem;
          opacity: 0.8;
          font-weight: 300;
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

        /* Exchange Books Section */
        .exchange-books-section {
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

        .exchange-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
          gap: 2.5rem;
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
          background: linear-gradient(135deg, rgba(156, 175, 158, 0.05), rgba(143, 166, 133, 0.05));
          opacity: 0;
          transition: opacity 0.3s ease;
          z-index: 1;
        }

        .exchange-card:hover::before {
          opacity: 1;
        }

        .exchange-card:hover {
          transform: translateY(-8px) scale(1.02);
          box-shadow: var(--shadow-strong);
          border-color: rgba(156, 175, 158, 0.3);
        }

        .exchange-book-image {
          width: 100%;
          height: 200px;
          object-fit: cover;
          transition: transform 0.4s ease;
          position: relative;
          z-index: 2;
        }

        .exchange-card:hover .exchange-book-image {
          transform: scale(1.05);
        }

        .exchange-info {
          padding: 1.5rem;
          position: relative;
          z-index: 2;
        }

        .exchange-badge {
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

        .exchange-book-title {
          font-family: var(--font-serif);
          font-size: 1.2rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: var(--color-charcoal);
          line-height: 1.4;
          letter-spacing: -0.01em;
        }

        .exchange-book-author {
          color: var(--color-text-secondary);
          margin-bottom: 1rem;
          font-size: 0.9rem;
          font-weight: 400;
        }

        .exchange-details {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1rem;
        }

        .exchange-condition {
          font-size: 0.9rem;
          font-weight: 600;
          padding: 0.3rem 0.8rem;
          border-radius: 12px;
          background: rgba(156, 175, 158, 0.15);
          color: var(--color-sage);
        }

        .exchange-date {
          font-size: 0.8rem;
          color: var(--color-text-secondary);
        }

        .exchange-location {
          display: flex;
          align-items: center;
          gap: 0.3rem;
          margin-bottom: 1rem;
          font-size: 0.9rem;
          color: var(--color-text-secondary);
        }

        .exchange-user {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
          color: var(--color-text-primary);
          font-weight: 500;
        }

        .user-avatar {
          width: 24px;
          height: 24px;
          border-radius: 50%;
          background: var(--color-sage);
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 0.8rem;
          color: var(--color-warm-white);
          font-weight: 600;
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

          .stats {
            flex-direction: column;
            gap: 1rem;
          }

          .filters-content {
            flex-direction: column;
            align-items: stretch;
          }

          .filter-group {
            justify-content: center;
          }

          .exchange-grid {
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
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
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="${path}" class="logo">BookBridge</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="${path}">홈</a></li>
                  <li><a href="${path}/board/best">베스트</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="${path}/tradebook/bookexchange" style="color: var(--color-charcoal);">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
        <c:choose>
            <c:when test="${empty sessionScope.userInfo}">
                <a href="${path}/member/login" class="btn btn-outline">로그인</a>
                <a href="${path}/member/register" class="btn btn-primary">회원가입</a>
           	</c:when>
           	<c:otherwise>
                <div class="user-menu">
                  <div class="user-greeting" onclick="toggleDropdown()">
                    ${userInfo.member_nickname}님 반갑습니다 ▼
                  </div>
                  <div class="user-dropdown">
                    <a href="${path}/member/logout" class="dropdown-item">로그아웃</a>
                    <a href="${path}/chat/chatDetail" class="dropdown-item">채팅</a>
                    <a href="${path}/payment/cart" class="dropdown-item">장바구니</a>
                    <a href="${path}/member/mypage" class="dropdown-item">주문내역</a>
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
              <h1 class="hero-title">모든 교환 도서</h1>
              <p class="hero-subtitle">
                다양한 독서 취향의 만남, 새로운 이야기와의 인연.<br/>
                당신의 책장에서 시작되는 특별한 교환을 경험해보세요.
              </p>
              
              <div class="stats">
                <div class="stat">
                  <span class="stat-number">2,547</span>
                  <span class="stat-label">교환 가능한 책</span>
                </div>
                <div class="stat">
                  <span class="stat-number">1,283</span>
                  <span class="stat-label">활발한 회원</span>
                </div>
                <div class="stat">
                  <span class="stat-number">4,892</span>
                  <span class="stat-label">성공한 교환</span>
                </div>
              </div>
            </div>
          </div>
        </section>

        <form id="filterForm" action="${path}/tradebook/list" method="get">
          <section class="filters-section">
            <div class="container">
              <div class="filters-content">
                <div class="search-filter">
                  <input 
                    type="text"
                    name="keyword"
                    class="search-input" 
                    placeholder="도서명이나 저자명을 입력하세요..."
                    value="${param.keyword}"
                  />
                </div>
                <div class="filter-group">
                  <span class="filter-label">상태:</span>
                  <select name="category" class="filter-select">
                    <option ${empty param.category || param.category == '전체' ? 'selected' : ''}>전체</option>
                    <option ${param.category == '새책' ? 'selected' : ''}>새책</option>
                    <option ${param.category == '매우 좋음' ? 'selected' : ''}>매우 좋음</option>
                    <option ${param.category == '좋음' ? 'selected' : ''}>좋음</option>
                    <option ${param.category == '보통' ? 'selected' : ''}>보통</option>
                    <option ${param.category == '낡음' ? 'selected' : ''}>낡음</option>
                  </select>
                </div>
                <div class="filter-group">
                  <span class="filter-label">지역:</span>
                  <select name="sort" class="filter-select">
                    <option ${empty param.sort || param.sort == '전국' ? 'selected' : ''}>전국</option>
                    <option ${param.sort == '서울' ? 'selected' : ''}>서울</option>
                    <option ${param.sort == '부산' ? 'selected' : ''}>부산</option>
                    <option ${param.sort == '대구' ? 'selected' : ''}>대구</option>
                    <option ${param.sort == '인천' ? 'selected' : ''}>인천</option>
                    <option ${param.sort == '광주' ? 'selected' : ''}>광주</option>
                    <option ${param.sort == '대전' ? 'selected' : ''}>대전</option>
                    <option ${param.sort == '울산' ? 'selected' : ''}>울산</option>
                  </select>
                </div>
                <input type="hidden" name="page" value="${empty param.page ? 1 : param.page}"/>
                <input type="hidden" name="perPageNum" value="${empty param.perPageNum ? 12 : param.perPageNum}"/>
              </div>
            </div>
          </section>
        </form>

        <section class="exchange-books-section">
          <div class="container">
            <h2 class="section-title">교환 가능한 모든 도서</h2>
            <div class="exchange-grid">
              <c:forEach var="item" items="${list}">
              		
	               <div class="exchange-card" onclick="location.href='detail?num=${item.tradebook_num}'">
		                <img 
		                  src="${pageContext.request.contextPath}/img${item.tradebook_img}"
		                  alt="${item.tradebook_title}"
		                  class="exchange-book-image"
		                />
		                <div class="exchange-info">
		                <c:choose>
		                	<c:when test="${item.tradebook_trade == 'y'}">
		                  		<div class="exchange-badge">교환가능</div>
		                  	 </c:when>
		                  	 <c:otherwise>
		                  	 	<div class="exchange-badge" style="background: linear-gradient(135deg, #9e9e9e, #757575);">교환 완료</div>
		                  	 </c:otherwise>
		                 </c:choose>
		                  <h3 class="exchange-book-title">${item.tradebook_title}</h3>
		                  <p class="exchange-book-author">${item.tradebook_author}</p>
		                  <div class="exchange-details">
		                    <span class="exchange-condition">${item.tradebook_status}</span>
		                  </div>
		                  <div class="exchange-location">
		                    <span>📍</span>
		                    <span>${item.tradebook_location}</span>
		                  </div>
		                  <div class="exchange-user">
		                    <span>${item.member_nickname}님</span>
		                  </div>
		                </div>
	              	</div>
             	</c:forEach>
            </div>
          </div>
        </section>

        <section class="pagination-section">
          <div class="container">
            <div class="pagination">
              <!-- 처음 페이지 (1페이지가 아닐 때만 표시) -->
              <c:if test="${pm.criteria.page > 1}">
                <a href="${pageContext.request.contextPath}/tradebook/list${pm.makeQuery(1)}" class="page-btn">« 처음</a>
              </c:if>
              
              <!-- 이전 페이지 (이전 블록이 있을 때만 표시) -->
              <c:if test="${pm.movePrev}">
                <a href="${pageContext.request.contextPath}/tradebook/list${pm.makeQuery(pm.startPage-1)}" class="page-btn">‹ 이전</a>
              </c:if>
              
              <!-- 페이지 번호들 -->
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
                <c:if test="${pm.criteria.page == idx}">
                  <span class="page-btn active">${idx}</span>
                </c:if>
                <c:if test="${pm.criteria.page != idx}">
                  <a href="${pageContext.request.contextPath}/tradebook/list${pm.makeQuery(idx)}" class="page-btn">${idx}</a>
                </c:if>
              </c:forEach>
              
              <!-- 다음 페이지 (다음 블록이 있을 때만 표시) -->
              <c:if test="${pm.moveNext}">
                <a href="${pageContext.request.contextPath}/tradebook/list${pm.makeQuery(pm.endPage+1)}" class="page-btn">다음 ›</a>
              </c:if>
              
              <!-- 마지막 페이지 (마지막 페이지가 아닐 때만 표시) -->
              <c:if test="${pm.criteria.page < pm.maxPage}">
                <a href="${pageContext.request.contextPath}/tradebook/list${pm.makeQuery(pm.maxPage)}" class="page-btn">마지막 »</a>
              </c:if>
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