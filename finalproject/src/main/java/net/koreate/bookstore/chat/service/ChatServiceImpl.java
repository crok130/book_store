package net.koreate.bookstore.chat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.chat.dao.ChatDAO;
import net.koreate.bookstore.vo.ChatRoomVO;
import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.MessageVO;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChatServiceImpl implements ChatService{
	
	private final ChatDAO dao;
	
	@Override
	public ChatRoomVO createChatRoom(ChatRoomVO room) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChatRoomVO getChatRoom(int chatroom_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatVO> getChatRoomList(int member_num) throws Exception {
		log.info("받은 member_num : {}", member_num);
		
		List<ChatVO> chatlist = dao.getChatRoomList(member_num);
		log.info("해당 member_num의 채팅방 목록 : {}", chatlist);
		
		return chatlist;
	}

	@Override
	public ChatRoomVO getExistingChatRoom(int seller_member_num, int buyer_member_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean sendMessage(MessageVO message) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MessageVO> getMessageList(int chatroom_num) throws Exception {
		log.info("메시지 목록 조회 chatroom_num: {}", chatroom_num);
		List<MessageVO> messages = dao.getMessageList(chatroom_num);
		log.info("메시지 건수: {}", messages != null ? messages.size() : 0);
		return messages != null ? messages : new ArrayList<>();
	}

	@Override
	public MessageVO getLastMessage(int chatroom_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean sendImageMessage(int chatroom_num, int sender_member_num, String imagePath) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMessage(int message_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean leaveChatRoom(int chatroom_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getUnreadMessageCount(int chatroom_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean markMessageAsRead(int message_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean markAllMessagesAsRead(int chatroom_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ChatRoomVO> searchChatRooms(int member_num, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MessageVO> searchMessages(int chatroom_num, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean blockUser(int chatroom_num, int blocked_member_num, int blocking_member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean unblockUser(int chatroom_num, int unblocked_member_num, int unblocking_member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	
}
