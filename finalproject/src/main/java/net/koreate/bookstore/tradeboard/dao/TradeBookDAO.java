package net.koreate.bookstore.tradeboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.tradeboard.provider.TradeBookQueryProvider;
import net.koreate.bookstore.vo.TradebookVO;

public interface TradeBookDAO {
	
	@Insert("INSERT INTO tradebook (" +
	        " tradebook_title, member_num, tradebook_condition, tradebook_content," +
	        " tradebook_status, tradebook_author, tradebook_method, tradebook_time," +
	        " tradebook_img, tradebook_isbn, tradebook_location" +
	        ") VALUES (" +
	        " #{tradebook_title}, #{member_num}, #{tradebook_condition}, #{tradebook_content}," +
	        " #{tradebook_status}, #{tradebook_author}, #{tradebook_method}, #{tradebook_time}," +
	        " #{tradebook_img}, #{tradebook_isbn}, #{tradebook_location}" +
	        ")")
	int write(TradebookVO vo)throws Exception;
	
	@Select("SELECT t.*, m.member_nickname AS member_nickname "
			+ "FROM tradebook t JOIN members m ON m.member_num = t.member_num "
			+ "ORDER BY t.tradebook_num DESC OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY")
	List<TradebookVO> mainlist() throws Exception;

	// 동적 전체 개수
	@SelectProvider(type = TradeBookQueryProvider.class, method = "searchListCount")
	int listCount(SearchCriteria scri) throws Exception;

	// 동적 목록 조회
	@SelectProvider(type = TradeBookQueryProvider.class, method = "searchSelectSQL")
	List<TradebookVO> list(SearchCriteria scri) throws Exception;
	
	
	@Select("SELECT t.*, m.member_nickname AS member_nickname " +
			"FROM tradebook t JOIN members m ON m.member_num = t.member_num " +
			"WHERE t.tradebook_num = #{tradebook_num}")
	TradebookVO detail(int tradebook_num) throws Exception;

	@Update("UPDATE tradebook SET tradebook_trade = 'n' WHERE tradebook_num = #{tradebook_num}")
	int markTradeCompleted(int tradebook_num) throws Exception;

}
