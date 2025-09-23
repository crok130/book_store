package net.koreate.bookstore.payment.service;

import java.util.List;

import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.CartVO;

public interface PaymentService {
	
	/**
	 * 결제 서비스 수행
	 * 
	 * @param vo 결제 정보(주문자/상품/수량/총액 등)
	 * @return 결제 처리 결과를 문자열로 반환(예: "SUCCESS", "FAIL")
	 */
	public String paymemt(PaymentVO vo) throws Exception;
	

	/**
	 * 회원 기본 배송지/정보 조회
	 * 
	 * @param member_mum 로그인한 회원의 기본키(회원 번호)
	 * @return 회원 기본 정보(주소/연락처 등)
	 */
	public MemberVO memberAddr(int member_mum) throws Exception;
	
	// ================= 장바구니(Cart) =================
	/**
	 * 장바구니에 단일 상품 추가
	 * 동일 상품이 이미 존재하는 경우, 수량 병합 여부는 구현체에서 정의합니다.
	 * 
	 * @param cart 장바구니 항목 정보(member_num, newbook_num, book_count price)
	 */
	public String addCartItem(CartVO vo) throws Exception;

	/**
	 * 장바구니에 다건 상품 일괄 추가
	 * 
	 * @param items 장바구니 항목 리스트
	 */
	public void addCartItems(List<CartVO> items) throws Exception;

	/**
	 * 회원의 장바구니 전체 조회
	 * 
	 * @param member_num 회원 번호
	 * @return 해당 회원의 장바구니 항목 리스트
	 */
	public List<CartVO> getCart(int member_num) throws Exception;

	/**
	 * 장바구니 단일 항목 수량 변경(덮어쓰기)
	 * 
	 * @param member_num 회원 번호
	 * @param newbook_num 도서 번호
	 * @param book_count 변경할 수량(1 이상)
	 */
	public void updateCartItemCount(int member_num, int newbook_num, int book_count) throws Exception;

	/**
	 * 장바구니에서 특정 항목 제거
	 * 
	 * @param member_num 회원 번호
	 * @param newbook_num 도서 번호
	 */
	public void removeCartItem(int member_num, int newbook_num) throws Exception;

	/**
	 * 장바구니 비우기(모든 항목 삭제)
	 * 
	 * @param member_num 회원 번호
	 */
	public void clearCart(int member_num) throws Exception;

	/**
	 * 장바구니 총 수량 반환
	 * 
	 * @param member_num 회원 번호
	 * @return 장바구니에 담긴 전체 수량 합계
	 */
	public int getCartTotalQuantity(int member_num) throws Exception;
	
	/**
	 * 결제 처리
	 * 
	 * @param payment 결제 정보
	 * @return 처리 결과 ("success" 또는 "fail")
	 */
	public String processPayment(PaymentVO payment) throws Exception;

}
