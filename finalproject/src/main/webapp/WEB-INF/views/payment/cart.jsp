<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<jsp:include page="../common/header.jsp"/>

        <section class="cart-header">
          <div class="container">
            <h1 class="cart-title">나만의 서재</h1>
            <p class="cart-subtitle">선택하신 소중한 책들이 당신을 기다리고 있습니다</p>
          </div>
        </section>

        <section class="cart-section">
          <div class="container">
  	<c:choose>
		<c:when test="${!empty cart}">
            <div class="cart-content">
              <div class="cart-items" id="cartItems">
                <c:set var="totalQty" value="0" />
                <c:set var="totalPrice" value="0" />
                <h2 class="items-header">선택한 도서 (<c:out value='${fn:length(cart)}'/>권)</h2>
                <c:forEach var="item" items="${cart}">
                  <c:set var="qty" value="${item.book_count != null ? item.book_count : 0}" />
                  <c:set var="unit" value="${item.price != null ? item.price : 0}" />
                  <c:set var="lineTotal" value="${qty * unit}" />
                  <c:set var="totalQty" value="${totalQty + qty}" />
                  <c:set var="totalPrice" value="${totalPrice + lineTotal}" />
                  <div class="cart-item" data-newbook-num="${item.newbook_num}" data-unit-price="${unit}">
                    <img 
                      src="${pageContext.request.contextPath}/img${item.newbook_img}"
                      alt="${item.newbook_title}"
                      class="item-image"
                    />
                    <div class="item-info">
                      <h3 class="item-title"><c:out value='${item.newbook_title}'/></h3>
                      <p class="item-author"><c:out value='${item.newbook_author}'/></p>
                      <p class="item-price"><fmt:formatNumber value='${lineTotal}' type='number'/>원</p>
                    </div>
                    <div class="item-controls">
                      <div class="quantity-control">
                        <button class="quantity-btn btn-decrease">−</button>
                        <span class="quantity-display">${qty}</span>
                        <button class="quantity-btn btn-increase">+</button>
                      </div>
                      <button class="remove-btn btn-delete">🗑️</button>
                    </div>
                  </div>
                </c:forEach>
              </div>


              <div class="cart-summary">
                <h2 class="summary-header">주문 요약</h2>
                <div class="summary-row summary-total">
                  <span class="summary-label">총 결제 금액</span>
                  <span class="summary-value" id="sumPrice"><fmt:formatNumber value='${totalPrice}' type='number'/>원</span>
                </div>
                <button class="checkout-btn" onclick="goToCheckout()">주문하기</button>
                <a href="${path}/board/list" class="continue-shopping">쇼핑 계속하기</a>
              </div>
            </div>
		</c:when>
		<c:otherwise>
            <div class="empty-cart">
              <div class="empty-icon">📚</div>
              <h2 class="empty-title">장바구니가 비어있습니다</h2>
              <p class="empty-text">아직 선택하신 책이 없습니다.<br/>마음에 드는 책을 담아보세요.</p>
              <a href="${path}/board/list" class="btn btn-primary">책 둘러보기</a>
            </div>
          </div>
        </c:otherwise>
	</c:choose>
        </section>


        <!-- Footer -->
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

        // ===== Cart AJAX Handlers =====
        (function(){
          const container = document.getElementById('cartItems');
          if (!container) return;

          function fmt(n){ return new Intl.NumberFormat('ko-KR').format(n); }

          function refreshSummary(){
            const items = container.querySelectorAll('.cart-item');
            let sumPrice = 0;
            items.forEach(it => {
              const qty = parseInt(it.querySelector('.quantity-display').textContent) || 0;
              const unit = parseInt(it.getAttribute('data-unit-price')) || 0;
              sumPrice += qty * unit;
            });
            const sumPriceEl = document.getElementById('sumPrice');
            if (sumPriceEl) sumPriceEl.textContent = fmt(sumPrice) + '원';
          }

          function post(url, data){
            return fetch(url, {
              method: 'POST',
              headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
              body: new URLSearchParams(data)
            }).then(r => r.text());
          }

          function updateItemLinePrice(itemEl){
            const qty = parseInt(itemEl.querySelector('.quantity-display').textContent) || 0;
            const unit = parseInt(itemEl.getAttribute('data-unit-price')) || 0;
            const priceEl = itemEl.querySelector('.item-price');
            if (priceEl) priceEl.textContent = fmt(qty * unit) + '원';
          }

          container.addEventListener('click', function(e){
            const btnInc = e.target.closest('.btn-increase');
            const btnDec = e.target.closest('.btn-decrease');
            const btnDel = e.target.closest('.btn-delete');
            const itemEl = e.target.closest('.cart-item');
            if (!itemEl) return;
            const bookNum = itemEl.getAttribute('data-newbook-num');
            const qtyEl = itemEl.querySelector('.quantity-display');
            let qty = parseInt(qtyEl.textContent) || 0;

            if (btnInc){
              const newQty = qty + 1;
              post('${path}/payment/cart/update', { newbook_num: bookNum, book_count: newQty })
                .then(msg => {
                  if (msg.indexOf('수량 변경 완료') === 0){
                    qtyEl.textContent = newQty; updateItemLinePrice(itemEl); refreshSummary();
                  } else {
                    alert(msg);
                  }
                })
                .catch(() => {});
            } else if (btnDec){
              const newQty = Math.max(1, qty - 1);
              if (newQty === qty) return;
              post('${path}/payment/cart/update', { newbook_num: bookNum, book_count: newQty })
                .then(msg => {
                  if (msg.indexOf('수량 변경 완료') === 0){
                    qtyEl.textContent = newQty; updateItemLinePrice(itemEl); refreshSummary();
                  } else {
                    alert(msg);
                  }
                })
                .catch(() => {});
            } else if (btnDel){
              post('${path}/payment/cart/delete', { newbook_num: bookNum })
                .then(msg => { if (msg.indexOf('항목 삭제 완료') === 0){ itemEl.remove(); refreshSummary(); } else { alert(msg); } })
                .catch(() => {});
            }
          });
        })();

        // 장바구니에서 결제 페이지로 이동
        function goToCheckout() {
          // 직접 결제 페이지로 이동
          window.location.href = '${path}/payment/ready?cart=true';
        }
      </script>

</body>
</html>