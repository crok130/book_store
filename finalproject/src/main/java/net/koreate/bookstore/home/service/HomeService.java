package net.koreate.bookstore.home.service;

import java.util.List;

import net.koreate.bookstore.vo.NewBookVO;

public interface HomeService {

    /**
     * 전체 카테고리 기준 베스트셀러 도서를 조회합니다.
     * 판매 데이터가 없는 경우 빈 목록을 반환할 수 있습니다.
     *
     * @param limit 반환할 최대 도서 개수
     * @return 최대 {@code limit} 개의 베스트셀러 도서 목록
     * @throws Exception 데이터 접근 중 오류가 발생한 경우
     */
    List<NewBookVO> getTopSellers(int limit) throws Exception;

    /**
     * 회원이 가장 많이 결제한 카테고리를 기준으로 개인화 추천 도서 목록을 생성합니다.
     * 우선 해당 카테고리의 베스트셀러로 채우고, 부족하면 같은 카테고리의 최신 도서로 보충합니다(중복 제거).
     * 회원의 구매 이력이 없는 경우 빈 목록을 반환합니다.
     *
     * @param memberNum 회원 번호
     * @param limit 반환할 도서 개수
     * @return 최대 {@code limit} 개의 개인화 추천 도서 목록
     * @throws Exception 데이터 접근 중 오류가 발생한 경우
     */
    List<NewBookVO> getPersonalRecommendationsByTopCategory(int memberNum, int limit) throws Exception;

    /**
     * 비로그인 사용자를 위해 전체에서 가장 많이 팔린 카테고리 기준으로 도서 6개를 반환합니다.
     */
    List<NewBookVO> getAnonymousRecommendationsByGlobalTopCategory(int limit) throws Exception;
}


