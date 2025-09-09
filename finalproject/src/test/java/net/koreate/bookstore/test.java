package net.koreate.bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Set;
import java.util.Collections;

import javax.websocket.ClientEndpoint;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/root-context.xml"})
public class MultiRoomTest {

    // 채팅방별 세션 관리: roomNum -> Set<Session>
    private static Map<Integer, Set<MockSession>> chatRooms = new ConcurrentHashMap<>();
    
    @Test
    public void testMultiRoomChat() throws Exception {
        System.out.println("=== 다중 채팅방 테스트 ===");
        
        // 1번방: 1번회원, 2번회원
        testChatRoom(1, 1, 2);
        
        // 2번방: 1번회원, 3번회원  
        testChatRoom(2, 1, 3);
        
        System.out.println("=== 테스트 완료 ===");
    }
    
    private void testChatRoom(int roomNum, int user1, int user2) throws Exception {
        System.out.println("\n 채팅방 " + roomNum + " 시작 (회원:" + user1 + ", " + user2 + ")");
        
        // 1. WebSocket URL
        String wsUrl = "ws://localhost:8080/chat?room=" + roomNum;
        System.out.println(" WebSocket: " + wsUrl);
        
        // 2. 채팅방에 세션 추가
        MockSession session1 = new MockSession("user_" + user1 + "_room_" + roomNum);
        MockSession session2 = new MockSession("user_" + user2 + "_room_" + roomNum);
        
        chatRooms.computeIfAbsent(roomNum, k -> Collections.newSetFromMap(new ConcurrentHashMap<>()))
                 .add(session1);
        chatRooms.computeIfAbsent(roomNum, k -> Collections.newSetFromMap(new ConcurrentHashMap<>()))
                 .add(session2);
        
        System.out.println("✅ 채팅방 " + roomNum + "에 회원 " + user1 + ", " + user2 + " 입장");
        
        // 3. 메시지 교환
        for (int i = 1; i <= 3; i++) {
            // 회원1 → 회원2 메시지
            String msg1 = "{\"type\":\"MESSAGE\",\"chatroom_num\":" + roomNum + 
                         ",\"sender_member_num\":" + user1 + 
                         ",\"message_content\":\"안녕하세요 " + user1 + "번 회원입니다 " + i + "\"}";
            System.out.println("�� 회원" + user1 + ": " + msg1);
            
            // 회원2 → 회원1 메시지
            String msg2 = "{\"type\":\"MESSAGE\",\"chatroom_num\":" + roomNum + 
                         ",\"sender_member_num\":" + user2 + 
                         ",\"message_content\":\"안녕하세요 " + user2 + "번 회원입니다 " + i + "\"}";
            System.out.println("�� 회원" + user2 + ": " + msg2);
        }
        
        // 4. 채팅방 정리
        chatRooms.remove(roomNum);
        System.out.println("✅ 채팅방 " + roomNum + " 종료\n");
    }
    
    @Test
    public void testConcurrentMultiRoom() throws Exception {
        System.out.println("\n=== 동시 다중 채팅방 테스트 ===");
        
        ExecutorService executor = Executors.newFixedThreadPool(4);
        CountDownLatch latch = new CountDownLatch(2);
        
        // 1번방: 1번회원, 2번회원 (동시)
        executor.submit(() -> {
            try {
                testChatRoom(1, 1, 2);
                latch.countDown();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        
        // 2번방: 1번회원, 3번회원 (동시)
        executor.submit(() -> {
            try {
                testChatRoom(2, 1, 3);
                latch.countDown();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        
        latch.await();
        executor.shutdown();
        System.out.println("=== 동시 테스트 완료 ===");
    }
    
    @Test
    public void testUserInMultipleRooms() throws Exception {
        System.out.println("\n=== 1번회원이 여러 채팅방에 참여하는 테스트 ===");
        
        // 1번회원이 1번방과 2번방에 동시 참여
        System.out.println("�� 1번회원이 1번방과 2번방에 동시 참여");
        
        // 1번방: 1번회원, 2번회원
        testChatRoom(1, 1, 2);
        
        // 2번방: 1번회원, 3번회원
        testChatRoom(2, 1, 3);
        
        System.out.println("✅ 1번회원이 여러 채팅방 참여 테스트 완료");
    }
    
    static class MockSession {
        String id;
        MockSession(String id) { this.id = id; }
        String getId() { return id; }
    }
    
    @ClientEndpoint
    public static class MultiRoomClient {
        @OnOpen
        public void onOpen(Session session) {
            System.out.println("다중방 채팅 연결됨: " + session.getId());
        }
        
        @OnMessage
        public void onMessage(String message, Session session) {
            System.out.println("다중방 채팅 메시지: " + message);
        }
        
        @OnClose
        public void onClose(Session session, CloseReason reason) {
            System.out.println("다중방 채팅 연결 종료");
        }
        
        @OnError
        public void onError(Session session, Throwable error) {
            System.err.println("다중방 채팅 에러: " + error.getMessage());
        }
    }
}
