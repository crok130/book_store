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

        /* Breadcrumb */
        .breadcrumb {
          background: var(--color-warm-white);
          padding: 1.5rem 0;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .breadcrumb-nav {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          font-size: 0.9rem;
          color: var(--color-text-secondary);
        }

        .breadcrumb-nav a {
          color: var(--color-sage);
          text-decoration: none;
          font-weight: 500;
          transition: color 0.3s ease;
        }

        .breadcrumb-nav a:hover {
          color: var(--color-muted-green);
        }

        .breadcrumb-separator {
          color: var(--color-text-muted);
        }

        /* Payment Section */
        .payment-section {
          background: white;
          padding: 3rem 0;
        }

        .payment-container {
          display: grid;
          grid-template-columns: 1fr 400px;
          gap: 3rem;
        }

        .payment-main {
          display: flex;
          flex-direction: column;
          gap: 2rem;
        }

        .section-card {
          background: white;
          border: 1px solid #e9ecef;
          border-radius: 12px;
          padding: 2rem;
          box-shadow: var(--shadow-soft);
        }

        .section-title {
          font-size: 1.5rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1.5rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .section-title::before {
          content: '';
          width: 4px;
          height: 1.5rem;
          background: #667eea;
          border-radius: 2px;
        }

        /* Address Section */
        .address-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1.5rem;
        }

        .address-group {
          position: relative;
        }

        .address-input-row {
          display: flex;
          gap: 0.5rem;
          align-items: flex-end;
          margin-bottom: 1rem;
        }

        .address-input-flex {
          flex: 1;
        }

        .load-address-btn {
          background: #f8f9fa;
          color: #667eea;
          border: 2px solid #667eea;
          padding: 0.8rem 1rem;
          border-radius: 6px;
          cursor: pointer;
          font-weight: 500;
          transition: all 0.3s ease;
          white-space: nowrap;
          height: fit-content;
        }

        .load-address-btn:hover {
          background: #667eea;
          color: white;
        }

        .form-group {
          margin-bottom: 1.5rem;
        }

        .form-label {
          display: block;
          margin-bottom: 0.5rem;
          font-weight: 600;
          color: #2c3e50;
        }

        .form-input {
          width: 100%;
          padding: 0.8rem 1rem;
          border: 2px solid #e9ecef;
          border-radius: 8px;
          font-size: 1rem;
          transition: border-color 0.3s ease;
          outline: none;
        }

        .form-input:focus {
          border-color: #667eea;
        }

        .form-input::placeholder {
          color: #999;
        }

        .detail-address-input {
          margin-top: 0.5rem;
        }

        /* Payment Method */
        .payment-methods {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1rem;
          margin-bottom: 1.5rem;
        }

        .payment-method {
          border: 2px solid #e9ecef;
          border-radius: 12px;
          padding: 1.5rem;
          cursor: pointer;
          transition: all 0.3s ease;
          text-align: center;
          background: white;
        }

        .payment-method:hover {
          border-color: #667eea;
          background: #f8f9fa;
        }

        .payment-method.selected {
          border-color: #667eea;
          background: rgba(102, 126, 234, 0.05);
        }

        .payment-icon {
          font-size: 2rem;
          margin-bottom: 0.5rem;
          display: block;
        }

        .payment-name {
          font-weight: 600;
          color: #2c3e50;
        }

        /* Order Summary */
        .order-summary {
          position: sticky;
          top: 2rem;
          height: fit-content;
        }

        .books-list {
          margin-bottom: 1.5rem;
          padding-bottom: 1.5rem;
          border-bottom: 1px solid #e9ecef;
        }

        .book-item {
          display: flex;
          gap: 1rem;
          margin-bottom: 1rem;
          padding: 1rem;
          background: #f8f9fa;
          border-radius: 8px;
        }

        .book-item:last-child {
          margin-bottom: 0;
        }

        .book-info {
          display: flex;
          gap: 1rem;
          margin-bottom: 1.5rem;
          padding-bottom: 1.5rem;
          border-bottom: 1px solid #e9ecef;
        }

        .book-image {
          width: 60px;
          height: 90px;
          border-radius: 6px;
          object-fit: cover;
          flex-shrink: 0;
        }

        .book-details {
          flex: 1;
        }

        .book-title {
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 0.3rem;
          font-size: 0.9rem;
          line-height: 1.3;
        }

        .book-author {
          color: #666;
          font-size: 0.8rem;
          margin-bottom: 0.3rem;
        }

        .book-quantity {
          color: #666;
          font-size: 0.8rem;
          margin-bottom: 0.3rem;
        }

        .book-price {
          color: #2c3e50;
          font-weight: 600;
          font-size: 0.9rem;
        }

        .price-breakdown {
          margin-bottom: 1.5rem;
        }

        .price-row {
          display: flex;
          justify-content: space-between;
          margin-bottom: 0.5rem;
          color: #666;
        }

        .price-row.total {
          border-top: 1px solid #e9ecef;
          padding-top: 0.5rem;
          margin-top: 1rem;
          font-weight: 600;
          color: #2c3e50;
          font-size: 1.1rem;
        }

        .checkout-btn {
          width: 100%;
          padding: 1rem 2rem;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          border: none;
          border-radius: 8px;
          font-size: 1.1rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.3s ease;
        }

        .checkout-btn:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .checkout-btn:disabled {
          background: #ccc;
          cursor: not-allowed;
          transform: none;
          box-shadow: none;
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

          .user-dropdown {
            right: auto;
            left: 0;
          }

          .payment-container {
            grid-template-columns: 1fr;
            gap: 2rem;
          }

          .payment-methods {
            grid-template-columns: 1fr;
          }

          .address-input-row {
            flex-direction: column;
            gap: 1rem;
          }

          .load-address-btn {
            width: 100%;
          }
        }
    </style>
</head>
<body>
    <div>
		<header class="header">
          <div class="container">
            <div class="header-content">
              <a href="#" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="${path}">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="${path}/tradebook/bookexchange">책 교환</a></li>
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
                    <a href="${path}/chat/chatroom" class="dropdown-item">채팅</a>
                    <a href="${path}/member/cart" class="dropdown-item">장바구니</a>
                  </div>
                </div>
           	</c:otherwise>
      	</c:choose>
              </div>
            </div>
          </div>
        </header>

        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="${path}">홈</a>
              <span class="breadcrumb-separator">›</span>
              <span>결제</span>
            </nav>
          </div>
        </section>

        <section class="payment-section">
          <div class="container">
            <div class="payment-container">
              <div class="payment-main">
                <div class="section-card">
                  <h2 class="section-title">배송지 정보</h2>

                  <div class="form-group">
                    <label class="form-label">받는 분</label>
                    <input 
                      type="text" 
                      class="form-input" 
                      placeholder="받는 분 성함을 입력해주세요"
                      name="member_name"
                    />
                  </div>

                  <div class="form-group">
                    <label class="form-label">연락처</label>
                    <input 
                      type="tel" 
                      class="form-input" 
                      placeholder="휴대폰 번호를 입력해주세요"
                      name="member_phone"
                    />
                  </div>

                  <div class="form-group">
                    <label class="form-label">주소</label>
                    <div class="address-group">
                      <div class="address-input-row">
                        <div class="address-input-flex">
                          <input 
                            type="text" 
                            class="form-input" 
                            placeholder="기본 주소를 입력해주세요"
                            name="member_addr1"
                          />
                        </div>
                        <button class="load-address-btn">
                          회원주소 불러오기
                        </button>
                      </div>
                      <input 
                        type="text" 
                        class="form-input detail-address-input" 
                        placeholder="상세 주소를 입력해주세요"
                        name="member_addr2"
                      />
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="form-label">배송 요청사항</label>
                    <input 
                      type="text" 
                      class="form-input" 
                      placeholder="배송 시 요청사항을 입력해주세요 (선택)"
                      name="payment_content"
                    />
                  </div>
                </div>

                <div class="section-card">
                  <h2 class="section-title">결제 방법</h2>
                  <div class="payment-methods">
                    <label class="payment-method selected">
                      <input type="radio" name="paymentMethod" value="card" checked style="display:none;" />
                      <span class="payment-icon">💳</span>
                      <div class="payment-name">신용카드</div>
                    </label>
                    <label class="payment-method">
                      <input type="radio" name="paymentMethod" value="kakao" style="display:none;" />
                      <span class="payment-icon">🟡</span>
                      <div class="payment-name">카카오페이</div>
                    </label>
                  </div>
                </div>
              </div>


              <div class="order-summary">
                <div class="section-card">
                  <h3 class="section-title">주문 요약</h3>
                  
                  <div class="books-list">
                    <div class="book-item">
                      <img 
                        src="${pageContext.request.contextPath}/img${book.newbook_img}"
                        alt="${book.newbook_title}"
                        class="book-image"
                      />
                      <div class="book-details">
                        <div class="book-title">${book.newbook_title}</div>
                        <div class="book-author">${book.newbook_author} 지음</div>
                        <div class="book-quantity">수량: ${quantity}개</div>
                        <div class="book-price">${totalPrice}원</div>
                      </div>
                    </div>
                  </div>

                  <div class="price-breakdown">
                    <div class="price-row">
                      <span>배송비</span>
                      <span>무료</span>
                    </div>
                    <div class="price-row total">
                      <span>총 결제금액</span>
                      <span>${totalPrice}원</span>
                    </div>
                  </div>

                  <button class="checkout-btn">
                    결제하기
                  </button>
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

        // 회원주소 불러오기 버튼 AJAX 연동
        document.addEventListener('DOMContentLoaded', function(){
          const btn = document.querySelector('.load-address-btn');
          if(!btn) return;
          btn.addEventListener('click', function(e){
            e.preventDefault();
            fetch('${path}/member/address', { method: 'GET' })
              .then(function(res){
                if(!res.ok){ throw new Error('unauthorized'); }
                return res.json();
              })
              .then(function(data){
                const addr1Input = document.querySelector('input[name="member_addr1"]');
                const addr2Input = document.querySelector('input[name="member_addr2"]');
                if(addr1Input) addr1Input.value = data.addr1 || '';
                if(addr2Input) addr2Input.value = data.addr2 || '';
              })
              .catch(function(){
                alert('주소를 불러올 수 없습니다. 로그인 상태를 확인하세요.');
              });
          });

          // 결제방법 라디오 선택 시 시각적 선택상태 유지
          const methodLabels = document.querySelectorAll('.payment-methods .payment-method');
          methodLabels.forEach(function(label){
            label.addEventListener('click', function(){
              methodLabels.forEach(function(l){ l.classList.remove('selected'); });
              this.classList.add('selected');
              const input = this.querySelector('input[type="radio"]');
              if(input){ input.checked = true; }
            });
          });
        });
      </script>
</html>