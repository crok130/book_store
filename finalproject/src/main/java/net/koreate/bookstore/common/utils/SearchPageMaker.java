package net.koreate.bookstore.common.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class SearchPageMaker extends PageMaker{
	
	public SearchPageMaker(Criteria criteria,  int totalCount, int displayPageNum){
		super(criteria, totalCount, displayPageNum);
	}

	@Override
	public String makeQuery(int page) {
		SearchCriteria sCri = (SearchCriteria)criteria;
		UriComponentsBuilder builder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.queryParam("keyword", sCri.getKeyword());
		
		// category 파라미터 추가
		if(sCri.getCategory() != null && !sCri.getCategory().trim().equals("")) {
			builder.queryParam("category", sCri.getCategory());
		}
		
		// sort 파라미터 추가
		if(sCri.getSort() != null && !sCri.getSort().trim().equals("")) {
			builder.queryParam("sort", sCri.getSort());
		}
		
		String query = builder.build().toUriString();
		return query;
	}
	
	public String makeQueryBno(int bno) {
		SearchCriteria sCri = (SearchCriteria)criteria;
		UriComponents uriComponentsents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", criteria.getPage())
				.queryParam("perPageNum", criteria.getPerPageNum())
				.queryParam("searchType", sCri.getSearchType())
				.queryParam("keyword",sCri.getKeyword())
				.queryParam("bno", bno)
				.build();
		String query = uriComponentsents.toUriString();
		return query;
	}
	
	

}






