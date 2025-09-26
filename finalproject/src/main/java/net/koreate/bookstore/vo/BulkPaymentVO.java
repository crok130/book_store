package net.koreate.bookstore.vo;

import lombok.Data;
import java.util.List;

@Data
public class BulkPaymentVO {
    
    private int member_num;            // 결제한 회원 번호
    private String member_name;        // 결제자 이름
    private String member_phone;       // 결제자 연락처
    private String member_addr;        // 결제자 주소
    private String payment_content;    // 배송/요청 사항
    private String payment_date;       // 결제 날짜
    private int payment_total_price;  // 총 결제 금액
    private String item_status;        // 주문 상태
    
    // 장바구니에서 가져온 상품 목록
    private List<CartVO> cartItems;
}
