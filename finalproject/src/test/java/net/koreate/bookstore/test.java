package net.koreate.bookstore;

import org.junit.Test;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;
import java.util.Set;

public class test {

    private static final AtomicInteger roomSeq = new AtomicInteger(100);
    private static final Map<Integer, Set<Integer>> roomAllowed = new ConcurrentHashMap<>();
    private static final Map<Integer, Set<Integer>> roomConnected = new ConcurrentHashMap<>();

    @Test
    public void testClickOpensRoomAndChat() {
        // 게시글1: 방 생성 후 1,2만 허용
        clickChatButton(1, 1, 2);
        // 게시글2: 방 생성 후 1,3만 허용
        clickChatButton(2, 1, 3);
    }

    private void clickChatButton(int boardNum, int seller, int buyer) {
        System.out.println("\n[CLICK] 게시글 " + boardNum + " 채팅하기 버튼");

        // 1) 방 생성
        int room = roomSeq.incrementAndGet();
        System.out.println("[ROOM] 생성됨 → room=" + room);

        // 2) 이 방에는 seller, buyer 두 명만 허용
        roomAllowed.put(room, Set.of(seller, buyer));

        // 3) 프론트가 열 WebSocket URL(같은 채널)
        String wsUrl = "ws://localhost:8080/chat?room=" + room;
        System.out.println("[WS] URL=" + wsUrl);

        // 4) 두 사용자 입장
        join(room, seller);
        join(room, buyer);

        // 5) 비허용 사용자 입장 시도(예시 출력)
        join(room, 9);
        join(room, 99);

        // 6) 채팅 (허용/접속된 사용자만 전송 허용)
        send(room, buyer, "안녕하세요! 이 상품 보고 문의드립니다.");
        send(room, seller, "안녕하세요! 무엇이 궁금하신가요?");
        send(room, 9, "난 비인가자야(보내기 거부되어야 함)");
        send(room, buyer, "상세 사진과 가격 알려주세요.");

        // 7) 퇴장
        leave(room, buyer);
        leave(room, seller);
        // 비접속자 퇴장 시도 예시
        leave(room, 9);

        System.out.println("[ROOM] 종료 room=" + room);
    }

    // 허용된 두 명 외엔 입장 거부, 정원(2명) 초과도 거부
    private void join(int room, int user) {
        Set<Integer> allowed = roomAllowed.get(room);
        if (allowed == null || !allowed.contains(user)) {
            System.out.println("[DENY] room=" + room + ", user=" + user + " (허용 아님)");
            return;
        }
        Set<Integer> connected = roomConnected.computeIfAbsent(room, k -> ConcurrentHashMap.newKeySet());
        if (connected.size() >= 2 && !connected.contains(user)) {
            System.out.println("[DENY] room=" + room + ", user=" + user + " (정원 초과)");
            return;
        }
        connected.add(user);
        System.out.println("[JOIN] room=" + room + ", user=" + user);
    }

    // 허용+접속 사용자만 전송 가능
    private void send(int room, int user, String msg) {
        Set<Integer> allowed = roomAllowed.get(room);
        Set<Integer> connected = roomConnected.get(room);
        if (allowed == null || !allowed.contains(user) || connected == null || !connected.contains(user)) {
            System.out.println("[DENY-SEND] room=" + room + ", user=" + user + " (권한 없음/미접속)");
            return;
        }
        System.out.println("{\"type\":\"MESSAGE\",\"chatroom_num\":" + room +
                ",\"sender_member_num\":" + user + ",\"message_content\":\"" + msg + "\"}");
    }

    // 접속된 사용자만 퇴장 처리
    private void leave(int room, int user) {
        Set<Integer> connected = roomConnected.get(room);
        if (connected == null || !connected.remove(user)) {
            System.out.println("[IGNORE-LEAVE] room=" + room + ", user=" + user + " (미접속)");
            return;
        }
        System.out.println("[LEAVE] room=" + room + ", user=" + user);
        if (connected.isEmpty()) {
            roomConnected.remove(room);
        }
    }
}
