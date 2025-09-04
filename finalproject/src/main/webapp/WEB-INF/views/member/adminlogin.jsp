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

        .login-container {
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          padding: 2rem 1rem;
        }

        .login-card {
          background: white;
          border-radius: 12px;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
          padding: 3rem;
          width: 100%;
          max-width: 400px;
          text-align: center;
        }

        .login-header {
          margin-bottom: 2rem;
        }

        .logo {
          font-size: 2rem;
          font-weight: 700;
          color: #2c3e50;
          margin-bottom: 0.5rem;
          display: flex;
          align-items: center;
          justify-content: center;
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

        .login-title {
          color: #2c3e50;
          font-size: 1.8rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
        }

        .login-subtitle {
          color: #666;
          font-size: 0.95rem;
        }

        .security-notice {
          background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
          color: white;
          padding: 1rem;
          border-radius: 8px;
          margin: 1.5rem 0;
          font-size: 0.85rem;
          line-height: 1.4;
        }

        .security-notice strong {
          display: block;
          margin-bottom: 0.5rem;
        }

        .login-form {
          margin-bottom: 2rem;
        }

        .form-group {
          margin-bottom: 1.5rem;
          text-align: left;
        }

        .form-label {
          display: block;
          margin-bottom: 0.5rem;
          color: #2c3e50;
          font-weight: 600;
          font-size: 0.9rem;
        }

        .form-input {
          width: 100%;
          padding: 0.9rem;
          border: 2px solid #e9ecef;
          border-radius: 8px;
          font-size: 1rem;
          outline: none;
          transition: all 0.3s ease;
          background: #f8f9fa;
        }

        .form-input:focus {
          border-color: #2c3e50;
          background: white;
          box-shadow: 0 0 0 3px rgba(44, 62, 80, 0.1);
        }

        .form-options {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 2rem;
          font-size: 0.85rem;
        }

        .checkbox-group {
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .checkbox-group input[type="checkbox"] {
          margin: 0;
          accent-color: #2c3e50;
        }

        .forgot-password {
          color: #e74c3c;
          text-decoration: none;
          transition: color 0.3s ease;
        }

        .forgot-password:hover {
          color: #c0392b;
          text-decoration: underline;
        }

        .login-btn {
          width: 100%;
          padding: 1rem;
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
          border: none;
          border-radius: 8px;
          font-size: 1rem;
          font-weight: 600;
          cursor: pointer;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-btn:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(44, 62, 80, 0.4);
        }

        .two-factor {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 8px;
          margin: 2rem 0;
          text-align: left;
        }

        .two-factor h4 {
          color: #2c3e50;
          margin-bottom: 0.5rem;
          font-size: 1rem;
        }

        .two-factor p {
          color: #666;
          font-size: 0.85rem;
          margin-bottom: 1rem;
        }

        .two-factor-input {
          width: 100%;
          padding: 0.8rem;
          border: 2px solid #e9ecef;
          border-radius: 6px;
          font-size: 1.2rem;
          text-align: center;
          letter-spacing: 0.5rem;
          outline: none;
          transition: all 0.3s ease;
        }

        .two-factor-input:focus {
          border-color: #2c3e50;
          box-shadow: 0 0 0 3px rgba(44, 62, 80, 0.1);
        }

        .admin-info {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 8px;
          margin-bottom: 2rem;
          text-align: left;
        }

        .admin-info h4 {
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .admin-info ul {
          list-style: none;
          padding: 0;
        }

        .admin-info li {
          color: #666;
          font-size: 0.85rem;
          margin-bottom: 0.5rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .signup-link {
          color: #666;
          font-size: 0.9rem;
        }

        .signup-link a {
          color: #e74c3c;
          text-decoration: none;
          font-weight: 600;
          transition: color 0.3s ease;
        }

        .signup-link a:hover {
          color: #c0392b;
          text-decoration: underline;
        }

        .back-links {
          position: fixed;
          top: 2rem;
          left: 2rem;
          display: flex;
          gap: 1rem;
        }

        .back-to-home {
          background: rgba(255, 255, 255, 0.9);
          color: #2c3e50;
          padding: 0.7rem 1.2rem;
          border-radius: 8px;
          text-decoration: none;
          font-weight: 600;
          transition: all 0.3s ease;
          backdrop-filter: blur(10px);
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
          font-size: 0.9rem;
        }

        .back-to-home:hover {
          background: white;
          transform: translateY(-1px);
          box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .back-to-admin {
          background: rgba(231, 76, 60, 0.9);
          color: white;
          padding: 0.7rem 1.2rem;
          border-radius: 8px;
          text-decoration: none;
          font-weight: 600;
          transition: all 0.3s ease;
          backdrop-filter: blur(10px);
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
          font-size: 0.9rem;
        }

        .back-to-admin:hover {
          background: #e74c3c;
          transform: translateY(-1px);
          box-shadow: 0 6px 20px rgba(231, 76, 60, 0.3);
        }

        @media (max-width: 480px) {
          .login-card {
            padding: 2rem 1.5rem;
            margin: 1rem;
          }
          
          .back-links {
            top: 1rem;
            left: 1rem;
            flex-direction: column;
            gap: 0.5rem;
          }
          
          .back-to-home,
          .back-to-admin {
            padding: 0.6rem 1rem;
            font-size: 0.8rem;
          }
        }
	</style>
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
              🛠️ BookStore Admin
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

          <form class="login-form">
            <div class="form-group">
              <label class="form-label">관리자 이메일</label>
              <input
                type="email"
                class="form-input"
                placeholder="관리자 이메일을 입력하세요"
                required
              />
            </div>

            <div class="form-group">
              <label class="form-label">비밀번호</label>
              <input
                type="password"
                class="form-input"
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
            새 관리자 계정이 필요하신가요? <a href="/components/AdminRegisterPage.tsx">관리자 등록</a>
          </div>
        </div>
      </div>
</body>
</html>