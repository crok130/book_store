<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/adminregister.css">
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
              🛠️ BookBridge Admin
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
            이미 관리자 계정이 있으신가요? <a href="${path}/admin/adminregister">관리자 로그인</a>
          </div>
        </div>
      </div>
</body>
</html>