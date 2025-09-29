package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class TradebookVO {
	
	private int tradebook_num;
    private String tradebook_title;               // 책 제목
    private String tradebook_author;              // 저자
    private String tradebook_publication_date;    // 출간일 (yyyy-MM-dd)
    private String tradebook_img;                 // 책 이미지 (저장 경로/파일명)
    private String tradebook_content;             // 소개/내용
    private String tradebook_isbn;                // ISBN
    private int member_num;
    private String tradebook_status;              // 책 상태 (new/excellent/good/fair/poor)
    private String tradebook_condition;           // 교환 조건
    private String tradebook_method;              // 교환 방식 (direct/delivery/both)
    private String tradebook_time;                // 교환 가능 시간
    private String tradebook_location;            // 희망 교환 지역
    private String member_nickname;
    private String tradebook_trade;
}


