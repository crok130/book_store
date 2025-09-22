package net.koreate.bookstore.board.controller;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.service.BoardService;
import net.koreate.bookstore.common.utils.FileUtils;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.NewBookVO;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	@Autowired
	private String uploadDir;  // C:\Temp\img
	
	private final BoardService bs;
	
	private String realPath;
	
	@PostConstruct
	public void initPath() {
		realPath = uploadDir;  // C:\Temp\img 직접 사용
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("경로 생성 완료: " + realPath);
		}
		System.out.println("FileController 초기화 완료: " + realPath);
	}
	
	@GetMapping("admin/write")
	public String write() {
		return "admin/bookcreate";
	};
	
	@GetMapping("admin/dashboard")
	public String dashboard() {
		return "admin/admindashboard";
	}
	
	@GetMapping("board/list")
	public String booklist(SearchCriteria cri, Model model) throws Exception {
		List<NewBookVO> list = bs.listReply(cri);
		PageMaker pm = bs.getPageMaker(cri);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "board/newbooklist";
	}
	
	@PostMapping("admin/newbookwrite")
	public String newbookwrite(NewBookVO vo, @RequestPart("newbook_imgs") MultipartFile file, RedirectAttributes rttr) throws Exception{
		String newbook_img = FileUtils.uploadFile(realPath, file);
		vo.setNewbook_img(newbook_img);
		boolean write = bs.writeBoard(vo);
		if(write) {
			rttr.addFlashAttribute("msg", "게시굴 작성 성공");
			return "redirect:/admin/dashboard";
		}else {
			rttr.addFlashAttribute("msg", "게시글 작성 실패");
			return "redirect:/admin/write";
		}
	}
	
	
	@GetMapping("board/detail")
	public String BookDetil(@RequestParam("num") int newbook_num, Model model) throws Exception {
		NewBookVO book = bs.readBoard(newbook_num);
		model.addAttribute("read", book);
		return "board/bookdetail";
	}



}
