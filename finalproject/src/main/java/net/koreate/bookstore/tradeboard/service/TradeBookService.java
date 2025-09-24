package net.koreate.bookstore.tradeboard.service;

import java.util.List;

import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.TradebookVO;

public interface TradeBookService {
	
	
	/**
	 * 게시글 작성
	 * 
	 * @param vo - 게시글 작성할 내용
	 * @return 게시글 작성된 행의 갯수 반환 작성 성공하면 1 실패하면 0
	 */
	int write(TradebookVO vo) throws Exception;
	
	/**
	 * 메인페이지 게시글 출력
	 * 
	 * @return 최신 게시글 6개 리턴
	 */
	List<TradebookVO> mainlist()throws Exception;


	/**
	 * 게시글 페이징 블럭 정보 (공용)
	 */
	PageMaker getPageMaker(SearchCriteria scri) throws Exception;

	/**
	 * 페이징 목록 조회 (공용)
	 */
	List<TradebookVO> list(SearchCriteria scri) throws Exception;
	
}
