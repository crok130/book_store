<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          line-height: 1.6;
          color: #333;
          background-color: #fafafa;
        }

        .container {
          max-width: 1200px;
          margin: 0 auto;
          padding: 0 20px;
        }

        /* Header */
        .header {
          background: #fff;
          box-shadow: 0 2px 10px rgba(0,0,0,0.1);
          position: sticky;
          top: 0;
          z-index: 100;
        }

        .header-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1rem 0;
        }

        .logo {
          font-size: 1.8rem;
          font-weight: 700;
          color: #2c3e50;
          text-decoration: none;
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

        .nav-menu a:hover,
        .nav-menu a.active {
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
          background: white;
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

        /* Main Content */
        .detail-container {
          background: white;
          padding: 2rem 0;
        }

        .detail-content {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 3rem;
          margin-bottom: 3rem;
        }

        /* Book Image Section */
        .book-image-section {
          display: flex;
          justify-content: center;
          align-items: flex-start;
        }

        .book-image {
          max-width: 350px;
          width: 100%;
          height: auto;
          border-radius: 12px;
          box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        /* Book Info Section */
        .book-info-section {
          padding: 1rem 0;
        }

        .exchange-status {
          background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
          color: white;
          padding: 0.4rem 1rem;
          border-radius: 20px;
          font-size: 0.8rem;
          font-weight: 600;
          display: inline-block;
          margin-bottom: 1rem;
        }

        .book-title {
          font-size: 2.2rem;
          font-weight: 700;
          color: #2c3e50;
          margin-bottom: 0.5rem;
          line-height: 1.3;
        }

        .book-author {
          font-size: 1.1rem;
          color: #666;
          margin-bottom: 1rem;
        }

        .book-condition {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          margin-bottom: 1.5rem;
        }

        .condition-badge {
          background: #3498db;
          color: white;
          padding: 0.3rem 0.8rem;
          border-radius: 15px;
          font-size: 0.8rem;
          font-weight: 600;
        }

        .condition-text {
          color: #666;
          font-size: 0.9rem;
        }

        .book-description {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 10px;
          margin-bottom: 2rem;
        }

        .description-title {
          font-size: 1.1rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1rem;
        }

        .description-text {
          color: #666;
          line-height: 1.6;
        }

        /* Owner Info */
        .owner-section {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 10px;
          margin-bottom: 2rem;
        }

        .owner-title {
          font-size: 1.1rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .owner-info {
          display: flex;
          align-items: center;
          gap: 1rem;
        }

        .owner-avatar {
          width: 60px;
          height: 60px;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-size: 1.5rem;
          font-weight: 600;
        }

        .owner-details {
          flex: 1;
        }

        .owner-name {
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 0.3rem;
        }

        .owner-location {
          color: #666;
          font-size: 0.9rem;
          margin-bottom: 0.3rem;
        }

        .owner-rating {
          display: flex;
          align-items: center;
          gap: 0.3rem;
          font-size: 0.8rem;
        }

        .stars {
          color: #f39c12;
        }

        /* Exchange Conditions */
        .exchange-conditions {
          background: white;
          border: 2px solid #e9ecef;
          border-radius: 10px;
          padding: 1.5rem;
          margin-bottom: 2rem;
        }

        .conditions-title {
          font-size: 1.1rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .condition-item {
          display: flex;
          align-items: center;
          gap: 0.8rem;
          margin-bottom: 0.8rem;
          padding: 0.8rem;
          background: #f8f9fa;
          border-radius: 8px;
        }

        .condition-icon {
          width: 35px;
          height: 35px;
          background: #667eea;
          color: white;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 0.9rem;
        }

        .condition-content {
          flex: 1;
        }

        .condition-label {
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 0.2rem;
        }

        .condition-value {
          color: #666;
          font-size: 0.9rem;
        }

        /* Action Buttons */
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
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 0.5rem;
        }

        .btn-exchange {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
        }

        .btn-exchange:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-chat {
          background: #27ae60;
          color: white;
        }

        .btn-chat:hover {
          background: #2ecc71;
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(39, 174, 96, 0.4);
        }

        /* Book Details */
        .book-details-section {
          background: white;
          padding: 2rem 0;
          border-top: 1px solid #e9ecef;
        }

        .details-title {
          font-size: 1.8rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 2rem;
          text-align: center;
        }

        .details-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
          gap: 2rem;
        }

        .detail-card {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 10px;
        }

        .detail-card-title {
          font-size: 1.1rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
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
          width: 100px;
        }

        .specs-table td:last-child {
          color: #666;
        }

        .exchange-history {
          list-style: none;
          padding: 0;
        }

        .history-item {
          display: flex;
          align-items: center;
          gap: 0.8rem;
          margin-bottom: 0.8rem;
          padding: 0.8rem;
          background: white;
          border-radius: 8px;
        }

        .history-icon {
          width: 35px;
          height: 35px;
          background: #27ae60;
          color: white;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 0.8rem;
        }

        .history-content {
          flex: 1;
        }

        .history-text {
          font-weight: 500;
          color: #2c3e50;
          margin-bottom: 0.2rem;
        }

        .history-date {
          font-size: 0.8rem;
          color: #666;
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

          .detail-content {
            grid-template-columns: 1fr;
            gap: 2rem;
          }

          .book-title {
            font-size: 1.8rem;
          }

          .action-buttons {
            flex-direction: column;
          }

          .owner-info {
            flex-direction: column;
            text-align: center;
          }

          .details-grid {
            grid-template-columns: 1fr;
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
                  <li><a href="/components/BookExchangePage.tsx" class="active">책 교환</a></li>
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
              <a href="/components/BookExchangePage.tsx">책 교환</a>
              <span class="breadcrumb-separator">></span>
              <span>달러구트 꿈 백화점</span>
            </nav>
          </div>
        </section>

        {/* Main Detail Section */}
        <section class="detail-container">
          <div class="container">
            <div class="detail-content">
              <div class="book-image-section">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=350&h=500&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
              </div>

              <div class="book-info-section">
                <div class="exchange-status">교환 가능</div>
                
                <h1 class="book-title">달러구트 꿈 백화점</h1>
                <p class="book-author">이미예 지음 | 팩토리나인 | 2020년 07월</p>

                <div class="book-condition">
                  <div class="condition-badge">상태 좋음</div>
                </div>

                <div class="book-description">
                  <h3 class="description-title">📖 교환자 한마디</h3>
                  <p class="description-text">
                    정말 재미있게 읽었던 책입니다! 상상력이 풍부하고 따뜻한 이야기라 
                    많은 분들이 읽어보셨으면 좋겠어요. 책 상태도 매우 깨끗하니 안심하고 교환하세요.
                  </p>
                </div>

                <div class="owner-section">
                  <h3 class="owner-title">👤 교환 제안자</h3>
                  <div class="owner-info">
                    <div class="owner-avatar">김</div>
                    <div class="owner-details">
                      <div class="owner-name">김독서님</div>
                      <div class="owner-location">📍 서울 강남구</div>
                      <div class="owner-rating">
                        <span class="stars">★★★★★</span>
                        <span>4.8점 (15회 교환)</span>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="action-buttons">
                  <button class="btn-large btn-exchange">
                    🔄 교환 신청하기
                  </button>
                  <button class="btn-large btn-chat">
                    💬 채팅하기
                  </button>
                </div>
              </div>
            </div>

            <div class="exchange-conditions">
              <h3 class="conditions-title">📋 교환 조건</h3>
              
              <div class="condition-item">
                <div class="condition-icon">📚</div>
                <div class="condition-content">
                  <div class="condition-label">희망 교환 도서</div>
                  <div class="condition-value">소설, 에세이, 자기계발서 (상태 무관)</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">📍</div>
                <div class="condition-content">
                  <div class="condition-label">교환 방식</div>
                  <div class="condition-value">직거래 (강남구 일대) 또는 택배거래 가능</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">⏰</div>
                <div class="condition-content">
                  <div class="condition-label">교환 가능 시간</div>
                  <div class="condition-value">평일 저녁, 주말 오후 (협의 가능)</div>
                </div>
              </div>

              <div class="condition-item">
                <div class="condition-icon">💬</div>
                <div class="condition-content">
                  <div class="condition-label">추가 사항</div>
                  <div class="condition-value">책갈피와 독서 노트 함께 드려요!</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Book Details Section */}
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
                      <td>달러구트 꿈 백화점</td>
                    </tr>
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
                      <td>2020년 07월</td>
                    </tr>
                    <tr>
                      <td>페이지</td>
                      <td>304쪽</td>
                    </tr>
                    <tr>
                      <td>ISBN</td>
                      <td>9791189909284</td>
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
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 BookStore. All rights reserved.</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>