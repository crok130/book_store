<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트셀러 - BookBridge</title>
<link rel="stylesheet" href="${path}/resources/css/index.css">
<style>
  .best-hero{background:#f8f6f0;padding:40px 0;margin-bottom:20px}
  .best-hero .container{max-width:1200px;margin:0 auto;padding:0 16px}
  .best-hero h1{font-size:28px;margin-bottom:8px}
  .best-hero p{color:#666}
  .grid{max-width:1200px;margin:0 auto;padding:0 16px;display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:16px}
  .card{background:#fff;border:1px solid #eee;border-radius:10px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.04)}
  .thumb{width:100%;aspect-ratio:3/4;object-fit:cover;display:block}
  .info{padding:12px}
  .title{font-weight:600;font-size:15px;line-height:1.3;margin-bottom:6px}
  .author{font-size:13px;color:#777;margin-bottom:8px}
  .price{font-weight:700;color:#2d3436}
  .badge{position:absolute;top:8px;left:8px;background:#d4a574;color:#fff;font-size:12px;padding:4px 8px;border-radius:999px}
  .card-wrap{position:relative}
</style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>
  <section class="best-hero">
    <div class="container">
      <h1>베스트셀러</h1>
      <p>지금 가장 많이 사랑받는 책들을 만나보세요.</p>
    </div>
  </section>
  <section>
    <div class="grid">
      <c:forEach items="${best}" var="b">
        <div class="card">
          <div class="card-wrap">
            <span class="badge">TOP ${b.rank_num}</span>
            <a href="${b.link_url}" target="_blank">
              <img class="thumb" src="${b.image_src}" alt="${b.title}"/>
            </a>
          </div>
          <div class="info">
            <div class="title">${b.title}</div>
          </div>
        </div>
      </c:forEach>
    </div>
  </section>

  <section style="margin:24px 0;">
    <div class="container" style="max-width:1200px;margin:0 auto;padding:0 16px;display:flex;gap:8px;justify-content:center;">
      <c:forEach begin="1" end="${totalPages}" var="p">
        <c:choose>
          <c:when test="${p == page}">
            <span style="padding:8px 12px;border:1px solid #333;border-radius:6px;background:#333;color:#fff;">${p}</span>
          </c:when>
          <c:otherwise>
            <a href="${path}/board/best?page=${p}" style="padding:8px 12px;border:1px solid #ccc;border-radius:6px;color:#333;text-decoration:none;">${p}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </div>
  </section>
</body>
</html>

