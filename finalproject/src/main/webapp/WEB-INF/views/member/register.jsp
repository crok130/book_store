<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .register-container {
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          background: linear-gradient(135deg, var(--color-deep-blue) 0%, var(--color-charcoal) 100%);
          padding: 2rem 1rem;
          position: relative;
          overflow: hidden;
        }

        .register-container::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.4;
        }

        .register-card {
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-strong);
          padding: 3rem;
          width: 100%;
          max-width: 520px;
          text-align: center;
          position: relative;
          z-index: 2;
          backdrop-filter: blur(20px);
          border: 1px solid rgba(156, 175, 158, 0.1);
        }

        .register-header {
          margin-bottom: 2.5rem;
        }

        .logo {
          font-family: var(--font-serif);
          font-size: 2rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 1rem;
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 0.75rem;
          letter-spacing: -0.02em;
        }

        .logo::before {
          content: '📖';
          font-size: 1.5rem;
        }

        .register-title {
          font-family: var(--font-serif);
          color: var(--color-charcoal);
          font-size: 2.25rem;
          font-weight: 600;
          margin-bottom: 0.75rem;
          letter-spacing: -0.02em;
        }

        .register-subtitle {
          color: var(--color-text-secondary);
          font-size: 1rem;
          font-weight: 300;
          line-height: 1.6;
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
          margin-bottom: 0.75rem;
          color: var(--color-charcoal);
          font-weight: 600;
          font-size: 0.95rem;
          letter-spacing: -0.01em;
        }

        .form-label .required {
          color: var(--color-terracotta);
        }

        .form-input {
          width: 100%;
          padding: 1rem 1.25rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
          font-size: 1rem;
          outline: none;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
          color: var(--color-text-primary);
          font-family: var(--font-sans);
        }

        .form-input::placeholder {
          color: var(--color-text-secondary);
          font-style: italic;
        }

        .form-input:focus {
          border-color: var(--color-sage);
          background: var(--color-warm-white);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
        }

        .form-input-with-button {
          display: flex;
          gap: 0.75rem;
          align-items: stretch;
        }

        .form-input-with-button .form-input {
          flex: 1;
        }

        .verify-btn, .search-btn {
          padding: 0.75rem 1.25rem;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-md);
          cursor: pointer;
          font-weight: 600;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          white-space: nowrap;
          font-family: var(--font-sans);
          flex-shrink: 0;
        }

        .verify-btn:hover, .search-btn:hover {
          transform: translateY(-1px);
          box-shadow: var(--shadow-soft);
          background: linear-gradient(135deg, #8BB89B, #7DA079);
        }

        .verify-btn:active, .search-btn:active {
          transform: translateY(0);
        }

        .form-select {
          width: 100%;
          padding: 1rem 1.25rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
          font-size: 1rem;
          outline: none;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
          color: var(--color-text-primary);
          cursor: pointer;
          font-family: var(--font-sans);
        }

        .form-select:focus {
          border-color: var(--color-sage);
          background: var(--color-warm-white);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
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
          accent-color: var(--color-sage);
          flex-shrink: 0;
        }

        .checkbox-item.required {
          color: var(--color-charcoal);
          font-weight: 500;
        }

        .checkbox-item.optional {
          color: var(--color-text-secondary);
        }

        .checkbox-item a {
          color: var(--color-sage);
          text-decoration: none;
          font-weight: 500;
        }

        .checkbox-item a:hover {
          text-decoration: underline;
          color: var(--color-muted-green);
        }

        .register-btn {
          width: 100%;
          padding: 1.25rem;
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          border: none;
          border-radius: var(--border-radius-md);
          font-size: 1rem;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.3s ease;
          margin-bottom: 2rem;
          letter-spacing: -0.01em;
          font-family: var(--font-sans);
        }

        .register-btn:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
          background: linear-gradient(135deg, #8BB89B, #7DA079);
        }

        .register-btn:disabled {
          background: var(--color-text-secondary);
          cursor: not-allowed;
          transform: none;
          box-shadow: none;
          opacity: 0.6;
        }

        .divider {
          position: relative;
          margin: 2rem 0;
          text-align: center;
          font-size: 0.85rem;
          color: #666;
        }

        .divider::before {
          content: '';
          position: absolute;
          top: 50%;
          left: 0;
          right: 0;
          height: 1px;
          background: #e9ecef;
        }

        .divider span {
          background: var(--color-warm-white);
          padding: 0 1rem;
          color: var(--color-text-secondary);
        }

        .social-register {
          display: flex;
          flex-direction: column;
          gap: 1rem;
          margin-bottom: 2rem;
        }

        .social-btn {
          width: 100%;
          padding: 1rem;
          border: 2px solid rgba(156, 175, 158, 0.15);
          border-radius: var(--border-radius-md);
          background: var(--color-warm-white);
          color: var(--color-charcoal);
          font-weight: 600;
          cursor: pointer;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 0.75rem;
          font-family: var(--font-sans);
          letter-spacing: -0.01em;
        }

        .social-btn:hover {
          border-color: rgba(156, 175, 158, 0.3);
          background: rgba(156, 175, 158, 0.05);
          transform: translateY(-1px);
          box-shadow: var(--shadow-soft);
        }

        .login-link {
          color: var(--color-text-secondary);
          font-size: 0.95rem;
          font-weight: 300;
        }

        .login-link a {
          color: var(--color-sage);
          text-decoration: none;
          font-weight: 600;
          transition: color 0.3s ease;
        }

        .login-link a:hover {
          color: var(--color-muted-green);
          text-decoration: underline;
        }

        .back-to-home {
          position: fixed;
          top: 2rem;
          left: 2rem;
          background: rgba(254, 253, 251, 0.9);
          backdrop-filter: blur(20px);
          border: 1px solid rgba(156, 175, 158, 0.2);
          color: var(--color-charcoal);
          padding: 0.75rem 1.25rem;
          border-radius: var(--border-radius-lg);
          text-decoration: none;
          font-weight: 500;
          transition: all 0.3s ease;
          box-shadow: var(--shadow-soft);
          font-family: var(--font-sans);
          letter-spacing: -0.01em;
          z-index: 1000;
        }

        .back-to-home:hover {
          background: var(--color-warm-white);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
          border-color: rgba(156, 175, 158, 0.3);
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

          .form-input-with-button {
            flex-direction: column;
            gap: 0.5rem;
          }

          .verify-btn, .search-btn {
            width: 100%;
          }
          
          .back-to-home {
            top: 1rem;
            left: 1rem;
            padding: 0.6rem 1rem;
            font-size: 0.9rem;
          }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <a href="/App.tsx" class="back-to-home">← 홈으로</a>
        
        <div class="register-card">
          <div class="register-header">
            <div class="logo">BookStore</div>
            <h1 class="register-title">새로운 여정의 시작</h1>
            <p class="register-subtitle">문학적 경험을 나누고 새로운 이야기를 만들어 나가세요</p>
          </div>

          <form class="register-form">
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">이름 <span class="required">*</span></label>
                <input
                  type="text"
                  class="form-input"
                  placeholder="이름을 입력하세요"
                  required
                />
              </div>
              <div class="form-group">
                <label class="form-label">닉네임 <span class="required">*</span></label>
                <input
                  type="text"
                  class="form-input"
                  placeholder="닉네임을 입력하세요"
                  required
                />
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">이메일 <span class="required">*</span></label>
              <div class="form-input-with-button">
                <input
                  type="email"
                  class="form-input"
                  placeholder="이메일을 입력하세요"
                  required
                />
                <button type="button" class="verify-btn">인증번호 발송</button>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">이메일 인증번호 <span class="required">*</span></label>
              <input
                type="text"
                class="form-input"
                placeholder="인증번호를 입력하세요"
                required
              />
            </div>

            <div class="form-group">
              <label class="form-label">전화번호</label>
              <input
                type="tel"
                class="form-input"
                placeholder="전화번호를 입력하세요 (선택)"
              />
            </div>

            <div class="form-row">
              <div class="form-group">
                <label class="form-label">비밀번호 <span class="required">*</span></label>
                <input
                  type="password"
                  class="form-input"
                  placeholder="비밀번호를 입력하세요"
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

            <div class="form-group">
              <label class="form-label">생년월일</label>
              <input
                type="date"
                class="form-input"
              />
            </div>

            <div class="form-group">
              <label class="form-label">주소</label>
              <div class="form-input-with-button">
                <input
                  type="text"
                  class="form-input"
                  placeholder="주소를 검색하세요"
                  readonly
                />
                <button type="button" class="search-btn">주소찾기</button>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">상세주소</label>
              <input
                type="text"
                class="form-input"
                placeholder="상세주소를 입력하세요"
              />
            </div>

            <div class="terms-group">
              <div class="checkbox-item required">
                <input type="checkbox" id="terms" required />
                <label htmlFor="terms">
                  <a href="#">이용약관</a> 및 <a href="#">개인정보처리방침</a>에 동의합니다 (필수)
                </label>
              </div>
              <div class="checkbox-item required">
                <input type="checkbox" id="age" required />
                <label htmlFor="age">
                  만 14세 이상입니다 (필수)
                </label>
              </div>
              <div class="checkbox-item optional">
                <input type="checkbox" id="marketing" />
                <label htmlFor="marketing">
                  마케팅 정보 수신에 동의합니다 (선택)
                </label>
              </div>
              <div class="checkbox-item optional">
                <input type="checkbox" id="newsletter" />
                <label htmlFor="newsletter">
                  이메일 뉴스레터 수신에 동의합니다 (선택)
                </label>
              </div>
            </div>

            <button type="submit" class="register-btn">
              회원가입
            </button>
          </form>

          <div class="divider">
            <span>또는</span>
          </div>

          <div class="social-register">
            <button class="social-btn">
              <span>🌐</span>
              Google로 가입하기
            </button>
            <button class="social-btn">
              <span>💬</span>
              카카오로 가입하기
            </button>
          </div>

          <div class="login-link">
            이미 계정이 있으신가요? <a href="/components/LoginPage.tsx">로그인</a>
          </div>
        </div>
      </div>
</body>
</html>