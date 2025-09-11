<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
        <a href="${path}" class="back-to-home">← 홈으로</a>
        
        <div class="register-card">
          <div class="register-header">
            <div class="logo">BookStore</div>
            <h1 class="register-title">새로운 여정의 시작</h1>
            <p class="register-subtitle">문학적 경험을 나누고 새로운 이야기를 만들어 나가세요</p>
          </div>
          <form class="register-form" method="POST" action="${path}/member/register">
          	   <div class="form-group">
                <label class="form-label">아이디 <span class="required">*</span></label>
                <input
                  type="text"
                  name="member_id"
                  id="member_id"
                  class="form-input"
                  placeholder="아이디를 입력하세요"
                  autocomplete="off"
                  required
                />
                <button type="button" class="verify-btn" id="checkId" >아이디 중복 확인</button>
                <div class="result"></div>
              </div>
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">이름 <span class="required">*</span></label>
                <input
                  type="text"
                  name="member_name"
                  id="member_name"
                  class="form-input"
                  placeholder="이름을 입력하세요"
                  required
                />
              <div class="result"></div>
              </div>
              <div class="form-group">
                <label class="form-label">닉네임 <span class="required">*</span></label>
                <input
                  type="text"
                  class="form-input"
                  id="member_nickname"
                  name="member_nickname"
                  placeholder="닉네임을 입력하세요"
                  required
                />
                <div class="result"></div>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">이메일 <span class="required">*</span></label>
              <div class="form-input-with-button">
                <input
                  type="email"
                  id="member_email"
  				  name="member_email"
                  class="form-input"
                  placeholder="이메일을 입력하세요"
                  required
                />
                <input type="button" id="acceptEmail" class="verify-btn" value="인증번호 발송">
                <div class="result"></div>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">이메일 인증번호 <span class="required">*</span></label>
              <div class="form-input-with-button">
              <input
                type="text"
                id="memberCode" 
 				name="memberCode" 
                class="form-input"
                placeholder="인증번호를 입력하세요"
                required
              />
               <button type="button" id="emailAcceptBtn" class="verify-btn">인증번호 확인</button>
               </div>
               <div class="result"></div>
            </div>

            <div class="form-group">
              <label class="form-label">전화번호</label>
              <input
                type="tel"
                class="form-input"
                placeholder="전화번호를 입력하세요 (선택)"
                name="member_phone"
              />
            </div>

            <div class="form-row">
              <div class="form-group">
                <label class="form-label">비밀번호 <span class="required">*</span></label>
                <input
                  id="member_pw" 
                  name="member_pw"
                  type="password"
                  class="form-input"
                  placeholder="비밀번호를 입력하세요"
                  required
                />
              <div class="result"></div>
              </div>
              <div class="form-group">
                <label class="form-label">비밀번호 확인 <span class="required">*</span></label>
                <input
                  id="re_pw" 
                  name="re_pw"
                  type="password"
                  class="form-input"
                  placeholder="비밀번호를 다시 입력하세요"
                  required
                />
               <div class="result"></div>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">생년월일</label>
              <input
                type="date"
                class="form-input"
                name="member_birth"
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
                  id="member_addr1"
                  name="member_addr1"
                />
                <button type="button" class="search-btn" onclick="daumApiCode();">주소찾기</button>
              </div>
            </div>

            <div class="form-group">
              <label class="form-label">상세주소</label>
              <input
                type="text"
                class="form-input"
                placeholder="상세주소를 입력하세요"
                name="member_addr2"
                id="member_addr2"
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
            이미 계정이 있으신가요? <a href="${path}/member/login">로그인</a>
          </div>
        </div>
      </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function daumApiCode(){
			// 함수 실행 시 주소 검색창 오픈
		    new daum.Postcode({
		    	
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            console.log(data);
		            
		            let fullAddr = "";	// 최종 주소
		            let extraAddr = "";	// 조합형 주소(참조항목이 있을 시 주소에 추가)
		            
		            if(data.userSelectedType == "R" ){
		            	// 도로명 주소
		            	fullAddr = data.roadAddress; 
		            	
		            	if(data.bname != ''){
		            		// 법정 동명이 존재 하면
		            		extraAddr += data.bname;
		            	}
		            	
		            	if(data.buildingName != ''){
		            		extraAddr += (extraAddr != '') ? ", " + data.buildingName : data.buildingName;
		            	}
		            	
		            	fullAddr += (extraAddr != '') ? "("+extraAddr+")" : "";
		            	
		            }else{
		            	// jibun - 지번 주소 선택
		            	fullAddr = data.jibunAddress;
		            }
		            
		            document.getElementById("member_addr1").value = fullAddr;
		            document.getElementById("member_addr2").focus();
		            
 		        } // end oncomplete
		    
		    }).open();
		}
	</script>
		
	<script>	
		/*
			정규식 검사 및 AJAX 결과 메세지 출력 함수
			- el: 결과 메시지를 표시할 요소(예: <span class="result">)
			- val: 사용자가 입력한 값
			- regex: 검사할 정규표현식
			- message: 안내 문구(성공/실패 공용 문구)
			- ajax: 추가 서버 검사 함수(예: 아이디 중복 확인). 없으면 생략 가능
		*/
		// checkRegex(결과를 출력할 요소, 검증할 문자열, 정규표현식, 출력메세지, 서버요청 ajax 함수)
		function checkRegex(el, val, regex, message, ajax){
			if(!regex.test(val)){
				// 정규식 불일치 → 에러 메시지(빨간색)
				showMessage(el, message, false);
				return false;
			}else if(!ajax){
				// 정규식 통과 + 추가 ajax 없음 → 성공 메시지(초록색)
				showMessage(el, message, true);
				return true;
			}else{
				// 정규식 통과 + 추가 ajax 검사 실행
				ajax(el, val);
			}
		} // checkRegex
		
		// 유효성 검증 메세지 출력
		// shoMessage(메세지 출력 태그 요소, 출력 메세지, 사용가능 여부){
		function showMessage(el, msg, isCheck){
			el.innerHTML = `<span style="\${isCheck ? "color:green;" : "color:red;" }">\${msg}</span>`;
		}
		
		
		// 아이디 중복 검사 결과를 저장할 변수 boolMid
		let boolMid = false;
		// ID 영문숫자 포함 4~12자 이내(특문제외)
		var regexID = /^[0-9a-zA-Z]{4,12}$/;
		// 아이디 입력 요소
		let member_id = document.querySelector("#member_id");
		// "아이디 확인" 버튼 클릭 시 아이디 중복 검사 실행
		document.querySelector("#checkId").onclick = function(){
			// 같은 .form-froup 내의 .result 요소를 결과 표시 영역으로 사용
			let result = member_id.closest(".form-group").querySelector(".result");	
			checkMidAjax(result, member_id.value);
		};		
		// 중복 아이디 검사
		// element : 결과를 출력할 태그 요소
		// id : 사용가능(중복) 검사할 아이디
		function checkMidAjax(element, id){
			fetch("${path}/member/midCheck?member_id="+id)
			.then(res => res.json())
			.then(result => {
				// 중복 검사 결과
				console.log(result);
				boolMid = result;
				let msg = boolMid ? "사용가능한 아이디입니다." : "해당 아이디가 이미 존재합니다.";
				// 아이디 버튼 활성화 여부 스타일 지정
				showMessage(element, msg, boolMid);
			}).catch(err => {
				alert("서버 오류");
				console.log(err);
			});
		} // end checkMidAjax
		
		
		// 이름을 저장할 변수 boolName
		let boolName = false;
		// 한글 2~6자 이내
		var regexName = /^[\uac00-\ud7a3]{2,6}$/;
		
		let member_name = document.querySelector("#member_name");

		// member_name 입력 필드에 사용자가 데이터를 입력하면 이벤트 실행
		member_name.oninput = function(){
			let el = member_name.parentElement.querySelector(".result");
			boolName = checkRegex(el, member_name.value, regexName, "2~6자이내 한글로 작성");
			if(boolName) showMessage(el, "사용가능합니다.", true);
		}; // 이름 체크
		
		
		// 닉네임 중복 확인
		// 닉네임 중복검사 결과를 저장할 변수 boolMnick
		let boolMnick = false;		
		
		let member_nickname = document.querySelector("#member_nickname");
		member_nickname.addEventListener("input",function(e){
			let element = e.target.parentElement.querySelector(".result");
			nickname = member_nickname.value;
			console.log(nickname);
			checkMnickAjax(element, nickname);
		})
		
		
		// member_nick
		function checkMnickAjax(element, nickname){
		  fetch("${path}/member/mnickCheck?member_nickname=" + nickname)
		  .then(res => res.json())
		  .then(result => {
		    // 중복 검사 결과 반환
		    console.log(result);
		    boolMnick = result;
		    let msg = boolMnick ? "사용가능한 닉네임입니다." : "이미 사용중인 닉네임입니다.";
		    showMessage(element, msg, boolMnick); 
		  })
		  .catch(err => {
		    alert("서버 오류");
		    console.log(err);
		  });
		}
		
		
		// 이메일 검증
		// 사용 할 수 있는 이메일 인지 여부를 저장할 변수
		let boolMemail = false;
		
		let member_email = document.getElementById("member_email");
		
		var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		member_email.addEventListener("input", function(e){
			let val = member_email.value;
			console.log(val);
			let el = e.target.parentElement.querySelector(".result");
			console.log(el);
			let message = "올바른 이메일 형식이 아닙니다.";
			// 아이디(이메일) 작성란에 데이터를 변경하면 이메일 인증 버튼 비활성화

			document.querySelector("#acceptEmail").style.display = "none";
			
			boolMemail = checkRegex(el, val, regexEmail, message, checkMemailAjax);
		});
		
		// 중복 이메일 검사
		function checkMemailAjax(element, email){
			fetch("${path}/member/memailCheck?member_email="+email)
			.then(res => res.json())
			.then(result => {
				console.log(result);
				let msg = result ? "사용 가능한 이메일입니다." : "이미 존재하는 이메일입니다.";
				
				boolMemail = result; 
				
				let style = boolMemail ? "inline-block" : "none";
				
				document.querySelector("#acceptEmail").style.display = style;
				
				showMessage(element, msg, boolMemail);
				
			}).catch(err => alert("서버 오류"));
		} // end checkcehckMemailAjax
		
		// 이메일 코드 발송 및 결과 비교 확인
		// 발신 코드번호
		let emailCode = "";
		// email 코드 확인 여부를 저장할 변수 boolEmailCode
		let boolEmailCode = false;
		
		let acceptEmail = document.querySelector("#acceptEmail");
	
		
		acceptEmail.onclick = function(){
			if(!boolMemail){
				alert("이메일을 먼저 올바르게 작성해주세요.");
				return;
			}
			let email = member_email.value;
			console.log("발송할 이메일", email);
			
			fetch("${path}/member/checkEmail?member_email="+email)
			.then(res => res.text())
			.then(code =>{
				console.log("발신코드 : code", code);
				if(code){
					emailCode = code;
					alert("메일발송 완료\n메일을 확인해주세요.");
					acceptEmail.style.display = "block";
				}else{
					alert("메일 발송 실패\n관리자에게 문의하세요.");
				}			
			});			
		} // end #acceptEmail button
		
		let memberCode = document.getElementById("memberCode");
		
		document.getElementById("emailAcceptBtn").onclick = function(){
			if(emailCode != '' && emailCode == memberCode.value){
				boolEmailCode = true;
				alert("이메일 인증 완료");
				acceptEmail.style.display = "none";
			}else{
				boolEmailCode = false;
				alert("인증 코드를 다시 확인해 주세요.");
			}
		};
		
		// 비밀번호 확인
		// 비밀번호 검증 여부
		let boolPassword = false;
		// 특수문자 포함 비밀번호(12~18자)
		var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{12,18}$/;
		
		let member_pw = document.querySelector("#member_pw");
		
		member_pw.oninput = function(){
			// 결과를 출력할 result 태그 요소
			let el = member_pw.parentElement.querySelector(".result");
			let msg = "특수문자,숫자,영문 포함 12~18자 이내 작성";
			boolPassword = checkRegex(el, member_pw.value, regexPass, msg);
			
			if(boolPassword) showMessage(el, "사용가능한 비밀번호 입니다.", true);
		};
		
		// 비밀번호 확인(일치) 여부
		let boolPassCheck = false;
		
		let re_pw = document.querySelector("#re_pw");
		
		re_pw.oninput = function(){
			
			let el = re_pw.parentElement.querySelector(".result");
			// 비밀번호 입력란 확인 여부
			if(boolPassword){
				boolPassCheck = (re_pw.value == member_pw.value);
				let msg = boolPassCheck ? "비밀번호가 일치합니다." : "비밀번호가 일치하지 않습니다.";
				showMessage(el,msg, boolPassCheck);
			}else{
				showMessage(el, "비밀번호를 확인해 주세요.", false);
			}
		} // end 비밀번호 확인 check
		
		document.querySelector(".register-btn").onclick = function() {
			
			let member_addr1 = document.getElementById("member_addr1");
			let member_addr2 = document.getElementById("member_addr2");
	
			if(!boolMid){
				alert("아이디를 확인해 주세요.");
				member_id.focus(); // 아이디 작성란에 포커스
				return; // event 함수 종료
			}
			
			if(!boolName){
				alert("이름를 확인해 주세요.");
				member_name.focus(); // 아이디 작성란에 포커스
				return; // event 함수 종료
			}
			
			if(!boolMnick){
				alert("닉네임을 확인해 주세요.");
				member_nickname.focus();
				return;
			}
			
			if(!boolMemail){
				alert("이메일을 확인해 주세요.");
				member_email.focus();
				return;
			}
			
			if(!boolEmailCode){
				alert("이메일을 확인해 주세요.");
				memberCode.focus();
				return;
			}
			
			if(!boolPassCheck){
				alert("비빌번호를 확인해 주세요.");
				member_pw.focus();
				return;
			}
			
			if(member_addr1.value === ''&& member_addr2.value === ''){
				alert("주소지를 확인해 주세요.");
				return;
			}
			
			document.querySelector("#register-btn").submit();
			
		};
		
		
		
	</script>	
	
</body>
</html>
