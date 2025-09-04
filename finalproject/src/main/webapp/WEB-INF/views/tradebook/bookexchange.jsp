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

        .nav-menu a:hover {
          color: #2c3e50;
        }

        .nav-menu .active {
          color: #2c3e50;
          font-weight: 600;
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

        /* Hero Section */
        .hero-section {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          padding: 4rem 0;
          text-align: center;
        }

        .hero-title {
          font-size: 3rem;
          margin-bottom: 1rem;
          font-weight: 700;
        }

        .hero-subtitle {
          font-size: 1.3rem;
          margin-bottom: 2rem;
          opacity: 0.95;
          max-width: 600px;
          margin-left: auto;
          margin-right: auto;
        }

        .exchange-icon {
          font-size: 4rem;
          margin-bottom: 1rem;
          display: block;
        }

        /* Filter Section */
        .filter-section {
          background: white;
          padding: 2rem 0;
          box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .filter-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-wrap: wrap;
          gap: 1.5rem;
        }

        .filter-group {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .filter-label {
          font-weight: 600;
          color: #2c3e50;
          margin-right: 0.5rem;
        }

        .filter-select {
          padding: 0.6rem 1rem;
          border: 2px solid #e0e0e0;
          border-radius: 6px;
          background: white;
          color: #333;
          font-size: 0.9rem;
          outline: none;
          transition: border-color 0.3s ease;
        }

        .filter-select:focus {
          border-color: #667eea;
        }

        .search-filter {
          flex: 1;
          max-width: 400px;
        }

        .search-input {
          width: 100%;
          padding: 0.8rem 1rem;
          border: 2px solid #e0e0e0;
          border-radius: 6px;
          font-size: 1rem;
          outline: none;
          transition: border-color 0.3s ease;
        }

        .search-input:focus {
          border-color: #667eea;
        }

        /* Stats Section */
        .stats-section {
          background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          padding: 2rem 0;
        }

        .stats-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          gap: 2rem;
          text-align: center;
        }

        .stat-card {
          background: white;
          padding: 1.5rem;
          border-radius: 10px;
          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .stat-number {
          font-size: 2.5rem;
          font-weight: 700;
          color: #667eea;
          margin-bottom: 0.5rem;
        }

        .stat-label {
          color: #666;
          font-size: 0.95rem;
        }

        /* Books Grid Section */
        .books-section {
          padding: 3rem 0;
          background: white;
        }

        .section-header {
          text-align: center;
          margin-bottom: 3rem;
        }

        .section-title {
          font-size: 2.2rem;
          margin-bottom: 1rem;
          color: #2c3e50;
          font-weight: 600;
        }

        .section-subtitle {
          font-size: 1.1rem;
          color: #666;
          max-width: 600px;
          margin: 0 auto;
        }

        .books-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
          gap: 2rem;
          margin-top: 2rem;
        }

        .exchange-card {
          background: white;
          border-radius: 12px;
          overflow: hidden;
          box-shadow: 0 6px 20px rgba(0,0,0,0.1);
          transition: transform 0.3s ease, box-shadow 0.3s ease;
          cursor: pointer;
          border: 2px solid transparent;
          position: relative;
        }

        .exchange-card:hover {
          transform: translateY(-8px);
          box-shadow: 0 15px 35px rgba(0,0,0,0.15);
          border-color: #667eea;
        }

        .exchange-badge {
          position: absolute;
          top: 12px;
          left: 12px;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          padding: 0.4rem 0.8rem;
          border-radius: 20px;
          font-size: 0.75rem;
          font-weight: 600;
          z-index: 10;
        }

        .book-image {
          width: 100%;
          height: 220px;
          object-fit: cover;
          background: linear-gradient(45deg, #ddd 0%, #eee 100%);
        }

        .exchange-info {
          padding: 1.5rem;
        }

        .book-title {
          font-size: 1.1rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: #2c3e50;
          line-height: 1.4;
        }

        .book-author {
          color: #666;
          margin-bottom: 0.8rem;
          font-size: 0.9rem;
        }

        .book-condition {
          display: inline-block;
          background: #e8f5e8;
          color: #2d5d2d;
          padding: 0.3rem 0.6rem;
          border-radius: 15px;
          font-size: 0.75rem;
          font-weight: 600;
          margin-bottom: 0.8rem;
        }

        .book-condition.fair {
          background: #fff3cd;
          color: #856404;
        }

        .book-condition.poor {
          background: #f8d7da;
          color: #721c24;
        }

        .owner-info {
          display: flex;
          align-items: center;
          gap: 0.8rem;
          margin-bottom: 1rem;
        }

        .owner-avatar {
          width: 32px;
          height: 32px;
          border-radius: 50%;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-weight: 600;
          font-size: 0.8rem;
        }

        .owner-details {
          flex: 1;
        }

        .owner-name {
          font-weight: 600;
          color: #2c3e50;
          font-size: 0.9rem;
        }

        .owner-location {
          color: #666;
          font-size: 0.8rem;
        }

        .wants-section {
          border-top: 1px solid #eee;
          padding-top: 1rem;
          margin-top: 1rem;
        }

        .wants-label {
          font-size: 0.85rem;
          color: #666;
          margin-bottom: 0.5rem;
          font-weight: 500;
        }

        .wants-text {
          font-size: 0.9rem;
          color: #2c3e50;
          font-style: italic;
        }

        /* Category Pills */
        .category-filters {
          display: flex;
          gap: 0.8rem;
          margin: 2rem 0;
          flex-wrap: wrap;
          justify-content: center;
        }

        .category-pill {
          padding: 0.6rem 1.2rem;
          background: white;
          border: 2px solid #e0e0e0;
          border-radius: 25px;
          color: #666;
          text-decoration: none;
          font-weight: 500;
          transition: all 0.3s ease;
          cursor: pointer;
        }

        .category-pill:hover,
        .category-pill.active {
          background: #667eea;
          color: white;
          border-color: #667eea;
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

        /* How it works section */
        .how-it-works {
          background: #f8f9fa;
          padding: 3rem 0;
        }

        .steps-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
          margin-top: 2rem;
        }

        .step-card {
          text-align: center;
          padding: 2rem;
          background: white;
          border-radius: 12px;
          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .step-number {
          width: 60px;
          height: 60px;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1.5rem;
          font-weight: 700;
          margin: 0 auto 1rem;
        }

        .step-title {
          font-size: 1.2rem;
          font-weight: 600;
          margin-bottom: 0.8rem;
          color: #2c3e50;
        }

        .step-description {
          color: #666;
          line-height: 1.5;
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

          .hero-title {
            font-size: 2.2rem;
          }

          .filter-content {
            flex-direction: column;
            align-items: stretch;
          }

          .filter-group {
            justify-content: center;
          }

          .books-grid {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
          }

          .category-filters {
            justify-content: flex-start;
          }
        }
    </style>
</head>
<body>
    <div>
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/">홈</a></li>
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

        <section class="hero-section">
          <div class="container">
            <span class="exchange-icon">🔄</span>
            <h1 class="hero-title">책 물물교환</h1>
            <p class="hero-subtitle">
              더 이상 읽지 않는 책을 다른 독서 애호가들과 교환하세요.<br/>
              새로운 책을 발견하고, 독서 경험을 나누는 즐거움을 느껴보세요.
            </p>
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
                <div class="stat-number">523</div>
                <div class="stat-label">활성 사용자</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">892</div>
                <div class="stat-label">성공한 교환</div>
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
                  <option>기타</option>
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


        <section class="books-section">
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


            <div class="books-grid">
              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1755188977089-3bb40306d57f?w=400&h=300&fit=crop"
                  alt="해리 포터와 마법사의 돌"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">해리 포터와 마법사의 돌</h3>
                  <p class="book-author">J.K. 롤링</p>
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
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1660479123634-2c700dfbbbdb?w=400&h=300&fit=crop"
                  alt="코스모스"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">코스모스</h3>
                  <p class="book-author">칼 세이건</p>
                  <span class="book-condition">양호</span>
                  <div class="owner-info">
                    <div class="owner-avatar">이</div>
                    <div class="owner-details">
                      <div class="owner-name">이과학</div>
                      <div class="owner-location">부산 해운대구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"스티븐 호킹의 책이나 물리학 관련 도서"</div>
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

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1666281269793-da06484657e8?w=400&h=300&fit=crop"
                  alt="미적분학"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">미적분학 입문</h3>
                  <p class="book-author">제임스 스튜어트</p>
                  <span class="book-condition">최상</span>
                  <div class="owner-info">
                    <div class="owner-avatar">최</div>
                    <div class="owner-details">
                      <div class="owner-name">최수학</div>
                      <div class="owner-location">광주 북구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"선형대수학이나 통계학 교재"</div>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <div class="exchange-badge">교환 가능</div>
                <img 
                  src="https://images.unsplash.com/photo-1580121441575-41bcb5c6b47c?w=400&h=300&fit=crop"
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
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=300&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="book-image"
                />
                <div class="exchange-info">
                  <h3 class="book-title">달러구트 꿈 백화점</h3>
                  <p class="book-author">이미예</p>
                  <span class="book-condition">최상</span>
                  <div class="owner-info">
                    <div class="owner-avatar">윤</div>
                    <div class="owner-details">
                      <div class="owner-name">윤감성</div>
                      <div class="owner-location">울산 남구</div>
                    </div>
                  </div>
                  <div class="wants-section">
                    <div class="wants-label">원하는 책:</div>
                    <div class="wants-text">"무라카미 하루키 소설이나 감성 에세이"</div>
                  </div>
                </div>
              </div>

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
                  <span class="book-condition fair">보통</span>
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
            </div>
          </div>
        </section>


        <section class="how-it-works">
          <div class="container">
            <div class="section-header">
              <h2 class="section-title">교환 방법</h2>
              <p class="section-subtitle">간단한 3단계로 책 교환을 시작하세요</p>
            </div>
            <div class="steps-grid">
              <div class="step-card">
                <div class="step-number">1</div>
                <h3 class="step-title">책 등록하기</h3>
                <p class="step-description">교환하고 싶은 책의 정보와 상태, 원하는 책을 등록하세요.</p>
              </div>
              <div class="step-card">
                <div class="step-number">2</div>
                <h3 class="step-title">상대방 찾기</h3>
                <p class="step-description">내가 원하는 책을 가진 사람을 찾아 교환을 제안하세요.</p>
              </div>
              <div class="step-card">
                <div class="step-number">3</div>
                <h3 class="step-title">만나서 교환</h3>
                <p class="step-description">안전한 장소에서 만나 책 상태를 확인하고 교환하세요.</p>
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
                  <li><a href="#">교환 가이드</a></li>
                  <li><a href="#">안전 수칙</a></li>
                  <li><a href="#">FAQ</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">교환 정책</a></li>
                  <li><a href="#">신고하기</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>커뮤니티</h3>
                <ul>
                  <li><a href="#">교환 후기</a></li>
                  <li><a href="#">독서 모임</a></li>
                  <li><a href="#">추천 도서</a></li>
                  <li><a href="#">이벤트</a></li>
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