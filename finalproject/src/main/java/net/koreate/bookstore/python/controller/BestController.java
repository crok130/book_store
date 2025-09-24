package net.koreate.bookstore.python.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.python.service.BestService;
import net.koreate.bookstore.vo.BestSellerVO;

@Controller
@RequiredArgsConstructor
public class BestController {
	
	private final BestService bestService;

    @GetMapping("board/best")
    public String bestPage(@RequestParam(value="page", required=false, defaultValue="1") int page,
                           Model model) throws Exception {
        int size = 20;
        List<BestSellerVO> best = bestService.bestPage(page, size);
        int total = bestService.bestCount();
        int totalPages = (int)Math.ceil(total / (double)size);
        model.addAttribute("best", best);
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPages);
        return "board/best";
    }
}
