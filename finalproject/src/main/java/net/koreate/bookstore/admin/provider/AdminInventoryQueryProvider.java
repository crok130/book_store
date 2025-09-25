package net.koreate.bookstore.admin.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.bookstore.common.utils.SearchCriteria;

public class AdminInventoryQueryProvider {

    public String countInventory(final SearchCriteria scri) {
        return new SQL() {{
            SELECT("COUNT(*)");
            FROM("newbook");
            if (scri.getKeyword() != null && !scri.getKeyword().trim().isEmpty()) {
                WHERE("(LOWER(newbook_title) LIKE '%' || LOWER(#{keyword}) || '%' OR LOWER(newbook_author) LIKE '%' || LOWER(#{keyword}) || '%' OR newbook_isbn LIKE '%' || #{keyword} || '%')");
            }
            if (scri.getCategory() != null && !scri.getCategory().trim().isEmpty() && !"전체".equals(scri.getCategory())) {
                WHERE("newbook_category = #{category}");
            }
            // 재고 상태 필터 (low/oos)
            if (scri.getStockStatus() != null && "oos".equals(scri.getStockStatus())) {
                WHERE("newbook_count = 0");
            } else if (scri.getStockStatus() != null && "low".equals(scri.getStockStatus())) {
                WHERE("newbook_count BETWEEN 1 AND 5");
            }
        }}.toString();
    }

    public String selectInventory(final SearchCriteria scri) {
        String base = new SQL() {{
            SELECT("*");
            FROM("newbook");
            if (scri.getKeyword() != null && !scri.getKeyword().trim().isEmpty()) {
                WHERE("(LOWER(newbook_title) LIKE '%' || LOWER(#{keyword}) || '%' OR LOWER(newbook_author) LIKE '%' || LOWER(#{keyword}) || '%' OR newbook_isbn LIKE '%' || #{keyword} || '%')");
            }
            if (scri.getCategory() != null && !scri.getCategory().trim().isEmpty() && !"전체".equals(scri.getCategory())) {
                WHERE("newbook_category = #{category}");
            }
            // 재고 상태 필터 (low/oos)
            if (scri.getStockStatus() != null && "oos".equals(scri.getStockStatus())) {
                WHERE("newbook_count = 0");
            } else if (scri.getStockStatus() != null && "low".equals(scri.getStockStatus())) {
                WHERE("newbook_count BETWEEN 1 AND 5");
            }

            // 정렬
            if ("재고 많은순".equals(scri.getSort())) {
                ORDER_BY("newbook_count DESC, newbook_num DESC");
            } else if ("재고 적은순".equals(scri.getSort())) {
                ORDER_BY("newbook_count ASC, newbook_num DESC");
            } else if ("가격 낮은순".equals(scri.getSort())) {
                ORDER_BY("newbook_price ASC, newbook_num DESC");
            } else if ("가격 높은순".equals(scri.getSort())) {
                ORDER_BY("newbook_price DESC, newbook_num DESC");
            } else {
                ORDER_BY("newbook_num DESC");
            }
        }}.toString();

        // 페이징 (Oracle OFFSET/FETCH)
        int offset = scri.getStartRow();
        int fetch = scri.getPerPageNum();
        return base + " OFFSET " + offset + " ROWS FETCH NEXT " + fetch + " ROWS ONLY";
    }
}

