package net.koreate.bookstore.tradeboard.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
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

}
