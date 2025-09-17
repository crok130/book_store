<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="../common/header.jsp"/>

        <section class="cart-header">
          <div class="container">
            <h1 class="cart-title">나만의 서재</h1>
            <p class="cart-subtitle">선택하신 소중한 책들이 당신을 기다리고 있습니다</p>
          </div>
        </section>

        <section class="cart-section">
          <div class="container">
            <div class="cart-content">
    
              <div class="cart-items">
                <h2 class="items-header">선택한 도서 (3권)</h2>
                
                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1622490836804-4069f1f6df53?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxib29rcyUyMHN0YWNrJTIwdmludGFnZXxlbnwxfHx8fDE3NTczMDg3NjF8MA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="달러구트 꿈 백화점"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">달러구트 꿈 백화점</h3>
                    <p class="item-author">이미예</p>
                    <p class="item-price">13,320원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">1</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>

                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1755188977089-3bb40306d57f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHx2aW50YWdlJTIwbGl0ZXJhdHVyZSUyMGJvb2t8ZW58MXx8fHwxNzU3MzA4NzY1fDA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="세이노의 가르침"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">세이노의 가르침</h3>
                    <p class="item-author">세이노</p>
                    <p class="item-price">6,480원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">2</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>

                <div class="cart-item">
                  <img 
                    src="https://images.unsplash.com/photo-1615413833480-6e8427dbcc5e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjbGFzc2ljJTIwbm92ZWwlMjBib29rJTIwY292ZXJ8ZW58MXx8fHwxNzU3MzA4NzcwfDA&ixlib=rb-4.1.0&q=80&w=400&h=600&fit=crop"
                    alt="불편한 편의점"
                    class="item-image"
                  />
                  <div class="item-info">
                    <h3 class="item-title">불편한 편의점</h3>
                    <p class="item-author">김호연</p>
                    <p class="item-price">12,600원</p>
                  </div>
                  <div class="item-controls">
                    <div class="quantity-control">
                      <button class="quantity-btn">−</button>
                      <span class="quantity-display">1</span>
                      <button class="quantity-btn">+</button>
                    </div>
                    <button class="remove-btn">🗑️</button>
                  </div>
                </div>
              </div>


              <div class="cart-summary">
                <h2 class="summary-header">주문 요약</h2>
                
                <div class="summary-row">
                  <span class="summary-label">상품 금액</span>
                  <span class="summary-value">45,360원</span>
                </div>
                
                <div class="summary-row">
                  <span class="summary-label">배송비</span>
                  <span class="summary-value">2,500원</span>
                </div>
                
                <div class="summary-row">
                  <span class="summary-label">할인</span>
                  <span class="summary-value">-2,000원</span>
                </div>
                
                <div class="summary-row summary-total">
                  <span class="summary-label">총 결제 금액</span>
                  <span class="summary-value">45,860원</span>
                </div>

                <button class="checkout-btn">주문하기</button>
                <a href="/App.tsx" class="continue-shopping">쇼핑 계속하기</a>
              </div>
            </div>


            <div class="empty-cart">
              <div class="empty-icon">📚</div>
              <h2 class="empty-title">장바구니가 비어있습니다</h2>
              <p class="empty-text">아직 선택하신 책이 없습니다.<br/>마음에 드는 책을 담아보세요.</p>
              <a href="/App.tsx" class="btn btn-primary">책 둘러보기</a>
            </div>
  
          </div>
        </section>

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
                  <li><a href="#">FAQ</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>이용안내</h3>
                <ul>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">청소년보호정책</a></li>
                  <li><a href="#">회원혜택</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>회사소개</h3>
                <ul>
                  <li><a href="#">회사정보</a></li>
                  <li><a href="#">인재채용</a></li>
                  <li><a href="#">제휴문의</a></li>
                  <li><a href="#">광고문의</a></li>
                </ul>
              </div>
              <div class="footer-section">
                <h3>SNS</h3>
                <ul>
                  <li><a href="#">인스타그램</a></li>
                  <li><a href="#">페이스북</a></li>
                  <li><a href="#">유튜브</a></li>
                  <li><a href="#">네이버 블로그</a></li>
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
          const userMenu = document.querySelector('.user-menu');
          userMenu.classList.toggle('active');
        }

        // 드롭다운 외부 클릭시 닫기
        document.addEventListener('click', function(event) {
          const userMenu = document.querySelector('.user-menu');
          if (userMenu && !userMenu.contains(event.target)) {
            userMenu.classList.remove('active');
          }
        });
      </script>

</body>
</html>