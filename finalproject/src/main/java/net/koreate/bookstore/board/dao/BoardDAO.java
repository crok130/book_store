package net.koreate.bookstore.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.bookstore.board.provider.BoardQueryProvider;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.NewBookVO;

public interface BoardDAO {

	 @Insert("INSERT INTO newbook(newbook_title, newbook_content, newbook_author, newbook_publisher,"
			  + "newbook_count, newbook_img, newbook_category, newbook_price, newbook_page, newbook_publication_date, newbook_isbn)"
			  + " VALUES(#{newbook_title}, #{newbook_content}, #{newbook_author}, #{newbook_publisher}, "
			  + "#{newbook_count}, #{newbook_img}, #{newbook_category}, #{newbook_price}, #{newbook_page},"
			  + "#{newbook_publication_date}, #{newbook_isbn})")
	 int insert(NewBookVO vo) throws Exception;
	 
	 @Select("SELECT * FROM newbook ORDER BY newbook_num DESC OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY")
	 List<NewBookVO> listBook() throws Exception;
	 
	 @Select("SELECT * FROM newbook WHERE newbook_num = #{newbook_num}")
	 NewBookVO read(int newbook_num) throws Exception;

		
	/**
      * 검색결과내에서 페이징 처리된 게시글 목록
	 */
	@SelectProvider(type=BoardQueryProvider.class, method="searchSelectSQL")
	List<NewBookVO> listReply(SearchCriteria cri)throws Exception;
		

	// @Select("SELECT count(*) FROM re_tbl_board")
	@SelectProvider(type=BoardQueryProvider.class, method="searchListCount")
	int listCount(SearchCriteria cri)throws Exception;

	
	 
}
