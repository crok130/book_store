package net.koreate.bookstore.board.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.bookstore.common.utils.SearchCriteria;

/**
 * Provider 공급자 제공자 <br>
 * 동적(파라미터에 따라 변경되는) SQL Query 제공 객체
 */
public class BoardQueryProvider {
	
	
	public String searchSelectSQL(SearchCriteria cri) {
		
		SQL sql = new SQL();
		sql.SELECT("*");								// 검색 컬럼
		sql.FROM("newbook");							// 검색 테이블
		
		// 매개변수로 전달된 SQL 객체에 조건에 따라 WHERE LIKE 절 추가
		getWhereLike(cri, sql);
		
		// 카테고리 필터 추가
		if(cri.getCategory() != null && !cri.getCategory().trim().equals("")) {
			sql.AND().WHERE("newbook_category = '" + cri.getCategory() + "'");
		}
		
		// 정렬 조건 추가
		if(cri.getSort() != null && !cri.getSort().trim().equals("")) {
			if(cri.getSort().equals("newbook_price_desc")) {
				sql.ORDER_BY("newbook_price DESC");
			} else {
				sql.ORDER_BY(cri.getSort() + " ASC");
			}
		} else {
			sql.ORDER_BY("newbook_num DESC");
		}
		
		String query = sql.toString();
		
		query += " OFFSET #{startRow} ROWS FETCH NEXT #{perPageNum} ROWS ONLY";
		
		System.out.println("searchSelectSQL: " + query);
		
		return query;
	} // end searchSelectSQL;
	
	
	public String searchListCount(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("count(*)");
		sql.FROM("newbook");
		
		getWhereLike(cri, sql);
		
		return sql.toString();
	} // end ssearchListCount()
	
	
	private void getWhereLike(SearchCriteria cri, SQL sql) {
		// 키워드가 있을 때만 검색 조건 추가
		if(cri.getKeyword() != null && !cri.getKeyword().trim().equals("")) {
			String titleQuery = "newbook_title LIKE '%' || '"+cri.getKeyword()+"' || '%'";
			String authorQuery = "newbook_author LIKE '%'|| '"+cri.getKeyword()+"' || '%' ";
			String publisherQuery = "newbook_publisher LIKE '%'|| '"+cri.getKeyword()+"' || '%' ";
			
			// 제목, 저자, 출판사에서 검색
			sql.WHERE("(" + titleQuery + " OR " + authorQuery + " OR " + publisherQuery + ")");
		}
	} // end getWhereLike
	
	
}














