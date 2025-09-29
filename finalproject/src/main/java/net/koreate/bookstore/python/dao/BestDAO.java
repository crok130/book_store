package net.koreate.bookstore.python.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.BestSellerVO;

public interface BestDAO {

    /**
     * 베스트셀러 전체 개수 조회
     * 
     * @return 베스트셀러 전체 개수
     */
    @Select("SELECT COUNT(*) FROM bestseller_simple")
    int countBest() throws Exception;

    /**
     * 베스트셀러 페이지별 조회
     * 
     * @param offset 시작 위치
     * @param limit 조회할 개수
     * @return 베스트셀러 목록
     */
    @Select("SELECT rank_num, title, image_src, link_url\n"
          + "FROM bestseller_simple\n"
          + "ORDER BY rank_num ASC\n"
          + "OFFSET #{offset} ROWS FETCH NEXT #{limit} ROWS ONLY")
    List<BestSellerVO> selectBestPage(@Param("offset") int offset, @Param("limit") int limit) throws Exception;
}
