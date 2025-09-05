package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class NewBookVO {
    
    private int newbook_num;              // 신간 도서 번호 (기본키)
    private String newbook_title;         // 도서 제목
    private String newbook_content;       // 도서 내용/설명
    private String newbook_author;        // 저자
    private String newbook_publisher;     // 출판사
    private int newbook_count;            // 재고 수량 (0 이상)
    private String newbook_img;           // 도서 이미지 경로
    private String newbook_category;      // 도서 카테고리
    private int newbook_price;            // 도서 가격
    private String newbook_isbn;          // ISBN 번호
    private int newbook_page;             // 페이지 수
    private String newbook_publication_date; // 출간일
    

}
