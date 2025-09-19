package net.koreate.bookstore.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.dao.BoardDAO;
import net.koreate.bookstore.common.utils.Criteria;
import net.koreate.bookstore.vo.NewBookVO;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO dao;
	
	@Override
	public boolean writeBoard(NewBookVO vo) throws Exception {
		return dao.insert(vo) == 1 ? true : false;
	}

	@Override
	public NewBookVO readBoard(int newbook_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
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

}
