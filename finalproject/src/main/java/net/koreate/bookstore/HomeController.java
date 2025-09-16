package net.koreate.bookstore;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.service.BoardService;
import net.koreate.bookstore.vo.NewBookVO;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final BoardService bs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) throws Exception {
		List<NewBookVO> list = new ArrayList<>();
		list = bs.listBook();
		System.out.println(list);
		model.addAttribute("list", list);
		return "index";
	}
	
	@GetMapping("admin/adminmain")
	public void adminmian() {}
	

	
}
