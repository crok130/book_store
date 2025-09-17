package net.koreate.bookstore.tradeboard.dao;

import org.apache.ibatis.annotations.Insert;

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

}
