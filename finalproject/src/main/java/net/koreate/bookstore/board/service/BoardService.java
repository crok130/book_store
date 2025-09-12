package net.koreate.bookstore.board.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import net.koreate.bookstore.common.utils.Criteria;
import net.koreate.bookstore.vo.NewBookVO;

@Service
public interface BoardService {

    /**
     * 게시글을 작성.
     * 
     * @param newBook 등록할 신간 도서 정보
     * @return 등록 성공 시 true, 실패 시 false
     */
    boolean writeBoard(NewBookVO vo) throws Exception;

    /**
     * 게시글 상세보기.
     * 
     * @param newbook_num 조회할 게시글 번호
     * @return 조회된 신간 도서 정보, 해당 게시글이 없으면 null
     */
    NewBookVO readBoard(int newbook_num) throws Exception;;

    /**
     * 게시글을 삭제.
     * 
     * @param newbook_num 삭제할 게시글 번호
     * @return 삭제 성공 시 true, 실패 시 false
     */
    boolean deleteBoard(int newbook_num) throws Exception;


	/**
	 * 검색할 게시글 번호, 검색 범위 기준 정보를 이용하여
	 * 검색된 댓글 목록 리스트 와 페이징 블럭 출력에 필요한 PageMaker 객체를
	 * Map 에 저장하여 반환
	 */
	Map<String, Object> commentListPage(int bno, Criteria cri)throws Exception;


    /**
     * 도서 재고 수량을 변경합니다.
     * 특정 도서의 재고를 증가 또는 감소시킵니다.
     * 
     * @param newbook_num 재고를 변경할 도서 번호
     * @param newbook_count 변경할 수량 
     * @return 변경 성공 시 true, 실패 시 false
     */
    boolean changeBookCount(NewBookVO vo) throws Exception;



}
