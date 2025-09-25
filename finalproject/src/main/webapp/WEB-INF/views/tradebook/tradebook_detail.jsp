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

        /* Main Detail Section */
        .detail-container {
          background: var(--color-warm-white);
          padding: 4rem 0;
        }

        .detail-content {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 4rem;
          margin-bottom: 4rem;
        }

        /* Book Image Section - 고정 크기 적용 */
        .book-image-section {
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .book-image {
          width: 420px;
          height: 600px;
          object-fit: cover;
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-strong);
          transition: transform 0.4s ease;
        }

        .book-image:hover {
          transform: scale(1.05);
        }

        /* Book Info Section */
        .book-info-section {
          padding: 2rem 0;
        }

        .exchange-status {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          padding: 0.5rem 1.25rem;
          border-radius: 25px;
          font-size: 0.8rem;
          font-weight: 600;
          display: inline-block;
          margin-bottom: 1.5rem;
          letter-spacing: 0.5px;
          text-transform: uppercase;
        }

        .book-title {
          font-family: var(--font-serif);
          font-size: 3rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1rem;
          line-height: 1.2;
          letter-spacing: -0.02em;
        }

        .book-author {
          font-size: 1.2rem;
          color: var(--color-text-secondary);
          margin-bottom: 2rem;
          font-weight: 300;
        }

        .book-condition {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 2rem;
        }

        .condition-badge {
          background: linear-gradient(135deg, var(--color-terracotta), #C19660);
          color: var(--color-warm-white);
          padding: 0.4rem 1rem;
          border-radius: 20px;
          font-size: 0.8rem;
          font-weight: 600;
          letter-spacing: 0.5px;
        }

        .condition-text {
          color: var(--color-text-secondary);
          font-size: 1rem;
          font-style: italic;
        }

        .book-description {
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          padding: 2rem;
          border-radius: var(--border-radius-lg);
          margin-bottom: 2rem;
          border: 1px solid rgba(156, 175, 158, 0.1);
        }

        .description-title {
          font-family: var(--font-serif);
          font-size: 1.3rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1rem;
          letter-spacing: -0.01em;
        }

        .description-text {
          color: var(--color-text-secondary);
          line-height: 1.7;
          font-size: 1rem;
        }

        /* Owner Section */
        .owner-section {
          background: var(--color-warm-white);
          border: 2px solid rgba(156, 175, 158, 0.15);
          padding: 2rem;
          border-radius: var(--border-radius-lg);
          margin-bottom: 2rem;
          box-shadow: var(--shadow-soft);
        }

        .owner-title {
          font-family: var(--font-serif);
          font-size: 1.3rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1.5rem;
          display: flex;
          align-items: center;
          gap: 0.75rem;
          letter-spacing: -0.01em;
        }

        .owner-info {
          display: flex;
          align-items: center;
          gap: 1.5rem;
        }

        .owner-avatar {
          width: 70px;
          height: 70px;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          color: var(--color-warm-white);
          font-size: 1.8rem;
          font-weight: 600;
        }

        .owner-details {
          flex: 1;
        }

        .owner-name {
          font-weight: 600;
          color: var(--color-charcoal);
          font-size: 1.1rem;
          margin-bottom: 0.5rem;
        }

        .owner-location {
          color: var(--color-text-secondary);
          font-size: 1rem;
          margin-bottom: 0.5rem;
        }

        .owner-rating {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
        }

        .stars {
          color: var(--color-accent-gold);
          font-size: 1.1rem;
        }

        /* Action Buttons */
        .action-buttons {
          display: flex;
          gap: 1.5rem;
          margin-bottom: 3rem;
        }

        .btn-large {
          flex: 1;
          padding: 1.5rem 2rem;
          font-size: 1.2rem;
          font-weight: 600;
          border-radius: var(--border-radius-md);
          cursor: pointer;
          transition: all 0.3s ease;
          border: none;
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 0.75rem;
          text-decoration: none;
          letter-spacing: -0.01em;
        }

        .btn-exchange {
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
        }

        .btn-exchange:hover {
          transform: translateY(-3px);
          box-shadow: var(--shadow-strong);
        }

        .btn-chat {
          background: linear-gradient(135deg, var(--color-terracotta), #C19660);
          color: var(--color-warm-white);
        }

        .btn-chat:hover {
          background: linear-gradient(135deg, #C19660, #A8825A);
          transform: translateY(-3px);
          box-shadow: var(--shadow-strong);
        }

        /* Exchange Conditions */
        .exchange-conditions {
          background: var(--color-warm-white);
          border: 2px solid rgba(156, 175, 158, 0.15);
          border-radius: var(--border-radius-lg);
          padding: 2.5rem;
          margin-bottom: 3rem;
          box-shadow: var(--shadow-soft);
        }

        .conditions-title {
          font-family: var(--font-serif);
          font-size: 1.8rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 2rem;
          display: flex;
          align-items: center;
          gap: 0.75rem;
          letter-spacing: -0.01em;
        }

        .condition-item {
          display: flex;
          align-items: flex-start;
          gap: 1.5rem;
          margin-bottom: 2rem;
          padding: 1.5rem;
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          border-radius: var(--border-radius-md);
          transition: transform 0.3s ease;
        }

        .condition-item:hover {
          transform: translateX(5px);
        }

        .condition-icon {
          width: 50px;
          height: 50px;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1.2rem;
          flex-shrink: 0;
        }

        .condition-content {
          flex: 1;
          padding-top: 0.3rem;
        }

        .condition-label {
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 0.5rem;
          font-size: 1.1rem;
        }

        .condition-value {
          color: var(--color-text-secondary);
          font-size: 1rem;
          line-height: 1.6;
        }

        /* Book Details Section */
        .book-details-section {
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          padding: 4rem 0;
        }

        .details-title {
          font-family: var(--font-serif);
          font-size: 2.5rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 3rem;
          text-align: center;
          letter-spacing: -0.02em;
        }

        .details-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
          gap: 3rem;
        }

        .detail-card {
          background: var(--color-warm-white);
          padding: 2.5rem;
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-soft);
          border: 1px solid rgba(156, 175, 158, 0.1);
          transition: transform 0.3s ease;
        }

        .detail-card:hover {
          transform: translateY(-8px);
        }

        .detail-card-title {
          font-family: var(--font-serif);
          font-size: 1.4rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1.5rem;
          display: flex;
          align-items: center;
          gap: 0.75rem;
          letter-spacing: -0.01em;
        }

        .specs-table {
          width: 100%;
        }

        .specs-table tr {
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .specs-table tr:last-child {
          border-bottom: none;
        }

        .specs-table td {
          padding: 1rem 0;
          vertical-align: top;
        }

        .specs-table td:first-child {
          font-weight: 600;
          color: var(--color-charcoal);
          width: 120px;
        }

        .specs-table td:last-child {
          color: var(--color-text-secondary);
        }

        .exchange-history {
          list-style: none;
          padding: 0;
        }

        .history-item {
          display: flex;
          align-items: center;
          gap: 1.5rem;
          margin-bottom: 1.5rem;
          padding: 1.5rem;
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          border-radius: var(--border-radius-md);
          transition: transform 0.3s ease;
        }

        .history-item:hover {
          transform: translateX(5px);
        }

        .history-icon {
          width: 45px;
          height: 45px;
          background: linear-gradient(135deg, var(--color-terracotta), #C19660);
          color: var(--color-warm-white);
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1rem;
          flex-shrink: 0;
        }

        .history-content {
          flex: 1;
        }

        .history-text {
          font-weight: 500;
          color: var(--color-charcoal);
          margin-bottom: 0.3rem;
          font-size: 1rem;
        }

        .history-date {
          font-size: 0.9rem;
          color: var(--color-text-secondary);
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

          .detail-content {
            grid-template-columns: 1fr;
            gap: 3rem;
          }

          .book-image {
            width: 320px;
            height: 480px;
          }

          .book-title {
            font-size: 2rem;
          }

          .action-buttons {
            flex-direction: column;
          }

          .owner-info {
            flex-direction: column;
            text-align: center;
            gap: 1rem;
          }

          .details-grid {
            grid-template-columns: 1fr;
          }

          .condition-item {
            flex-direction: column;
            text-align: center;
            gap: 1rem;
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

        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="${path}">홈</a>
              <span class="breadcrumb-separator">›</span>
              <a href="${path}/trade/bookexchange">책 교환</a>
              <span class="breadcrumb-separator">›</span>
              <span>${vo.tradebook_title}</span>
            </nav>
          </div>
        </section>

        <section class="detail-container">
          <div class="container">
            <div class="detail-content">
              <div class="book-image-section">
                <img 
                  src="${pageContext.request.contextPath}/img${vo.tradebook_img}"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
              </div>

              <div class="book-info-section">
              <c:choose>
              	<c:when test="${vo.tradebook_trade == 'y'}">
                	<div class="exchange-status">교환 가능</div>
               	</c:when>
               	<c:otherwise>
               		<div class="exchange-status" style="background: linear-gradient(135deg, #9e9e9e, #757575);">교환 완료</div>
               	</c:otherwise>
              </c:choose>  
                <h1 class="book-title">${vo.tradebook_title}</h1>
                <p class="book-author">${vo.tradebook_author} 지음 | ${vo.tradebook_publication_date}</p>

                <div class="book-condition">
                  <div class="condition-badge">${vo.tradebook_status}</div>
                </div>

                <div class="book-description">
                  <h3 class="description-title">📖 교환자 한마디</h3>
                  <p class="description-text">
					${vo.tradebook_content}
                  </p>
                </div>

                <div class="owner-section">
                  <h3 class="owner-title">👤 교환 제안자</h3>
                  <div class="owner-info">
                    <div class="owner-details">
                      <div class="owner-name">${vo.member_nickname}님</div>
                      <div class="owner-location">📍 ${vo.tradebook_location}</div>
                      <div class="owner-rating">
                        <span class="stars">★★★★★</span>
                        <span>4.8점 (15회 교환)</span>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="action-buttons">
                  <c:if test="${empty sessionScope.userInfo || sessionScope.userInfo.member_num != vo.member_num}">
                    <a href="#" class="btn-large btn-chat" onclick="startChat(${vo.tradebook_num}); return false;">
                      💬 채팅하기
                    </a>
                  </c:if>
                </div>
              </div>
            </div>

            <div class="exchange-conditions">
              <h3 class="conditions-title">📋 교환 조건</h3>
              
              <div class="condition-item">
                <div class="condition-icon">📚</div>
                <div class="condition-content">
                  <div class="condition-label">희망 교환 도서</div>
                  <div class="condition-value">${vo.tradebook_condition}</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">📍</div>
                <div class="condition-content">
                  <div class="condition-label">교환 방식</div>
                  <div class="condition-value">${vo.tradebook_method}</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">⏰</div>
                <div class="condition-content">
                  <div class="condition-label">교환 가능 시간</div>
                  <div class="condition-value">${vo.tradebook_time}</div>
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
                      <td>${vo.tradebook_title}</td>
                    </tr>
                    <tr>
                      <td>저자</td>
                      <td>${vo.tradebook_author}</td>
                    </tr>
                    <tr>
                      <td>출간일</td>
                      <td>${vo.tradebook_publication_date}</td>
                    </tr>
                    <tr>
                      <td>ISBN</td>
                      <td>${vo.tradebook_isbn}</td>
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
</body>
	      <script>
        function startChat(tradebookNum) {
          fetch('${path}/chat/start', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'tradebook_num=' + encodeURIComponent(tradebookNum)
          }).then(res => {
            if (!res.ok) {
              if (res.status === 401) { alert('로그인 후 이용해주세요.'); location.href='${path}/member/login'; return null; }
              throw new Error('채팅 시작 실패');
            }
            return res.text();
          }).then(roomId => {
            if (!roomId) return;
            // 채팅 상세 페이지로 이동 (채팅방 자동 선택을 위해 파라미터 전달)
            location.href = '${path}/chat/chatroom?room=' + encodeURIComponent(roomId);
          }).catch(err => alert(err.message));
        }

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