package net.koreate.bookstore.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

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
			"m.sent_at " +
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
	List<MessageVO> getMessageList(int chatroom_num) throws Exception;
			  
}

			  
