package net.koreate.bookstore.vo;

import java.sql.Timestamp;

import lombok.Data;

/**
 * 메시지 정보를 담는 VO 클래스
 * messages 테이블과 매핑됩니다.
 */
@Data
public class MessageVO {
    
    private int message_num;               // 메시지 번호 (기본키)
    private int chatroom_num;              // 메시지가 속한 채팅방 번호
    private int sender_member_num;         // 메시지 보낸 사람 회원 번호
    private String message_content;        // 메시지 내용 (필수 입력)
    private Timestamp sent_at;             // 메시지 전송 시간
    private String memssage_img;           // 메시지 이미지 (오타 그대로 유지)
    
}
