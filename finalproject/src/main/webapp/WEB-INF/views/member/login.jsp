<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" href="${path}/resources/css/login.css">
</head>
<body>
 <script>
	
	if('${msg}' !== '' && '${msg}'!== null){
		alert("${msg}");
	}
</script>
     <div class="login-container">
        <a href="${path}/" class="back-to-home">← 홈으로</a>
        
        <div class="login-card">
          <div class="login-header">
            <div class="logo">BookStore</div>
            <h1 class="login-title">다시 만나뵙네요</h1>
            <p class="login-subtitle">문학적 여정을 이어가기 위해 로그인해 주세요</p>
          </div>

          <form class="login-form" method="POST" action="">
            <div class="form-group">
              <label class="form-label">아이디</label>
              <input
                type="text"
                class="form-input"
                placeholder="아이디를 입력하세요"
                required
                name="member_id"
              />
            </div>

            <div class="form-group">
              <label class="form-label">비밀번호</label>
              <input
                type="password"
                class="form-input"
                placeholder="비밀번호를 입력하세요"
                required
                name="member_pw"
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
              로그인
            </button>
          </form>

          <div class="divider">
            <span>또는</span>
          </div>

          <div class="social-login">
            <button class="social-btn">
              <span>🌐</span>
              Google로 로그인
            </button>
            <button class="social-btn">
              <span>💬</span>
              카카오로 로그인
            </button>
          </div>

          <div class="signup-link">
            아직 계정이 없으신가요? <a href="${path}/member/register">회원가입</a>
          </div>
        </div>
      </div>
</body>
</html>