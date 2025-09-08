<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="common/header.jsp"/>

        {/* Hero Section */}
        <section class="hero-section">
          <div class="container">
            <div class="hero-content">
              <h1 class="hero-title">새로 출간된 도서</h1>
              <p class="hero-subtitle">
                방금 출간된 신선한 이야기들을 만나보세요.<br/>
                세상에 새롭게 태어난 문학의 향기를 느껴보시길 바랍니다.
              </p>
            </div>
          </div>
        </section>

        {/* Filters */}
        <section class="filters-section">
          <div class="container">
            <div class="filters-content">
              <div class="search-filter">
                <input 
                  type="text" 
                  class="search-input" 
                  placeholder="도서명이나 저자명을 입력하세요..."
                />
              </div>
              <div class="filter-group">
                <span class="filter-label">카테고리:</span>
                <select class="filter-select">
                  <option>전체 카테고리</option>
                  <option>소설/에세이</option>
                  <option>경영/경제</option>
                  <option>과학/기술</option>
                  <option>예술/디자인</option>
                  <option>자기계발</option>
                  <option>IT/컴퓨터</option>
                  <option>아동/청소년</option>
                </select>
              </div>
              <div class="filter-group">
                <span class="filter-label">정렬:</span>
                <select class="filter-select">
                  <option>출간일순</option>
                  <option>인기순</option>
                  <option>평점순</option>
                  <option>가격낮은순</option>
                  <option>가격높은순</option>
                </select>
              </div>
            </div>
          </div>
        </section>

        {/* Books Section */}
        <section class="books-section">
          <div class="container">
            <h2 class="section-title">신간 도서 전체 목록</h2>
            <div class="books-grid">
              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=500&fit=crop"
                  alt="달러구트 꿈 백화점 2"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">달러구트 꿈 백화점 2</h3>
                  <p class="book-author">이미예</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.3/5)</span>
                  </div>
                  <div class="book-price">14,220원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=500&fit=crop"
                  alt="아버지의 해방일지"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">아버지의 해방일지</h3>
                  <p class="book-author">정지아</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.1/5)</span>
                  </div>
                  <div class="book-price">14,400원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=500&fit=crop"
                  alt="트렌드 코리아 2025"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">트렌드 코리아 2025</h3>
                  <p class="book-author">김난도</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">16,200원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400&h=500&fit=crop"
                  alt="원피스 107권"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">원피스 107권</h3>
                  <p class="book-author">오다 에이치로</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.9/5)</span>
                  </div>
                  <div class="book-price">4,500원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=500&fit=crop"
                  alt="클린 아키텍처"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">클린 아키텍처</h3>
                  <p class="book-author">로버트 C. 마틴</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.7/5)</span>
                  </div>
                  <div class="book-price">33,300원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=500&fit=crop"
                  alt="부의 추월차선"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">부의 추월차선</h3>
                  <p class="book-author">엠제이 드마코</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.4/5)</span>
                  </div>
                  <div class="book-price">17,100원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=500&fit=crop"
                  alt="불편한 편의점 2"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">불편한 편의점 2</h3>
                  <p class="book-author">김호연</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">13,500원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1599185186578-0ba91c2a15c0?w=400&h=500&fit=crop"
                  alt="미래를 읽는 기술"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">미래를 읽는 기술</h3>
                  <p class="book-author">김상균</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.0/5)</span>
                  </div>
                  <div class="book-price">15,300원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1549964336-ce406285ffc4?w=400&h=500&fit=crop"
                  alt="호모 데우스 2025"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">호모 데우스 2025</h3>
                  <p class="book-author">유발 하라리</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.6/5)</span>
                  </div>
                  <div class="book-price">18,900원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1666281269793-da06484657e8?w=400&h=500&fit=crop"
                  alt="AI 시대의 교육"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">AI 시대의 교육</h3>
                  <p class="book-author">이주호</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(3.9/5)</span>
                  </div>
                  <div class="book-price">19,800원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1580121441575-41bcb5c6b47c?w=400&h=500&fit=crop"
                  alt="리팩토링 2판"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">리팩토링 2판</h3>
                  <p class="book-author">마틴 파울러</p>
                  <div class="book-rating">
                    <span class="stars">★★★★★</span>
                    <span class="rating-text">(4.8/5)</span>
                  </div>
                  <div class="book-price">38,700원</div>
                </div>
              </div>

              <div class="book-card">
                <img 
                  src="https://images.unsplash.com/photo-1660479123634-2c700dfbbbdb?w=400&h=500&fit=crop"
                  alt="우주의 비밀"
                  class="book-image"
                />
                <div class="book-info">
                  <div class="book-badge">신간</div>
                  <h3 class="book-title">우주의 비밀</h3>
                  <p class="book-author">닐 디그래스 타이슨</p>
                  <div class="book-rating">
                    <span class="stars">★★★★☆</span>
                    <span class="rating-text">(4.2/5)</span>
                  </div>
                  <div class="book-price">22,500원</div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Pagination */}
        <section class="pagination-section">
          <div class="container">
            <div class="pagination">
              <a href="#" class="page-btn disabled">‹ 이전</a>
              <a href="#" class="page-btn active">1</a>
              <a href="#" class="page-btn">2</a>
              <a href="#" class="page-btn">3</a>
              <a href="#" class="page-btn">4</a>
              <a href="#" class="page-btn">5</a>
              <span class="page-btn">...</span>
              <a href="#" class="page-btn">12</a>
              <a href="#" class="page-btn">다음 ›</a>
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