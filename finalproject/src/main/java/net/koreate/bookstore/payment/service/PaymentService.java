package net.koreate.bookstore.payment.service;

import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

public interface PaymentService {
	
	/**
	 * 결제서비스
	 * 
	 * @param vo 결제 정보를
	 * @return 결제 성공 여부 문자열로 반환
	 */
	public String paymemt(PaymentVO vo) throws Exception;
	

	/**
	 * 회원정보 가져오기
	 * 
	 * @param member_mum 로그인유저 기본키
	 * @return 로그인 유저 회원정보
	 */
	public MemberVO memberAddr(int member_mum) throws Exception;

}
