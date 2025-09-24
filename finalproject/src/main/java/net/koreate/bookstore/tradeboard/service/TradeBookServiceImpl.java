package net.koreate.bookstore.tradeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.common.utils.SearchPageMaker;
import net.koreate.bookstore.tradeboard.dao.TradeBookDAO;
import net.koreate.bookstore.vo.TradebookVO;

@Service
@RequiredArgsConstructor
public class TradeBookServiceImpl implements TradeBookService {
	
	private final TradeBookDAO dao;
	
	@Override
	public int write(TradebookVO vo) throws Exception {
		return dao.write(vo);
	}

	@Override
	public List<TradebookVO> mainlist() throws Exception {
		return dao.mainlist();
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria scri) throws Exception {
		int totalCount = dao.listCount(scri);
		// 한 블럭 5페이지 기준 (Board 예제와 동일)
		return new SearchPageMaker(scri, totalCount, 5);
	}

	@Override
	public List<TradebookVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}



}
