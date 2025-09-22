package net.koreate.bookstore.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.board.dao.BoardDAO;
import net.koreate.bookstore.common.utils.Criteria;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.common.utils.SearchPageMaker;
import net.koreate.bookstore.vo.NewBookVO;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO dao;
	
	@Override
	public boolean writeBoard(NewBookVO vo) throws Exception {
		return dao.insert(vo) == 1 ? true : false;
	}

	@Override
	public NewBookVO readBoard(int newbook_num) throws Exception {	
		return dao.read(newbook_num);
	}

	@Override
	public boolean deleteBoard(int newbook_num) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> commentListPage(int bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean changeBookCount(NewBookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<NewBookVO> listBook() throws Exception {
		List<NewBookVO> list = new ArrayList<>();
		list = dao.listBook();
		return list;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria scri) throws Exception {
		int totalCount = dao.listCount(scri); // 전체 게시물 개수
		
		PageMaker pm = new SearchPageMaker(scri, totalCount, 10);
		return pm;
	}

	@Override
	public List<NewBookVO> listReply(SearchCriteria scri) throws Exception {
		log.info("페이징 처리된 도서 목록 조회 - page: {}, perPageNum: {}", scri.getPage(), scri.getPerPageNum());
		return dao.listReply(scri);
	}


}
