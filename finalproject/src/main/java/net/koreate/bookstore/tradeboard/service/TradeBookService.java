package net.koreate.bookstore.tradeboard.service;

import javax.servlet.http.HttpSession;

import net.koreate.bookstore.vo.TradebookVO;

public interface TradeBookService {
	
	
	/**
	 * 게시글 작성
	 * 
	 * @param vo - 게시글 작성할 내용
	 * @return 게시글 작성된 행의 갯수 반환 작성 성공하면 1 실패하면 0
	 */
	int write(TradebookVO vo) throws Exception;
}
