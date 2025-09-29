// 구분자를 구분함
package net.koreate.bookstore.member.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.member.service.MemberService;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

@Controller
@RequestMapping("/member/")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	
	// 로그인 / 회원가입 / 중복확인 등 로직 수행
	private final MemberService ms;
	// 이메일 발송을 위한 스프링 메일 전송기
	private final JavaMailSender mailSender;
	
	@GetMapping("login")
	public String login() {		
		return "member/login";
	}
	
	// 로그인 성공 -> 세션에 사용자 정보 저장 후 메인페이지 이동
	@PostMapping("login")
	public String POSTlogin(String member_id, String member_pw, HttpSession session) throws Exception {
		ms.login(member_id, member_pw, session);

		return "redirect:/";
	}
	
	// GET /member/register 요청을 처리 : 회원가입 화면(member/register.jsp)으로 이동
	@GetMapping("register")
	public void register() {}
	
	
	// 로그아웃 처리 (현재 세션에서 memberInfo 제거 후 로그인 상태 해제)
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberInfo");
		return "redirect:/member/login";
	}
	
	// 아이디 중복 여부 체크
	@GetMapping("midCheck")
	@ResponseBody
	public boolean midCheck(String member_id) throws Exception {
		MemberVO member = ms.getMemberById(member_id);
		return member == null ? true : false;
	}

	// 닉네임 중복 여부 체크
	@GetMapping("mnickCheck")
	@ResponseBody
	public boolean mnickCheck(String member_nickname) throws Exception{
		return ms.isNicknameAvailable(member_nickname);	
	}
	
	
	// 이메일 중복 여부 체크
	@GetMapping("memailCheck")
	@ResponseBody
	public boolean memailCheck(String member_email) throws Exception{
		boolean emailcheck = ms.isEmailAvailable(member_email);
		return emailcheck;
	}
	
	// 이메일 인증 코드 메서드
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
	
	// 회원가입 처리 담당
	@PostMapping("register")
	public String register(MemberVO vo, String member_addr1, String member_addr2,RedirectAttributes redirectAttributes) throws Exception {
		String member_addr = member_addr1 +"_"+ member_addr2;
		vo.setMember_addr(member_addr);
		log.info("vo : {}", vo);
		String msg = ms.signUp(vo);
		redirectAttributes.addFlashAttribute("msg", msg);
		return "redirect:/member/login";
	}
	

	@GetMapping("mypage")
	public String mypage(SearchCriteria scri, Model model, HttpSession session) throws Exception {
		if (scri == null) scri = new SearchCriteria();
		List<PaymentVO> list = ms.listOrders(scri, session);
		PageMaker pm = ms.getPageMaker(scri, session);
		
		log.info("oder : {}", list);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "member/orderHistory";
	}
	

}
