package net.koreate.bookstore.payment.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.payment.dao.PaymentDAO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {

    private final PaymentDAO paymentDAO;

	@Override
	public String paymemt(PaymentVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
    public MemberVO memberAddr(int member_mum) throws Exception {
        return paymentDAO.findMemberByNum(member_mum);
	}

}
