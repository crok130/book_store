package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class PaymentVO {

	private int payment_num;           // 결제 번호 (기본키)
	private int member_num;            // 결제한 회원 번호
	private String member_name;        // 결제자 이름
	private String member_phone;       // 결제자 연락처
	private String member_addr;        // 결제자 주소
	private String payment_content;    // 배송/요청 사항 (CLOB)
	private int newbook_num;           // 구매한 책 번호
	private String payment_date;       // 결제 날짜 (TIMESTAMP → 문자열로 수신)
	private int payment_quantity;      // 구매 수량
	private int payment_total_price;   // 총 결제 금액
	private String item_status;
	private String newbook_title;
	private String newbook_img;
}


