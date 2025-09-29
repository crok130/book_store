package net.koreate.bookstore.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatRoomVO {
    
    private int chatroom_num;              // 채팅방 번호 (기본키)
    private int tradebook_num;             // 교환글 번호
    private int seller_member_num;         // 판매자 회원 번호
    private int buyer_member_num;          // 구매자 회원 번호
    private Timestamp created_at;          // 채팅방 생성 시간
    
}
