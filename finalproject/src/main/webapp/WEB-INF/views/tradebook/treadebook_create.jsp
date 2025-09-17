<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../common/header.jsp"/>

        <section class="breadcrumb">
          <div class="container">
            <nav class="breadcrumb-nav">
              <a href="${path}">홈</a>
              <span class="breadcrumb-separator">></span>
              <a href="${path}/tradebook/bookexchange">책 교환</a>
              <span class="breadcrumb-separator">></span>
              <span>교환 글 등록</span>
            </nav>
          </div>
        </section>

        
        <main class="main-content">
          <div class="container">
            <div class="create-container">
              <div class="create-header">
                <h1 class="create-title">📚 책 교환 글 등록</h1>
                <p class="create-subtitle">소중한 책에게 새로운 독자와의 만남을 선사해보세요</p>
              </div>

              <form class="create-form" method="POST" action="trade/write" enctype="multipart/form-data">
               
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
                        name="tradebook_title" 
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
                        name="tradebook_author" 
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
                        <input type="radio" id="condition-new" name="tradebook_status" value="new" class="condition-option" required>
                        <label for="condition-new" class="condition-label">
                          ✨ 새 책
                        </label>

                        <input type="radio" id="condition-excellent" name="tradebook_status" value="excellent" class="condition-option">
                        <label for="condition-excellent" class="condition-label">
                          👍 매우 좋음
                        </label>

                        <input type="radio" id="condition-good" name="tradebook_status" value="good" class="condition-option">
                        <label for="condition-good" class="condition-label">
                          😊 좋음
                        </label>

                        <input type="radio" id="condition-fair" name="tradebook_status" value="fair" class="condition-option">
                        <label for="condition-fair" class="condition-label">
                          🤔 보통
                        </label>

                        <input type="radio" id="condition-poor" name="tradebook_status" value="poor" class="condition-option">
                        <label for="condition-poor" class="condition-label">
                          😅 낡음
                        </label>
                      </div>
                    </div>
                  </div>
                </div>

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
                      name="tradebook_img1" 
                      class="image-input" 
                      accept="image/jpeg,image/png"
                      required
                    />
                    <div class="form-help">책의 상태를 잘 보여주는 사진을 올려주세요.</div>
                  </div>
                </div>

       
                <div class="form-section">
                  <h2 class="section-title">🔄 교환 조건</h2>
                  <div class="form-grid">
                    <div class="form-group full-width">
                      <label for="wanted-books" class="form-label">
                        원하는 책<span class="required">*</span>
                      </label>
                      <textarea 
                        id="wanted-books" 
                        name="tradebook_condition" 
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
                        <input type="radio" id="direct-exchange" name="tradebook_method" value="direct" class="method-option" required>
                        <label for="direct-exchange" class="method-label">
                          🤝 직거래
                        </label>

                        <input type="radio" id="delivery-exchange" name="tradebook_method" value="delivery" class="method-option">
                        <label for="delivery-exchange" class="method-label">
                          📦 택배거래
                        </label>

                        <input type="radio" id="both-exchange" name="tradebook_method" value="both" class="method-option">
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
                        name="tradebook_time" 
                        class="form-textarea" 
                        placeholder="예) 평일 오후 6시 이후, 주말 언제든 가능"
                        required
                      ></textarea>
                      <div class="form-help">언제 교환이 가능한지 구체적으로 적어주세요.</div>
                    </div>
                  </div>
                </div>

                <div class="form-section">
                  <h2 class="section-title">💬 교환 소개</h2>
                  <div class="form-group">
                    <label for="exchange-content" class="form-label">
                      교환 내용<span class="required">*</span>
                    </label>
                      <textarea 
                        id="exchange-content" 
                        name="tradebook_content" 
                      class="form-textarea large" 
                      placeholder="예) 정말 재미있게 읽었던 책입니다! 상상력이 풍부하고 따뜻한 이야기라 많은 분들이 읽어보셨으면 좋겠어요. 책 상태도 매우 깨끗하니 안심하고 교환하세요."
                      required
                    ></textarea>
                    <div class="form-help">책에 대한 소감, 추천 이유, 교환 조건 등을 자세히 설명해주세요.</div>
                  </div>
                </div>

         
                <div class="form-section">
                  <h2 class="section-title">📝 추가 정보</h2>
                  <div class="form-grid">
                    <div class="form-group">
                      <label for="location" class="form-label">희망 교환 지역</label>
                      <input 
                        type="text" 
                        id="location" 
                        name="tradebook_location" 
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
                        name="tradebook_isbn" 
                        class="form-input" 
                        placeholder="978-89-xxxxx-xx-x"
                      />
                      <div class="form-help">있다면 입력해주세요.</div>
                    </div>
                  </div>
                </div>

          
                <div class="form-actions">
                  <button type="button" class="btn-large btn-cancel" onclick="history.back()">취소</button>
                  <button type="submit" class="btn-large btn-save">교환 글 등록하기</button>
                </div>
              </form>
            </div>
          </div>
        </main>


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

      <script>

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
</body>
</html>