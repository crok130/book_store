<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="common/header.jsp"/>


        <section class="hero-section">
          <div class="container">
            <div class="hero-content">
              <h1 class="hero-title">모든 교환 도서</h1>
              <p class="hero-subtitle">
                다양한 독서 취향의 만남, 새로운 이야기와의 인연.<br/>
                당신의 책장에서 시작되는 특별한 교환을 경험해보세요.
              </p>
              
              <div class="stats">
                <div class="stat">
                  <span class="stat-number">2,547</span>
                  <span class="stat-label">교환 가능한 책</span>
                </div>
                <div class="stat">
                  <span class="stat-number">1,283</span>
                  <span class="stat-label">활발한 회원</span>
                </div>
                <div class="stat">
                  <span class="stat-number">4,892</span>
                  <span class="stat-label">성공한 교환</span>
                </div>
              </div>
            </div>
          </div>
        </section>

     
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
                <span class="filter-label">상태:</span>
                <select class="filter-select">
                  <option>전체</option>
                  <option>최상급</option>
                  <option>상급</option>
                  <option>중급</option>
                  <option>하급</option>
                </select>
              </div>
              <div class="filter-group">
                <span class="filter-label">지역:</span>
                <select class="filter-select">
                  <option>전국</option>
                  <option>서울</option>
                  <option>부산</option>
                  <option>대구</option>
                  <option>인천</option>
                  <option>광주</option>
                  <option>대전</option>
                  <option>울산</option>
                </select>
              </div>
            </div>
          </div>
        </section>

     
        <section class="exchange-books-section">
          <div class="container">
            <h2 class="section-title">교환 가능한 모든 도서</h2>
            <div class="exchange-grid">
              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=300&fit=crop"
                  alt="미움받을 용기"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">미움받을 용기</h3>
                  <p class="exchange-book-author">기시미 이치로</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">상급</span>
                    <span class="exchange-date">2일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>서울 강남구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">김</div>
                    <span>김독서님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1589998059171-988d887df646?w=400&h=300&fit=crop"
                  alt="달러구트 꿈 백화점"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">달러구트 꿈 백화점</h3>
                  <p class="exchange-book-author">이미예</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">최상급</span>
                    <span class="exchange-date">1일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>부산 해운대구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">이</div>
                    <span>이책사님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop"
                  alt="부의 추월차선"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">부의 추월차선</h3>
                  <p class="exchange-book-author">엠제이 드마코</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">상급</span>
                    <span class="exchange-date">3일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>대구 중구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">박</div>
                    <span>박경제님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?w=400&h=300&fit=crop"
                  alt="클린 코드"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">클린 코드</h3>
                  <p class="exchange-book-author">로버트 C. 마틴</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">중급</span>
                    <span class="exchange-date">5일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>서울 마포구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">최</div>
                    <span>최개발님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=400&h=300&fit=crop"
                  alt="아몬드"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">아몬드</h3>
                  <p class="exchange-book-author">손원평</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">상급</span>
                    <span class="exchange-date">1주일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>인천 남동구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">정</div>
                    <span>정소설님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop"
                  alt="채식주의자"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">채식주의자</h3>
                  <p class="exchange-book-author">한강</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">최상급</span>
                    <span class="exchange-date">3일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>광주 서구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">한</div>
                    <span>한문학님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=300&fit=crop"
                  alt="불편한 편의점"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">불편한 편의점</h3>
                  <p class="exchange-book-author">김호연</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">상급</span>
                    <span class="exchange-date">2일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>대전 유성구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">강</div>
                    <span>강이야기님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1599185186578-0ba91c2a15c0?w=400&h=300&fit=crop"
                  alt="사피엔스"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">사피엔스</h3>
                  <p class="exchange-book-author">유발 하라리</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">중급</span>
                    <span class="exchange-date">4일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>울산 중구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">유</div>
                    <span>유역사님</span>
                  </div>
                </div>
              </div>

              <div class="exchange-card">
                <img 
                  src="https://images.unsplash.com/photo-1549964336-ce406285ffc4?w=400&h=300&fit=crop"
                  alt="코스모스"
                  class="exchange-book-image"
                />
                <div class="exchange-info">
                  <div class="exchange-badge">교환중</div>
                  <h3 class="exchange-book-title">코스모스</h3>
                  <p class="exchange-book-author">칼 세이건</p>
                  <div class="exchange-details">
                    <span class="exchange-condition">하급</span>
                    <span class="exchange-date">6일 전</span>
                  </div>
                  <div class="exchange-location">
                    <span>📍</span>
                    <span>서울 송파구</span>
                  </div>
                  <div class="exchange-user">
                    <div class="user-avatar">칼</div>
                    <span>칼과학님</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>


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
              <a href="#" class="page-btn">18</a>
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