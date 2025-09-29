package net.koreate.bookstore.home.service;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.home.dao.HomeDAO;
import net.koreate.bookstore.vo.NewBookVO;

@Service
@RequiredArgsConstructor
public class HomeServiceImpl implements HomeService {

    private final HomeDAO homeDAO;

    @Override
    public List<NewBookVO> getTopSellers(int limit) throws Exception {
        List<NewBookVO> list = homeDAO.topSellers(limit);
        return list != null ? list : Collections.emptyList();
    }

    @Override
    public List<NewBookVO> getPersonalRecommendationsByTopCategory(int memberNum, int limit) throws Exception {
        List<String> topCategories = homeDAO.topCategoriesForMember(memberNum, 1);
        if (topCategories == null || topCategories.isEmpty()) {
            // 구매 이력이 전혀 없는 경우: null 반환하여 컨트롤러에서 비로그인/무이력 플로우로 처리
            return null;
        }
        String top = topCategories.get(0);
        List<NewBookVO> result = homeDAO.topSellersByCategory(top, limit);
        if (result == null) result = Collections.emptyList();
        if (result.size() < limit) {
            List<NewBookVO> fillers = homeDAO.recentByCategory(top, limit);
            if (fillers != null && !fillers.isEmpty()) {
                
                java.util.LinkedHashMap<Integer, NewBookVO> merged = new java.util.LinkedHashMap<>();
                for (NewBookVO b : result) merged.put(b.getNewbook_num(), b);
                for (NewBookVO b : fillers) {
                    if (merged.size() >= limit) break;
                    merged.putIfAbsent(b.getNewbook_num(), b);
                }
                result = new java.util.ArrayList<>(merged.values());
            }
        }
        // Trim to limit in case
        if (result.size() > limit) {
            result = result.subList(0, limit);
        }
        return result;
    }

    @Override
    public List<NewBookVO> getAnonymousRecommendationsByGlobalTopCategory(int limit) throws Exception {
        List<String> cats = homeDAO.topCategoriesOverall(1);
        if (cats == null || cats.isEmpty()) {
            return Collections.emptyList();
        }
        String cat = cats.get(0);
        List<NewBookVO> list = homeDAO.topSellersByCategory(cat, limit);
        if (list == null || list.size() < limit) {
            List<NewBookVO> fillers = homeDAO.recentByCategory(cat, limit);
            java.util.LinkedHashMap<Integer, NewBookVO> merged = new java.util.LinkedHashMap<>();
            if (list != null) for (NewBookVO b : list) merged.put(b.getNewbook_num(), b);
            if (fillers != null) {
                for (NewBookVO b : fillers) {
                    if (merged.size() >= limit) break;
                    merged.putIfAbsent(b.getNewbook_num(), b);
                }
            }
            list = new java.util.ArrayList<>(merged.values());
        }
        if (list.size() > limit) list = list.subList(0, limit);
        return list;
    }
}


