// 구분자를 구분함
package net.koreate.bookstore.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.member.service.MemberService;
import net.koreate.bookstore.vo.MemberVO;

@Controller
@RequestMapping("/member/")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	private final MemberService ms;
	// 이메일 발송을 위한 스프링 메일 전송기
	private final JavaMailSender mailSender;
	// 서버 로그 출력용 (디버깅/상태 확인)
	
	@GetMapping("login")
	public void login() {}
	
	// GET /user/join 요청을 처리 : 회원가입 화면(member/register.jsp)으로 이동
	@GetMapping("register")
	public String register() {
		// /WEB-INF/views/member/register.jsp
		return "member/register";
	}
	
	@PostMapping("login")
	public String POSTlogin(String member_id, String member_pw, HttpSession session) throws Exception {
		MemberVO vo = ms.signIn(member_id, member_pw, session); 
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/";
	}
	
	// 아이디 가입가능 여부 체크
	@GetMapping("midCheck")
	@ResponseBody
	public boolean midCheck(String member_id) throws Exception {
		boolean idckeck = ms.isIdAvailable(member_id);
		return idckeck;/* ms.isIdAvailable(member_id); */
	}

	// 닉네임 중복 여부 체크
	@GetMapping("mnickCheck")
	@ResponseBody
	public boolean mnickCheck(String member_nickname) throws Exception{
		return ms.isNicknameAvailable(member_nickname);	
	}
	
	
	
	@GetMapping("memailCheck")
	@ResponseBody
	public boolean memailCheck(String member_email) throws Exception{
		boolean emailcheck = ms.isEmailAvailable(member_email);
		return emailcheck;
	}
	
	@GetMapping("checkEmail")
	@ResponseBody
	public String sendMail(String member_email) throws Exception{
		
		String code = "";
		for(int i = 0; i < 5; i++) {
			code += (int)(Math.random() * 10);
		}
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
		
		helper.setFrom("ho0213201@gmail.com", "CGG MASTER");
		
		helper.setTo(member_email);
		helper.setSubject("CGG 이메일 인증 코드");
		helper.setText("다음 인증 코드를 입력해주세요.<h3>["+code+"]</h3>", true);
		mailSender.send(message);
		return code;
	}
	
	@PostMapping("register")
	public String register(MemberVO vo, String member_addr1, String member_addr2,RedirectAttributes redirectAttributes) throws Exception {
		String member_addr = member_addr1 +"_"+ member_addr2;
		vo.setMember_addr(member_addr);
		log.info("vo : {}", vo);
		String msg = ms.signUp(vo);
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/member/login";
	}
	
	
}
