package net.koreate.bookstore.member.listener;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.vo.MemberVO;

// HttpSession 생성/소멸 이벤트, 속성 추가/제거/대체 이벤트를 받기 위해 두 리스너 인터페이스 구현
// HttpSessionListener : HttpSession 객체 생성, 제거(무효화) 될 때 제거 또는 생성된 session event 감지
// HttpSessionAttributeListener : 등록된 Session 객체들의 속성 정보(추가, 수정, 삭제 등) 변경 시 event 감지
@Slf4j
public class MySessionListener implements HttpSessionListener, HttpSessionAttributeListener{

	// 동시성 안전한 세션 저장소. memberInfo가 추가된 세션만 보관.
	// session 에 memberInfo 속성이 추가된 HttpSession 객체 저장
	private static Hashtable<String, HttpSession> sessionRepossitory = new Hashtable<>();
	
	/**
	 *	sessionCreated
	 * - 새로운 HttpSession이 만들어질 때 호출.
	 * - 기존 세션 무효화 또는 타임아웃 후 새로 생성된 경우도 포함.
	 */
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// 이벤트에서 생성된 세션 객체 획득
		HttpSession session = se.getSession();
		// 서버에서 제거된 session 정보가 repository 에 등록되어 있으면 제거
		log.info("생성된 SESSION {}", session.getId());
	}
	
	/**
	 *	sessionDestroyed
	 *	Server 에서 관리중인 Session 객체가 timeout 또는 invalidate()로 제거 되었을 때 호출되는 method 
	 */	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		log.info("제거된 SESSION {}", session.getId());
		// 서버에서 제거된 session 정보가 repository 에 등록되엉 있으면 제거
		sessionRepossitory.remove(session.getId());
	}
	
	/**
	 *	attributeAdded - 등록된 session 객체에 새로운 속성이 추가되면 호출되는 메서드
	 */
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		log.info("added 호출");
		// 속성이 추가된 세션 참조
		HttpSession session = event.getSession();
		log.info("SESSION ID : {}", session.getId());
		// 추가된 속성 이름과 값 로그
		log.info("SESSION ADD name : {}, value : {}", event.getName(), event.getValue());
		
		// 로그인 완료 시 세션에 넣는 키가 "memberInfo"라고 가정
		if(event.getName().equals("memberInfo")) {
			// 새로운 로그인으로 session 추가된 사용자 정보
			MemberVO newMem = (MemberVO)event.getValue();
			log.info("newMem : {}", newMem);
			
			// 기존 사용자 로그인 해제
			
			// 같은 사용자로 로그인된 기존 세션이 있는지 탐색하고, 있으면 만료 알림 속성 부여
			for(HttpSession ses : sessionRepossitory.values()) {
				// 기존에 등록된 로그인 된 사용자 정보
				MemberVO mem = (MemberVO)ses.getAttribute("memberInfo");
				
				if(mem != null && mem.getMember_num() == newMem.getMember_num()) {
					// 컨트롤러/필터에서 이 속성을 감지해 강제 로그아웃 처리
					ses.setAttribute("expire", "새로운 로그인으로 인하여 로그아웃 됩니다.");
					break;
				}
			}
			// 현재 로그인한 사용자의 세션을 저장소에 등록
			sessionRepossitory.put(session.getId(), session);
		}
	}
	
	/**
	 * attributeRemoved
	 * - 세션에서 속성이 제거될 때 호출.
	 */
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		log.info("Removed 호출");
		HttpSession session = event.getSession();
		log.info("SESSION ID : {}", session.getId());
		log.info("SELECT REMOVE name : {}, value : {}", event.getName(), event.getValue());
		// 로그인 정보가 제거되면 세션 저장소에서도 제거
		if(event.getName().equals("memberInfo")) {
			
			sessionRepossitory.remove(session.getId());
		}
	}
	
	/**
	 * attributeReplaced
	 * - 세션의 기존 속성이 새 값으로 대체될 때 호출.
	 */
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		log.info("Replaced 호출");
		HttpSession session = event.getSession();
		log.info("SESSION ID : {}", session.getId());
		log.info("SESSION REPLACE name : {}, value : {}", event.getName(), event.getValue());		
	}
	
}
