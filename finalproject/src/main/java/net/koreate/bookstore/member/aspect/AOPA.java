package net.koreate.bookstore.member.aspect;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class AOPA {
	/**
	 *	Controller 계층의 모든 메서드 실행 시점에 AOP 적용
	 *	AOP : 공통 기능(로깅, 트랜잭션, 보안, 예외처리 등)을 여러 모듈에서 반복 구현하지 않고, 
	 *		  횡단 로직을 한 곳에 정의해 필요할 때 자동으로 끼워 넣는다.
	 */
	@Around("execution(* net.koreate.bookstore.*.controller.*.*(..))")
	public Object cehckControllerObject(ProceedingJoinPoint pjp) throws Throwable{
		// AOP 시작 로그
		log.info("AOP CheckController START");
		
		// 실제 호출 대상 객체
		log.info("target : " + pjp.getTarget());
		// 호출 메서드 명
		log.info("method : " + pjp.getSignature().getName());
		// 전달된 인자 목록
		log.info("args : " + Arrays.toString(pjp.getArgs()));
		
		// 전달된 인자 하나씩 출력
		for(Object o : pjp.getArgs()) {
			System.out.println(o);
		}
		
		// 실제 메서드 실행
		Object o = pjp.proceed();
		
		// 반환값
		log.info("returns : " + o);
		
		// AOP 종료
		log.info("AOP CheckController END");
		
		return o;
	}
	
	/**
	 *	Service 계층의 모든 메서드 실행 시점에 AOP 적용	 
	*/
	@Around("execution(* net.koreate.bookstore.*.service.*.*(..))")
	public Object checkServiceObject(ProceedingJoinPoint pjp) throws Throwable{
		
		log.info("AOP checkServiceObject START");
		
		log.info("target : " + pjp.getTarget());
		log.info("method : " + pjp.getSignature().getName());
		log.info("args : " + Arrays.toString(pjp.getArgs()));
		
		for(Object o : pjp.getArgs()) {
			System.out.println(o);
		}
		
		Object o = pjp.proceed();
		
		log.info("returns : " + o);
		
		log.info("AOP checkServiceObject END");
		return o;
	}
}
