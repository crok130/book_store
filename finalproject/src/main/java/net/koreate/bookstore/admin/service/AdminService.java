package net.koreate.bookstore.admin.service;

import java.util.List;

import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.CountVO;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;
import net.koreate.bookstore.vo.MemberVO;

public interface AdminService {
	
	
	CountVO allList()throws Exception;
	
	// 주문 목록 조회
	List<PaymentVO> getOrderList() throws Exception;
	
	// 주문 상태 변경
	void updateOrderStatus(PaymentVO vo) throws Exception;
	
	// 특정 주문 상세 조회
	PaymentVO getOrderDetail(int payment_num) throws Exception;
	
	// 최근 등록책 5개
	List<NewBookVO> list() throws Exception;

	// 재고관리 - 목록/페이징
	PageMaker getInventoryPage(SearchCriteria scri) throws Exception;
	List<NewBookVO> getInventoryList(SearchCriteria scri) throws Exception;

	// 재고관리 - 입/출고
    void increaseStock(StockUpdateVO req) throws Exception;
    void decreaseStock(StockUpdateVO req) throws Exception;

	// 관리자 인증
	MemberVO adminSignIn(String member_id, String member_pw) throws Exception;
	String adminSignUp(MemberVO vo) throws Exception;
	
}
