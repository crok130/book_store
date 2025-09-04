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

        .register-container {
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          background: linear-gradient(135deg, #34495e 0%, #2c3e50 100%);
          padding: 2rem 1rem;
        }

        .register-card {
          background: white;
          border-radius: 12px;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
          padding: 3rem;
          width: 100%;
          max-width: 500px;
          text-align: center;
        }

        .register-header {
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

        .register-title {
          color: #2c3e50;
          font-size: 1.8rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
        }

        .register-subtitle {
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
          text-align: left;
        }

        .security-notice strong {
          display: block;
          margin-bottom: 0.5rem;
        }

        .register-form {
          margin-bottom: 1.5rem;
        }

        .form-row {
          display: flex;
          gap: 1rem;
          margin-bottom: 1.5rem;
        }

        .form-row .form-group {
          flex: 1;
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

        .form-label .required {
          color: #e74c3c;
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

        .form-select {
          width: 100%;
          padding: 0.9rem;
          border: 2px solid #e9ecef;
          border-radius: 8px;
          font-size: 1rem;
          outline: none;
          transition: all 0.3s ease;
          background: #f8f9fa;
          cursor: pointer;
        }

        .form-select:focus {
          border-color: #2c3e50;
          background: white;
          box-shadow: 0 0 0 3px rgba(44, 62, 80, 0.1);
        }

        .auth-setup {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 8px;
          margin-bottom: 2rem;
          text-align: left;
        }

        .auth-setup h4 {
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .auth-setup p {
          color: #666;
          font-size: 0.85rem;
          margin-bottom: 1rem;
        }

        .auth-steps {
          list-style: none;
          padding: 0;
        }

        .auth-steps li {
          color: #666;
          font-size: 0.85rem;
          margin-bottom: 0.5rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .terms-group {
          text-align: left;
          margin-bottom: 2rem;
        }

        .checkbox-item {
          display: flex;
          align-items: flex-start;
          gap: 0.75rem;
          margin-bottom: 1rem;
          font-size: 0.85rem;
          line-height: 1.4;
        }

        .checkbox-item input[type="checkbox"] {
          margin-top: 0.1rem;
          accent-color: #2c3e50;
          flex-shrink: 0;
        }

        .checkbox-item.required {
          color: #2c3e50;
          font-weight: 500;
        }

        .checkbox-item.admin {
          color: #e74c3c;
          font-weight: 600;
        }

        .checkbox-item.optional {
          color: #666;
        }

        .checkbox-item a {
          color: #e74c3c;
          text-decoration: none;
        }

        .checkbox-item a:hover {
          text-decoration: underline;
        }

        .register-btn {
          width: 100%;
          padding: 1rem;
          background: linear-gradient(135deg, #34495e 0%, #2c3e50 100%);
          color: white;
          border: none;
          border-radius: 8px;
          font-size: 1rem;
          font-weight: 600;
          cursor: pointer;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
          margin-bottom: 2rem;
        }

        .register-btn:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(52, 73, 94, 0.4);
        }

        .register-btn:disabled {
          background: #ccc;
          cursor: not-allowed;
          transform: none;
          box-shadow: none;
        }

        .admin-permissions {
          background: #f8f9fa;
          padding: 1.5rem;
          border-radius: 8px;
          margin-bottom: 2rem;
          text-align: left;
        }

        .admin-permissions h4 {
          color: #2c3e50;
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .permissions-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
          gap: 1rem;
        }

        .permission-item {
          background: white;
          padding: 1rem;
          border-radius: 6px;
          border: 1px solid #e9ecef;
        }

        .permission-title {
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 0.5rem;
          font-size: 0.9rem;
        }

        .permission-desc {
          color: #666;
          font-size: 0.8rem;
        }

        .login-link {
          color: #666;
          font-size: 0.9rem;
        }

        .login-link a {
          color: #e74c3c;
          text-decoration: none;
          font-weight: 600;
          transition: color 0.3s ease;
        }

        .login-link a:hover {
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

        @media (max-width: 520px) {
          .register-card {
            padding: 2rem 1.5rem;
            margin: 1rem;
          }
          
          .form-row {
            flex-direction: column;
            gap: 0;
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

          .permissions-grid {
            grid-template-columns: 1fr;
          }
        }
	</style>
</head>
<body>
      <div class="register-container">
        <div class="back-links">
          <a href="/App.tsx" class="back-to-home">← 사용자 사이트</a>
          <a href="/components/AdminMainPage.tsx" class="back-to-admin">← 관리자 메인</a>
        </div>
        
        <div class="register-card">
          <div class="register-header">
            <div class="logo">
              🛠️ BookStore Admin
              <span class="admin-badge">ADMIN</span>
            </div>
            <h1 class="register-title">관리자 등록</h1>
            <p class="register-subtitle">새로운 관리자 계정을 생성하여 시스템 관리 권한을 획득하세요</p>
          </div>

          <div class="security-notice">
            <strong>⚠️ 중요 보안 알림</strong>
            관리자 계정은 시스템의 모든 기능에 접근할 수 있습니다. 
            신뢰할 수 있는 사람에게만 관리자 권한을 부여하세요.
          </div>

          <form class="register-form">
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">이름 <span class="required">*</span></label>
                <input
                  type="text"
                  class="form-input"
                  placeholder="관리자 이름을 입력하세요"
                  required
                />
              </div>
              <div class="form-group">
                <label class="form-label">부서</label>
                <select class="form-select">
                  <option value="">부서 선택</option>
                  <option value="it">IT팀</option>
                  <option value="sales">영업팀</option>
                  <option value="marketing">마케팅팀</option>
                  <option value="management">경영진</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">관리자 이메일 <span class="required">*</span></label>
              <input
                type="email"
                class="form-input"
                placeholder="관리자 이메일을 입력하세요"
                required
              />
            </div>

            <div class="form-group">
              <label class="form-label">직급 <span class="required">*</span></label>
              <select class="form-select" required>
                <option value="">직급을 선택하세요</option>
                <option value="super_admin">최고 관리자</option>
                <option value="admin">시스템 관리자</option>
                <option value="content_manager">콘텐츠 관리자</option>
                <option value="customer_manager">고객 관리자</option>
              </select>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label class="form-label">비밀번호 <span class="required">*</span></label>
                <input
                  type="password"
                  class="form-input"
                  placeholder="강력한 비밀번호를 입력하세요"
                  required
                />
              </div>
              <div class="form-group">
                <label class="form-label">비밀번호 확인 <span class="required">*</span></label>
                <input
                  type="password"
                  class="form-input"
                  placeholder="비밀번호를 다시 입력하세요"
                  required
                />
              </div>
            </div>


            <div class="auth-setup">
              <h4>🔐 2단계 인증 설정</h4>
              <p>보안을 위해 2단계 인증을 설정해주세요:</p>
              <ol class="auth-steps">
                <li>1️⃣ Google Authenticator 또는 Microsoft Authenticator 설치</li>
                <li>2️⃣ QR 코드 스캔하여 계정 추가</li>
                <li>3️⃣ 생성된 6자리 코드로 인증 완료</li>
              </ol>
            </div>

            <div class="admin-permissions">
              <h4>🛡️ 관리자 권한 및 책임</h4>
              <div class="permissions-grid">
                <div class="permission-item">
                  <div class="permission-title">📚 도서 관리</div>
                  <div class="permission-desc">도서 등록, 수정, 삭제 권한</div>
                </div>
                <div class="permission-item">
                  <div class="permission-title">👥 회원 관리</div>
                  <div class="permission-desc">회원 정보 조회 및 관리</div>
                </div>
                <div class="permission-item">
                  <div class="permission-title">📊 통계 접근</div>
                  <div class="permission-desc">매출 및 운영 통계 열람</div>
                </div>
                <div class="permission-item">
                  <div class="permission-title">⚙️ 시스템 설정</div>
                  <div class="permission-desc">시스템 환경 설정 관리</div>
                </div>
              </div>
            </div>

            <div class="terms-group">
              <div class="checkbox-item admin">
                <input type="checkbox" id="admin-agreement" required />
                <label htmlFor="admin-agreement">
                  <strong>관리자 권한 및 책임에 대한 동의 (필수)</strong><br />
                  시스템 관리자로서의 책임과 의무를 이해하고 동의합니다.
                </label>
              </div>
              <div class="checkbox-item required">
                <input type="checkbox" id="terms" required />
                <label htmlFor="terms">
                  <a href="#">관리자 이용약관</a> 및 <a href="#">보안정책</a>에 동의합니다 (필수)
                </label>
              </div>
              <div class="checkbox-item required">
                <input type="checkbox" id="confidentiality" required />
                <label htmlFor="confidentiality">
                  고객 정보 보호 및 기밀 유지 서약에 동의합니다 (필수)
                </label>
              </div>
              <div class="checkbox-item optional">
                <input type="checkbox" id="notifications" />
                <label htmlFor="notifications">
                  시스템 알림 및 보안 업데이트 수신에 동의합니다 (선택)
                </label>
              </div>
            </div>

            <button type="submit" class="register-btn">
              관리자 계정 생성
            </button>
          </form>

          <div class="login-link">
            이미 관리자 계정이 있으신가요? <a href="/components/AdminLoginPage.tsx">관리자 로그인</a>
          </div>
        </div>
      </div>
</body>
</html>