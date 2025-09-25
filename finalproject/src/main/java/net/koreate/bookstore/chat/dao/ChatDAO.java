package net.koreate.bookstore.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.MessageVO;

public interface ChatDAO {

	@Select("SELECT " +
			"c.chatroom_num, " +
			"c.tradebook_num, " +
			"CASE " +
			"    WHEN c.seller_member_num = #{member_num} " +
			"    THEN b.member_nickname " +
			"    ELSE s.member_nickname " +
			"END as opponent_nickname, " +
			"t.tradebook_title, " +
			"m.message_content, " +
			"m.sent_at, " +
			"(SELECT COUNT(*) " +
			" FROM messages msg " +
			" WHERE msg.chatroom_num = c.chatroom_num " +
			" AND msg.sender_member_num != #{member_num} " +
			" AND NVL(msg.is_read, 0) = 0) as unread_count " +
			"FROM chatrooms c " +
			"LEFT JOIN members b ON b.member_num = c.buyer_member_num " +
			"LEFT JOIN members s ON s.member_num = c.seller_member_num " +
			"LEFT JOIN tradebook t ON t.tradebook_num = c.tradebook_num " +
			"LEFT JOIN ( " +
			"    SELECT " +
			"        chatroom_num, " +
			"        message_content, " +
			"        sent_at, " +
			"        ROW_NUMBER() OVER (PARTITION BY chatroom_num ORDER BY sent_at DESC) as rn " +
			"    FROM messages " +
			") m ON m.chatroom_num = c.chatroom_num AND m.rn = 1 " +
			"WHERE c.seller_member_num = #{member_num} OR c.buyer_member_num = #{member_num} " +
			"ORDER BY NVL(m.sent_at, c.created_at) DESC")
	List<ChatVO> getChatRoomList(int member_num) throws Exception;
			  
	
	@Select("SELECT message_num, chatroom_num, sender_member_num, message_content, sent_at, memssage_img " +
			"FROM messages " +
			"WHERE chatroom_num = #{chatroom_num} " +
			"ORDER BY sent_at ASC")
	List<MessageVO> getMessageList(@Param("chatroom_num") int chatroom_num) throws Exception;
		  
	
	@Insert("INSERT INTO messages (chatroom_num, sender_member_num, message_content, is_read) " +
			"VALUES (#{chatroom_num}, #{sender_member_num}, #{message_content}, 0)")
	int insertMessage(MessageVO message) throws Exception;
	
	
	// 특정 채팅방의 안읽은 메시지 개수 조회
	@Select("SELECT COUNT(*) " +
			"FROM messages " +
			"WHERE chatroom_num = #{chatroom_num} " +
			"AND sender_member_num != #{member_num} " +
			"AND NVL(is_read, 0) = 0")
	int getUnreadMessageCount(@Param("chatroom_num") int chatroom_num, @Param("member_num") int member_num) throws Exception;
	
	
	// 특정 채팅방의 모든 메시지를 읽음 처리 (웹소켓 연결 시 사용)
	@Update("UPDATE messages " +
			"SET is_read = 1 " +
			"WHERE chatroom_num = #{chatroom_num} " +
			"AND sender_member_num != #{member_num} " +
			"AND NVL(is_read, 0) = 0")
	int markAllMessagesAsRead(@Param("chatroom_num") int chatroom_num, @Param("member_num") int member_num) throws Exception;
			  
}

			  