package net.koreate.bookstore.payment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.payment.dao.PaymentDAO;
import net.koreate.bookstore.vo.CartVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final PaymentDAO dao;

	@Override
	public String paymemt(PaymentVO vo) throws Exception {
		// TODO 결제 연동 구현
		return null;
	}

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
		// TODO 구현체/DAO 준비 후 적용
	}

	@Override
	public int getCartTotalQuantity(int member_num) throws Exception {
		// TODO 구현체/DAO 준비 후 적용
		return 0;
	}

	@Override
	public String processPayment(PaymentVO payment) throws Exception {
		try {
			// 주소가 이미 "addr1_addr2" 형태로 합쳐져서 들어온다고 가정
			// 만약 별도로 합쳐야 한다면:
			// String fullAddr = payment.getMember_addr1() + "_" + payment.getMember_addr2();
			// payment.setMember_addr(fullAddr);
			
			// 결제 정보를 데이터베이스에 저장
			int result = dao.insertPayment(payment);
			if (result > 0) {
				return "결제성공";
			} else {
				return "결제 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "결제 실패";
		}
	}

}
