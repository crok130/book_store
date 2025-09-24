<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="../common/header.jsp"/>


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

    
        <section class="books-section">
          <div class="container">
            <h2 class="section-title">신간 도서 전체 목록</h2>
            <div class="books-grid">
              <c:forEach var="book" items="${list}">
                <div class="book-card" onclick="location.href='detail?num=${book.newbook_num}'">
                  <img 
                    src="${pageContext.request.contextPath}/img${book.newbook_img}"
                    alt="${book.newbook_title}"
                    class="book-image"
                    onerror="this.src='${pageContext.request.contextPath}/resources/images/no-image.png'"
                  />
                  <div class="recommended-info">
                    <div class="recommended-badge">${book.newbook_category}</div>
                    <h3 class="book-title">${book.newbook_title}</h3>
                    <p class="book-author">${book.newbook_author}</p>
                    <div class="book-rating">
                      <span class="stars">★★★★☆</span>
                      <span class="rating-text">(4.3/5)</span>
                    </div>
                    <div class="book-price"><fmt:formatNumber value="${book.newbook_price}" pattern="#,###"/>원</div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </section>


        <section class="pagination-section">
          <div class="container">
            <div class="pagination">
              <c:if test="${pm.movePrev}">
                <a href="list${pm.makeQuery(pm.startPage-1)}" class="page-btn">‹ 이전</a>
              </c:if>
              <c:if test="${!pm.movePrev}">
                <span class="page-btn disabled">‹ 이전</span>
              </c:if>
              
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
                <c:if test="${pm.criteria.page == idx}">
                  <span class="page-btn active">${idx}</span>
                </c:if>
                <c:if test="${pm.criteria.page != idx}">
                  <a href="list${pm.makeQuery(idx)}" class="page-btn">${idx}</a>
                </c:if>
              </c:forEach>
              
              <c:if test="${pm.moveNext}">
                <a href="list${pm.makeQuery(pm.endPage+1)}" class="page-btn">다음 ›</a>
              </c:if>
              <c:if test="${!pm.moveNext}">
                <span class="page-btn disabled">다음 ›</span>
              </c:if>
            </div>
          </div>
        </section>


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