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
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
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
          color: white;
          text-decoration: none;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .admin-badge {
          background: #e74c3c;
          color: white;
          padding: 0.2rem 0.6rem;
          border-radius: 12px;
          font-size: 0.7rem;
          font-weight: 600;
        }

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 2rem;
        }

        .nav-menu a {
          text-decoration: none;
          color: rgba(255, 255, 255, 0.9);
          font-weight: 500;
          transition: color 0.3s ease;
        }

        .nav-menu a:hover {
          color: white;
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

        .btn-admin {
          background: #e74c3c;
          color: white;
        }

        .btn-admin:hover {
          background: #c0392b;
        }

        .btn-outline-admin {
          background: transparent;
          color: white;
          border: 2px solid rgba(255, 255, 255, 0.5);
        }

        .btn-outline-admin:hover {
          background: rgba(255, 255, 255, 0.1);
          border-color: white;
        }

        /* Hero Section */
        .hero-section {
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
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
          font-size: 1.2rem;
          margin-bottom: 2rem;
          opacity: 0.9;
          max-width: 600px;
          margin-left: auto;
          margin-right: auto;
        }

        .hero-actions {
          display: flex;
          gap: 1rem;
          justify-content: center;
          flex-wrap: wrap;
        }

        .btn-hero {
          padding: 1rem 2rem;
          font-size: 1.1rem;
          font-weight: 600;
          border-radius: 8px;
          cursor: pointer;
          transition: all 0.3s ease;
          text-decoration: none;
          display: inline-block;
        }

        .btn-hero-primary {
          background: #e74c3c;
          color: white;
          border: none;
        }

        .btn-hero-primary:hover {
          background: #c0392b;
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(231, 76, 60, 0.4);
        }

        .btn-hero-secondary {
          background: transparent;
          color: white;
          border: 2px solid rgba(255, 255, 255, 0.5);
        }

        .btn-hero-secondary:hover {
          background: rgba(255, 255, 255, 0.1);
          border-color: white;
          transform: translateY(-2px);
        }

        /* Stats Section */
        .stats-section {
          background: white;
          padding: 3rem 0;
        }

        .section-title {
          text-align: center;
          font-size: 2rem;
          margin-bottom: 2rem;
          color: #2c3e50;
          font-weight: 600;
        }

        .stats-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
          margin-top: 2rem;
        }

        .stat-card {
          background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
          padding: 2rem;
          border-radius: 12px;
          text-align: center;
          border: 2px solid transparent;
          transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .stat-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 10px 30px rgba(0,0,0,0.1);
          border-color: #2c3e50;
        }

        .stat-icon {
          font-size: 3rem;
          margin-bottom: 1rem;
          color: #2c3e50;
        }

        .stat-number {
          font-size: 2.5rem;
          font-weight: 700;
          color: #2c3e50;
          margin-bottom: 0.5rem;
        }

        .stat-label {
          font-size: 1rem;
          color: #666;
          font-weight: 500;
        }

        /* Quick Actions */
        .actions-section {
          background: #f8f9fa;
          padding: 3rem 0;
        }

        .actions-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
          gap: 2rem;
          margin-top: 2rem;
        }

        .action-card {
          background: white;
          padding: 2rem;
          border-radius: 12px;
          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
          transition: transform 0.3s ease, box-shadow 0.3s ease;
          cursor: pointer;
        }

        .action-card:hover {
          transform: translateY(-5px);
          box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .action-icon {
          font-size: 2.5rem;
          margin-bottom: 1rem;
          color: #2c3e50;
        }

        .action-title {
          font-size: 1.3rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
          color: #2c3e50;
        }

        .action-description {
          color: #666;
          margin-bottom: 1.5rem;
        }

        .action-link {
          color: #e74c3c;
          text-decoration: none;
          font-weight: 600;
          transition: color 0.3s ease;
        }

        .action-link:hover {
          color: #c0392b;
        }

        /* Recent Activity */
        .activity-section {
          background: white;
          padding: 3rem 0;
        }

        .activity-list {
          background: #f8f9fa;
          border-radius: 12px;
          padding: 2rem;
          margin-top: 2rem;
        }

        .activity-item {
          display: flex;
          align-items: center;
          padding: 1rem 0;
          border-bottom: 1px solid #e9ecef;
        }

        .activity-item:last-child {
          border-bottom: none;
        }

        .activity-icon {
          width: 40px;
          height: 40px;
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          margin-right: 1rem;
          font-size: 1rem;
        }

        .activity-content {
          flex: 1;
        }

        .activity-text {
          margin-bottom: 0.2rem;
          color: #2c3e50;
        }

        .activity-time {
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

          .hero-title {
            font-size: 2rem;
          }

          .hero-actions {
            flex-direction: column;
          }

          .stats-grid {
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          }

          .actions-grid {
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
              <a href="#" class="logo">
                🛠️ BookStore Admin
                <span class="admin-badge">ADMIN</span>
              </a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="#">관리자 소개</a></li>
                  <li><a href="#">기능 안내</a></li>
                  <li><a href="#">지원센터</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/AdminLoginPage.tsx" class="btn btn-outline-admin">관리자 로그인</a>
                <a href="/components/AdminRegisterPage.tsx" class="btn btn-admin">관리자 회원가입</a>
              </div>
            </div>
          </div>
        </header>

        {/* Hero Section */}
        <section class="hero-section">
          <div class="container">
            <h1 class="hero-title">BookStore 관리자</h1>
            <p class="hero-subtitle">
              효율적인 도서 관리와 고객 서비스를 위한 관리자 전용 플랫폼입니다. 
              다양한 관리 기능들을 살펴보고 체험해보세요.
            </p>
          </div>
        </section>

        {/* Stats Section */}
        <section class="stats-section">
          <div class="container">
            <h2 class="section-title">실시간 현황</h2>
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-icon">📚</div>
                <div class="stat-number">1,247</div>
                <div class="stat-label">등록된 도서</div>
              </div>
              <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-number">8,932</div>
                <div class="stat-label">총 회원 수</div>
              </div>
              <div class="stat-card">
                <div class="stat-icon">📦</div>
                <div class="stat-number">156</div>
                <div class="stat-label">오늘 주문</div>
              </div>
              <div class="stat-card">
                <div class="stat-icon">💰</div>
                <div class="stat-number">₩2,847,000</div>
                <div class="stat-label">오늘 매출</div>
              </div>
            </div>
          </div>
        </section>

        {/* Quick Actions */}
        <section class="actions-section">
          <div class="container">
            <h2 class="section-title">빠른 작업</h2>
            <div class="actions-grid">
              <div class="action-card">
                <div class="action-icon">📖</div>
                <h3 class="action-title">새 도서 등록</h3>
                <p class="action-description">새로운 도서를 시스템에 추가하고 관리하세요.</p>
                <a href="/components/AdminLoginPage.tsx" class="action-link">로그인하여 이용하기 →</a>
              </div>

              <div class="action-card">
                <div class="action-icon">📊</div>
                <h3 class="action-title">매출 분석</h3>
                <p class="action-description">매출 현황과 통계를 실시간으로 확인하세요.</p>
                <a href="/components/AdminLoginPage.tsx" class="action-link">로그인하여 이용하기 →</a>
              </div>

              <div class="action-card">
                <div class="action-icon">🛒</div>
                <h3 class="action-title">주문 관리</h3>
                <p class="action-description">고객 주문을 확인하고 배송 상태를 관리하세요.</p>
                <a href="/components/AdminLoginPage.tsx" class="action-link">로그인하여 이용하기 →</a>
              </div>

              <div class="action-card">
                <div class="action-icon">👤</div>
                <h3 class="action-title">회원 관리</h3>
                <p class="action-description">회원 정보를 조회하고 관리하세요.</p>
                <a href="/components/AdminLoginPage.tsx" class="action-link">로그인하여 이용하기 →</a>
              </div>
            </div>
          </div>
        </section>

        {/* Recent Activity */}
        <section class="activity-section">
          <div class="container">
            <h2 class="section-title">최근 활동</h2>
            <div class="activity-list">
              <div class="activity-item">
                <div class="activity-icon">📖</div>
                <div class="activity-content">
                  <div class="activity-text">새 도서 "클린 코드 2판"이 등록되었습니다.</div>
                  <div class="activity-time">5분 전</div>
                </div>
              </div>
              <div class="activity-item">
                <div class="activity-icon">👤</div>
                <div class="activity-content">
                  <div class="activity-text">새 회원 김도서님이 가입하였습니다.</div>
                  <div class="activity-time">12분 전</div>
                </div>
              </div>
              <div class="activity-item">
                <div class="activity-icon">🛒</div>
                <div class="activity-content">
                  <div class="activity-text">주문 #ORD-2024-0156이 완료되었습니다.</div>
                  <div class="activity-time">23분 전</div>
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
                <h3>관리자 안내</h3>
                <ul>
                  <li><a href="#">관리자 가이드</a></li>
                  <li><a href="#">시스템 요구사항</a></li>
                  <li><a href="#">보안 정책</a></li>
                  <li><a href="#">업데이트 내역</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>지원</h3>
                <ul>
                  <li><a href="#">기술 지원</a></li>
                  <li><a href="#">FAQ</a></li>
                  <li><a href="#">문의하기</a></li>
                  <li><a href="#">교육 자료</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>시스템 정보</h3>
                <ul>
                  <li><a href="#">서버 상태</a></li>
                  <li><a href="#">API 문서</a></li>
                  <li><a href="#">데이터베이스 현황</a></li>
                  <li><a href="#">백업 현황</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>사용자 사이트</h3>
                <ul>
                  <li><a href="/App.tsx">일반 사용자 사이트</a></li>
                  <li><a href="#">모바일 앱</a></li>
                  <li><a href="#">고객 센터</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 BookStore Admin. All rights reserved. | 관리자 전용 시스템</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>