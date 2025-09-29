<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 관리 - 관리자</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Inter', sans-serif; background: #f8f9fa; color: #2c3e50; }

    .container { max-width: 1200px; margin: 0 auto; padding: 2rem; }

    .page-header { background: #fff; padding: 1.5rem 2rem; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); display: flex; justify-content: space-between; align-items: center; }
    .page-title { font-size: 1.6rem; font-weight: 700; }
    .back-btn { background: #667eea; color: #fff; text-decoration: none; padding: 0.6rem 1rem; border-radius: 8px; font-weight: 600; }

    .filters { margin-top: 1rem; background: #fff; padding: 1rem 1.5rem; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); display: grid; grid-template-columns: repeat(12, 1fr); gap: 0.75rem; }
    .filter-group { grid-column: span 3; display: flex; gap: 0.5rem; align-items: center; }
    .filter-group.w-6 { grid-column: span 6; }
    .filter-label { font-size: 0.9rem; color: #7f8c8d; min-width: 64px; }
    .input, .select { width: 100%; padding: 0.6rem 0.8rem; border: 1px solid #e1e4e8; border-radius: 8px; background: #fff; }
    .btn { padding: 0.6rem 1rem; border-radius: 8px; border: none; cursor: pointer; font-weight: 600; text-decoration: none; display: inline-flex; align-items: center; }
    .btn-primary { background: #3498db; color: #fff; }
    .btn-primary:hover { background: #2980b9; color: #fff; }
    .btn-outline { background: #fff; color: #2c3e50; border: 1px solid #dfe3e6; }
    .btn-outline:hover { background: #f7f9fb; color: #2c3e50; border-color: #cfd6dc; }

    .table-wrap { margin-top: 1.25rem; background: #fff; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.06); overflow: hidden; }
    table { width: 100%; border-collapse: collapse; }
    thead th { background: #34495e; color:#fff; padding: 0.9rem; text-align: left; font-size: 0.85rem; letter-spacing: 0.3px; }
    tbody td { padding: 0.9rem; border-bottom: 1px solid #f0f2f4; vertical-align: middle; }
    .book { display: flex; gap: 0.75rem; align-items: center; }
    .cover { width: 44px; height: 60px; object-fit: cover; border-radius: 6px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); }
    .title { font-weight: 600; }
    .meta { color: #7f8c8d; font-size: 0.85rem; }
    .qty { font-weight: 700; }
    .badge { display: inline-block; padding: 0.3rem 0.6rem; border-radius: 999px; font-size: 0.75rem; font-weight: 700; }
    .badge-ok { background: #e9f7ef; color: #1e8449; }
    .badge-low { background: #fff5e6; color: #ad6800; }
    .badge-oos { background: #fdecea; color: #d93025; }

    .actions { display: flex; gap: 0.4rem; }
    .btn-small { padding: 0.35rem 0.6rem; font-size: 0.8rem; border-radius: 6px; }
    .btn-edit { background:#f1f3f5; }
    .btn-in { background:#27ae60; color:#fff; }
    .btn-out { background:#e74c3c; color:#fff; }

    .pagination { display: flex; gap: 0.4rem; justify-content: center; align-items: center; padding: 1rem; }
    .page-btn { padding: 0.45rem 0.8rem; border: 1px solid #e1e4e8; border-radius: 8px; text-decoration: none; color: #2c3e50; font-size: 0.9rem; }
    .page-btn.active { background: #2c3e50; color:#fff; border-color:#2c3e50; }
</style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <div>
                <div class="page-title">📦 재고 관리</div>
                <div style="color:#7f8c8d; font-size: 0.9rem; margin-top: 0.25rem;">도서 재고 현황을 조회하고 입출고를 관리합니다</div>
            </div>
            <a href="${path}/admin/dashboard" class="back-btn">← 대시보드</a>
        </div>

        <form class="filters" method="get" action="${path}/admin/inventory" id="filterForm">
            <div class="filter-group w-6">
                <span class="filter-label">검색</span>
                <input type="text" name="keyword" value="${scri.keyword}" class="input" placeholder="도서명, 저자, ISBN 검색" />
            </div>
            <div class="filter-group">
                <span class="filter-label">카테고리</span>
                <select class="select" name="category">
                    <option ${empty scri.category ? 'selected' : ''}>전체</option>
                    <option value="소설/에세이" ${scri.category == '소설/에세이' ? 'selected' : ''}>소설/에세이</option>
                    <option value="경영/경제" ${scri.category == '경영/경제' ? 'selected' : ''}>경영/경제</option>
                    <option value="과학/기술" ${scri.category == '과학/기술' ? 'selected' : ''}>과학/기술</option>
                    <option value="예술/디자인" ${scri.category == '예술/디자인' ? 'selected' : ''}>예술/디자인</option>
                    <option value="아동/청소년" ${scri.category == '아동/청소년' ? 'selected' : ''}>아동/청소년</option>
                    <option value="자기계발" ${scri.category == '자기계발' ? 'selected' : ''}>자기계발</option>
                    <option value="IT/컴퓨터" ${scri.category == 'IT/컴퓨터' ? 'selected' : ''}>IT/컴퓨터</option>
                    <option value="역사/문화" ${scri.category == '역사/문화' ? 'selected' : ''}>역사/문화</option>
                    <option value="건강/의학" ${scri.category == '건강/의학' ? 'selected' : ''}>건강/의학</option>
                    <option value="취미/스포츠" ${scri.category == '취미/스포츠' ? 'selected' : ''}>취미/스포츠</option>
                    <option value="외국어" ${scri.category == '외국어' ? 'selected' : ''}>외국어</option>
                    <option value="만화" ${scri.category == '만화' ? 'selected' : ''}>만화</option>
                </select>
            </div>
            <div class="filter-group">
                <span class="filter-label">재고상태</span>
                <select class="select" name="stockStatus">
                    <option value="" ${empty scri.stockStatus ? 'selected' : ''}>전체</option>
                    <option value="low" ${scri.stockStatus == 'low' ? 'selected' : ''}>재고부족(1~5권)</option>
                    <option value="oos" ${scri.stockStatus == 'oos' ? 'selected' : ''}>품절(0권)</option>
                </select>
            </div>
            <div class="filter-group">
                <span class="filter-label">정렬</span>
                <select class="select" name="sort">
                    <option value="최근 등록순" ${empty scri.sort || scri.sort=='최근 등록순' ? 'selected' : ''}>최근 등록순</option>
                    <option value="재고 많은순" ${scri.sort == '재고 많은순' ? 'selected' : ''}>재고 많은순</option>
                    <option value="재고 적은순" ${scri.sort == '재고 적은순' ? 'selected' : ''}>재고 적은순</option>
                    <option value="가격 낮은순" ${scri.sort == '가격 낮은순' ? 'selected' : ''}>가격 낮은순</option>
                    <option value="가격 높은순" ${scri.sort == '가격 높은순' ? 'selected' : ''}>가격 높은순</option>
                </select>
            </div>
            <div class="filter-group" style="justify-content:flex-end; grid-column: span 12;">
                <a class="btn btn-outline" href="${path}/admin/inventory">필터 초기화</a>
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </form>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th style="width:34%">도서</th>
                        <th>ISBN</th>
                        <th>가격</th>
                        <th>재고</th>
                        <th>상태</th>
                        <th>최근 입고일</th>
                        <th style="width:180px">작업</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td>
                                <div class="book">
                                    <img class="cover" src="${pageContext.request.contextPath}/img${item.newbook_img}" alt="cover" />
                                    <div>
                                        <div class="title">${item.newbook_title}</div>
                                        <div class="meta">${item.newbook_author} | ${item.newbook_publisher}</div>
                                    </div>
                                </div>
                            </td>
                            <td>${item.newbook_isbn}</td>
                            <td><fmt:formatNumber value="${item.newbook_price}" pattern=",###"/>원</td>
                            <td class="qty">${item.newbook_count}권</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.newbook_count == 0}"><span class="badge badge-oos">품절</span></c:when>
                                    <c:when test="${item.newbook_count <= 5}"><span class="badge badge-low">재고부족</span></c:when>
                                    <c:otherwise><span class="badge badge-ok">판매중</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:parseDate value="${item.newbook_publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="pubDate" />
                                <fmt:formatDate value="${pubDate}" pattern="yyyy-MM-dd" />
                            </td>
                            <td>
                                <div class="actions">
                                    <form method="post" action="${path}/admin/inventory/in" style="display:inline;">
                                        <input type="hidden" name="newbookNum" value="${item.newbook_num}" />
                                        <input type="number" name="qty" value="1" min="1" style="width:60px; padding:0.3rem; border:1px solid #ddd; border-radius:6px;" />
                                        <button type="submit" class="btn btn-small btn-in">입고</button>
                                    </form>
                                    <form method="post" action="${path}/admin/inventory/out" style="display:inline; margin-left:6px;">
                                        <input type="hidden" name="newbookNum" value="${item.newbook_num}" />
                                        <input type="number" name="qty" value="1" min="1" style="width:60px; padding:0.3rem; border:1px solid #ddd; border-radius:6px;" />
                                        <button type="submit" class="btn btn-small btn-out" ${item.newbook_count == 0 ? 'disabled' : ''}>출고</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination">
                <c:if test="${pm.criteria.page > 1}">
                    <a href="${path}/admin/inventory${pm.makeQuery(1)}" class="page-btn">« 처음</a>
                </c:if>
                <c:if test="${pm.movePrev}">
                    <a href="${path}/admin/inventory${pm.makeQuery(pm.prev)}" class="page-btn">‹ 이전</a>
                </c:if>
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                    <c:choose>
                        <c:when test="${pm.criteria.page == i}">
                            <span class="page-btn active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${path}/admin/inventory${pm.makeQuery(i)}" class="page-btn">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pm.moveNext}">
                    <a href="${path}/admin/inventory${pm.makeQuery(pm.next)}" class="page-btn">다음 ›</a>
                </c:if>
                <c:if test="${pm.criteria.page < pm.maxPage}">
                    <a href="${path}/admin/inventory${pm.makeQuery(pm.last)}" class="page-btn">마지막 »</a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>

