package net.koreate.bookstore;

import static org.junit.Assert.assertTrue;

import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.TimeUnit;

import javax.mail.Transport;
import javax.websocket.ClientEndpointConfig;
import javax.websocket.ContainerProvider;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.MessageHandler;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

import org.junit.Test;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.simp.stomp.StompFrameHandler;
import org.springframework.messaging.simp.stomp.StompHeaders;
import org.springframework.messaging.simp.stomp.StompSession;
import org.springframework.messaging.simp.stomp.StompSessionHandlerAdapter;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;
import org.springframework.web.socket.messaging.WebSocketStompClient;
import org.springframework.web.socket.sockjs.client.SockJsClient;
import org.springframework.web.socket.sockjs.client.WebSocketTransport;

public class test {

    /**
	 * 순수 WebSocket E2E (서버에 @ServerEndpoint 또는 임의 엔드포인트가 있을 때)
     */
    @Test
	public void e2eWebSocket_1to1_roomCreate_join_message() throws Exception {
		final String wsUri = System.getProperty("ws.uri", "ws://localhost:8080/chat");

		final CountDownLatch messageReceived = new CountDownLatch(1);
		final CountDownLatch opened = new CountDownLatch(2);

        WebSocketContainer container = ContainerProvider.getWebSocketContainer();
		ClientEndpointConfig cfg = ClientEndpointConfig.Builder.create().build();

		// Client 1 (방 생성자)
		Session c1 = container.connectToServer(new Endpoint() {
			@Override
			public void onOpen(Session session, EndpointConfig config) {
				opened.countDown();
				session.addMessageHandler((MessageHandler.Whole<String>) msg -> {
					System.out.println("[C1] recv: " + msg);
					messageReceived.countDown();
				});
				try {
					session.getBasicRemote().sendText("{\"type\":\"CREATE_ROOM\"}");
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		}, cfg, java.net.URI.create(wsUri));

		// Client 2 (참가자)
		Session c2 = container.connectToServer(new Endpoint() {
			@Override
			public void onOpen(Session session, EndpointConfig config) {
				opened.countDown();
				session.addMessageHandler((MessageHandler.Whole<String>) msg -> {
					System.out.println("[C2] recv: " + msg);
				});
				try {
					session.getBasicRemote().sendText("{\"type\":\"JOIN\",\"roomId\":1}");
					session.getBasicRemote().sendText("{\"type\":\"MESSAGE\",\"roomId\":1,\"text\":\"hello\"}");
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		}, cfg, java.net.URI.create(wsUri));

		assertTrue("클라이언트 오픈 실패", opened.await(5, TimeUnit.SECONDS));
		assertTrue("메시지 수신 타임아웃", messageReceived.await(5, TimeUnit.SECONDS));

		c2.close();
		c1.close();
	}

	/**
	 * STOMP E2E (Spring STOMP 서버가 설정되어 있을 때)
	 * 기본 접속: ws://localhost:8080/ws-stomp
	 * 구독: /topic/chat.1, 전송: /app/chat/1
     */
    @Test
	public void stompE2E_subscribe_and_send() throws Exception {
		final String stompUri = System.getProperty("stomp.uri", "ws://localhost:8080/ws-stomp");
		final String subscribeDest = System.getProperty("stomp.sub", "/topic/chat.1");
		final String sendDest = System.getProperty("stomp.send", "/app/chat/1");

		// SockJS + Standard WebSocket transport 구성
		WebSocketTransport webSocketTransport = new WebSocketTransport(new StandardWebSocketClient());
		SockJsClient sockJsClient = new SockJsClient(Arrays.asList(webSocketTransport));
		WebSocketStompClient stompClient = new WebSocketStompClient(sockJsClient);
		stompClient.setMessageConverter(new MappingJackson2MessageConverter());

		final BlockingQueue<String> queue = new LinkedBlockingDeque<>();
		final CountDownLatch connected = new CountDownLatch(1);

		StompSession session = stompClient.connect(stompUri, new StompSessionHandlerAdapter() {
			@Override public void afterConnected(StompSession sess, StompHeaders connectedHeaders) {
				connected.countDown();
			}
		}).get(5, TimeUnit.SECONDS);

		assertTrue("STOMP 연결 실패", connected.await(5, TimeUnit.SECONDS));

		// 구독
		session.subscribe(subscribeDest, new StompFrameHandler() {
			@Override public Type getPayloadType(StompHeaders headers) { return String.class; }
			@Override public void handleFrame(StompHeaders headers, Object payload) {
				queue.offer(String.valueOf(payload));
			}
		});

		// 전송 (서버에서 @MessageMapping("/chat/{id}") 등으로 처리하도록 맞춰주세요)
		String payload = "{\"text\":\"hello stomp\"}";
		session.send(sendDest, payload.getBytes());

		String received = queue.poll(5, TimeUnit.SECONDS);
		assertTrue("구독 메시지 수신 실패", received != null && received.length() > 0);
    }
}
