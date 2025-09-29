package net.koreate.bookstore.common.utils;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	private String category;
	private String sort;
	private String location;
	private String stockStatus; // 재고 상태 필터: low(1~5), oos(0)
	
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum);
		this.searchType = searchType;
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString()+" startRow : "+super.getStartRow()+"- SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
}









