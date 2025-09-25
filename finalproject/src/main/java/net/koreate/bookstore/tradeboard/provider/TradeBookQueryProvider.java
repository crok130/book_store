package net.koreate.bookstore.tradeboard.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.bookstore.common.utils.SearchCriteria;

public class TradeBookQueryProvider {

	public String searchSelectSQL(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("t.*");
		sql.SELECT("m.member_nickname AS member_nickname");
		sql.FROM("tradebook t");
		sql.JOIN("members m ON m.member_num = t.member_num");

		applyWhere(cri, sql);

		sql.ORDER_BY("t.tradebook_num DESC");

		String query = sql.toString();
		query += " OFFSET #{startRow} ROWS FETCH NEXT #{perPageNum} ROWS ONLY";
		return query;
	}

	public String searchListCount(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("COUNT(*)");
		sql.FROM("tradebook t");
		sql.JOIN("members m ON m.member_num = t.member_num");

		applyWhere(cri, sql);
		return sql.toString();
	}

	private void applyWhere(SearchCriteria cri, SQL sql) {
		// keyword: title or author contains
		if (cri.getKeyword() != null && !cri.getKeyword().trim().isEmpty()) {
			sql.WHERE("(t.tradebook_title LIKE '%' || #{keyword} || '%' OR t.tradebook_author LIKE '%' || #{keyword} || '%')");
		}
		// category -> 상태 필터 (전체는 무시)
		if (cri.getCategory() != null && !cri.getCategory().trim().isEmpty() && !"전체".equals(cri.getCategory())) {
			sql.WHERE("t.tradebook_condition = #{category}");
		}
		// sort -> 지역 필터 (전국은 무시)
		if (cri.getSort() != null && !cri.getSort().trim().isEmpty() && !"전국".equals(cri.getSort())) {
			sql.WHERE("t.tradebook_location LIKE '%' || #{sort} || '%'");
		}
	}
}


