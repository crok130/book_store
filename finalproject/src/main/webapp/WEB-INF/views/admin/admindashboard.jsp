<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${path}/resources/css/admindashboard.css">
</head>
<body>
<script>
	if('${msg}' !== '' && '${msg}'!== null){
		alert("${msg}");
	}
</script>
         <div class="dashboard-container">
        <div class="sidebar">
          <div class="sidebar-header">
            <a href="${path}/admin/dashboard" class="sidebar-logo">
              🛠️ BookBridge Admin
              <span class="admin-badge">ADMIN</span>
            </a>
            <div class="sidebar-user">환영합니다, 관리자님</div>
          </div>

          <div class="sidebar-nav">
            <div class="nav-section">
              <div class="nav-section-title">메인</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="${path}/admin/dashboard" class="nav-link active">
                    <span class="nav-icon">📊</span>
                    대시보드
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">도서 관리</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="${path}/admin/write" class="nav-link">
                    <span class="nav-icon">📖</span>
                    새 도서 등록
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">📚</span>
                    도서 목록
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">🏷️</span>
                    카테고리 관리
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">운영 관리</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="${path}/admin/orders" class="nav-link">
                    <span class="nav-icon">🛒</span>
                    주문 관리
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${path}/admin/inventory" class="nav-link">
                    <span class="nav-icon">📦</span>
                    재고 관리
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">분석</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">💰</span>
                    매출 분석
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="nav-icon">📈</span>
                    통계 리포트
                  </a>
                </li>
              </ul>
            </div>

            <div class="nav-section">
              <div class="nav-section-title">설정</div>
              <ul class="nav-menu">
                <li class="nav-item">
                  <a href="${path}" class="nav-link">
                    <span class="nav-icon">🌐</span>
                    사용자 사이트
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>

       
        <div class="main-content">
          <div class="main-header">
            <div class="header-top">
              <h1 class="page-title">관리자 대시보드</h1>
              <div class="header-actions">
                <a href="${path}/admin/write" class="btn btn-primary">
                  📖 새 도서 등록
                </a>
              </div>
            </div>
            <div class="breadcrumb">	
              <span>대시보드</span>
            </div>
          </div>

          <div class="dashboard-content">
       
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">📚</div>
                </div>
                <div class="stat-number">${vo.book}</div>
                <div class="stat-label">총 등록 도서</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">👥</div>
                </div>
                <div class="stat-number">${vo.member}</div>
                <div class="stat-label">총 회원 수</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">📦</div>
                </div>
                <div class="stat-number">${vo.oder}</div>
                <div class="stat-label">주문</div>
              </div>

              <div class="stat-card">
                <div class="stat-header">
                  <div class="stat-icon">💰</div>
                </div>
                <div class="stat-number">₩<fmt:formatNumber value="${vo.money}" pattern="#,###"/></div>
                <div class="stat-label">매출</div>
              </div>
            </div>

  
            <div class="quick-actions">
              <h2 class="section-title">
                ⚡ 빠른 작업
              </h2>
              <div class="actions-grid">
                <a href="${path}/admin/write" class="action-btn">
                  <div class="action-icon">📖</div>
                  <div class="action-title">새 도서 등록</div>
                  <div class="action-desc">새로운 도서를 시스템에 추가</div>
                </a>

                <a href="${path}/admin/orders" class="action-btn">
                  <div class="action-icon">🛒</div>
                  <div class="action-title">주문 처리</div>
                  <div class="action-desc">대기 중인 주문 확인</div>
                </a>

                <a href="${path}/admin/inventory" class="action-btn">
                  <div class="action-icon">👤</div>
                  <div class="action-title">재고 관리</div>
                  <div class="action-desc">신규 회원 및 문의 확인</div>
                </a>

                <a href="#" class="action-btn">
                  <div class="action-icon">📊</div>
                  <div class="action-title">매출 분석</div>
                  <div class="action-desc">실시간 매출 현황 조회</div>
                </a>

              </div>
            </div>

            <div class="dashboard-grid">
              <div class="chart-card">
                <h2 class="section-title">
                  📈 매출 현황
                </h2>
                <div class="chart-placeholder">
                  📊 매출 차트가 여기에 표시됩니다
                </div>
              </div>
              <script src="https://d3js.org/d3.v7.min.js"></script>
              <script>
              (function(){
                const basePath = '${path}';
                fetch(basePath + '/admin/api/revenue/daily7', { headers: { 'Accept': 'application/json' } })
                  .then(r => r.json())
                  .then(rows => {
                    const data = rows.map(d => ({ date: d.SALES_DATE || d.sales_date, amount: +d.TOTAL_AMOUNT || +d.total_amount || 0 }));
                    // 주 범위 라벨 (월~일)
                    const parse = d3.timeParse('%Y-%m-%d');
                    const formatMd = d3.timeFormat('%m-%d');
                    const weekStart = parse(data[0].date);
                    const weekEnd = parse(data[data.length-1].date);
                    const container = document.querySelector('.chart-card .chart-placeholder');
                    if(!container) return;
                    container.innerHTML = '';
                    const width = container.clientWidth || 600;
                    const height = 280;
                    const margin = { top: 10, right: 20, bottom: 45, left: 50 };

                    const svg = d3.select(container)
                      .append('svg')
                      .attr('width', width)
                      .attr('height', height);

                    const x = d3.scaleBand()
                      .domain(data.map(d => d.date))
                      .range([margin.left, width - margin.right])
                      .padding(0.2);

                    const y = d3.scaleLinear()
                      .domain([0, d3.max(data, d => d.amount) || 0]).nice()
                      .range([height - margin.bottom, margin.top]);

                    const xAxis = g => g
                      .attr('transform', `translate(0,${height - margin.bottom})`)
                      .call(d3.axisBottom(x).tickSizeOuter(0).tickFormat(() => ''));

                    const yAxis = g => g
                      .attr('transform', `translate(${margin.left},0)`)
                      .call(d3.axisLeft(y).ticks(5).tickFormat(d => d3.format(',')(d)))
                      .call(g => g.select('.domain').remove());

                    svg.append('g').call(xAxis);
                    svg.append('g').call(yAxis);

                    const bar = svg.append('g')
                      .selectAll('rect')
                      .data(data)
                      .enter().append('rect')
                      .attr('x', d => x(d.date))
                      .attr('y', d => y(d.amount))
                      .attr('width', x.bandwidth())
                      .attr('height', d => (height - margin.bottom) - y(d.amount))
                      .attr('fill', '#4f46e5');

                    const labels = svg.append('g')
                      .selectAll('text')
                      .data(data)
                      .enter().append('text')
                      .attr('x', d => x(d.date) + x.bandwidth()/2)
                      .attr('y', d => y(d.amount) - 6)
                      .attr('text-anchor', 'middle')
                      .attr('fill', '#111')
                      .attr('font-size', '11px')
                      .text(d => d3.format(',')(d.amount));

                    // 날짜 라벨을 그래프 아래쪽에 별도 행으로 배치
                    // 기존 라벨 영역 제거
                    const existingDateRow = container.parentElement.querySelector('.chart-date-row');
                    if(existingDateRow) existingDateRow.remove();
                    // 각 막대 하단에 해당 일자 라벨을 별도 행으로 표기
                    const dateRow = document.createElement('div');
                    dateRow.className = 'chart-date-row';
                    dateRow.style.display = 'flex';
                    dateRow.style.marginTop = '8px';
                    dateRow.style.fontSize = '11px';
                    dateRow.style.color = '#333';
                    dateRow.style.paddingLeft = margin.left + 'px';
                    dateRow.style.paddingRight = margin.right + 'px';
                    data.forEach(d => {
                      const cell = document.createElement('div');
                      cell.style.flex = '1 1 0';
                      cell.style.textAlign = 'center';
                      const dt = parse(d.date);
                      cell.textContent = formatMd(dt);
                      dateRow.appendChild(cell);
                    });
                    container.parentElement.insertBefore(dateRow, container.nextSibling);
                  })
                  .catch(err => {
                    console.error('Failed to load revenue data', err);
                  });
              })();
              </script>
            </div>


          
            <div class="books-table">
              <h2 class="section-title">
                📚 최근 등록된 도서
              </h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>도서 정보</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>상태</th>
                    <th>등록일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}">
                  <tr>
                    <td>
                      <div class="book-info">
                        <img 
                          src="${pageContext.request.contextPath}/img${list.newbook_img}"
                          alt="${list.newbook_title}"
                          class="book-cover"
                        />
                        <div class="book-details">
                          <h4>${list.newbook_title}</h4>
                          <p>${list.newbook_author} | ${list.newbook_publisher}</p>
                        </div>
                      </div>
                    </td>
                    <td><fmt:formatNumber value="${list.newbook_price}" pattern="#,###"/>원</td>
                    <td>${list.newbook_count}권</td>
                    <td>
                      <c:choose>
                        <c:when test="${list.newbook_count == 0}">
                          <span class="status-badge" style="background:#e74c3c;color:#fff;">재고부족</span>
                        </c:when>
                        <c:otherwise>
                          <span class="status-badge status-active">판매중</span>
                        </c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <fmt:parseDate value="${list.newbook_publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="pubDate" />
                      <fmt:formatDate value="${pubDate}" pattern="yyyy-MM-dd" />
                    </td>
                  </tr>
				</c:forEach>
               
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
</body>
</html>