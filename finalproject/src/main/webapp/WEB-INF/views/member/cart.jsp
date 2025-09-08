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

        /* User Menu Dropdown */
        .user-menu {
          position: relative;
        }

        .user-greeting {
          cursor: pointer;
          padding: 0.75rem 1rem;
          background: rgba(156, 175, 158, 0.1);
          border-radius: var(--border-radius-sm);
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-weight: 500;
          color: var(--color-charcoal);
        }

        .user-greeting:hover {
          background: rgba(156, 175, 158, 0.2);
        }

        .user-dropdown {
          position: absolute;
          top: 100%;
          right: 0;
          background: var(--color-warm-white);
          border: 1px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
          box-shadow: var(--shadow-strong);
          min-width: 180px;
          opacity: 0;
          visibility: hidden;
          transform: translateY(-10px);
          transition: all 0.3s ease;
          z-index: 1000;
        }

        .user-menu.active .user-dropdown {
          opacity: 1;
          visibility: visible;
          transform: translateY(0);
        }

        .dropdown-item {
          display: block;
          padding: 0.75rem 1rem;
          text-decoration: none;
          color: var(--color-text-primary);
          font-size: 0.9rem;
          transition: all 0.3s ease;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .dropdown-item:last-child {
          border-bottom: none;
        }

        .dropdown-item:hover {
          background: var(--color-soft-beige);
          color: var(--color-charcoal);
        }

        /* Cart Page Styles */
        .cart-section {
          padding: 4rem 0;
        }

        .cart-header {
          background: linear-gradient(135deg, var(--color-charcoal) 0%, var(--color-deep-blue) 100%);
          color: var(--color-warm-white);
          padding: 4rem 0;
          text-align: center;
          position: relative;
          overflow: hidden;
        }

        .cart-header::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.4;
        }

        .cart-title {
          font-family: var(--font-serif);
          font-size: 3rem;
          margin-bottom: 1rem;
          font-weight: 600;
          letter-spacing: -0.02em;
          position: relative;
          z-index: 2;
        }

        .cart-subtitle {
          font-size: 1.2rem;
          opacity: 0.85;
          font-weight: 300;
          position: relative;
          z-index: 2;
        }

        .cart-content {
          display: grid;
          grid-template-columns: 2fr 1fr;
          gap: 3rem;
          margin-top: 3rem;
        }

        .cart-items {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          padding: 2.5rem;
          box-shadow: var(--shadow-soft);
          border: 1px solid rgba(156, 175, 158, 0.1);
        }

        .items-header {
          font-family: var(--font-serif);
          font-size: 1.5rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 2rem;
          padding-bottom: 1rem;
          border-bottom: 2px solid rgba(156, 175, 158, 0.15);
        }

        .cart-item {
          display: flex;
          align-items: center;
          gap: 1.5rem;
          padding: 1.5rem 0;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
          transition: all 0.3s ease;
        }

        .cart-item:last-child {
          border-bottom: none;
        }

        .cart-item:hover {
          background: rgba(156, 175, 158, 0.05);
          border-radius: var(--border-radius-sm);
          padding-left: 1rem;
          padding-right: 1rem;
        }

        .item-image {
          width: 80px;
          height: 110px;
          object-fit: cover;
          border-radius: var(--border-radius-sm);
          box-shadow: var(--shadow-soft);
        }

        .item-info {
          flex: 1;
        }

        .item-title {
          font-family: var(--font-serif);
          font-size: 1.1rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 0.5rem;
          letter-spacing: -0.01em;
        }

        .item-author {
          color: var(--color-text-secondary);
          font-size: 0.9rem;
          margin-bottom: 0.75rem;
        }

        .item-price {
          font-size: 1rem;
          font-weight: 600;
          color: var(--color-terracotta);
        }

        .item-controls {
          display: flex;
          align-items: center;
          gap: 1rem;
        }

        .quantity-control {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          background: var(--color-soft-beige);
          border-radius: var(--border-radius-sm);
          padding: 0.5rem;
        }

        .quantity-btn {
          width: 32px;
          height: 32px;
          border: none;
          background: var(--color-warm-white);
          border-radius: 4px;
          cursor: pointer;
          font-weight: 600;
          color: var(--color-charcoal);
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .quantity-btn:hover {
          background: var(--color-sage);
          color: var(--color-warm-white);
        }

        .quantity-display {
          width: 40px;
          text-align: center;
          font-weight: 600;
          color: var(--color-charcoal);
        }

        .remove-btn {
          background: none;
          border: none;
          color: var(--color-text-secondary);
          cursor: pointer;
          font-size: 1.5rem;
          transition: all 0.3s ease;
          padding: 0.5rem;
        }

        .remove-btn:hover {
          color: #e74c3c;
          transform: scale(1.1);
        }

        /* Cart Summary */
        .cart-summary {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          padding: 2.5rem;
          box-shadow: var(--shadow-soft);
          border: 1px solid rgba(156, 175, 158, 0.1);
          height: fit-content;
          position: sticky;
          top: 100px;
        }

        .summary-header {
          font-family: var(--font-serif);
          font-size: 1.5rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 2rem;
          padding-bottom: 1rem;
          border-bottom: 2px solid rgba(156, 175, 158, 0.15);
        }

        .summary-row {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1rem;
          font-size: 0.95rem;
        }

        .summary-label {
          color: var(--color-text-secondary);
        }

        .summary-value {
          font-weight: 600;
          color: var(--color-charcoal);
        }

        .summary-total {
          font-size: 1.1rem;
          font-weight: 700;
          padding-top: 1rem;
          border-top: 2px solid rgba(156, 175, 158, 0.15);
          margin-top: 1rem;
        }

        .summary-total .summary-value {
          color: var(--color-terracotta);
          font-size: 1.3rem;
        }

        .checkout-btn {
          width: 100%;
          padding: 1.25rem;
          background: linear-gradient(135deg, var(--color-charcoal) 0%, var(--color-deep-blue) 100%);
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-md);
          font-size: 1.1rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.3s ease;
          margin-top: 2rem;
          letter-spacing: -0.01em;
        }

        .checkout-btn:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-strong);
        }

        .continue-shopping {
          width: 100%;
          padding: 1rem;
          background: transparent;
          color: var(--color-charcoal);
          border: 2px solid rgba(45, 52, 54, 0.2);
          border-radius: var(--border-radius-md);
          font-size: 1rem;
          font-weight: 500;
          cursor: pointer;
          transition: all 0.3s ease;
          margin-top: 1rem;
          text-decoration: none;
          display: block;
          text-align: center;
        }

        .continue-shopping:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          transform: translateY(-1px);
        }

        /* Empty Cart */
        .empty-cart {
          text-align: center;
          padding: 4rem 2rem;
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-soft);
          border: 1px solid rgba(156, 175, 158, 0.1);
          grid-column: 1 / -1;
        }

        .empty-icon {
          font-size: 4rem;
          color: var(--color-sage);
          margin-bottom: 1.5rem;
        }

        .empty-title {
          font-family: var(--font-serif);
          font-size: 1.8rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1rem;
        }

        .empty-text {
          color: var(--color-text-secondary);
          font-size: 1.1rem;
          margin-bottom: 2rem;
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
            flex-wrap: wrap;
            justify-content: center;
          }

          .cart-content {
            grid-template-columns: 1fr;
            gap: 2rem;
          }

          .cart-title {
            font-size: 2rem;
          }

          .cart-item {
            flex-direction: column;
            align-items: flex-start;
            gap: 1rem;
          }

          .item-controls {
            width: 100%;
            justify-content: space-between;
          }

          .cart-items, .cart-summary {
            padding: 1.5rem;
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
              <a href="/App.tsx" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/App.tsx">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
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

        {/* Cart Header */}
        <section class="cart-header">
          <div class="container">
            <h1 class="cart-title">나만의 서재</h1>
            <p class="cart-subtitle">선택하신 소중한 책들이 당신을 기다리고 있습니다</p>
          </div>
        </section>

        {/* Cart Content */}
        <section class="cart-section">
          <div class="container">
            <div class="cart-content">
              {/* Cart Items */}
              <div class="cart-items">
                <h2 class="items-header">선택한 도서 (3권)</h2>
                
                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1622490836804-4069f1f6df53?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxib29rcyUyMHN0YWNrJTIwdmludGFnZXxlbnwxfHx8fDE3NTczMDg3NjF8MA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="달러구트 꿈 백화점"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">달러구트 꿈 백화점</h3>
                    <p class="item-author">이미예</p>
                    <p class="item-price">13,320원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">1</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>

                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1755188977089-3bb40306d57f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHx2aW50YWdlJTIwbGl0ZXJhdHVyZSUyMGJvb2t8ZW58MXx8fHwxNzU3MzA4NzY1fDA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="세이노의 가르침"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">세이노의 가르침</h3>
                    <p class="item-author">세이노</p>
                    <p class="item-price">6,480원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">2</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>

                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1615413833480-6e8427dbcc5e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjbGFzc2ljJTIwbm92ZWwlMjBib29rJTIwY292ZXJ8ZW58MXx8fHwxNzU3MzA4NzcwfDA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="불편한 편의점"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">불편한 편의점</h3>
                    <p class="item-author">김호연</p>
                    <p class="item-price">12,600원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">1</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>
              </div>

              {/* Cart Summary */}
              <div class="cart-summary">
                <h2 class="summary-header">주문 요약</h2>
                
                <div class="summary-row">
                  <span class="summary-label">상품 금액</span>
                  <span class="summary-value">45,360원</span>
                </div>
                
                <div class="summary-row">
                  <span class="summary-label">배송비</span>
                  <span class="summary-value">2,500원</span>
                </div>
                
                <div class="summary-row">
                  <span class="summary-label">할인</span>
                  <span class="summary-value">-2,000원</span>
                </div>
                
                <div class="summary-row summary-total">
                  <span class="summary-label">총 결제 금액</span>
                  <span class="summary-value">45,860원</span>
                </div>

                <button class="checkout-btn">주문하기</button>
                <a href="/App.tsx" class="continue-shopping">쇼핑 계속하기</a>
              </div>
            </div>

            {/* Empty Cart State (주석 처리된 예시) */}
            {/*
            <div class="empty-cart">
              <div class="empty-icon">📚</div>
              <h2 class="empty-title">장바구니가 비어있습니다</h2>
              <p class="empty-text">아직 선택하신 책이 없습니다.<br/>마음에 드는 책을 담아보세요.</p>
              <a href="/App.tsx" class="btn btn-primary">책 둘러보기</a>
            </div>
            */}
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
          const userMenu = document.querySelector('.user-menu');
          userMenu.classList.toggle('active');
        }

        // 드롭다운 외부 클릭시 닫기
        document.addEventListener('click', function(event) {
          const userMenu = document.querySelector('.user-menu');
          if (userMenu && !userMenu.contains(event.target)) {
            userMenu.classList.remove('active');
          }
        });
      </script>

      </script>
</body>
</html>