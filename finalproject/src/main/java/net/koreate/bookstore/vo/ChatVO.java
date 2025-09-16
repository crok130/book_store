package net.koreate.bookstore.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatVO {
    private int chatroom_num;           // 채팅방 번호
    private int tradebook_num;          // 교환책 번호
    private String opponent_nickname;   // 상대방 닉네임
    private String tradebook_title;     // 책 제목
    private String message_content;     // 마지막 메시지 내용
    private Timestamp sent_at;          // 마지막 메시지 시간
    private int unread_count;           // 안읽은 메시지 개수
}
