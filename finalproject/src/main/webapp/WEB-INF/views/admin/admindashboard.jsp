<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${path}/resources/css/admindashboard.css">
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