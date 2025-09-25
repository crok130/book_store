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
import net.koreate.bookstore.tradeboard.dao.TradeBookDAO;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChatServiceImpl implements ChatService{
	
	private final ChatDAO dao;
    private final TradeBookDAO tradeBookDAO;
	
	@Override
	public ChatRoomVO createChatRoom(ChatRoomVO room) throws Exception {
		if (room == null) return null;
		int affected = dao.insertChatRoom(room);
		if (affected == 1) {
			// 방 번호는 IDENTITY로 생성되므로, 생성 직후 동일 키 조건으로 한 번 더 조회해도 됨
			return dao.findRoomByMembersAndTradebook(room.getSeller_member_num(), room.getBuyer_member_num(), room.getTradebook_num());
		}
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
	public ChatRoomVO getExistingChatRoom(int seller_member_num, int buyer_member_num, int tradebook_num) throws Exception {
		return dao.findRoomByMembersAndTradebook(seller_member_num, buyer_member_num, tradebook_num);
	}

	@Override
	public int startChat(int tradebook_num, int buyer_member_num) throws Exception {
		// 1) tradebook에서 판매자 member_num 조회
		Integer seller = dao.findSellerMemberByTradebook(tradebook_num);
		if (seller == null) return 0;
		int seller_member_num = seller;
		// 2) 기존 동일 조합 + 동일 tradebook 방 존재 시 재사용
		ChatRoomVO existing = dao.findRoomByMembersAndTradebook(seller_member_num, buyer_member_num, tradebook_num);
		if (existing != null) return existing.getChatroom_num();
		// 3) 없으면 생성
		ChatRoomVO room = new ChatRoomVO();
		room.setTradebook_num(tradebook_num);
		room.setSeller_member_num(seller_member_num);
		room.setBuyer_member_num(buyer_member_num);
		ChatRoomVO created = createChatRoom(room);
		return created != null ? created.getChatroom_num() : 0;
	}

	@Override
	public boolean sendMessage(MessageVO message) throws Exception {
		if (message == null) return false;
		if (message.getMessage_content() == null || message.getMessage_content().trim().isEmpty()) return false;
		int affected = dao.insertMessage(message);
		return affected == 1;
	}

	@Override
	public List<MessageVO> getMessageList(int chatroom_num) throws Exception {
		log.info("메시지 목록 조회 chatroom_num: {}", chatroom_num);
		List<MessageVO> messages = dao.getMessageList(chatroom_num);
		log.info("메시지 건수: {}", messages != null ? messages.size() : 0);
		return messages != null ? messages : new ArrayList<>();
	}


	@Override
	public boolean sendImageMessage(int chatroom_num, int sender_member_num, String imagePath) throws Exception {
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
		log.info("안읽은 메시지 개수 조회 chatroom_num: {}, member_num: {}", chatroom_num, member_num);
		return dao.getUnreadMessageCount(chatroom_num, member_num);
	}

	@Override
	public boolean markMessageAsRead(int message_num, int member_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean markAllMessagesAsRead(int chatroom_num, int member_num) throws Exception {
		log.info("모든 메시지 읽음 처리 chatroom_num: {}, member_num: {}", chatroom_num, member_num);
		int affected = dao.markAllMessagesAsRead(chatroom_num, member_num);
		log.info("읽음 처리된 메시지 수: {}", affected);
		return affected >= 0; // 0개 이상 처리되면 성공
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

	@Override
	public boolean confirmPaymentAndMaybeCompleteTrade(int chatroom_num, int member_num) throws Exception {
		// 1) 내 결제 완료 기록(중복 허용해도 DISTINCT로 세기 때문에 문제 없음)
		dao.insertPaymentConfirm(chatroom_num, member_num);
		// 2) 해당 방에서 서로 다른 인원 수 확인
		int distinct = dao.countPaymentConfirmers(chatroom_num);
		if (distinct >= 2) {
			// 3) 거래글 번호 조회 후 상태 'n'으로 변경
			Integer tradebookNum = dao.findTradebookByChatroom(chatroom_num);
			if (tradebookNum != null) {
				int updated = tradeBookDAO.markTradeCompleted(tradebookNum);
				return updated == 1;
			}
		}
		return false;
	}
	
}