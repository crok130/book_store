package net.koreate.bookstore.chat.service;

import java.util.List;

import net.koreate.bookstore.vo.ChatRoomVO;
import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.MessageVO;

/**
 * 채팅 서비스 인터페이스
 * 물물 거래 게시글에서 구매자와 판매자 간의 채팅 기능을 제공합니다.
 * 웹소켓을 통한 실시간 채팅과 이미지 전송을 지원합니다.
 */
public interface ChatService {

    /**
     * 채팅방을 생성합니다.
     * 
     * @param seller_member_num 판매자 회원 번호
     * @param buyer_member_num 구매자 회원 번호
     * @return 생성된 채팅방 정보
     */
    ChatRoomVO createChatRoom(ChatRoomVO room) throws Exception;

    /**
     * 회원이 참여한 채팅방 목록을 조회합니다.
     * 
     * @param member_num 회원 번호
     * @return 참여한 채팅방 목록
     */
    List<ChatVO> getChatRoomList(int member_num) throws Exception;

    /**
     * 두 회원 간의 기존 채팅방을 조회 이미 채팅한적 내역있는지 조회.
     * 
     * @param seller_member_num 판매자 회원 번호
     * @param buyer_member_num 구매자 회원 번호
     * @return 기존 채팅방 정보, 없으면 null
     */
    ChatRoomVO getExistingChatRoom(int seller_member_num, int buyer_member_num) throws Exception;

    /**
     * 메시지를 전송합니다.
     * 
     * @param message 전송할 메시지 정보
     * @return 전송 성공 시 true, 실패 시 false
     */
    boolean sendMessage(MessageVO message) throws Exception;

    /**
     * 채팅방의 메시지 목록을 조회합니다.
     * 특정 채팅방의 모든 메시지를 시간순으로 반환합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @return 메시지 목록
     */
    List<MessageVO> getMessageList(int chatroom_num) throws Exception;

    /**
     * 이미지 메시지를 전송합니다.
     * 파일 업로드를 통해 이미지를 전송하고 메시지로 저장합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param sender_member_num 발신자 회원 번호
     * @param imagePath 업로드된 이미지 경로
     * @return 전송 성공 시 true, 실패 시 false
     */
    boolean sendImageMessage(int chatroom_num, int sender_member_num, String imagePath) throws Exception;

    /**
     * 채팅방을 나갑니다.
     * 회원이 채팅방에서 나갈 때 호출됩니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param member_num 나가는 회원 번호
     * @return 나가기 성공 시 true, 실패 시 false
     */
    boolean leaveChatRoom(int chatroom_num, int member_num) throws Exception;

    /**
     * 채팅방의 읽지 않은 메시지 수를 조회합니다.
     * 특정 회원이 읽지 않은 메시지의 개수를 반환합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param member_num 회원 번호
     * @return 읽지 않은 메시지 수
     */
    int getUnreadMessageCount(int chatroom_num, int member_num) throws Exception;

    /**
     * 메시지를 읽음 처리합니다.
     * 특정 메시지를 읽음으로 표시합니다.
     * 
     * @param message_num 읽음 처리할 메시지 번호
     * @param member_num 읽은 회원 번호
     * @return 처리 성공 시 true, 실패 시 false
     */
    boolean markMessageAsRead(int message_num, int member_num) throws Exception;

    /**
     * 채팅방의 모든 메시지를 읽음 처리합니다.
     * 채팅방에 입장했을 때 모든 메시지를 읽음으로 표시합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param member_num 회원 번호
     * @return 처리 성공 시 true, 실패 시 false
     */
    boolean markAllMessagesAsRead(int chatroom_num, int member_num) throws Exception;


    /**
     * 채팅방을 차단합니다.
     * 특정 회원을 채팅방에서 차단합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param blocked_member_num 차단할 회원 번호
     * @param blocking_member_num 차단하는 회원 번호
     * @return 차단 성공 시 true, 실패 시 false
     */
    boolean blockUser(int chatroom_num, int blocked_member_num, int blocking_member_num) throws Exception;

    /**
     * 차단을 해제합니다.
     * 차단된 회원의 차단을 해제합니다.
     * 
     * @param chatroom_num 채팅방 번호
     * @param unblocked_member_num 차단 해제할 회원 번호
     * @param unblocking_member_num 차단 해제하는 회원 번호
     * @return 해제 성공 시 true, 실패 시 false
     */
    boolean unblockUser(int chatroom_num, int unblocked_member_num, int unblocking_member_num) throws Exception;
    
    

}
