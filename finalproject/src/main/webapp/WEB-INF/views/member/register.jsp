<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${path}/resources/css/register.css">
</head>
<body>
    <div class="register-container">
        <a href="${path}" class="back-to-home">← 홈으로</a>
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
            이미 계정이 있으신가요? <a href="${path}/member/longin">로그인</a>
          </div>
        </div>
      </div>
</body>
</html>