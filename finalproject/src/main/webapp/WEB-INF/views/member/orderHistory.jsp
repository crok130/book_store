<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Inter', sans-serif; background: #f8f9fa; color: #2c3e50; }

    .container { max-width: 1100px; margin: 0 auto; padding: 2rem 1rem; }

    .page-header { display:flex; justify-content: space-between; align-items:center; margin-bottom: 1rem; }
    .title { font-size: 1.75rem; font-weight: 700; }
    .subtitle { color:#7f8c8d; }
    .back-btn { text-decoration:none; background:#2d3436; color:#fff; padding:0.55rem 1rem; border-radius:8px; font-weight:600; }
    .back-btn:hover { background:#364958; }

    .card { background:#fff; border-radius:12px; box-shadow:0 2px 10px rgba(0,0,0,0.06); overflow:hidden; }
    .table { width:100%; border-collapse: collapse; }
    .table th { background:#34495e; color:#fff; text-align:left; padding:0.9rem; font-size:0.9rem; }
    .table td { padding:0.9rem; border-bottom:1px solid #eef2f5; vertical-align: middle; }

    .product { display:flex; gap:0.75rem; align-items:center; }
    .cover { width:44px; height:60px; object-fit:cover; border-radius:6px; box-shadow:0 1px 4px rgba(0,0,0,0.08); }
    .p-title { font-weight:600; }
    .p-meta { color:#7f8c8d; font-size:0.85rem; }

    .price { font-weight:700; color:#2c3e50; }
    .badge { display:inline-block; padding:0.35rem 0.6rem; border-radius:999px; font-size:0.75rem; font-weight:700; }
    .badge-prep { background:#fff3cd; color:#856404; }
    .badge-ship { background:#d1ecf1; color:#0c5460; }
    .badge-done { background:#d4edda; color:#155724; }
    .badge-cancel { background:#f8d7da; color:#721c24; }

    .empty { padding:3rem; text-align:center; color:#7f8c8d; }
    .empty .icon { font-size:3rem; margin-bottom:0.5rem; }

    .pagination { display:flex; gap:0.4rem; justify-content:center; padding:1rem; }
    .page-btn { padding:0.45rem 0.8rem; border:1px solid #e1e4e8; border-radius:8px; text-decoration:none; color:#2c3e50; font-size:0.9rem; }
    .page-btn.active { background:#2c3e50; color:#fff; border-color:#2c3e50; }
</style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <div>
                <div class="title">🧾 주문내역</div>
                <div class="subtitle">최근 주문 현황을 확인하세요</div>
            </div>
            <a href="${path}" class="back-btn">← 홈으로</a>
        </div>

        <div class="card">
            <c:choose>
                <c:when test="${empty list}">
                    <div class="empty">
                        <div class="icon">📦</div>
                        <div>주문 내역이 없습니다.</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width:120px">주문번호</th>
                                <th>상품</th>
                                <th style="width:80px">수량</th>
                                <th style="width:140px">결제금액</th>
                                <th style="width:120px">상태</th>
                                <th style="width:140px">주문일시</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${list}">
                                <tr>
                                    <td>#${o.payment_num}</td>
                                    <td>
                                        <div class="product">
                                            <img class="cover" src="${pageContext.request.contextPath}/img${o.newbook_img}" alt="cover" />
                                            <div>
                                                <div class="p-title">${o.newbook_title}</div>
                                                <div class="p-meta">도서번호: ${o.newbook_num}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${o.payment_quantity}</td>
                                    <td class="price"><fmt:formatNumber value="${o.payment_total_price}" pattern=",###"/>원</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.item_status == '배송준비중'}"><span class="badge badge-prep">배송준비중</span></c:when>
                                            <c:when test="${o.item_status == '배송중'}"><span class="badge badge-ship">배송중</span></c:when>
                                            <c:when test="${o.item_status == '배송완료'}"><span class="badge badge-done">배송완료</span></c:when>
                                            <c:otherwise><span class="badge badge-cancel">${o.item_status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <fmt:parseDate value="${o.payment_date}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="paidAt"/>
                                        <fmt:formatDate value="${paidAt}" pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty pm}">
            <div class="pagination">
                <c:if test="${pm.criteria.page > 1}">
                    <a class="page-btn" href="${path}/member/orders${pm.makeQuery(1)}">« 처음</a>
                </c:if>
                <c:if test="${pm.movePrev}">
                    <a class="page-btn" href="${path}/member/orders${pm.makeQuery(pm.prev)}">‹ 이전</a>
                </c:if>
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                    <c:choose>
                        <c:when test="${pm.criteria.page == i}"><span class="page-btn active">${i}</span></c:when>
                        <c:otherwise><a class="page-btn" href="${path}/member/orders${pm.makeQuery(i)}">${i}</a></c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pm.moveNext}">
                    <a class="page-btn" href="${path}/member/orders${pm.makeQuery(pm.next)}">다음 ›</a>
                </c:if>
                <c:if test="${pm.criteria.page < pm.maxPage}">
                    <a class="page-btn" href="${path}/member/orders${pm.makeQuery(pm.last)}">마지막 »</a>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>

