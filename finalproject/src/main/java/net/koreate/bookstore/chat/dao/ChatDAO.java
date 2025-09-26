package net.koreate.bookstore.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.ChatRoomVO;
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

	// tradebook 기준으로 판매자 조회
	@Select("SELECT member_num FROM tradebook WHERE tradebook_num = #{tradebook_num}")
	Integer findSellerMemberByTradebook(@Param("tradebook_num") int tradebook_num) throws Exception;

	// 동일한 두 회원 조합(순서 무관) + 동일 tradebook에 대한 기존 채팅방 조회
	@Select("SELECT chatroom_num, tradebook_num, seller_member_num, buyer_member_num, created_at " +
	        "FROM chatrooms " +
	        "WHERE tradebook_num = #{tradebook_num} " +
	        "AND ((seller_member_num = #{seller_member_num} AND buyer_member_num = #{buyer_member_num}) " +
	        "  OR (seller_member_num = #{buyer_member_num} AND buyer_member_num = #{seller_member_num})) " +
	        "FETCH FIRST 1 ROWS ONLY")
	ChatRoomVO findRoomByMembersAndTradebook(@Param("seller_member_num") int seller_member_num,
	                                        @Param("buyer_member_num") int buyer_member_num,
	                                        @Param("tradebook_num") int tradebook_num) throws Exception;

	// 채팅방 생성
	@Insert("INSERT INTO chatrooms (tradebook_num, seller_member_num, buyer_member_num) " +
	        "VALUES (#{tradebook_num}, #{seller_member_num}, #{buyer_member_num})")
	int insertChatRoom(ChatRoomVO room) throws Exception;
			  
	// 결제 완료 확인을 시스템 메시지로 기록
	@Insert("INSERT INTO messages (chatroom_num, sender_member_num, message_content, is_read) " +
	        "VALUES (#{chatroom_num}, #{member_num}, '__PAY_DONE__', 1)")
	int insertPaymentConfirm(@Param("chatroom_num") int chatroom_num, @Param("member_num") int member_num) throws Exception;

	// 해당 채팅방에서 결제 완료 확인을 누른 서로 다른 인원 수 조회
	@Select("SELECT COUNT(DISTINCT sender_member_num) FROM messages " +
	        "WHERE chatroom_num = #{chatroom_num} AND message_content = '__PAY_DONE__'")
	int countPaymentConfirmers(@Param("chatroom_num") int chatroom_num) throws Exception;

	// 채팅방 번호로 거래글 번호 조회
	@Select("SELECT tradebook_num FROM chatrooms WHERE chatroom_num = #{chatroom_num}")
	Integer findTradebookByChatroom(@Param("chatroom_num") int chatroom_num) throws Exception;
}

			  