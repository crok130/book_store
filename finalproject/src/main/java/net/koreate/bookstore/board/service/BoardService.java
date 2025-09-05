package net.koreate.bookstore.board.service;

import java.util.List;

import net.koreate.bookstore.util.Criteria;
import net.koreate.bookstore.util.PageMaker;
import net.koreate.bookstore.vo.NewBookVO;

/**
 * 게시판 서비스 인터페이스
 * 신간 도서 게시판의 CRUD 기능과 페이징 처리를 제공합니다.
 */
public interface BoardService {

    /**
     * 게시글을 작성합니다.
     * 새로운 신간 도서 정보를 등록합니다.
     * 
     * @param newBook 등록할 신간 도서 정보
     * @return 등록 성공 시 true, 실패 시 false
     */
    boolean writeBoard(NewBookVO newBook) throws Exception;

    /**
     * 게시글 번호로 게시글을 조회합니다.
     * 특정 신간 도서의 상세 정보를 가져옵니다.
     * 
     * @param newbook_num 조회할 게시글 번호
     * @return 조회된 신간 도서 정보, 해당 게시글이 없으면 null
     */
    NewBookVO readBoard(int newbook_num) throws Exception;

    /**
     * 게시글을 수정합니다.
     * 기존 신간 도서 정보를 업데이트합니다.
     * 
     * @param newBook 수정할 신간 도서 정보
     * @return 수정 성공 시 true, 실패 시 false
     */
    boolean updateBoard(NewBookVO vo) throws Exception;

    /**
     * 게시글을 삭제합니다.
     * 신간 도서 정보를 데이터베이스에서 제거합니다.
     * 
     * @param newbook_num 삭제할 게시글 번호
     * @return 삭제 성공 시 true, 실패 시 false
     */
    boolean deleteBoard(int newbook_num) throws Exception;

    /**
     * 전체 게시글 목록을 조회합니다.
     * 페이징 처리가 적용된 게시글 리스트를 반환합니다.
     * 
     * @param cri 페이징 정보 (페이지 번호, 페이지당 게시글 수)
     * @return 게시글 목록
     */
    List<NewBookVO> getBoardList(Criteria cri) throws Exception;

    /**
     * 전체 게시글 수를 조회합니다.
     * 페이징 처리를 위한 총 게시글 개수를 반환합니다.
     * 
     * @return 전체 게시글 수
     */
    int getTotalCount() throws Exception;


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
