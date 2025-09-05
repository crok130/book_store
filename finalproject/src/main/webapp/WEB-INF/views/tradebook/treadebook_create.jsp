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

        .nav-menu a:hover,
        .nav-menu a.active {
          color: var(--color-charcoal);
        }

        .nav-menu a:hover::after,
        .nav-menu a.active::after {
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
          color: var(--color-muted-green);
        }

        .breadcrumb-separator {
          color: var(--color-text-secondary);
          opacity: 0.6;
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
          background: linear-gradient(135deg, var(--color-sage) 0%, var(--color-muted-green) 100%);
          color: var(--color-warm-white);
          padding: 3rem;
          text-align: center;
          position: relative;
          overflow: hidden;
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
          font-size: 1.2rem;
          opacity: 0.9;
          font-weight: 300;
          position: relative;
          z-index: 2;
        }

        .create-form {
          padding: 3rem;
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
          color: var(--color-charcoal);
          margin-bottom: 0.75rem;
          font-size: 0.95rem;
          font-family: var(--font-sans);
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
          border-radius: var(--border-radius-md);
          font-size: 1rem;
          transition: all 0.3s ease;
          background: var(--color-warm-white);
          outline: none;
          color: var(--color-text-primary);
          font-family: var(--font-sans);
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
          border-color: var(--color-sage);
          box-shadow: 0 0 0 3px rgba(156, 175, 158, 0.1);
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
          color: var(--color-text-secondary);
          margin-top: 0.75rem;
          font-style: italic;
        }

        /* Image Upload */
        .image-upload-area {
          border: 2px dashed rgba(156, 175, 158, 0.4);
          border-radius: var(--border-radius-md);
          padding: 3rem;
          text-align: center;
          background: linear-gradient(135deg, var(--color-soft-beige) 0%, var(--color-cream) 100%);
          transition: all 0.3s ease;
          cursor: pointer;
          position: relative;
          overflow: hidden;
        }

        .image-upload-area::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background: url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.02'%3E%3Cpath d='M20 20c0 11-9 20-20 20s-20-9-20-20 9-20 20-20 20 9 20 20zm-10-10v20m-10-10h20'/%3E%3C/g%3E%3C/svg%3E") repeat;
          opacity: 0.3;
        }

        .image-upload-area:hover {
          border-color: var(--color-sage);
          background: linear-gradient(135deg, var(--color-cream) 0%, var(--color-soft-beige) 100%);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        .image-upload-icon {
          font-size: 3.5rem;
          color: var(--color-sage);
          margin-bottom: 1.5rem;
          position: relative;
          z-index: 2;
        }

        .image-upload-text {
          font-size: 1.1rem;
          color: var(--color-charcoal);
          margin-bottom: 0.75rem;
          font-weight: 500;
          position: relative;
          z-index: 2;
        }

        .image-upload-hint {
          font-size: 0.9rem;
          color: var(--color-text-secondary);
          position: relative;
          z-index: 2;
        }

        .image-input {
          display: none;
        }

        /* Exchange Method Pills */
        .exchange-methods {
          display: flex;
          gap: 1.5rem;
          flex-wrap: wrap;
        }

        .method-option {
          display: none;
        }

        .method-label {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          padding: 1rem 2rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: 30px;
          cursor: pointer;
          transition: all 0.3s ease;
          font-weight: 500;
          background: var(--color-warm-white);
          color: var(--color-text-primary);
          font-size: 0.95rem;
          box-shadow: var(--shadow-soft);
        }

        .method-option:checked + .method-label {
          border-color: var(--color-sage);
          background: linear-gradient(135deg, var(--color-sage), var(--color-muted-green));
          color: var(--color-warm-white);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        .method-label:hover {
          border-color: var(--color-sage);
          transform: translateY(-1px);
          box-shadow: var(--shadow-medium);
        }

        /* Condition Pills */
        .condition-options {
          display: flex;
          flex-wrap: wrap;
          gap: 1rem;
        }

        .condition-option {
          display: none;
        }

        .condition-label {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          padding: 0.8rem 1.5rem;
          border: 2px solid rgba(156, 175, 158, 0.2);
          border-radius: 25px;
          cursor: pointer;
          transition: all 0.3s ease;
          font-weight: 500;
          background: var(--color-warm-white);
          font-size: 0.9rem;
          color: var(--color-text-primary);
          box-shadow: var(--shadow-soft);
        }

        .condition-option:checked + .condition-label {
          border-color: var(--color-terracotta);
          background: linear-gradient(135deg, var(--color-terracotta), var(--color-accent-gold));
          color: var(--color-warm-white);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        .condition-label:hover {
          border-color: var(--color-terracotta);
          transform: translateY(-1px);
          box-shadow: var(--shadow-medium);
        }

        /* Action Buttons */
        .form-actions {
          display: flex;
          gap: 1.5rem;
          justify-content: flex-end;
          padding-top: 2.5rem;
          border-top: 2px solid rgba(156, 175, 158, 0.2);
          margin-top: 3rem;
        }

        .btn-large {
          padding: 1.25rem 2.5rem;
          font-size: 1.1rem;
          font-weight: 600;
          border-radius: var(--border-radius-lg);
          cursor: pointer;
          transition: all 0.3s ease;
          border: none;
          min-width: 160px;
          font-family: var(--font-sans);
          letter-spacing: -0.01em;
        }

        .btn-cancel {
          background: var(--color-text-secondary);
          color: var(--color-warm-white);
          border: 2px solid var(--color-text-secondary);
        }

        .btn-cancel:hover {
          background: var(--color-charcoal);
          border-color: var(--color-charcoal);
          transform: translateY(-2px);
          box-shadow: var(--shadow-medium);
        }

        .btn-save {
          background: linear-gradient(135deg, var(--color-sage) 0%, var(--color-muted-green) 100%);
          color: var(--color-warm-white);
          box-shadow: var(--shadow-soft);
        }

        .btn-save:hover {
          background: linear-gradient(135deg, var(--color-muted-green) 0%, var(--color-deep-blue) 100%);
          transform: translateY(-3px);
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
            padding: 2rem;
          }

          .create-header {
            padding: 2rem;
          }

          .create-title {
            font-size: 2rem;
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

          .image-upload-area {
            padding: 2rem;
          }

          .method-label,
          .condition-label {
            justify-content: center;
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
              <a href="/App.tsx" class="logo">BookStore</a>
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
                <p class="create-subtitle">소중한 책에게 새로운 독자와의 만남을 선사해보세요</p>
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
                        name="publication-date" 
                        class="form-input"
                      />
                    </div>

                    <div class="form-group full-width">
                      <label for="book-condition" class="form-label">
                        책 상태<span class="required">*</span>
                      </label>
                      <div class="condition-options">
                        <input type="radio" id="condition-new" name="book-condition" value="new" class="condition-option" required>
                        <label for="condition-new" class="condition-label">
                          ✨ 새 책
                        </label>

                        <input type="radio" id="condition-excellent" name="book-condition" value="excellent" class="condition-option">
                        <label for="condition-excellent" class="condition-label">
                          👍 매우 좋음
                        </label>

                        <input type="radio" id="condition-good" name="book-condition" value="good" class="condition-option">
                        <label for="condition-good" class="condition-label">
                          😊 좋음
                        </label>

                        <input type="radio" id="condition-fair" name="book-condition" value="fair" class="condition-option">
                        <label for="condition-fair" class="condition-label">
                          🤔 보통
                        </label>

                        <input type="radio" id="condition-poor" name="book-condition" value="poor" class="condition-option">
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
                        <input type="radio" id="direct-exchange" name="exchange-method" value="direct" class="method-option" required>
                        <label for="direct-exchange" class="method-label">
                          🤝 직거래
                        </label>

                        <input type="radio" id="delivery-exchange" name="exchange-method" value="delivery" class="method-option">
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
              <p>&copy; 2024 북스토어. 모든 문학적 여정을 함께합니다. | 사업자등록번호: 123-45-67890</p>
            </div>
          </div>
        </footer>
      </div>
</body>
</html>