package net.koreate.bookstore.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;

public interface AdminDAO {
	
	@Select("SELECT count(*) FROM newbook")
	int BookCount()throws Exception;
	
	@Select("SELECT count(*) FROM members")
	int MemberCount()throws Exception;
	
	@Select("SELECT SUM(payment_total_price) FROM payments")
	int TotalMoney() throws Exception;
	
	@Select("SELECT count(*) FROM payments")
	int TotalOrderer() throws Exception;
	
	
	// 주문 목록 조회
	@Select("SELECT p.*, n.newbook_title FROM payments p JOIN newbook n ON p.newbook_num = n.newbook_num ORDER BY p.payment_date DESC")
	List<PaymentVO> getOrderList() throws Exception;
	
	// 주문 상태 변경
	@Update("UPDATE payments SET item_status = #{item_status} WHERE payment_num = #{payment_num}")
	void updateOrderStatus(PaymentVO vo) throws Exception;
	
	// 특정 주문 상세 조회
	@Select("SELECT * FROM payments WHERE payment_num = #{payment_num}")
	PaymentVO getOrderDetail(int payment_num) throws Exception;
	
	@Select("SELECT * FROM newbook ORDER BY newbook_num DESC OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY")
	List<NewBookVO> list()throws Exception;

	// 재고관리: 총 개수
	@SelectProvider(type = net.koreate.bookstore.admin.provider.AdminInventoryQueryProvider.class, method = "countInventory")
	int countInventory(SearchCriteria scri) throws Exception;

	// 재고관리: 목록 조회
	@SelectProvider(type = net.koreate.bookstore.admin.provider.AdminInventoryQueryProvider.class, method = "selectInventory")
	List<NewBookVO> selectInventory(SearchCriteria scri) throws Exception;

	// 재고 증가(입고)
    @Update("UPDATE newbook SET newbook_count = newbook_count + #{qty} WHERE newbook_num = #{newbookNum}")
    int increaseStock(StockUpdateVO req) throws Exception;

	// 재고 감소(출고)
    @Update("UPDATE newbook SET newbook_count = CASE WHEN newbook_count - #{qty} < 0 THEN 0 ELSE newbook_count - #{qty} END WHERE newbook_num = #{newbookNum}")
    int decreaseStock(StockUpdateVO req) throws Exception;
}
