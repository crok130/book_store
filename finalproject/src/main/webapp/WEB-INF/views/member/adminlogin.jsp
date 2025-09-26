<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/adminlogin.css">
</head>
<body>
    <div class="login-container">
        <div class="back-links">
          <a href="/App.tsx" class="back-to-home">← 사용자 사이트</a>
          <a href="/components/AdminMainPage.tsx" class="back-to-admin">← 관리자 메인</a>
        </div>
        
        <div class="login-card">
          <div class="login-header">
            <div class="logo">
              🛠️ BookBridge Admin
              <span class="admin-badge">ADMIN</span>
            </div>
            <h1 class="login-title">관리자 로그인</h1>
            <p class="login-subtitle">관리자 계정으로 로그인하여 시스템을 관리하세요</p>
          </div>

          <div class="security-notice">
            <strong>🔒 보안 알림</strong>
            관리자 계정은 중요한 시스템 자원에 접근할 수 있습니다. 
            안전한 장소에서만 로그인하시기 바랍니다.
          </div>

          <form class="login-form" method="post" action="${path}/admin/login">
            <div class="form-group">
              <label class="form-label">관리자 아이디</label>
              <input
                type="text"
                class="form-input"
                name="member_id"
                placeholder="관리자 아이디를 입력하세요"
                required
              />
            </div>

            <div class="form-group">
              <label class="form-label">비밀번호</label>
              <input
                type="password"
                class="form-input"
                name="member_pw"
                placeholder="비밀번호를 입력하세요"
                required
              />
            </div>

            <div class="two-factor">
              <h4>🔐 2단계 인증</h4>
              <p>인증 앱에서 생성된 6자리 코드를 입력하세요</p>
              <input
                type="text"
                class="two-factor-input"
                placeholder="000000"
                maxLength="6"
                pattern="[0-9]{6}"
              />
            </div>

            <div class="form-options">
              <div class="checkbox-group">
                <input type="checkbox" id="remember" />
                <label htmlFor="remember">로그인 유지</label>
              </div>
              <a href="#" class="forgot-password">비밀번호 찾기</a>
            </div>

            <button type="submit" class="login-btn">
              관리자 로그인
            </button>
          </form>

          <div class="admin-info">
            <h4>🛡️ 관리자 권한</h4>
            <ul>
              <li>📊 시스템 통계 및 분석</li>
              <li>📚 도서 등록 및 관리</li>
              <li>👥 회원 및 주문 관리</li>
              <li>⚙️ 시스템 설정 관리</li>
            </ul>
          </div>

          <div class="signup-link">
            새 관리자 계정이 필요하신가요? <a href="${path}/admin/register">관리자 등록</a>
          </div>
        </div>
      </div>
</body>
</html>