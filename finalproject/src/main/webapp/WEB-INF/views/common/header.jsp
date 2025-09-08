<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/bookexchange.css">
<link rel="stylesheet" href="${path}/resources/css/tradebooklist.css">
<link rel="stylesheet" href="${path}/resources/css/newbooklist.css">
 <link rel="stylesheet" href="${path}/resources/css/bookdetail.css">
 <link rel="stylesheet" href="${path}/resources/css/cart.css">
 <link rel="stylesheet" href="${path}/resources/css/tradebook_detail.css">
  <link rel="stylesheet" href="${path}/resources/css/treadebook_create.css">
<link rel="stylesheet" href="${path}/resources/css/index.css">

</head>
<body>
      <div>
        {/* Header */}
        <header class="header">
          <div class="container">
            <div class="header-content">
              <a href="#" class="logo">📚 BookStore</a>
              <nav>
                <ul class="nav-menu">
                  <li><a href="${path}">홈</a></li>
                  <li><a href="#">베스트셀러</a></li>
                  <li><a href="#">신간</a></li>
                  <li><a href="#">카테고리</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="${path}/tradebook/bookexchange">책 교환</a></li>
                </ul>
              </nav>
              <div class="user-actions">
                <a href="${path}/member/login" class="btn btn-outline">로그인</a>
                <a href="${path}/member/register" class="btn btn-primary">회원가입</a>
                <div class="user-menu">
                  <div class="user-greeting" onclick="toggleDropdown()">
                    홍길동님 반갑습니다 ▼
                  </div>
                  <div class="user-dropdown">
                    <a href="#" class="dropdown-item">로그아웃</a>
                    <a href="${path}/chat/chat" class="dropdown-item">채팅</a>
                    <a href="${path}/member/cart" class="dropdown-item">장바구니</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
