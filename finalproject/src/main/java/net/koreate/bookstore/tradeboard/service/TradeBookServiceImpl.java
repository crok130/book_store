package net.koreate.bookstore.tradeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
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
		return null;
	}



}
