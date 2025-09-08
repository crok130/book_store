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

        .container {
          max-width: 1280px;
          margin: 0 auto;
          padding: 0 2rem;
        }

        /* Header */
        .header {
          background: rgba(254, 253, 251, 0.95);
          backdrop-filter: blur(20px);
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
          position: sticky;
          top: 0;
          z-index: 1000;
          transition: all 0.3s ease;
        }

        .header-content {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1.5rem 0;
        }

        .logo {
          font-family: var(--font-serif);
          font-size: 2rem;
          font-weight: 600;
          color: var(--color-charcoal);
          text-decoration: none;
          letter-spacing: -0.02em;
          display: flex;
          align-items: center;
          gap: 0.75rem;
        }

        .logo::before {
          content: '📖';
          font-size: 1.5rem;
        }

        .nav-menu {
          display: flex;
          list-style: none;
          gap: 3rem;
          align-items: center;
        }

        .nav-menu a {
          text-decoration: none;
          color: var(--color-text-secondary);
          font-weight: 400;
          font-size: 0.95rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          position: relative;
          padding: 0.5rem 0;
        }

        .nav-menu a::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 0;
          width: 0;
          height: 2px;
          background: var(--color-sage);
          transition: width 0.3s ease;
        }

        .nav-menu a:hover {
          color: var(--color-charcoal);
        }

        .nav-menu a:hover::after {
          width: 100%;
        }

        .user-actions {
          display: flex;
          gap: 1rem;
          align-items: center;
        }

        .btn {
          padding: 0.75rem 1.5rem;
          border: 2px solid transparent;
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          text-decoration: none;
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }

        .btn-primary {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .btn-primary:hover {
          background: var(--color-deep-blue);
          transform: translateY(-1px);
          box-shadow: var(--shadow-medium);
        }

        .btn-outline {
          background: transparent;
          color: var(--color-charcoal);
          border-color: rgba(45, 52, 54, 0.2);
        }

        .btn-outline:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          border-color: var(--color-charcoal);
          transform: translateY(-1px);
        }

        /* User Menu Dropdown */
        .user-menu {
          position: relative;
        }

        .user-greeting {
          cursor: pointer;
          padding: 0.75rem 1rem;
          background: rgba(156, 175, 158, 0.1);
          border-radius: var(--border-radius-sm);
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-weight: 500;
          color: var(--color-charcoal);
        }

        .user-greeting:hover {
          background: rgba(156, 175, 158, 0.2);
        }

        .user-dropdown {
          position: absolute;
          top: 100%;
          right: 0;
          background: var(--color-warm-white);
          border: 1px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-md);
          box-shadow: var(--shadow-strong);
          min-width: 180px;
          opacity: 0;
          visibility: hidden;
          transform: translateY(-10px);
          transition: all 0.3s ease;
          z-index: 1000;
        }

        .user-menu.active .user-dropdown {
          opacity: 1;
          visibility: visible;
          transform: translateY(0);
        }

        .dropdown-item {
          display: block;
          padding: 0.75rem 1rem;
          text-decoration: none;
          color: var(--color-text-primary);
          font-size: 0.9rem;
          transition: all 0.3s ease;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .dropdown-item:last-child {
          border-bottom: none;
        }

        .dropdown-item:hover {
          background: var(--color-soft-beige);
          color: var(--color-charcoal);
        }

        /* Breadcrumb */
        .breadcrumb {
          background: var(--color-warm-white);
          padding: 1.5rem 0;
          border-bottom: 1px solid rgba(156, 175, 158, 0.15);
        }

        .breadcrumb-nav {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          font-size: 0.95rem;
          color: var(--color-text-secondary);
        }

        .breadcrumb-nav a {
          color: var(--color-sage);
          text-decoration: none;
          transition: color 0.3s ease;
          font-weight: 500;
        }

        .breadcrumb-nav a:hover {
          color: var(--color-charcoal);
        }

        .breadcrumb-separator {
          color: var(--color-text-secondary);
        }

        /* Main Content */
        .main-content {
          background: linear-gradient(135deg, var(--color-warm-white) 0%, var(--color-cream) 100%);
          padding: 4rem 0;
        }

        .create-container {
          max-width: 900px;
          margin: 0 auto;
          background: var(--color-warm-white);
          border-radius: var(--border-radius-lg);
          box-shadow: var(--shadow-strong);
          overflow: hidden;
          border: 1px solid rgba(156, 175, 158, 0.1);
        }

        .create-header {
          background: linear-gradient(135deg, var(--color-charcoal) 0%, var(--color-deep-blue) 100%);
          color: var(--color-warm-white);
          padding: 3rem 2rem;
          text-align: center;
          position: relative;
        }

        .create-header::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.4;
        }

        .create-title {
          font-family: var(--font-serif);
          font-size: 2.5rem;
          font-weight: 600;
          margin-bottom: 1rem;
          letter-spacing: -0.02em;
          position: relative;
          z-index: 2;
        }

        .create-subtitle {
          font-size: 1.1rem;
          opacity: 0.85;
          font-weight: 300;
          position: relative;
          z-index: 2;
        }

        .create-form {
          padding: 3rem 2.5rem;
        }

        .form-section {
          margin-bottom: 3rem;
        }

        .section-title {
          font-family: var(--font-serif);
          font-size: 1.5rem;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 2rem;
          display: flex;
          align-items: center;
          gap: 0.75rem;
          letter-spacing: -0.01em;
        }

        .form-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 2rem;
        }

        .form-group {
          margin-bottom: 2rem;
        }

        .form-group.full-width {
          grid-column: 1 / -1;
        }

        .form-label {
          display: block;
          font-weight: 600;
          color: var(--color-charcoal);
          margin-bottom: 0.75rem;
          font-size: 1rem;
          letter-spacing: -0.01em;
        }

        .required {
          color: var(--color-terracotta);
          margin-left: 0.3rem;
        }

        .form-input,
        .form-textarea,
        .form-select {
          width: 100%;
          padding: 1rem 1.25rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-sm);
          font-size: 1rem;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
          outline: none;
          font-family: var(--font-sans);
          color: var(--color-text-primary);
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
          border-color: var(--color-sage);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.15);
        }

        .form-textarea {
          resize: vertical;
          min-height: 140px;
          font-family: inherit;
          line-height: 1.6;
        }

        .form-select {
          cursor: pointer;
          background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
          background-position: right 1rem center;
          background-repeat: no-repeat;
          background-size: 1.2rem;
          padding-right: 3rem;
          appearance: none;
        }

        .form-help {
          font-size: 0.9rem;
          color: var(--color-text-secondary);
          margin-top: 0.75rem;
          font-style: italic;
        }

        /* Image Upload */
        .image-upload-area {
          border: 2px dashed rgba(156, 175, 158, 0.3);
          border-radius: var(--border-radius-md);
          padding: 3rem 2rem;
          text-align: center;
          background: var(--color-soft-beige);
          transition: all 0.4s ease;
          cursor: pointer;
        }

        .image-upload-area:hover {
          border-color: var(--color-sage);
          background: rgba(156, 175, 158, 0.1);
          transform: translateY(-2px);
        }

        .image-upload-icon {
          font-size: 3.5rem;
          color: var(--color-sage);
          margin-bottom: 1.5rem;
          transition: transform 0.3s ease;
        }

        .image-upload-area:hover .image-upload-icon {
          transform: scale(1.1);
        }

        .image-upload-text {
          font-size: 1.1rem;
          color: var(--color-charcoal);
          margin-bottom: 0.75rem;
          font-weight: 500;
        }

        .image-upload-hint {
          font-size: 0.9rem;
          color: var(--color-text-secondary);
          font-style: italic;
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
          gap: 1.5rem;
          justify-content: flex-end;
          padding-top: 2.5rem;
          border-top: 2px solid rgba(156, 175, 158, 0.15);
          margin-top: 3rem;
        }

        .btn-large {
          padding: 1.25rem 2.5rem;
          font-size: 1.1rem;
          font-weight: 600;
          border-radius: var(--border-radius-md);
          cursor: pointer;
          transition: all 0.3s ease;
          border: none;
          min-width: 160px;
          letter-spacing: -0.01em;
        }

        .btn-cancel {
          background: var(--color-text-secondary);
          color: var(--color-warm-white);
          border: 2px solid var(--color-text-secondary);
        }

        .btn-cancel:hover {
          background: transparent;
          color: var(--color-text-secondary);
          transform: translateY(-1px);
        }

        .btn-save {
          background: linear-gradient(135deg, var(--color-charcoal) 0%, var(--color-deep-blue) 100%);
          color: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .btn-save:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-strong);
        }

        /* Footer */
        .footer {
          background: linear-gradient(135deg, #1A1F2E 0%, var(--color-charcoal) 100%);
          color: var(--color-warm-white);
          padding: 4rem 0 2rem;
        }

        .footer-content {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
          gap: 3rem;
          margin-bottom: 3rem;
        }

        .footer-section h3 {
          margin-bottom: 1.5rem;
          color: var(--color-warm-white);
          font-family: var(--font-serif);
          font-weight: 600;
          font-size: 1.2rem;
          letter-spacing: -0.01em;
        }

        .footer-section ul {
          list-style: none;
        }

        .footer-section ul li {
          margin-bottom: 0.75rem;
        }

        .footer-section ul li a {
          color: rgba(254, 253, 251, 0.7);
          text-decoration: none;
          transition: all 0.3s ease;
          font-size: 0.95rem;
          font-weight: 400;
        }

        .footer-section ul li a:hover {
          color: var(--color-warm-white);
          transform: translateX(5px);
        }

        .footer-bottom {
          border-top: 1px solid rgba(254, 253, 251, 0.1);
          padding-top: 2rem;
          text-align: center;
          color: rgba(254, 253, 251, 0.6);
          font-size: 0.9rem;
        }

        /* User Menu Dropdown */
        .user-menu {
          position: relative;
        }

        .user-greeting {
          background: transparent;
          color: var(--color-charcoal);
          padding: 0.75rem 1.5rem;
          border: 2px solid rgba(45, 52, 54, 0.2);
          border-radius: var(--border-radius-sm);
          cursor: pointer;
          font-weight: 500;
          font-size: 0.9rem;
          letter-spacing: -0.01em;
          transition: all 0.3s ease;
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .user-greeting:hover {
          background: var(--color-charcoal);
          color: var(--color-warm-white);
          border-color: var(--color-charcoal);
          transform: translateY(-1px);
        }

        .user-dropdown {
          position: absolute;
          top: 100%;
          right: 0;
          background: var(--color-warm-white);
          border: 1px solid rgba(156, 175, 158, 0.2);
          border-radius: var(--border-radius-sm);
          box-shadow: var(--shadow-strong);
          min-width: 180px;
          opacity: 0;
          visibility: hidden;
          transform: translateY(-10px);
          transition: all 0.3s ease;
          z-index: 1000;
          margin-top: 0.5rem;
        }

        .user-dropdown.show {
          opacity: 1;
          visibility: visible;
          transform: translateY(0);
        }

        .dropdown-item {
          display: block;
          padding: 0.75rem 1.5rem;
          color: var(--color-text-secondary);
          text-decoration: none;
          font-size: 0.9rem;
          font-weight: 400;
          transition: all 0.3s ease;
          border-bottom: 1px solid rgba(156, 175, 158, 0.1);
        }

        .dropdown-item:last-child {
          border-bottom: none;
        }

        .dropdown-item:hover {
          background: var(--color-cream);
          color: var(--color-charcoal);
          transform: translateX(5px);
        }

        /* Responsive */
        @media (max-width: 768px) {
          .header-content {
            flex-direction: column;
            gap: 1rem;
          }

          .nav-menu {
            gap: 1rem;
            flex-wrap: wrap;
            justify-content: center;
          }

          .form-grid {
            grid-template-columns: 1fr;
            gap: 1.5rem;
          }

          .create-form {
            padding: 2rem 1.5rem;
          }

          .create-title {
            font-size: 2rem;
          }

          .section-title {
            font-size: 1.3rem;
          }

          .form-actions {
            flex-direction: column;
            gap: 1rem;
          }

          .btn-large {
            width: 100%;
          }

          .image-upload-area {
            padding: 2rem 1rem;
          }

          .image-upload-icon {
            font-size: 2.5rem;
          }

          .user-dropdown {
            right: auto;
            left: 0;
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
              <a href="/components/AdminMainPage.tsx" class="logo">🛠️ BookStore Admin</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="/components/AdminMainPage.tsx">대시보드</a></li>
                  <li><a href="/components/BookCreatePage.tsx">도서 등록</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <div class="user-menu">
                  <div class="user-greeting" onclick="toggleDropdown()">
                    관리자님 안녕하세요 ▼
                  </div>
                  <div class="user-dropdown">
                    <a href="#" class="dropdown-item">로그아웃</a>
                  </div>
                </div>
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
              <a href="#">도서 관리</a>
              <span class="breadcrumb-separator">></span>
              <span>새 책 등록</span>
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
                        name="" 
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
                  <li><a href="/components/AdminMainPage.tsx">대시보드</a></li>
                  <li><a href="/components/BookCreatePage.tsx">도서 등록</a></li>
                  <li><a href="#">도서 관리</a></li>
                  <li><a href="#">회원 관리</a></li>
                  <li><a href="#">주문 관리</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>시스템 설정</h3>
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
              <p>&copy; 2024 BookStore Admin. 관리자 전용 시스템 | All rights reserved.</p>
            </div>
          </div>
        </footer>
      </div>

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

        function toggleDropdown() {
          const dropdown = document.querySelector('.user-dropdown');
          dropdown.classList.toggle('show');
        }

        // 외부 클릭시 드롭다운 닫기
        document.addEventListener('click', function(event) {
          const userMenu = document.querySelector('.user-menu');
          const dropdown = document.querySelector('.user-dropdown');
          
          if (!userMenu.contains(event.target)) {
            dropdown.classList.remove('show');
          }
        });
      </script>
</html>