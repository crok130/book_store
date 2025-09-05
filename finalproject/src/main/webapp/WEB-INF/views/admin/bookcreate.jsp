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
          background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
          color: white;
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
          color: white;
          text-decoration: none;
          display: flex;
          align-items: center;
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

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 2rem;
        }

        .nav-menu a {
          text-decoration: none;
          color: rgba(255, 255, 255, 0.9);
          font-weight: 500;
          transition: color 0.3s ease;
        }

        .nav-menu a:hover {
          color: white;
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

        .btn-admin {
          background: #e74c3c;
          color: white;
        }

        .btn-admin:hover {
          background: #c0392b;
        }

        .btn-outline-admin {
          background: transparent;
          color: white;
          border: 2px solid rgba(255, 255, 255, 0.5);
        }

        .btn-outline-admin:hover {
          background: rgba(255, 255, 255, 0.1);
          border-color: white;
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
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
          border-color: #667eea;
          box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-textarea {
          resize: vertical;
          min-height: 120px;
          font-family: inherit;
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
          border-color: #667eea;
          background: #f0f4ff;
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

        /* Price Input */
        .price-input-group {
          position: relative;
        }

        .price-symbol {
          position: absolute;
          right: 1rem;
          top: 50%;
          transform: translateY(-50%);
          color: #666;
          font-weight: 600;
        }

        .price-input {
          padding-right: 2.5rem;
        }

        /* Quantity Input */
        .quantity-group {
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .quantity-btn {
          width: 40px;
          height: 40px;
          border: 2px solid #e9ecef;
          background: white;
          border-radius: 6px;
          cursor: pointer;
          font-size: 1.2rem;
          font-weight: 600;
          color: #666;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .quantity-btn:hover {
          border-color: #667eea;
          color: #667eea;
        }

        .quantity-input {
          width: 80px;
          text-align: center;
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
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
        }

        .btn-save:hover {
          transform: translateY(-2px);
          box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
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
          font-weight: 600;
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
          transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
          color: white;
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
        }
    </style>
</head>
<body>
     <div>
        {/* Header */}
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="/components/AdminMainPage.tsx" class="logo">
                🛠️ BookStore Admin
                <span class="admin-badge">ADMIN</span>
              </a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/components/AdminDashboard.tsx">대시보드</a></li>
                  <li><a href="/components/BookCreatePage.tsx">도서 등록</a></li>
                  <li><a href="#">도서 관리</a></li>
                  <li><a href="#">회원 관리</a></li>
                  <li><a href="#">주문 관리</a></li>
                  <li><a href="#">통계</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="/components/AdminLoginPage.tsx" class="btn btn-outline-admin">로그인</a>
                <a href="/components/AdminRegisterPage.tsx" class="btn btn-admin">관리자 등록</a>
              </div>
            </div>
          </div>
        </header>

        {/* Breadcrumb */}
        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="/components/AdminMainPage.tsx">관리자 홈</a>
              <span class="breadcrumb-separator">></span>
              <a href="/components/AdminDashboard.tsx">대시보드</a>
              <span class="breadcrumb-separator">></span>
              <span>책 등록</span>
            </nav>
          </div>
        </section>

        {/* Main Content */}
        <main class="main-content">
          <div class="container">
            <div class="create-container">
              <div class="create-header">
                <h1 class="create-title">새 책 등록</h1>
                <p class="create-subtitle">책 정보를 입력하여 새로운 도서를 등록하세요</p>
              </div>

              <form class="create-form">
                {/* 기본 정보 */}
                <div class="form-section">
                  <h2 class="section-title">📖 기본 정보</h2>
                  <div class="form-grid">
                    <div class="form-group full-width">
                      <label for="title" class="form-label">
                        책 제목<span class="required">*</span>
                      </label>
                      <input 
                        type="text" 
                        id="title" 
                        name="title" 
                        class="form-input" 
                        placeholder="책 제목을 입력하세요"
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
                      <label for="publisher" class="form-label">
                        출판사<span class="required">*</span>
                      </label>
                      <input 
                        type="text" 
                        id="publisher" 
                        name="publisher" 
                        class="form-input" 
                        placeholder="출판사명을 입력하세요"
                        required
                      />
                    </div>

                    <div class="form-group">
                      <label for="publication-date" class="form-label">
                        출간일<span class="required">*</span>
                      </label>
                      <input 
                        type="date" 
                        id="publication-date" 
                        name="publication-date" 
                        class="form-input" 
                        required
                      />
                    </div>

                    <div class="form-group">
                      <label for="category" class="form-label">
                        카테고리<span class="required">*</span>
                      </label>
                      <select id="category" name="category" class="form-select" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="novel">소설/에세이</option>
                        <option value="business">경영/경제</option>
                        <option value="science">과학/기술</option>
                        <option value="art">예술/디자인</option>
                        <option value="children">아동/청소년</option>
                        <option value="self-help">자기계발</option>
                        <option value="computer">IT/컴퓨터</option>
                        <option value="history">역사/문화</option>
                        <option value="health">건강/의학</option>
                        <option value="hobby">취미/스포츠</option>
                        <option value="language">외국어</option>
                        <option value="comics">만화</option>
                      </select>
                    </div>

                    <div class="form-group full-width">
                      <label for="description" class="form-label">
                        책 소개<span class="required">*</span>
                      </label>
                      <textarea 
                        id="description" 
                        name="description" 
                        class="form-textarea" 
                        placeholder="책에 대한 자세한 설명을 입력하세요..."
                        required
                      ></textarea>
                      <div class="form-help">책의 내용, 특징, 추천 이유 등을 자세히 작성해주세요.</div>
                    </div>
                  </div>
                </div>

                {/* 이미지 업로드 */}
                <div class="form-section">
                  <h2 class="section-title">📷 책 표지 이미지</h2>
                  <div class="form-group">
                    <label for="book-image" class="form-label">
                      표지 이미지<span class="required">*</span>
                    </label>
                    <div class="image-upload-area" onclick="document.getElementById('book-image').click()">
                      <div class="image-upload-icon">🖼️</div>
                      <div class="image-upload-text">클릭하여 이미지 업로드</div>
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
                  </div>
                </div>

                {/* 판매 정보 */}
                <div class="form-section">
                  <h2 class="section-title">💰 판매 정보</h2>
                  <div class="form-grid">
                    <div class="form-group">
                      <label for="price" class="form-label">
                        가격<span class="required">*</span>
                      </label>
                      <div class="price-input-group">
                        <input 
                          type="number" 
                          id="price" 
                          name="price" 
                          class="form-input price-input" 
                          placeholder="0"
                          min="0"
                          required
                        />
                        <span class="price-symbol">원</span>
                      </div>
                      <div class="form-help">정가 또는 판매 희망가를 입력하세요.</div>
                    </div>

                    <div class="form-group">
                      <label for="quantity" class="form-label">
                        재고 수량<span class="required">*</span>
                      </label>
                      <div class="quantity-group">
                        <button type="button" class="quantity-btn" onclick="decreaseQuantity()">-</button>
                        <input 
                          type="number" 
                          id="quantity" 
                          name="quantity" 
                          class="form-input quantity-input" 
                          value="1"
                          min="0"
                          required
                        />
                        <button type="button" class="quantity-btn" onclick="increaseQuantity()">+</button>
                      </div>
                      <div class="form-help">판매할 책의 수량을 입력하세요.</div>
                    </div>
                  </div>
                </div>

                {/* 추가 정보 */}
                <div class="form-section">
                  <h2 class="section-title">📝 추가 정보</h2>
                  <div class="form-grid">
                    <div class="form-group">
                      <label for="isbn" class="form-label">ISBN</label>
                      <input 
                        type="text" 
                        id="isbn" 
                        name="isbn" 
                        class="form-input" 
                        placeholder="978-89-xxxxx-xx-x"
                      />
                      <div class="form-help">ISBN이 있다면 입력해주세요.</div>
                    </div>

                    <div class="form-group">
                      <label for="pages" class="form-label">페이지 수</label>
                      <input 
                        type="number" 
                        id="pages" 
                        name="pages" 
                        class="form-input" 
                        placeholder="페이지 수"
                        min="1"
                      />
                    </div>
                  </div>
                </div>

                {/* 액션 버튼 */}
                <div class="form-actions">
                  <button type="button" class="btn-large btn-cancel">취소</button>
                  <button type="submit" class="btn-large btn-save">책 등록하기</button>
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
                <h3>관리자 도구</h3>
                <ul>
                  <li><a href="/components/AdminDashboard.tsx">대시보드</a></li>
                  <li><a href="/components/BookCreatePage.tsx">도서 등록</a></li>
                  <li><a href="#">도서 관리</a></li>
                  <li><a href="#">회원 관리</a></li>
                  <li><a href="#">주문 관리</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>설정</h3>
                <ul>
                  <li><a href="#">시스템 설정</a></li>
                  <li><a href="#">권한 관리</a></li>
                  <li><a href="#">백업 관리</a></li>
                  <li><a href="#">로그 관리</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>지원</h3>
                <ul>
                  <li><a href="#">관리자 가이드</a></li>
                  <li><a href="#">API 문서</a></li>
                  <li><a href="#">기술 지원</a></li>
                  <li><a href="#">업데이트 노트</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>사용자 사이트</h3>
                <ul>
                  <li><a href="/App.tsx">일반 사용자 사이트</a></li>
                  <li><a href="#">모바일 앱</a></li>
                  <li><a href="#">고객 센터</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </div>
            </div>
            <div class="footer-bottom">
              <p>&copy; 2024 BookStore Admin. All rights reserved. | 관리자 전용 시스템</p>
            </div>
          </div>
        </footer>
      </div>
</body>
      <script>
        function increaseQuantity() {
          const quantityInput = document.getElementById('quantity');
          const currentValue = parseInt(quantityInput.value) || 0;
          quantityInput.value = currentValue + 1;
        }

        function decreaseQuantity() {
          const quantityInput = document.getElementById('quantity');
          const currentValue = parseInt(quantityInput.value) || 0;
          if (currentValue > 0) {
            quantityInput.value = currentValue - 1;
          }
        }
      </script>
</html>