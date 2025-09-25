package net.koreate.bookstore.home.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.service.BoardService;
import net.koreate.bookstore.home.service.HomeService;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.NewBookVO;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
    private final BoardService bs;
    private final HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, HttpSession session) throws Exception {
        List<NewBookVO> homeList = new ArrayList<>();
        // 기본: 최신 신간 리스트 (기존 동작 유지)
        homeList = bs.listBook();

        // 추천: 로그인/구매 이력/베스트셀러 로직
        List<NewBookVO> recommend = Collections.emptyList();
        MemberVO user = (MemberVO) session.getAttribute("userInfo");
        if (user != null) {
            // 결제한 상품 중 가장 많이 결제한 카테고리 기준으로 6개 채우기
            recommend = homeService.getPersonalRecommendationsByTopCategory(user.getMember_num(), 6);
        }
        if (recommend == null || recommend.isEmpty()) {
            // 비로그인 또는 구매이력 없음 -> 전체에서 가장 많이 팔린 카테고리 기준 6개
            recommend = homeService.getAnonymousRecommendationsByGlobalTopCategory(6);
            if (recommend == null || recommend.isEmpty()) {
                // 전역 판매 데이터 전무 시 마지막 안전장치: 전체 베스트셀러 6개
                recommend = homeService.getTopSellers(6);
            }
        }
        // 팔린 상품이 하나도 없으면 빈 리스트 유지

        model.addAttribute("home", homeList);
        model.addAttribute("recommend", recommend);
        return "index";
    }
	
	@GetMapping("admin/adminmain")
	public void adminmian() {}
	

	
}