package net.koreate.bookstore.tradeboard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.common.utils.FileUtils;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.tradeboard.service.TradeBookService;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.TradebookVO;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TradeBoardController {
	
	private final TradeBookService ts;
	
	private String uploadPath;
	
	private final ServletContext servletContext;
	
	private String realPath;
	
	@PostConstruct
	public void initPath() {
		realPath = servletContext.getRealPath(
			File.separator+uploadPath
		);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("경로 생성 완료");
		}
		System.out.println("FileController 초기화 완료");
	}

	@GetMapping("tradebook/bookexchange")
	public void TradeBoard(Model model) throws Exception {
		List<TradebookVO> list = new ArrayList<>();
		list  = ts.mainlist();
		log.info("list : {}",list);
		model.addAttribute("list", list);
	}
	
	@GetMapping("tradebook/list")
	public String tradebooklist(SearchCriteria scri, Model model) throws Exception {
		if (scri == null) scri = new SearchCriteria();
		List<TradebookVO> list = ts.list(scri);
		PageMaker pm = ts.getPageMaker(scri);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "tradebook/tradebooklist";
	}
	
	@GetMapping("tradebook/write")
	public String write(){
		return "tradebook/treadebook_create";
	}
	
	@PostMapping("tradebook/write")
	public String Postwrite(TradebookVO vo,@RequestPart("tradebook_img1") MultipartFile file, RedirectAttributes rttr, HttpSession session) throws Exception {
		String tradeBook_img = FileUtils.uploadFile(realPath, file);
		vo.setTradebook_img(tradeBook_img);
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		vo.setMember_num(user.getMember_num());
		int write = ts.write(vo);
		if(write == 1) {
			rttr.addFlashAttribute("msg", "게시글작성 성공");
		}else {
			rttr.addFlashAttribute("msg", "게시글작성 실패");
		}
		return write == 1 ? "redirect:/tradebook/bookexchange" : "redirect:/tradebook/write";
	}
	
	@GetMapping("tradebook/detail")
	public String detail(@RequestParam("num") int tradebook_num, Model model) throws Exception {
		TradebookVO vo = new TradebookVO();
		System.out.println(tradebook_num);
		vo = ts.detail(tradebook_num);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "tradebook/tradebook_detail";
	}
	
}
