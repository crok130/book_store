<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리 - 관리자</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f8f9fa;
        color: #333;
    }
    
    .admin-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }
    
    .page-header {
        background: white;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        margin-bottom: 2rem;
    }
    
    .page-title {
        font-size: 2rem;
        font-weight: 700;
        color: #2c3e50;
        margin-bottom: 0.5rem;
    }
    
    .page-subtitle {
        color: #7f8c8d;
        font-size: 1rem;
    }
    
    .order-table-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        overflow: hidden;
    }
    
    .order-table {
        width: 100%;
        border-collapse: collapse;
    }
    
    .order-table th {
        background: #34495e;
        color: white;
        padding: 1rem;
        text-align: left;
        font-weight: 600;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .order-table td {
        padding: 1rem;
        border-bottom: 1px solid #ecf0f1;
        vertical-align: middle;
    }
    
    .order-table tr:hover {
        background-color: #f8f9fa;
    }
    
    .status-badge {
        padding: 0.4rem 0.8rem;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .status-preparing {
        background: #fff3cd;
        color: #856404;
    }
    
    .status-shipping {
        background: #d1ecf1;
        color: #0c5460;
    }
    
    .status-delivered {
        background: #d4edda;
        color: #155724;
    }
    
    .status-cancelled {
        background: #f8d7da;
        color: #721c24;
    }
    
    .status-refunded {
        background: #e2e3e5;
        color: #383d41;
    }
    
    .action-buttons {
        display: flex;
        gap: 0.5rem;
    }
    
    .btn {
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 0.8rem;
        font-weight: 500;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
    }
    
    .btn-primary {
        background: #3498db;
        color: white;
    }
    
    .btn-primary:hover {
        background: #2980b9;
    }
    
    .btn-success {
        background: #27ae60;
        color: white;
    }
    
    .btn-success:hover {
        background: #229954;
    }
    
    .btn-warning {
        background: #f39c12;
        color: white;
    }
    
    .btn-warning:hover {
        background: #e67e22;
    }
    
    .btn-danger {
        background: #e74c3c;
        color: white;
    }
    
    .btn-danger:hover {
        background: #c0392b;
    }
    
    .price {
        font-weight: 600;
        color: #27ae60;
    }
    
    .order-info {
        display: flex;
        flex-direction: column;
        gap: 0.2rem;
    }
    
    .order-id {
        font-weight: 600;
        color: #2c3e50;
    }
    
    .order-date {
        font-size: 0.8rem;
        color: #7f8c8d;
    }
    
    .customer-info {
        display: flex;
        flex-direction: column;
        gap: 0.2rem;
    }
    
    .customer-name {
        font-weight: 500;
    }
    
    .customer-phone {
        font-size: 0.8rem;
        color: #7f8c8d;
    }
    
    .no-orders {
        text-align: center;
        padding: 3rem;
        color: #7f8c8d;
    }
    
    .no-orders-icon {
        font-size: 3rem;
        margin-bottom: 1rem;
    }
    
    .status-select {
        padding: 0.4rem 0.8rem;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 0.8rem;
        background: white;
    }
    
    .update-btn {
        background: #3498db;
        color: white;
        border: none;
        padding: 0.4rem 0.8rem;
        border-radius: 6px;
        cursor: pointer;
        font-size: 0.8rem;
        margin-left: 0.5rem;
    }
    
    .update-btn:hover {
        background: #2980b9;
    }
</style>
</head>
<body>
    <div class="admin-container">
        <div class="page-header">
            <div>
                <h1 class="page-title">🛒 주문 관리</h1>
                <p class="page-subtitle">대기 중인 주문을 확인하고 상태를 관리하세요</p>
            </div>
            <a href="${path}/admin/dashboard" class="btn btn-primary" style="background: #667eea; padding: 0.75rem 1.5rem; text-decoration: none; border-radius: 8px; color: white; font-weight: 600;">
                📊 대시보드로 돌아가기
            </a>
        </div>
        
        <div class="order-table-container">
            <c:choose>
                <c:when test="${empty orderList}">
                    <div class="no-orders">
                        <div class="no-orders-icon">📦</div>
                        <h3>주문이 없습니다</h3>
                        <p>아직 처리할 주문이 없습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="order-table">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>고객정보</th>
                                <th>주문내용</th>
                                <th>수량</th>
                                <th>총금액</th>
                                <th>주문일시</th>
                                <th>상태</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>
                                        <div class="order-info">
                                            <span class="order-id">#${order.payment_num}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="customer-info">
                                            <span class="customer-name">${order.member_name}</span>
                                            <span class="customer-phone">${order.member_phone}</span>
                                            <span class="customer-phone">${order.member_addr}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="order-info">
                                            <span>도서 이름: ${order.newbook_title}</span>
                                            <span class="order-date">도서번호: ${order.newbook_num}</span>
                                        </div>
                                    </td>
                                    <td>${order.payment_quantity}개</td>
                                    <td class="price"><fmt:formatNumber value="${order.payment_total_price}" pattern="#,###"/>원</td>
                                    <td>
                                        <div class="order-date">
                                            <fmt:parseDate value="${order.payment_date}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="parsedDate" />
											<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.item_status == '배송준비중'}">
                                                <span class="status-badge status-preparing">${order.item_status}</span>
                                            </c:when>
                                            <c:when test="${order.item_status == '배송중'}">
                                                <span class="status-badge status-shipping">${order.item_status}</span>
                                            </c:when>
                                            <c:when test="${order.item_status == '배송완료'}">
                                                <span class="status-badge status-delivered">${order.item_status}</span>
                                            </c:when>
                                            <c:when test="${order.item_status == '주문취소'}">
                                                <span class="status-badge status-cancelled">${order.item_status}</span>
                                            </c:when>
                                            <c:when test="${order.item_status == '환불완료'}">
                                                <span class="status-badge status-refunded">${order.item_status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-preparing">${order.item_status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form method="post" action="${path}/admin/updateStatus" style="display: inline;">
                                            <input type="hidden" name="payment_num" value="${order.payment_num}">
                                            <select name="item_status" class="status-select">
                                                <option value="배송준비중" ${order.item_status == '배송준비중' ? 'selected' : ''}>배송준비중</option>
                                                <option value="배송중" ${order.item_status == '배송중' ? 'selected' : ''}>배송중</option>
                                                <option value="배송완료" ${order.item_status == '배송완료' ? 'selected' : ''}>배송완료</option>
                                                <option value="주문취소" ${order.item_status == '주문취소' ? 'selected' : ''}>주문취소</option>
                                                <option value="환불완료" ${order.item_status == '환불완료' ? 'selected' : ''}>환불완료</option>
                                            </select>
                                            <button type="submit" class="update-btn">변경</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <script>
        // 메시지 표시
        if('${msg}' !== '' && '${msg}' !== null) {
            alert('${msg}');
        }
    </script>
</body>
</html>
