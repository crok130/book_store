package net.koreate.bookstore.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.koreate.bookstore.util.Criteria;
import net.koreate.bookstore.vo.NewBookVO;

@Service
public interface BoardService {

    /**
     * 게시글을 작성.
     * 
     * @param newBook 등록할 신간 도서 정보
     * @return 등록 성공 시 true, 실패 시 false
     */
    boolean writeBoard(NewBookVO newBook) throws Exception;

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
     * 페이징처리..
     * 
     * @param cri 페이징 정보 (페이지 번호, 페이지당 게시글 수)
     * @return 게시글 목록
     */
    List<NewBookVO> getBoardList(Criteria cri) throws Exception;

    /**
     * 전체 게시글 갯수조회.
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
