package net.koreate.bookstore.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.admin.dao.AdminDAO;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.CountVO;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;
import net.koreate.bookstore.vo.MemberVO;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDAO dao;

	@Override
	public CountVO allList() throws Exception {
		CountVO vo = new CountVO();
		int book = dao.BookCount();
		int member = dao.MemberCount();
		int money = dao.TotalMoney();
		int oder = dao.TotalOrderer();
		vo.setBook(book);
		vo.setMember(member);
		vo.setMoney(money);
		vo.setOder(oder);
		return vo;
	}

	@Override
	public List<PaymentVO> getOrderList() throws Exception {
		return dao.getOrderList();
	}
	
	@Override
	public void updateOrderStatus(PaymentVO vo) throws Exception {
		dao.updateOrderStatus(vo);
	}
	
	@Override
	public PaymentVO getOrderDetail(int payment_num) throws Exception {
		return dao.getOrderDetail(payment_num);
	}

	@Override
	public List<NewBookVO> list() throws Exception {		
		return dao.list();
	}

	@Override
	public PageMaker getInventoryPage(SearchCriteria scri) throws Exception {
		int total = dao.countInventory(scri);
		return new PageMaker(scri, total, 5);
	}

	@Override
	public List<NewBookVO> getInventoryList(SearchCriteria scri) throws Exception {
		return dao.selectInventory(scri);
	}

	@Override
    public void increaseStock(StockUpdateVO req) throws Exception {
        dao.increaseStock(req);
	}

	@Override
    public void decreaseStock(StockUpdateVO req) throws Exception {
        dao.decreaseStock(req);
	}

    @Override
    public MemberVO adminSignIn(String member_id, String member_pw) throws Exception {
        return dao.loginAdmin(member_id, member_pw);
    }

    @Override
    public String adminSignUp(MemberVO vo) throws Exception {
        // member_status는 쿼리에서 1로 고정 삽입
        int r = dao.registerAdmin(vo);
        return r == 1 ? "success" : "fail";
    }
    
    @Override
    public List<Map<String, Object>> getDailyRevenue7d() throws Exception {
        return dao.selectDailyRevenue7d();
    }

}
