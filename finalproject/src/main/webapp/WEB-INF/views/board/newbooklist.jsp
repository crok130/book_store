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
            <form id="searchForm" action="${pageContext.request.contextPath}/board/list" method="get">
              <div class="filters-content">
                <div class="search-filter">
                  <input 
                    type="text" 
                    name="keyword"
                    class="search-input" 
                    placeholder="도서명이나 저자명을 입력하세요..."
                    value="${pm.criteria.keyword}"
                  />
                </div>
                <div class="filter-group">
                  <span class="filter-label">카테고리:</span>
                  <select name="category" class="filter-select">
                    <option value="">전체 카테고리</option>
                    <option value="소설/에세이" ${pm.criteria.category == '소설/에세이' ? 'selected' : ''}>소설/에세이</option>
                    <option value="경영/경제" ${pm.criteria.category == '경영/경제' ? 'selected' : ''}>경영/경제</option>
                    <option value="과학/기술" ${pm.criteria.category == '과학/기술' ? 'selected' : ''}>과학/기술</option>
                    <option value="예술/디자인" ${pm.criteria.category == '예술/디자인' ? 'selected' : ''}>예술/디자인</option>
                    <option value="자기계발" ${pm.criteria.category == '자기계발' ? 'selected' : ''}>자기계발</option>
                    <option value="IT/컴퓨터" ${pm.criteria.category == 'IT/컴퓨터' ? 'selected' : ''}>IT/컴퓨터</option>
                    <option value="아동/청소년" ${pm.criteria.category == '아동/청소년' ? 'selected' : ''}>아동/청소년</option>
                  </select>
                </div>
                <div class="filter-group">
                  <span class="filter-label">정렬:</span>
                  <select name="sort" class="filter-select">
                    <option value="newbook_publication_date" ${pm.criteria.sort == 'newbook_publication_date' ? 'selected' : ''}>출간일순</option>
                    <option value="newbook_num" ${pm.criteria.sort == 'newbook_num' ? 'selected' : ''}>최신순</option>
                    <option value="newbook_price_asc" ${pm.criteria.sort == 'newbook_price_asc' ? 'selected' : ''}>가격낮은순</option>
                    <option value="newbook_price_desc" ${pm.criteria.sort == 'newbook_price_desc' ? 'selected' : ''}>가격높은순</option>
                  </select>
                </div>
                <div class="filter-group">
                  <button type="submit" class="search-btn">검색</button>
                </div>
              </div>
            </form>
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
              <!-- 처음 페이지 (1페이지가 아닐 때만 표시) -->
              <c:if test="${pm.criteria.page > 1}">
                <a href="${pageContext.request.contextPath}/board/list${pm.makeQuery(1)}" class="page-btn">« 처음</a>
              </c:if>
              
              <!-- 이전 페이지 (이전 블록이 있을 때만 표시) -->
              <c:if test="${pm.movePrev}">
                <a href="${pageContext.request.contextPath}/board/list${pm.makeQuery(pm.startPage-1)}" class="page-btn">‹ 이전</a>
              </c:if>
              
              <!-- 페이지 번호들 -->
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
                <c:if test="${pm.criteria.page == idx}">
                  <span class="page-btn active">${idx}</span>
                </c:if>
                <c:if test="${pm.criteria.page != idx}">
                  <a href="${pageContext.request.contextPath}/board/list${pm.makeQuery(idx)}" class="page-btn">${idx}</a>
                </c:if>
              </c:forEach>
              
              <!-- 다음 페이지 (다음 블록이 있을 때만 표시) -->
              <c:if test="${pm.moveNext}">
                <a href="${pageContext.request.contextPath}/board/list${pm.makeQuery(pm.endPage+1)}" class="page-btn">다음 ›</a>
              </c:if>
              
              <!-- 마지막 페이지 (마지막 페이지가 아닐 때만 표시) -->
              <c:if test="${pm.criteria.page < pm.maxPage}">
                <a href="${pageContext.request.contextPath}/board/list${pm.makeQuery(pm.maxPage)}" class="page-btn">마지막 »</a>
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

        // 검색 폼 제출 시 페이지 초기화
        document.getElementById('searchForm').addEventListener('submit', function() {
          // 검색 시 첫 페이지로 이동
          const pageInput = document.createElement('input');
          pageInput.type = 'hidden';
          pageInput.name = 'page';
          pageInput.value = '1';
          this.appendChild(pageInput);
        });

        // 카테고리나 정렬 변경 시 자동 검색
        document.querySelectorAll('.filter-select').forEach(function(select) {
          select.addEventListener('change', function() {
            document.getElementById('searchForm').submit();
          });
        });
 
      </script>

      <style>
        .search-btn {
          background-color: #007bff;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 4px;
          cursor: pointer;
          font-size: 14px;
          margin-left: 10px;
        }
        
        .search-btn:hover {
          background-color: #0056b3;
        }
        
        .filters-content {
          display: flex;
          align-items: center;
          gap: 20px;
          flex-wrap: wrap;
        }
        
        .search-filter {
          flex: 1;
          min-width: 200px;
        }
        
        .filter-group {
          display: flex;
          align-items: center;
          gap: 8px;
        }
        
        .filter-label {
          font-weight: 500;
          color: #333;
        }
        
        .filter-select {
          padding: 6px 12px;
          border: 1px solid #ddd;
          border-radius: 4px;
          font-size: 14px;
        }
      </style>
</body>
</html>