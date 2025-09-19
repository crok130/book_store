package net.koreate.bookstore.common.interceptor;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.member.service.MemberService;
import net.koreate.bookstore.vo.MemberVO;

@Slf4j
public class CheckCookieInterceptor implements HandlerInterceptor {

	// 사용자 조회 서비스 (쿠키 아이디로 사용자 정보 조회)
	@Autowired
	private MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			 HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에 로그인 정보가 이미 있다면 통과
		HttpSession session = request.getSession();
		if(session.getAttribute("memberInfo") != null) {
			log.info("이미 로그인 되어있습니다.");
			// controller mapping method 로 요청 전달
			return true;
		}
		
		// Cookie 확인 
		// request 로 전달된 Cookie 목록에서 rememberme 라는 이름의 쿠키 정보 검색
		// 로그인 시 "로그인 정보 저장" 체크했던 사용자의 쿠키
		Cookie cookie = WebUtils.getCookie(request, "rememberme");
		if(cookie != null) {
			log.info("rememberme 쿠키 존재 : {} ", cookie.getName());
			// rememberme 쿠키 존재 / 쿠키 값(Base64 인코딩된 member_id) 확인
			String value = cookie.getValue();
			log.info("rememberme 쿠키 값 : {} ", value);
			
			// Decoding - Base64 / Base64 디코딩하여 실제 member_id 복원
			// Base64로 인코딩된 쿠키 값(value)을 다시 디코딩해서, 원래의 member_id 문자열로 복원하는 것
			byte[] decode = Base64.getDecoder().decode(value.getBytes());
			String member_id = new String(decode);
			log.info("decoded member_id : {} ", member_id);
			
			// member_id 로 사용자 조회 후 유효한 사용자면 세션에 로그인 정보 저장
			MemberVO member = ms.getMemberById(member_id);
			if(member != null) {
				log.info("session memberInfo 추가 : {}", member);
				session.setAttribute("memberInfo", member);
			}
		}
		// 문제가 없다면 true 반환 후 Controller 로 요청 흐름 계속 진행
		return true;
	}
	
}
