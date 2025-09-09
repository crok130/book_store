package net.koreate.bookstore;

import org.junit.Test;
import javax.websocket.*;
import java.net.URI;
import java.util.List;
import java.util.Map;

public class test {

    // 서버 컨텍스트 경로에 맞게 수정 (예: /hotel)
    private static final String BASE_WS = "ws://localhost:8080/hotel/chat";

    // 세션 필요 시 세션 쿠키 설정(없으면 비워두기)
    private static final String JSESSIONID = ""; // 예: "ABCDEF1234567890..."

    @ClientEndpoint
    public static class ChatClient {
        private final String name;
        public ChatClient(String name) { this.name = name; }
        @OnOpen public void onOpen(Session s) { System.out.println(name + " OPEN " + s.getId()); }
        @OnClose public void onClose(Session s, CloseReason r) { System.out.println(name + " CLOSE " + r.getCloseCode()); }
        @OnError public void onError(Session s, Throwable t) { System.out.println(name + " ERROR " + t.getMessage()); }
    }

    @Test
    public void openTwoRoomsConnectionsOnly() throws Exception {
        WebSocketContainer c = ContainerProvider.getWebSocketContainer();
        ClientEndpointConfig cfg = buildCfgWithCookie(JSESSIONID);

        // 방1 연결(유저1, 유저2) - 메시지 송수신 없음
        Session r1u1 = c.connectToServer(new ChatClient("R1-U1"), cfg, URI.create(BASE_WS + "/1"));
        Session r1u2 = c.connectToServer(new ChatClient("R1-U2"), cfg, URI.create(BASE_WS + "/1"));

        // 방2 연결(유저1, 유저3) - 메시지 송수신 없음
        Session r2u1 = c.connectToServer(new ChatClient("R2-U1"), cfg, URI.create(BASE_WS + "/2"));
        Session r2u3 = c.connectToServer(new ChatClient("R2-U3"), cfg, URI.create(BASE_WS + "/2"));

        // 잠깐 대기 후 종료
        Thread.sleep(500);
        safeClose(r1u1); safeClose(r1u2); safeClose(r2u1); safeClose(r2u3);
    }

    private ClientEndpointConfig buildCfgWithCookie(String jsid) {
        if (jsid == null || jsid.isBlank()) return ClientEndpointConfig.Builder.create().build();
        return ClientEndpointConfig.Builder.create().configurator(new ClientEndpointConfig.Configurator() {
            @Override public void beforeRequest(Map<String, List<String>> headers) {
                headers.put("Cookie", List.of("JSESSIONID=" + jsid));
            }
        }).build();
    }

    private void safeClose(Session s) {
        try { if (s != null && s.isOpen()) s.close(); } catch (Exception ignore) {}
    }
}
