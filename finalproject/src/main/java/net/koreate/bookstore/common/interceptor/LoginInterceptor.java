package net.koreate.bookstore.common.interceptor;

import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.member.dao.BanIPDAO;
import net.koreate.bookstore.member.vo.BanIPVO;
import net.koreate.bookstore.vo.MemberVO;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

	// 로그인 실패 횟수 / 차단 시간 정보를 관리하는 DAO
	@Autowired
	private BanIPDAO dao;
	
	// RequestMapping 실행 이전 호출
	// 로그인 처리 시도 실패 기록 / 차단 시간 확인 후 flase 반환 시 현재페이지 요청 처리 종료
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// GET 요청은 통과
		if(request.getMethod().equalsIgnoreCase("get")) {
			// 로그인 페이지 요청 시 페이지 출력될 수 있게 매핑메소드로 요청
			return true;
		}
		
		/**
		 *	POST 로그인 시도 전 차단 및 남은 시간 확인 
		 */
		// 요청자 ip 주소
		String ip = request.getRemoteAddr();
		log.info("preHandle IP : {}", ip);
		
		// 기존 로그인 실패 기록 정보
		BanIPVO banIP = dao.getBanIPVO(ip);
		log.info("preHandle ban : {}", banIP);
		
		/**
		 *	실패 기록이 존재하고 시도횟수가 5회 이상 시 로그인 시도 15분간 차단
		 */
		if(banIP != null && banIP.getCnt() >= 5) {
			int limit = 1000 * 60 * 15;
			log.info("제한시간 : {}", limit);
			long bandate = banIP.getBandate().getTime();
			log.info("마지막 시도 시간 : {} ", bandate);
			long now = System.currentTimeMillis();
			log.info("요청 현재 시간 : {} ", now);
			long saveTime = limit - (now - bandate);
			log.info("남은 시간 : {} ", saveTime);
			
			// 남은시간 존재할 시 로그인 차단
			if(saveTime > 0) {
				log.info("제한 시간이 남아 있습니다.");
				
				SimpleDateFormat sdf = new SimpleDateFormat("mm:ss");
				String time = sdf.format(new Date(saveTime));
				log.info("남은 시간 : {} ", time);
				
				// 로그인 페이지로 포워드(요청을 컨트롤러로 넘기지 않고 여기서 응답 생성)
				RequestDispatcher rd = request.getRequestDispatcher(
					"/WEB-INF/views/member/login.jsp"	
				);
				request.setAttribute("message", "로그인 요청이 불가합니다.");
				request.setAttribute("time", saveTime);
				rd.forward(request, response);
				
				return false;				
			}else {
				log.info("제한 시간이 초기화 되었습니다.");
				dao.removeBanIP(ip);
			}
		}
		// 차단 대상이 아닌경우 컨트롤러를 통해 계속 진행
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 컨트롤러, 뷰 랜더링 까지 모두 끝난 뒤 마지막에 호출
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, 
						   HttpServletResponse response, 
						   Object handler,
			               ModelAndView modelAndView) throws Exception {
		
		String method = request.getMethod();
		log.info("전송방식 : {} ", method);
		
		if(method.equalsIgnoreCase("GET")) {
			log.info("get 요청 postHandle 종료");
			return;
		}
		/**
		 *	POST 로그인 요청 처리 완료 후
		 */
		// 현재 요청 사용자의 IP 주소
		String ip = request.getRemoteAddr();
		
		// 이전 실패 기록 존재 확인(해당 IP 주소 사용자)
		BanIPVO banVO = dao.getBanIPVO(ip);
		log.info("로그인 실패 기록 : {}", banVO);
		
		// 로그인 성공 시 세션에 있는 memberInfo 확인
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		
		if(member != null) {
			
			if(banVO != null) {
				// 로그인 실패 기록 존재 시 기존 기록 제거
				dao.removeBanIP(ip);
			}
			// 로그인 정보 저장 체크박스 활성화 여부 확인
			String rememberme = request.getParameter("rememberme");
			log.info("rememberme : {} ", rememberme);
			if(rememberme != null) {
				String member_id = member.getMember_id();
				
				byte[] encodedId =Base64.getEncoder().encode(member_id.getBytes());
				log.info("member_id : {} ", member_id);
				String encodedText = new String(encodedId);
				log.info("encodedText : {} ", encodedText);
				
				Cookie cookie = new Cookie("rememberme", encodedText);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 10);
				response.addCookie(cookie);
			}
			
		}else {
			// 로그인 실패
			String message = "";
			// 시도 가능 횟수 5회
			int count = 5;
			
			if(banVO == null) {
				// 최초 실패
				// 실패 기록 등록
				dao.signInFail(ip);
				count--;
			}else {
				// 누적(중복) 실패
				int failCount = banVO.getCnt();
				
				count = count - (failCount + 1);
				
				// 시도횟수 update
				dao.updateBanIPCnt(ip);
			}
			
			if(count > 0) {
				// 시도횟수 남았을 경우
				message = "회원정보가 일치하지 않습니다. 남은 횟수 : " + count;
			}else {
				// 남은 시도횟수 없을 경우
				message = "남은 시도기회가 없습니다. 15분동안 로그인 시도 불가합니다.";
			}
			
			// TODO 현재 로그인 페이지 체크 메세지 속성키 값은 msg 
			// 로그인 전용 메세지 분류 시 msg 수정
			modelAndView.addObject("msg", message);
			modelAndView.setViewName("/member/login");
		}
		
		
	}
}