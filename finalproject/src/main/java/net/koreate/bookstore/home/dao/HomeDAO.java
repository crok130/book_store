package net.koreate.bookstore.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.NewBookVO;

public interface HomeDAO {

    // 전체 판매량 기준 베스트셀러 도서 조회 (limit개)
    @Select("SELECT n.*\n"
          + "FROM newbook n\n"
          + "JOIN (\n"
          + "  SELECT p.newbook_num, SUM(p.payment_quantity) AS qty\n"
          + "  FROM payments p\n"
          + "  GROUP BY p.newbook_num\n"
          + "  ORDER BY qty DESC\n"
          + "  OFFSET 0 ROWS FETCH NEXT #{limit} ROWS ONLY\n"
          + ") t ON t.newbook_num = n.newbook_num")
    List<NewBookVO> topSellers(@Param("limit") int limit) throws Exception;

    // 카테고리 내 판매량 상위 도서 조회 (limit개)
    @Select("SELECT n.*\n"
          + "FROM newbook n\n"
          + "JOIN (\n"
          + "  SELECT p.newbook_num, SUM(p.payment_quantity) AS qty\n"
          + "  FROM payments p\n"
          + "  JOIN newbook nb ON nb.newbook_num = p.newbook_num\n"
          + "  WHERE nb.newbook_category = #{category}\n"
          + "  GROUP BY p.newbook_num\n"
          + "  ORDER BY qty DESC\n"
          + "  OFFSET 0 ROWS FETCH NEXT #{limit} ROWS ONLY\n"
          + ") t ON t.newbook_num = n.newbook_num")
    List<NewBookVO> topSellersByCategory(@Param("category") String category, @Param("limit") int limit) throws Exception;

    // 회원의 많이 구매한 카테고리 상위 목록 조회 (limit개)
    @Select("SELECT nb.newbook_category\n"
          + "FROM payments p\n"
          + "JOIN newbook nb ON nb.newbook_num = p.newbook_num\n"
          + "WHERE p.member_num = #{memberNum}\n"
          + "GROUP BY nb.newbook_category\n"
          + "ORDER BY SUM(p.payment_quantity) DESC\n"
          + "OFFSET 0 ROWS FETCH NEXT #{limit} ROWS ONLY")
    List<String> topCategoriesForMember(@Param("memberNum") int memberNum, @Param("limit") int limit) throws Exception;

    // 전체에서 많이 팔린 카테고리 상위 목록 조회 (limit개)
    @Select("SELECT nb.newbook_category\n"
          + "FROM payments p\n"
          + "JOIN newbook nb ON nb.newbook_num = p.newbook_num\n"
          + "GROUP BY nb.newbook_category\n"
          + "ORDER BY SUM(p.payment_quantity) DESC\n"
          + "OFFSET 0 ROWS FETCH NEXT #{limit} ROWS ONLY")
    List<String> topCategoriesOverall(@Param("limit") int limit) throws Exception;

    // 카테고리 최신 도서 목록 조회 (보충용, limit개)
    @Select("SELECT * FROM newbook\n"
          + "WHERE newbook_category = #{category}\n"
          + "ORDER BY newbook_num DESC\n"
          + "OFFSET 0 ROWS FETCH NEXT #{limit} ROWS ONLY")
    List<NewBookVO> recentByCategory(@Param("category") String category, @Param("limit") int limit) throws Exception;
}


