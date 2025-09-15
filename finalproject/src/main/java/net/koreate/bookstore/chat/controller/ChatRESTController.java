package net.koreate.bookstore.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.chat.service.ChatService;
import net.koreate.bookstore.vo.ChatVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.MessageVO;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ChatRESTController {
	
	private final ChatService cs;
	
	@GetMapping("chat/chatAside")
	public List<ChatVO> chatAside(HttpSession session) throws Exception{
		int member_num= ((MemberVO) session.getAttribute("userInfo")).getMember_num();
		List<ChatVO> list = new ArrayList<>();
		list = cs.getChatRoomList(member_num);
		return list;
	}
	
	@GetMapping("chat/chatcontent")
	public List<MessageVO> chatContent(@RequestParam("chatroom_num") int chatroomNum) throws Exception {
		log.info("chatcontent 요청 chatroom_num={}", chatroomNum);
		return cs.getMessageList(chatroomNum);
	}
	
	@PutMapping("chat/complete")
	public ResponseEntity<String> complete(@RequestParam("tradebook_num") int tradebook_num) {
		
		return null;
	}
}
