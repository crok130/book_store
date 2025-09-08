<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${path}/resources/css/bookcreate.css">
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