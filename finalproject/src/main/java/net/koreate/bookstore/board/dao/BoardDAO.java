package net.koreate.bookstore.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.NewBookVO;

public interface BoardDAO {

	 @Insert("INSERT INTO newbook(newbook_title, newbook_content, newbook_author, newbook_publisher,"
			  + "newbook_count, newbook_img, newbook_category, newbook_price, newbook_page, newbook_publication_date)"
			  + " VALUES(#{newbook_title}, #{newbook_content}, #{newbook_author}, #{newbook_publisher}, "
			  + "#{newbook_count}, #{newbook_img}, #{newbook_category}, #{newbook_price}, #{newbook_page},"
			  + "#{newbook_publication_date})")
	 int insert(NewBookVO vo) throws Exception;
	 
	 @Select("SELECT * FROM newbook ORDER BY newbook_num DESC OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY")
	 List<NewBookVO> listBook() throws Exception;
	 
}
