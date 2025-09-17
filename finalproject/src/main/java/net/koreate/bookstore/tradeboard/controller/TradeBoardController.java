package net.koreate.bookstore.tradeboard.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.common.utils.FileUtils;
import net.koreate.bookstore.tradeboard.service.TradeBookService;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.TradebookVO;

@Controller
@RequiredArgsConstructor
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
	public void TradeBoard() {}
	
	@GetMapping("tradebook/list")
	public String tradebooklist(){
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
		ts.write(vo);
		return null;
	}
	
}
