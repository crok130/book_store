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

        .container {
          max-width: 1200px;
          margin: 0 auto;
          padding: 0 20px;
        }

        /* Header */
        .header {
          background: #fff;
          box-shadow: 0 2px 10px rgba(0,0,0,0.1);
          position: sticky;
          top: 0;
          z-index: 100;
        }

        .header-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1rem 0;
        }

        .logo {
          font-size: 1.8rem;
          font-weight: 700;
          color: #2c3e50;
          text-decoration: none;
        }

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 2rem;
        }

        .nav-menu a {
          text-decoration: none;
          color: #666;
          font-weight: 500;
          transition: color 0.3s ease;
        }

        .nav-menu a:hover,
        .nav-menu a.active {
          color: #2c3e50;
        }

        .user-actions {
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
          display: inline-block;
        }

        .btn-primary {
          background: #2c3e50;
          color: white;
        }

        .btn-primary:hover {
          background: #34495e;
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

        /* Breadcrumb */
        .breadcrumb {
          background: white;
          padding: 1rem 0;
          border-bottom: 1px solid #e9ecef;
        }

        .breadcrumb-nav {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
          color: #666;
        }

        .breadcrumb-nav a {
          color: #667eea;
          text-decoration: none;
          transition: color 0.3s ease;
        }

        .breadcrumb-nav a:hover {
          color: #5a6fd8;
        }

        .breadcrumb-separator {
          color: #999;
        }

        /* Main Content */
        .main-content {
          background: #fafafa;
          padding: 3rem 0;
        }

        .create-container {
          max-width: 800px;
          margin: 0 auto;
          background: white;
          border-radius: 12px;
          box-shadow: 0 8px 25px rgba(0,0,0,0.1);
          overflow: hidden;
        }

        .create-header {
          background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
          color: white;
          padding: 2rem;
          text-align: center;
        }

        .create-title {
          font-size: 2rem;
          font-weight: 600;
          margin-bottom: 0.5rem;
        }

        .create-subtitle {
          font-size: 1rem;
          opacity: 0.9;
        }

        .create-form {
          padding: 2.5rem;
        }

        .form-section {
          margin-bottom: 2.5rem;
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

        .form-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1.5rem;
        }

        .form-group {
          margin-bottom: 1.5rem;
        }

        .form-group.full-width {
          grid-column: 1 / -1;
        }

        .form-label {
          display: block;
          font-weight: 600;
          color: #2c3e50;
          margin-bottom: 0.5rem;
          font-size: 0.95rem;
        }

        .required {
          color: #e74c3c;
          margin-left: 0.3rem;
        }

        .form-input,
        .form-textarea,
        .form-select {
          width: 100%;
          padding: 0.8rem 1rem;
          border: 2px solid #e9ecef;
          border-radius: 8px;
          font-size: 1rem;
          transition: all 0.3s ease;
          background: white;
          outline: none;
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
          border-color: #27ae60;
          box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
        }

        .form-textarea {
          resize: vertical;
          min-height: 120px;
          font-family: inherit;
        }

        .form-textarea.large {
          min-height: 150px;
        }

        .form-select {
          cursor: pointer;
          background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
          background-position: right 0.75rem center;
          background-repeat: no-repeat;
          background-size: 1rem;
          padding-right: 2.5rem;
          appearance: none;
        }

        .form-help {
          font-size: 0.85rem;
          color: #666;
          margin-top: 0.5rem;
        }

        /* Image Upload */
        .image-upload-area {
          border: 2px dashed #d1d5db;
          border-radius: 8px;
          padding: 2rem;
          text-align: center;
          background: #f9fafb;
          transition: all 0.3s ease;
          cursor: pointer;
        }

        .image-upload-area:hover {
          border-color: #27ae60;
          background: #f0f9ff;
        }

        .image-upload-icon {
          font-size: 3rem;
          color: #9ca3af;
          margin-bottom: 1rem;
        }

        .image-upload-text {
          font-size: 1rem;
          color: #374151;
          margin-bottom: 0.5rem;
        }

        .image-upload-hint {
          font-size: 0.85rem;
          color: #6b7280;
        }

        .image-input {
          display: none;
        }

        /* Exchange Method Pills */
        .exchange-methods {
          display: flex;
          gap: 1rem;
        }

        .method-option {
          display: none;
        }

        .method-label {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          padding: 0.8rem 1.5rem;
          border: 2px solid #e9ecef;
          border-radius: 25px;
          cursor: pointer;
          transition: all 0.3s ease;
          font-weight: 500;
          background: white;
        }

        .method-option:checked + .method-label {
          border-color: #27ae60;
          background: #27ae60;
          color: white;
        }

        .method-label:hover {
          border-color: #27ae60;
        }

        /* Condition Pills */
        .condition-options {
          display: flex;
          flex-wrap: wrap;
          gap: 0.8rem;
        }

        .condition-option {
          display: none;
        }

        .condition-label {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          padding: 0.6rem 1.2rem;
          border: 2px solid #e9ecef;
          border-radius: 20px;
          cursor: pointer;
          transition: all 0.3s ease;
          font-weight: 500;
          background: white;
          font-size: 0.9rem;
        }

        .condition-option:checked + .condition-label {
          border-color: #3498db;
          background: #3498db;
          color: white;
        }

        .condition-label:hover {
          border-color: #3498db;
        }

        /* Action Buttons */
        .form-actions {
          display: flex;
          gap: 1rem;
          justify-content: flex-end;
          padding-top: 2rem;
          border-top: 2px solid #f1f3f4;
          margin-top: 2rem;
        }

        .btn-large {
          padding: 1rem 2rem;
          font-size: 1.1rem;
          font-weight: 600;
          border-radius: 8px;
          cursor: pointer;
          transition: all 0.3s ease;
          border: none;
          min-width: 140px;
        }

        .btn-cancel {
          background: #6c757d;
          color: white;
        }

        .btn-cancel:hover {
          background: #5a6268;
        }

        .btn-save {
          background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
          color: white;
        }

        .btn-save:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(39, 174, 96, 0.4);
        }

        /* Footer */
        .footer {
          background: #1a252f;
          color: white;
          padding: 3rem 0 2rem;
        }

        .footer-content {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
          margin-bottom: 2rem;
        }

        .footer-section h3 {
          margin-bottom: 1rem;
          color: white;
        }

        .footer-section ul {
          list-style: none;
        }

        .footer-section ul li {
          margin-bottom: 0.5rem;
        }

        .footer-section ul li a {
          color: #bbb;
          text-decoration: none;
        }

        .footer-bottom {
          border-top: 1px solid #333;
          padding-top: 2rem;
          text-align: center;
          color: #bbb;
        }

        /* Responsive */
        @media (max-width: 768px) {
          .header-content {
            flex-direction: column;
            gap: 1rem;
          }

          .nav-menu {
            gap: 1rem;
          }

          .form-grid {
            grid-template-columns: 1fr;
          }

          .create-form {
            padding: 1.5rem;
          }

          .form-actions {
            flex-direction: column;
          }

          .btn-large {
            width: 100%;
          }

          .exchange-methods {
            flex-direction: column;
          }

          .condition-options {
            justify-content: center;
          }
        }
    </style>
</head>
<body>
      <div>
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/App.tsx" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/App.tsx">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="/components/BookExchangePage.tsx" class="active">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/LoginPage.tsx" class="btn btn-outline">로그인</a>
                <a href="/components/RegisterPage.tsx" class="btn btn-primary">회원가입</a>
              </div>
            </div>
          </div>
        </header>

        {/* Breadcrumb */}
        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="/App.tsx">홈</a>
              <span class="breadcrumb-separator">></span>
              <a href="/components/BookExchangePage.tsx">책 교환</a>
              <span class="breadcrumb-separator">></span>
              <span>교환 글 등록</span>
            </nav>
          </div>
        </section>

        {/* Main Content */}
        <main class="main-content">
          <div class="container">
            <div class="create-container">
              <div class="create-header">
                <h1 class="create-title">📚 책 교환 글 등록</h1>
                <p class="create-subtitle">다른 독서 애호가들과 책을 교환해보세요</p>
              </div>

              <form class="create-form">
                {/* 책 정보 */}
                <div class="form-section">
                  <h2 class="section-title">📖 교환할 책 정보</h2>
                  <div class="form-grid">
                    <div class="form-group full-width">
                      <label for="book-title" class="form-label">
                        책 제목<span class="required">*</span>
                      </label>
                      <input 
                        type="text" 
                        id="book-title" 
                        name="book-title" 
                        class="form-input" 
                        placeholder="교환할 책의 제목을 입력하세요"
                        required
                      />
                    </div>

                    <div class="form-group">
                      <label for="author" class="form-label">
                        저자<span class="required">*</span>
                      </label>
                      <input 
                        type="text" 
                        id="author" 
                        name="author" 
                        class="form-input" 
                        placeholder="저자명을 입력하세요"
                        required
                      />
                    </div>

                    <div class="form-group">
                      <label for="publication-date" class="form-label">
                        출간일
                      </label>
                      <input 
                        type="date" 
                        id="publication-date" 
                        name="tradebook_publication_date" 
                        class="form-input"
                      />
                    </div>

                    <div class="form-group full-width">
                      <label for="book-condition" class="form-label">
                        책 상태<span class="required">*</span>
                      </label>
                      <div class="condition-options">
                        <input type="radio" id="condition-new" name="tradebook_status" value="새책" class="condition-option" required>
                        <label for="condition-new" class="condition-label">
                          ✨ 새 책
                        </label>
                        
                        <input type="radio" id="condition-excellent" name="tradebook_status" value="매우좋음" class="condition-option">
                        <label for="condition-excellent" class="condition-label">
                          👍 매우좋음
                        </label>

                        <input type="radio" id="condition-good" name="tradebook_status" value="좋음" class="condition-option">
                        <label for="condition-good" class="condition-label">
                          😊 좋음
                        </label>

                        <input type="radio" id="condition-fair" name="tradebook_status" value="보통" class="condition-option">
                        <label for="condition-fair" class="condition-label">
                          🤔 보통
                        </label>

                        <input type="radio" id="condition-poor" name="tradebook_status" value="낡음" class="condition-option">
                        <label for="condition-poor" class="condition-label">
                          😅 낡음
                        </label>
                      </div>
                    </div>
                  </div>
                </div>

                {/* 책 이미지 업로드 */}
                <div class="form-section">
                  <h2 class="section-title">📷 책 사진</h2>
                  <div class="form-group">
                    <label for="book-image" class="form-label">
                      책 이미지<span class="required">*</span>
                    </label>
                    <div class="image-upload-area" onclick="document.getElementById('book-image').click()">
                      <div class="image-upload-icon">📚</div>
                      <div class="image-upload-text">클릭하여 책 사진 업로드</div>
                      <div class="image-upload-hint">JPG, PNG 파일 (최대 5MB)</div>
                    </div>
                    <input 
                      type="file" 
                      id="book-image" 
                      name="book-image" 
                      class="image-input" 
                      accept="image/jpeg,image/png"
                      required
                    />
                    <div class="form-help">책의 상태를 잘 보여주는 사진을 올려주세요.</div>
                  </div>
                </div>

                {/* 교환 조건 */}
                <div class="form-section">
                  <h2 class="section-title">🔄 교환 조건</h2>
                  <div class="form-grid">
                    <div class="form-group full-width">
                      <label for="wanted-books" class="form-label">
                        원하는 책<span class="required">*</span>
                      </label>
                      <textarea 
                        id="wanted-books" 
                        name="wanted-books" 
                        class="form-textarea" 
                        placeholder="예) 소설, 에세이, 자기계발서 (상태 무관)"
                        required
                      ></textarea>
                      <div class="form-help">교환을 원하는 책의 장르, 종류, 조건 등을 자세히 적어주세요.</div>
                    </div>

                    <div class="form-group full-width">
                      <label for="exchange-method" class="form-label">
                        교환 방식<span class="required">*</span>
                      </label>
                      <div class="exchange-methods">
                        <input type="radio" id="direct-exchange" name="tradebook_method" value="직거래" class="method-option" required>
                        <label for="direct-exchange" class="method-label">
                          🤝 직거래
                        </label>

                        <input type="radio" id="delivery-exchange" name="tradebook_method" value="택배거래" class="method-option">
                        <label for="delivery-exchange" class="method-label">
                          📦 택배거래
                        </label>

                        <input type="radio" id="both-exchange" name="exchange-method" value="both" class="method-option">
                        <label for="both-exchange" class="method-label">
                          🔄 모두 가능
                        </label>
                      </div>
                    </div>

                    <div class="form-group full-width">
                      <label for="available-time" class="form-label">
                        교환 가능 시간<span class="required">*</span>
                      </label>
                      <textarea 
                        id="available-time" 
                        name="available-time" 
                        class="form-textarea" 
                        placeholder="예) 평일 오후 6시 이후, 주말 언제든 가능"
                        required
                      ></textarea>
                      <div class="form-help">언제 교환이 가능한지 구체적으로 적어주세요.</div>
                    </div>
                  </div>
                </div>

                {/* 교환 내용 */}
                <div class="form-section">
                  <h2 class="section-title">💬 교환 소개</h2>
                  <div class="form-group">
                    <label for="exchange-content" class="form-label">
                      교환 내용<span class="required">*</span>
                    </label>
                    <textarea 
                      id="exchange-content" 
                      name="exchange-content" 
                      class="form-textarea large" 
                      placeholder="예) 정말 재미있게 읽었던 책입니다! 상상력이 풍부하고 따뜻한 이야기라 많은 분들이 읽어보셨으면 좋겠어요. 책 상태도 매우 깨끗하니 안심하고 교환하세요."
                      required
                    ></textarea>
                    <div class="form-help">책에 대한 소감, 추천 이유, 교환 조건 등을 자세히 설명해주세요.</div>
                  </div>
                </div>

                {/* 추가 정보 */}
                <div class="form-section">
                  <h2 class="section-title">📝 추가 정보</h2>
                  <div class="form-grid">
                    <div class="form-group">
                      <label for="location" class="form-label">희망 교환 지역</label>
                      <input 
                        type="text" 
                        id="location" 
                        name="location" 
                        class="form-input" 
                        placeholder="예) 서울 강남구"
                      />
                      <div class="form-help">직거래 희망 시 선호하는 지역을 적어주세요.</div>
                    </div>

                    <div class="form-group">
                      <label for="isbn" class="form-label">ISBN</label>
                      <input 
                        type="text" 
                        id="isbn" 
                        name="isbn" 
                        class="form-input" 
                        placeholder="978-89-xxxxx-xx-x"
                      />
                      <div class="form-help">있다면 입력해주세요.</div>
                    </div>
                  </div>
                </div>

                {/* 액션 버튼 */}
                <div class="form-actions">
                  <button type="button" class="btn-large btn-cancel" onclick="history.back()">취소</button>
                  <button type="submit" class="btn-large btn-save">교환 글 등록하기</button>
                </div>
              </form>
            </div>
          </div>
        </main>

        {/* Footer */}
        <footer class="footer">
          <div class="container">
            <div class="footer-content">
              <div class="footer-section">
                <h3>고객센터</h3>
                <ul>
                  <li><a href="#">고객문의</a></li>
                  <li><a href="#">주문/배송 조회</a></li>
                  <li><a href="#">반품/교환</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 BookStore. All rights reserved.</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>