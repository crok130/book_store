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
          background-color: #f8f9fa;
        }

        .dashboard-container {
          display: flex;
          min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
          width: 280px;
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
          padding: 2rem 0;
          position: fixed;
          height: 100vh;
          overflow-y: auto;
        }

        .sidebar-header {
          padding: 0 2rem 2rem;
          border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-logo {
          font-size: 1.5rem;
          font-weight: 700;
          color: white;
          text-decoration: none;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          margin-bottom: 0.5rem;
        }

        .admin-badge {
          background: #e74c3c;
          color: white;
          padding: 0.2rem 0.6rem;
          border-radius: 12px;
          font-size: 0.7rem;
          font-weight: 600;
        }

        .sidebar-user {
          font-size: 0.9rem;
          opacity: 0.8;
        }

        .sidebar-nav {
          padding: 2rem 0;
        }

        .nav-section {
          margin-bottom: 2rem;
        }

        .nav-section-title {
          padding: 0 2rem;
          font-size: 0.8rem;
          opacity: 0.6;
          text-transform: uppercase;
          letter-spacing: 1px;
          margin-bottom: 1rem;
        }

        .nav-menu {
          list-style: none;
        }

        .nav-item {
          margin-bottom: 0.2rem;
        }

        .nav-link {
          display: flex;
          align-items: center;
          gap: 1rem;
          padding: 1rem 2rem;
          color: rgba(255, 255, 255, 0.9);
          text-decoration: none;
          transition: all 0.3s ease;
          border-left: 3px solid transparent;
        }

        .nav-link:hover {
          background: rgba(255, 255, 255, 0.1);
          color: white;
          border-left-color: #e74c3c;
        }

        .nav-link.active {
          background: rgba(255, 255, 255, 0.15);
          color: white;
          border-left-color: #e74c3c;
        }

        .nav-icon {
          width: 20px;
          text-align: center;
          font-size: 1.2rem;
        }

        /* Main Content */
        .main-content {
          flex: 1;
          margin-left: 280px;
          background: #f8f9fa;
        }

        .main-header {
          background: white;
          padding: 1.5rem 2rem;
          border-bottom: 1px solid #e9ecef;
          box-shadow: 0 2px 4px rgba(0,0,0,0.04);
        }

        .header-top {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1rem;
        }

        .page-title {
          font-size: 1.8rem;
          font-weight: 600;
          color: #2c3e50;
        }

        .header-actions {
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
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }

        .btn-primary {
          background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
          color: white;
        }

        .btn-primary:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(231, 76, 60, 0.3);
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

        .breadcrumb {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
          color: #666;
        }

        .breadcrumb a {
          color: #2c3e50;
          text-decoration: none;
        }

        .breadcrumb a:hover {
          color: #e74c3c;
        }

        /* Dashboard Content */
        .dashboard-content {
          padding: 2rem;
        }

        /* Stats Cards */
        .stats-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 1.5rem;
          margin-bottom: 2rem;
        }

        .stat-card {
          background: white;
          padding: 1.5rem;
          border-radius: 10px;
          box-shadow: 0 2px 10px rgba(0,0,0,0.08);
          border-left: 4px solid #e74c3c;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        }

        .stat-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 1rem;
        }

        .stat-icon {
          width: 50px;
          height: 50px;
          background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
          border-radius: 10px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-size: 1.5rem;
        }

        .stat-number {
          font-size: 2rem;
          font-weight: 700;
          color: #2c3e50;
          margin-bottom: 0.5rem;
        }

        .stat-label {
          color: #666;
          font-size: 0.9rem;
        }

        .stat-change {
          font-size: 0.8rem;
          padding: 0.2rem 0.6rem;
          border-radius: 20px;
          font-weight: 500;
        }

        .stat-change.positive {
          background: #d4edda;
          color: #155724;
        }

        .stat-change.negative {
          background: #f8d7da;
          color: #721c24;
        }

        /* Quick Actions */
        .quick-actions {
          background: white;
          padding: 2rem;
          border-radius: 10px;
          box-shadow: 0 2px 10px rgba(0,0,0,0.08);
          margin-bottom: 2rem;
        }

        .section-title {
          font-size: 1.3rem;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 1.5rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .actions-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          gap: 1rem;
        }

        .action-btn {
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 2rem 1rem;
          background: #f8f9fa;
          border: 2px solid #e9ecef;
          border-radius: 10px;
          text-decoration: none;
          color: #2c3e50;
          transition: all 0.3s ease;
        }

        .action-btn:hover {
          background: white;
          border-color: #e74c3c;
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }

        .action-icon {
          font-size: 2.5rem;
          margin-bottom: 1rem;
          color: #2c3e50;
        }

        .action-title {
          font-weight: 600;
          margin-bottom: 0.5rem;
        }

        .action-desc {
          font-size: 0.8rem;
          color: #666;
          text-align: center;
        }

        /* Charts and Tables */
        .dashboard-grid {
          display: grid;
          grid-template-columns: 2fr 1fr;
          gap: 2rem;
          margin-bottom: 2rem;
        }

        .chart-card,
        .activity-card {
          background: white;
          padding: 2rem;
          border-radius: 10px;
          box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .chart-placeholder {
          height: 300px;
          background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
          border-radius: 8px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: #666;
          font-size: 1.1rem;
        }

        /* Activity Feed */
        .activity-item {
          display: flex;
          align-items: flex-start;
          gap: 1rem;
          padding: 1rem 0;
          border-bottom: 1px solid #f8f9fa;
        }

        .activity-item:last-child {
          border-bottom: none;
        }

        .activity-avatar {
          width: 40px;
          height: 40px;
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1rem;
          flex-shrink: 0;
        }

        .activity-content {
          flex: 1;
        }

        .activity-text {
          color: #2c3e50;
          margin-bottom: 0.2rem;
          font-size: 0.9rem;
        }

        .activity-time {
          color: #666;
          font-size: 0.8rem;
        }

        /* Recent Books Table */
        .books-table {
          background: white;
          padding: 2rem;
          border-radius: 10px;
          box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .table {
          width: 100%;
          border-collapse: collapse;
        }

        .table th,
        .table td {
          padding: 1rem;
          text-align: left;
          border-bottom: 1px solid #f8f9fa;
        }

        .table th {
          background: #f8f9fa;
          font-weight: 600;
          color: #2c3e50;
        }

        .book-info {
          display: flex;
          align-items: center;
          gap: 1rem;
        }

        .book-cover {
          width: 40px;
          height: 60px;
          border-radius: 4px;
          object-fit: cover;
          background: #e9ecef;
        }

        .book-details h4 {
          font-size: 0.9rem;
          margin-bottom: 0.2rem;
          color: #2c3e50;
        }

        .book-details p {
          font-size: 0.8rem;
          color: #666;
        }

        .status-badge {
          padding: 0.3rem 0.8rem;
          border-radius: 20px;
          font-size: 0.8rem;
          font-weight: 500;
        }

        .status-active {
          background: #d4edda;
          color: #155724;
        }

        .status-inactive {
          background: #f8d7da;
          color: #721c24;
        }

        /* Responsive */
        @media (max-width: 768px) {
          .sidebar {
            width: 100%;
            height: auto;
            position: static;
          }

          .main-content {
            margin-left: 0;
          }

          .dashboard-grid {
            grid-template-columns: 1fr;
          }

          .stats-grid {
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          }

          .actions-grid {
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          }

          .header-top {
            flex-direction: column;
            gap: 1rem;
            align-items: flex-start;
          }
        }
    </style>
</head>
<body>
         <div class="dashboard-container">
        {/* Sidebar */}
        <div class="sidebar">
          <div class="sidebar-header">
            <a href="/components/AdminMainPage.tsx" class="sidebar-logo">
              🛠️ BookStore Admin
              <span class="admin-badge">ADMIN</span>
            </a>
            <div class="sidebar-user">환영합니다, 관리자님</div>
          </div>

          <div class="sidebar-nav">
            <div class="nav-section">
              <div class="nav-section-title">메인</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="/components/AdminDashboard.tsx" class="nav-link active">
                    <span class="nav-icon">📊</span>
                    대시보드
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">도서 관리</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="/components/AddBookPage.tsx" class="nav-link">
                    <span class="nav-icon">📖</span>
                    새 도서 등록
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">📚</span>
                    도서 목록
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">🏷️</span>
                    카테고리 관리
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">운영 관리</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">👥</span>
                    회원 관리
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">🛒</span>
                    주문 관리
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">📦</span>
                    재고 관리
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">분석</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">💰</span>
                    매출 분석
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">📈</span>
                    통계 리포트
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">설정</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">⚙️</span>
                    시스템 설정
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/App.tsx" class="nav-link">
                    <span class="nav-icon">🌐</span>
                    사용자 사이트
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* Main Content */}
        <div class="main-content">
          <div class="main-header">
            <div class="header-top">
              <h1 class="page-title">관리자 대시보드</h1>
              <div class="header-actions">
                <a href="/components/AddBookPage.tsx" class="btn btn-primary">
                  📖 새 도서 등록
                </a>
                <a href="#" class="btn btn-outline">
                  📊 리포트 생성
                </a>
              </div>
            </div>
            <div class="breadcrumb">
              <a href="/components/AdminMainPage.tsx">홈</a>
              <span>/</span>
              <span>대시보드</span>
            </div>
          </div>

          <div class="dashboard-content">
            {/* Stats Grid */}
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">📚</div>
                  <div class="stat-change positive">+12.5%</div>
                </div>
                <div class="stat-number">1,247</div>
                <div class="stat-label">총 등록 도서</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">👥</div>
                  <div class="stat-change positive">+8.2%</div>
                </div>
                <div class="stat-number">8,932</div>
                <div class="stat-label">총 회원 수</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">📦</div>
                  <div class="stat-change positive">+23.1%</div>
                </div>
                <div class="stat-number">156</div>
                <div class="stat-label">오늘 주문</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">💰</div>
                  <div class="stat-change negative">-3.4%</div>
                </div>
                <div class="stat-number">₩2,847,000</div>
                <div class="stat-label">오늘 매출</div>
              </div>
            </div>

            {/* Quick Actions */}
            <div class="quick-actions">
              <h2 class="section-title">
                ⚡ 빠른 작업
              </h2>
              <div class="actions-grid">
                <a href="/components/AddBookPage.tsx" class="action-btn">
                  <div class="action-icon">📖</div>
                  <div class="action-title">새 도서 등록</div>
                  <div class="action-desc">새로운 도서를 시스템에 추가</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">🛒</div>
                  <div class="action-title">주문 처리</div>
                  <div class="action-desc">대기 중인 주문 확인</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">👤</div>
                  <div class="action-title">회원 관리</div>
                  <div class="action-desc">신규 회원 및 문의 확인</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">📊</div>
                  <div class="action-title">매출 분석</div>
                  <div class="action-desc">실시간 매출 현황 조회</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">🏷️</div>
                  <div class="action-title">이벤트 관리</div>
                  <div class="action-desc">할인 이벤트 생성 및 관리</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">⚙️</div>
                  <div class="action-title">시스템 설정</div>
                  <div class="action-desc">사이트 설정 및 권한 관리</div>
                </a>
              </div>
            </div>

            {/* Charts and Activity */}
            <div class="dashboard-grid">
              <div class="chart-card">
                <h2 class="section-title">
                  📈 매출 현황
                </h2>
                <div class="chart-placeholder">
                  📊 매출 차트가 여기에 표시됩니다
                </div>
              </div>

              <div class="activity-card">
                <h2 class="section-title">
                  🔔 최근 활동
                </h2>
                <div class="activity-item">
                  <div class="activity-avatar">📖</div>
                  <div class="activity-content">
                    <div class="activity-text">새 도서 "클린 코드 2판"이 등록되었습니다.</div>
                    <div class="activity-time">5분 전</div>
                  </div>
                </div>
                <div class="activity-item">
                  <div class="activity-avatar">👤</div>
                  <div class="activity-content">
                    <div class="activity-text">새 회원 김도서님이 가입했습니다.</div>
                    <div class="activity-time">12분 전</div>
                  </div>
                </div>
                <div class="activity-item">
                  <div class="activity-avatar">🛒</div>
                  <div class="activity-content">
                    <div class="activity-text">주문 #ORD-2024-0156이 완료되었습니다.</div>
                    <div class="activity-time">23분 전</div>
                  </div>
                </div>
                <div class="activity-item">
                  <div class="activity-avatar">💰</div>
                  <div class="activity-content">
                    <div class="activity-text">일일 매출 목표 120% 달성했습니다.</div>
                    <div class="activity-time">1시간 전</div>
                  </div>
                </div>
                <div class="activity-item">
                  <div class="activity-avatar">🏷️</div>
                  <div class="activity-content">
                    <div class="activity-text">신년 할인 이벤트가 시작되었습니다.</div>
                    <div class="activity-time">2시간 전</div>
                  </div>
                </div>
              </div>
            </div>

            {/* Recent Books Table */}
            <div class="books-table">
              <h2 class="section-title">
                📚 최근 등록된 도서
              </h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>도서 정보</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>상태</th>
                    <th>등록일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="book-info">
                        <img 
                          src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=40&h=60&fit=crop"
                          alt="달러구트 꿈 백화점"
                          class="book-cover"
                        />
                        <div class="book-details">
                          <h4>달러구트 꿈 백화점</h4>
                          <p>이미예 | 팩토리나인</p>
                        </div>
                      </div>
                    </td>
                    <td>13,320원</td>
                    <td>42권</td>
                    <td><span class="status-badge status-active">판매중</span></td>
                    <td>2024-01-15</td>
                  </tr>
                  <tr>
                    <td>
                      <div class="book-info">
                        <img 
                          src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=40&h=60&fit=crop"
                          alt="세이노의 가르침"
                          class="book-cover"
                        />
                        <div class="book-details">
                          <h4>세이노의 가르침</h4>
                          <p>세이노 | 데이원</p>
                        </div>
                      </div>
                    </td>
                    <td>6,480원</td>
                    <td>23권</td>
                    <td><span class="status-badge status-active">판매중</span></td>
                    <td>2024-01-14</td>
                  </tr>
                  <tr>
                    <td>
                      <div class="book-info">
                        <img 
                          src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=40&h=60&fit=crop"
                          alt="클린 코드"
                          class="book-cover"
                        />
                        <div class="book-details">
                          <h4>클린 코드</h4>
                          <p>로버트 C. 마틴 | 인사이트</p>
                        </div>
                      </div>
                    </td>
                    <td>31,500원</td>
                    <td>0권</td>
                    <td><span class="status-badge status-inactive">품절</span></td>
                    <td>2024-01-13</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
</body>
</html>