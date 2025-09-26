# 📚 BookStore - 책 판매 및 물물교환 플랫폼

<div align="center">

![Java](https://img.shields.io/badge/Java-11-orange?style=for-the-badge&logo=java)
![Spring](https://img.shields.io/badge/Spring-5.3.39-green?style=for-the-badge&logo=spring)
![Tomcat](https://img.shields.io/badge/Tomcat-9.0-red?style=for-the-badge&logo=apache-tomcat)
![Git](https://img.shields.io/badge/Git-GitHub-blue?style=for-the-badge&logo=git)

**책을 사고팔고, 교환하는 스마트한 플랫폼**

[🚀 프로젝트 소개](#-프로젝트-소개) • [🛠️ 기술 스택](#️-기술-스택) • [👥 팀원 소개](#-팀원-소개) • [📋 주요 기능](#-주요-기능)

</div>

---

## 🚀 프로젝트 소개

**BookBridge**는 사용자들이 책을 구매하고, 판매하며, 물물교환할 수 있는 종합적인 웹 플랫폼입니다. 
개인 간의 책 거래를 통해 경제적이고 친환경적인 독서 문화를 만들어갑니다.

### ✨ 핵심 가치
- 📖 **책의 가치 재발견**: 사용하지 않는 책을 다른 사람과 공유
- 🤝 **커뮤니티 중심**: 독서 애호가들의 소통 공간
- 💡 **간단 추천**: 인기/최신 정렬 기반 도서 노출
- 💬 **실시간 소통**: 1:1 채팅을 통한 안전한 거래

---

## 🛠️ 기술 스택

### Backend
- **Java 11** - 메인 개발 언어
- **Spring Framework 5.3.39** - MVC 패턴 구현
- **Apache Tomcat 9.0** - 웹 서버
- **MyBatis** - 데이터베이스 매핑
- **Oracle Database** - 데이터 저장소
- **HikariCP** - 커넥션 풀

### Frontend
- **JSP** - 뷰 템플릿
- **JavaScript** - 클라이언트 사이드 로직
- **WebSocket** - 실시간 채팅
- **Bootstrap** - 반응형 UI

### DevOps & Tools
- **Git & GitHub** - 버전 관리 및 협업
- **Maven** - 의존성 관리
- **Lombok** - 코드 간소화

---

## 👥 팀원 소개

<table>
<tr>
<td align="center" width="33%">

### 👨‍💻 **팀장 - 최수빈**
**🎯 담당 파트**
- 추천 도서 노출(인기/최신)
- 결제 및 장바구니 시스템
- 1:1 채팅 기능
- 게시글 등록/관리, 페이징, 수량 수정, 삭제

**💡 주요 기술**
- 정렬/페이징 구현
- 결제 시스템 연동
- WebSocket 실시간 통신
- 추천상품 시스템

</td>
<td align="center" width="33%">

### 👨‍💻 **팀원 - 박석우**
**🎯 담당 파트**
- 회원가입 및 로그인
- 비밀번호 찾기
- 소셜 로그인 연동

**💡 주요 기술**
- Spring Security
- OAuth 2.0
- 이메일 인증

</td>
<td align="center" width="33%">

<!-- 팀 구성 변경으로 민서진 파트는 최수빈으로 통합 -->

</td>
</tr>
</table>

---

## 📋 주요 기능

### 🔐 사용자 관리
- [x] 회원가입 및 로그인
- [x] 회원 정보 수정

### 📚 책 관리
- [x] 신간 도서 등록
- [x] 책 정보 수정 및 삭제
- [x] 재고 수량 관리
- [x] 카테고리별 분류

### 🛒 거래 시스템
- [x] 장바구니 기능
- [x] 결제 시스템
- [x] 주문 내역 관리
- [x] 물물교환 게시판

### 💬 소통 기능
- [x] 1:1 실시간 채팅
- [x] 이미지 전송
- [x] 채팅방 관리
- [x] 메시지 검색

### 🎯 추천 시스템
- [x] 인기 도서 표시
- [x] 최신 도서 노출

### 📄 게시판
- [x] 페이징 처리
- [x] 검색 기능
- [x] 카테고리 필터링
- [x] 정렬 기능

---

## 🏗️ 프로젝트 구조

```
📦 BookStore
├── 📁 src/main/java/net/koreate/bookstore/
│   ├── 📁 admin/       # 관리자
│   ├── 📁 board/       # 게시판/도서 뷰
│   ├── 📁 chat/        # 실시간 채팅
│   ├── 📁 common/      # 공통(인터셉터/유틸)
│   ├── 📁 home/        # 홈/인덱스
│   ├── 📁 member/      # 회원
│   ├── 📁 payment/     # 결제/장바구니
│   ├── 📁 python/      # 파이썬 연동
│   ├── 📁 tradeboard/  # 물물교환
│   └── 📁 vo/          # VO(엔티티)
├── 📁 src/main/resources/
│   ├── 📁 prop/        # 설정(db.properties 등)
│   └── 📁 spring/      # 스프링 설정
├── 📁 src/main/webapp/
│   ├── 📁 resources/   # 정적 리소스(css 등)
│   └── 📁 WEB-INF/     # JSP 뷰/서블릿 설정
└── 📁 src/test/java/   # 테스트 코드
```

---

## 🚀 시작하기

### 필수 요구사항
- Java 11
- Apache Tomcat 9.0
- Oracle Database
- Maven 3.6+

### 설치 및 실행

1. **저장소 클론**
```bash
git clone https://github.com/your-username/bookstore.git
cd bookstore
```

2. **데이터베이스 설정**
```sql
-- Oracle Database에 테이블 생성
@book_store.sql
```

3. **설정 파일 수정**
```properties
# src/main/resources/prop/db.properties
db.driver=oracle.jdbc.driver.OracleDriver
db.url=jdbc:oracle:thin:@localhost:1521:xe
db.username=your_username
db.password=your_password
```

4. **프로젝트 빌드**
```bash
mvn clean compile
```

5. **Tomcat 서버 실행**
- Eclipse/STS에서 프로젝트를 Tomcat에 배포
- `http://localhost:8080/bookstore` 접속

---

## 📊 데이터베이스 설계

### ERD (Entity Relationship Diagram)
![Database Schema](https://github.com/user-attachments/assets/acc76922-17ba-463d-8346-25519e9abe1b)

### 주요 테이블
- **members** - 회원 정보
- **newbook** - 신간 도서
- **tradebook** - 거래 게시판
- **chatrooms** - 채팅방
- **messages** - 메시지
- **payments** - 결제 정보

### 인덱스 최적화
```sql
-- ORDER BY 성능 최적화를 위한 인덱스
CREATE INDEX idx_messages_sent_at ON messages(sent_at);
CREATE INDEX idx_newbook_publication_date ON newbook(newbook_publication_date);
CREATE INDEX idx_payments_payment_date ON payments(payment_date);

-- 회원별 조회 성능 최적화를 위한 인덱스
CREATE INDEX idx_payments_member_num ON payments(member_num);
CREATE INDEX idx_tradebook_member_num ON tradebook(member_num);
```

---

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'feat: #이슈번호 - Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

---

## 📞 연락처

**팀장 - 최수빈** - [GitHub](https://github.com/crok130) - tnqls13001@gmail.com

**팀원 - 박석우** - [GitHub](https://github.com/your-username) - your.email@example.com

**팀원 - 민서진** - [GitHub](https://github.com/your-username) - your.email@example.com

---

<div align="center">

**⭐ 이 프로젝트가 도움이 되었다면 Star를 눌러주세요! ⭐**

Made with ❤️ by BookStore Team

</div>

