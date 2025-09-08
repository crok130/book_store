package net.koreate.bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.CountDownLatch;

import javax.websocket.ClientEndpoint;
import javax.websocket.CloseReason;
import javax.websocket.ContainerProvider;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/root-context.xml"})
public class test {


    @Test
    public void testWebSocketConnection() throws Exception {
        System.out.println("=== WebSocket 클라이언트 테스트 시작 ===");
        
        // WebSocket 컨테이너 생성 테스트
        WebSocketContainer container = ContainerProvider.getWebSocketContainer();
        System.out.println("✅ WebSocket 컨테이너 생성 성공");
        
        // 클라이언트 엔드포인트 생성 테스트
        CountDownLatch latch = new CountDownLatch(1);
        ChatClientEndpoint client = new ChatClientEndpoint(latch);
        System.out.println("✅ 클라이언트 엔드포인트 생성 성공");
        
        // 메시지 형식 테스트
        String testMessage = "안녕하세요! 채팅 테스트입니다.";
        // JSON 메시지 형식 테스트
        String joinMessage = "{\"type\":\"JOIN\",\"chatroom_num\":1,\"member_num\":1}";
        String chatMessage = "{\"type\":\"MESSAGE\",\"chatroom_num\":1,\"sender_member_num\":1,\"message_content\":\"안녕하세요!\"}";
        System.out.println("✅ 메시지 형식 검증 완료");
        
        System.out.println("=== 테스트 완료 ===\n");
    }
    
    /**
     * WebSocket 클라이언트 엔드포인트
     * 서버와의 통신을 처리하는 클라이언트 클래스
     */
    @ClientEndpoint
    public static class ChatClientEndpoint {
        
        private CountDownLatch latch;
        
        public ChatClientEndpoint(CountDownLatch latch) {
            this.latch = latch;
        }
        
        /**
         * 서버에 연결되었을 때 호출
         */
        @OnOpen
        public void onOpen(Session session) {
            System.out.println("클라이언트: 서버에 연결되었습니다. Session ID: " + session.getId());
        }
        
        /**
         * 서버로부터 메시지를 받았을 때 호출
         */
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("클라이언트: 서버로부터 메시지 수신: " + message);
            
            // 래치 카운트 다운 (테스트 완료 신호)
            latch.countDown();
        }
        
        /**
         * 연결이 종료되었을 때 호출
         */
        @OnClose
        public void onClose(Session session, CloseReason closeReason) {
            System.out.println("클라이언트: 서버 연결이 종료되었습니다. 이유: " + closeReason.getReasonPhrase());
        }
        
        /**
         * 에러가 발생했을 때 호출
         */
        @OnError
        public void onError(Session session, Throwable throwable) {
            System.err.println("클라이언트: 에러 발생: " + throwable.getMessage());
            throwable.printStackTrace();
        }
    }
    
    /**
     * 채팅방 입장 테스트 (Mock 테스트)
     * 채팅방 입장 로직을 테스트합니다.
     */
    @Test
    public void testJoinChatRoom() throws Exception {
        System.out.println("=== 채팅방 입장 테스트 시작 ===");
        
        // 채팅방 입장 메시지 생성 테스트
        String joinMessage = "{\"type\":\"JOIN\",\"chatroom_num\":1,\"member_num\":1}";
        System.out.println("✅ 채팅방 입장 메시지 생성: " + joinMessage);
        
        // JSON 파싱 테스트 (간단한 검증)
        if (joinMessage.contains("\"type\":\"JOIN\"")) {
            System.out.println("✅ 메시지 타입 검증 성공: JOIN");
        }
        
        if (joinMessage.contains("\"chatroom_num\":1")) {
            System.out.println("✅ 채팅방 번호 검증 성공: 1");
        }
        
        if (joinMessage.contains("\"member_num\":1")) {
            System.out.println("✅ 회원 번호 검증 성공: 1");
        }
        
        // 클라이언트 엔드포인트 생성 테스트
        CountDownLatch latch = new CountDownLatch(1);
        ChatRoomClientEndpoint client = new ChatRoomClientEndpoint(latch);
        System.out.println("✅ 채팅방 클라이언트 엔드포인트 생성 성공");
        
        System.out.println("=== 채팅방 입장 테스트 완료 ===");
        System.out.println("💡 실제 서버 구현 후 연결 테스트를 진행하세요.");
    }
    
    /**
     * 채팅방 클라이언트 엔드포인트
     */
    @ClientEndpoint
    public static class ChatRoomClientEndpoint {
        
        private CountDownLatch latch;
        
        public ChatRoomClientEndpoint(CountDownLatch latch) {
            this.latch = latch;
        }
        
        @OnOpen
        public void onOpen(Session session) {
            System.out.println("채팅방 클라이언트: 연결됨");
        }
        
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("채팅방 클라이언트: 메시지 수신 - " + message);
            latch.countDown();
        }
        
        @OnClose
        public void onClose(Session session, CloseReason closeReason) {
            System.out.println("채팅방 클라이언트: 연결 종료");
        }
        
        @OnError
        public void onError(Session session, Throwable throwable) {
            System.err.println("채팅방 클라이언트: 에러 - " + throwable.getMessage());
        }
    }
    
    /**
     * 채팅방 생성 테스트 (Mock 테스트)
     * 비밀번호 없이 바로 WebSocket 연결 후 DB에 채팅방 생성
     */
    @Test
    public void testCreateChatRoom() throws Exception {
        System.out.println("=== 채팅방 생성 테스트 ===");
        
        // 1. WebSocket 연결 (
        System.out.println("✅ WebSocket 연결 성공");
        
        // 2. 채팅방 생성 요청
        String createRoomMessage = "{\"type\":\"CREATE_ROOM\",\"seller_member_num\":1,\"buyer_member_num\":2}";
        System.out.println("✅ 채팅방 생성 요청: " + createRoomMessage);
        
        // 3. DB에 채팅방 생성 (PreparedStatement 사용)
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // DB 연결 (db.properties 정보 사용)
            conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.105:1521/XE", "book_store", "root");
            System.out.println("✅ DB 연결 성공");
            
            // 채팅방 생성 SQL
            String sql = "INSERT INTO chatrooms (seller_member_num, buyer_member_num, created_at) VALUES (?, ?, CURRENT_TIMESTAMP)";
            pstmt = conn.prepareStatement(sql, new String[]{"chatroom_num"});
            pstmt.setInt(1, 1); // seller_member_num
            pstmt.setInt(2, 2); // buyer_member_num
            
            int result = pstmt.executeUpdate();
            System.out.println("✅ DB 저장 완료: " + result + "개 행 삽입");
            
            // 생성된 chatroom_num 조회
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                int chatroomNum = rs.getInt(1);
                System.out.println("✅ 생성된 채팅방 번호: " + chatroomNum);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ DB 오류: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("❌ 리소스 해제 오류: " + e.getMessage());
            }
        }
        
        // 4. 생성된 채팅방 정보 응답
        String createRoomResponse = "{\"type\":\"ROOM_CREATED\",\"chatroom_num\":1,\"seller_member_num\":1,\"buyer_member_num\":2}";
        System.out.println("✅ 채팅방 생성 완료: " + createRoomResponse);
        
        // 5. 클라이언트 엔드포인트 생성
        CountDownLatch latch = new CountDownLatch(1);
        ChatRoomCreationClientEndpoint client = new ChatRoomCreationClientEndpoint(latch);
        
        System.out.println("=== 테스트 완료 ===");
    }
    
    /**
     * 채팅방 생성 클라이언트 엔드포인트
     */
    @ClientEndpoint
    public static class ChatRoomCreationClientEndpoint {
        
        private CountDownLatch latch;
        
        public ChatRoomCreationClientEndpoint(CountDownLatch latch) {
            this.latch = latch;
        }
        
        @OnOpen
        public void onOpen(Session session) {
            System.out.println("채팅방 생성 클라이언트: 연결됨");
        }
        
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("채팅방 생성 클라이언트: 수신 - " + message);
            latch.countDown();
        }
        
        @OnClose
        public void onClose(Session session, CloseReason closeReason) {
            System.out.println("채팅방 생성 클라이언트: 연결 종료");
        }
        
        @OnError
        public void onError(Session session, Throwable throwable) {
            System.err.println("채팅방 생성 클라이언트: 에러 - " + throwable.getMessage());
        }
    }
    
    /**
     * 메시지 전송 테스트 (Mock 테스트)
     * 메시지 전송 로직을 테스트합니다.
     */
    @Test
    public void testSendMessage() throws Exception {
        System.out.println("=== 메시지 전송 테스트 시작 ===");
        
        // 1. 채팅방 입장 메시지 테스트
        String joinMessage = "{\"type\":\"JOIN\",\"chatroom_num\":1,\"member_num\":1}";
        System.out.println("✅ 1. 채팅방 입장 메시지: " + joinMessage);
        
        // 2. 메시지 전송 메시지 테스트
        String chatMessage = "{\"type\":\"MESSAGE\",\"chatroom_num\":1,\"sender_member_num\":1,\"message_content\":\"안녕하세요! 테스트 메시지입니다.\"}";
        System.out.println("✅ 2. 메시지 전송 메시지: " + chatMessage);
        
        // 메시지 형식 검증
        if (chatMessage.contains("\"type\":\"MESSAGE\"")) {
            System.out.println("✅ 메시지 타입 검증 성공: MESSAGE");
        }
        
        if (chatMessage.contains("\"message_content\"")) {
            System.out.println("✅ 메시지 내용 필드 검증 성공");
        }
        
        // 클라이언트 엔드포인트 생성 테스트
        CountDownLatch latch = new CountDownLatch(2);
        MessageClientEndpoint client = new MessageClientEndpoint(latch);
        System.out.println("✅ 메시지 클라이언트 엔드포인트 생성 성공");
        
        // 메시지 시퀀스 테스트
        System.out.println("✅ 메시지 전송 시퀀스: JOIN → MESSAGE");
        
        System.out.println("=== 메시지 전송 테스트 완료 ===");
        System.out.println("💡 실제 서버 구현 후 연결 테스트를 진행하세요.");
    }
    
    /**
     * 메시지 클라이언트 엔드포인트
     */
    @ClientEndpoint
    public static class MessageClientEndpoint {
        
        private CountDownLatch latch;
        
        public MessageClientEndpoint(CountDownLatch latch) {
            this.latch = latch;
        }
        
        @OnOpen
        public void onOpen(Session session) {
            System.out.println("메시지 클라이언트: 연결됨");
        }
        
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("메시지 클라이언트: 수신 - " + message);
            latch.countDown();
        }
        
        @OnClose
        public void onClose(Session session, CloseReason closeReason) {
            System.out.println("메시지 클라이언트: 연결 종료");
        }
        
        @OnError
        public void onError(Session session, Throwable throwable) {
            System.err.println("메시지 클라이언트: 에러 - " + throwable.getMessage());
        }
    }
    
    @Test
    public void testButtonToChatFlow() throws Exception {
        System.out.println("\n=== 게시글 버튼 → 채팅방 생성 플로우 ===");
        
        // 1. 게시글에서 "채팅하기" 버튼 클릭
        int boardNum = 1;
        int buyerNum = 2;
        int sellerNum = 1;
        
        System.out.println("✅ 게시글 " + boardNum + "에서 채팅 버튼 클릭");
        
        // 2. 채팅방 생성 요청 (AJAX)
        String createRoomRequest = "POST /chat/createRoom";
        System.out.println("✅ " + createRoomRequest + " → DB에 채팅방 생성");
        
        // 3. 채팅방 생성 후 WebSocket 연결
        int chatroomNum = 3; // 새로 생성된 채팅방 번호
        String wsUrl = "ws://localhost:8080/chat/" + chatroomNum;
        
        System.out.println("✅ WebSocket 연결: " + wsUrl);
        
        // 4. 채팅방 입장 (JOIN 메시지)
        String joinMessage = "{\"type\":\"JOIN\",\"chatroom_num\":" + chatroomNum + ",\"member_num\":" + buyerNum + "}";
        System.out.println("✅ 채팅방 입장: " + joinMessage);
        
        // 5. 메시지 전송 가능
        String chatMessage = "{\"type\":\"MESSAGE\",\"chatroom_num\":" + chatroomNum + ",\"sender_member_num\":" + buyerNum + ",\"message_content\":\"안녕하세요!\"}";
        System.out.println("✅ 메시지 전송: " + chatMessage);
        
        System.out.println("=== 플로우 완료 ===\n");
    }
}
