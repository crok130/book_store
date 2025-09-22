package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class CartVO {

    // 회원 번호
    private int member_num;

    // 도서(신간) 번호
    private int newbook_num;

    // 담은 수량
    private int book_count;
    
    // 단가
    private int price;

    // ===== 화면 표시용(조인으로 채움) =====
    private String newbook_title;   // 제목
    private String newbook_author;  // 저자
    private String newbook_img;     // 이미지 URL/경로
}


