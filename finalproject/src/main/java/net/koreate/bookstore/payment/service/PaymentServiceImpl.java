package net.koreate.bookstore.payment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.payment.dao.PaymentDAO;
import net.koreate.bookstore.vo.BulkPaymentVO;
import net.koreate.bookstore.vo.CartVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final PaymentDAO dao;

	@Override
    public MemberVO memberAddr(int member_mum) throws Exception {
        return dao.findMemberByNum(member_mum);
	}

	@Override
	public String addCartItem(CartVO vo) throws Exception {
		if (vo == null) return "유효하지 않은 요청";
		if (vo.getBook_count() <= 0) return "유효하지 않은 수량";
		try {
			int affected = dao.AddCart(vo); // MERGE: 증가 또는 삽입
			return affected > 0 ? "장바구니 담기 완료" : "장바구니 담기 실패";
		} catch (Exception e) {
			return "장바구니 담기 실패";
		}
	}

	@Override
	public void addCartItems(List<CartVO> items) throws Exception {
		if (items == null || items.isEmpty()) return;
		for (CartVO item : items) {
			addCartItem(item);
		}
	}

	@Override
	public List<CartVO> getCart(int member_num) throws Exception {
		return dao.getCart(member_num);
	}

	@Override
	public void updateCartItemCount(int member_num, int newbook_num, int book_count) throws Exception {
		CartVO vo = new CartVO();
		vo.setMember_num(member_num);
		vo.setNewbook_num(newbook_num);
		vo.setBook_count(book_count);
		dao.UpdateCartCount(vo);
	}

	@Override
	public void removeCartItem(int member_num, int newbook_num) throws Exception {
		CartVO vo = new CartVO();
		vo.setMember_num(member_num);
		vo.setNewbook_num(newbook_num);
		dao.DeleteCartItem(vo);
	}

	@Override
	public void clearCart(int member_num) throws Exception {
		dao.clearCart(member_num);
	}

	@Override
	public int getCartTotalQuantity(int member_num) throws Exception {
		// TODO 구현체/DAO 준비 후 적용
		return 0;
	}

	@Override
	public String processPayment(PaymentVO payment) throws Exception {
		try {
			// 결제 정보를 데이터베이스에 저장
			int result = dao.insertPayment(payment);
			if (result > 0) {
				// 결제 성공 시 상품 수량 차감
				int decreaseResult = dao.decreaseBookCount(payment);
				if (decreaseResult > 0) {
					return "success";
				} else {
					return "fail"; // 수량 차감 실패
				}
			} else {
				return "fail"; // 결제 정보 저장 실패
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@Override
	public String processBulkPayment(BulkPaymentVO bulkPayment) throws Exception {
		try {
			if (bulkPayment == null || bulkPayment.getCartItems() == null || bulkPayment.getCartItems().isEmpty()) {
				return "fail";
			}
			
			// 각 장바구니 항목에 대해 개별 결제 처리
			for (CartVO cartItem : bulkPayment.getCartItems()) {
				PaymentVO payment = new PaymentVO();
				payment.setMember_num(bulkPayment.getMember_num());
				payment.setMember_name(bulkPayment.getMember_name());
				payment.setMember_phone(bulkPayment.getMember_phone());
				payment.setMember_addr(bulkPayment.getMember_addr());
				payment.setPayment_content(bulkPayment.getPayment_content());
				payment.setNewbook_num(cartItem.getNewbook_num());
				payment.setPayment_quantity(cartItem.getBook_count());
				payment.setPayment_total_price(cartItem.getPrice() * cartItem.getBook_count());
				payment.setItem_status(bulkPayment.getItem_status());
				
				// 개별 결제 정보 저장
				int result = dao.insertBulkPayment(payment);
				if (result <= 0) {
					return "fail";
				}
				
				// 상품 수량 차감
				int decreaseResult = dao.decreaseBookCountForBulk(payment);
				if (decreaseResult <= 0) {
					return "fail";
				}
			}
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

}
