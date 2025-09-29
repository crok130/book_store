package net.koreate.bookstore.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;
import java.util.Map;

public interface AdminDAO {
	
	@Select("SELECT count(*) FROM newbook")
	int BookCount()throws Exception;
	
	@Select("SELECT count(*) FROM members")
	int MemberCount()throws Exception;
	
	@Select("SELECT NVL(SUM(payment_total_price), 0) FROM payments")
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

    // 관리자 등록 (member_status = 1)
    @Insert("INSERT INTO members(member_id,member_pw,member_name,member_addr,member_email,member_phone,member_nickname,member_birth,member_status) VALUES(#{member_id},#{member_pw},#{member_name},#{member_addr},#{member_email},#{member_phone},#{member_nickname},#{member_birth},1)")
    int registerAdmin(net.koreate.bookstore.vo.MemberVO vo) throws Exception;

    // 관리자 로그인 (member_status = 1)
    @Select("SELECT * FROM members WHERE member_status = 1 AND member_id = #{member_id} AND member_pw = #{member_pw}")
    net.koreate.bookstore.vo.MemberVO loginAdmin(@Param("member_id") String member_id, @Param("member_pw") String member_pw) throws Exception;
    
    // 이번 주(월~일) 일자별 매출 합계 (Oracle 기준, ISO 주: TRUNC(date, 'IW'))
    @Select(
        "WITH week_bounds AS (SELECT TRUNC(SYSDATE, 'IW') AS week_start, TRUNC(SYSDATE, 'IW') + 6 AS week_end FROM dual), " +
        "days AS (SELECT week_start + (LEVEL-1) AS dt FROM week_bounds CONNECT BY LEVEL <= 7) " +
        "SELECT TO_CHAR(d.dt, 'YYYY-MM-DD') AS sales_date, NVL(SUM(p.payment_total_price), 0) AS total_amount " +
        "FROM days d " +
        "LEFT JOIN payments p ON TRUNC(p.payment_date) = d.dt " +
        "GROUP BY d.dt ORDER BY d.dt"
    )
    List<Map<String, Object>> selectDailyRevenue7d();
    

}
