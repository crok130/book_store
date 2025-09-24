package net.koreate.bookstore.python.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.koreate.bookstore.vo.BestSellerVO;

@Service
public interface BestService {

    /**
     * 베스트셀러 페이지별 조회
     * 
     * @param page 페이지 번호 (1부터 시작)
     * @param size 페이지당 개수
     * @return 베스트셀러 목록
     */
    List<BestSellerVO> bestPage(int page, int size) throws Exception;

    /**
     * 베스트셀러 전체 개수 조회
     * 
     * @return 베스트셀러 전체 개수
     */
    int bestCount() throws Exception;
}
