package net.koreate.bookstore.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.admin.service.AdminService;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.CountVO;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;
import net.koreate.bookstore.vo.MemberVO;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
	
	private final AdminService as;
    // 로그인 화면
    @GetMapping("admin/login")
    public String adminLoginView() { return "member/adminlogin"; }

    // 로그인 처리: 세션 키 adminInfo 사용
    @PostMapping("admin/login")
    public String adminLogin(String member_id, String member_pw, HttpSession session, RedirectAttributes rttr) throws Exception {
        MemberVO admin = as.adminSignIn(member_id, member_pw);
        if (admin == null || admin.getMember_status() != 1) {
            rttr.addFlashAttribute("msg", "로그인 실패 또는 권한 없음");
            return "redirect:/admin/login";
        }
        session.setAttribute("adminInfo", admin);
        return "redirect:/admin/dashboard";
    }

    // 로그아웃
    @GetMapping("admin/logout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("adminInfo");
        return "redirect:/admin/login";
    }

    // 관리자 회원가입 화면
    @GetMapping("admin/register")
    public String adminRegisterView() { return "member/adminregister"; }

    // 관리자 회원가입 처리 (member_status=1 저장)
    @PostMapping("admin/register")
    public String adminRegister(MemberVO vo, String member_addr1, String member_addr2, RedirectAttributes rttr) throws Exception {
        vo.setMember_addr((member_addr1 != null ? member_addr1 : "") + "_" + (member_addr2 != null ? member_addr2 : ""));
        String result = as.adminSignUp(vo);
        rttr.addFlashAttribute("msg", result);
        return "success".equals(result) ? "redirect:/admin/login" : "redirect:/admin/register";
    }
	
	@GetMapping("admin/dashboard")
	public String dashboard(Model model) throws Exception {
		CountVO vo = as.allList();
		List<NewBookVO> list = new ArrayList<>();
		list = as.list();
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "admin/admindashboard";
	}
	
	@GetMapping("admin/orders")
	public String orderList(Model model) throws Exception {
		List<PaymentVO> orderList = as.getOrderList();
		model.addAttribute("orderList", orderList);
		return "admin/orderList";
	}
	
	@PostMapping("admin/updateStatus")
	public String updateOrderStatus(PaymentVO vo, RedirectAttributes rttr) throws Exception {
		as.updateOrderStatus(vo);
		rttr.addFlashAttribute("msg", "주문 상태가 변경되었습니다.");	
		return "redirect:/admin/orders";
	}
	
    @GetMapping("admin/inventory")
    public String inventory(SearchCriteria scri, Model model) throws Exception{
        if(scri.getPerPageNum() == 0) scri.setPerPageNum(10);
        List<NewBookVO> items = as.getInventoryList(scri);
        PageMaker pm = as.getInventoryPage(scri);
        model.addAttribute("items", items);
        model.addAttribute("pm", pm);
        model.addAttribute("scri", scri);
        return "admin/inventory";
    }

    @PostMapping("admin/inventory/in")
    public String inventoryIn(StockUpdateVO req,
                              RedirectAttributes rttr,
                              SearchCriteria scri) throws Exception {
        as.increaseStock(req);
        rttr.addFlashAttribute("msg", "입고 처리되었습니다.");
        return "redirect:/admin/inventory" + new net.koreate.bookstore.common.utils.SearchPageMaker(scri, 0, 5).makeQuery(scri.getPage());
    }

    @PostMapping("admin/inventory/out")
    public String inventoryOut(StockUpdateVO req,
                               RedirectAttributes rttr,
                               SearchCriteria scri) throws Exception {
        as.decreaseStock(req);
        rttr.addFlashAttribute("msg", "출고 처리되었습니다.");
        return "redirect:/admin/inventory" + new net.koreate.bookstore.common.utils.SearchPageMaker(scri, 0, 5).makeQuery(scri.getPage());
    }
    
    // 매출 데이터 API (일별 매출 차트용)
    @GetMapping(value = "admin/api/revenue/daily7")
    @ResponseBody
    public ResponseEntity<java.util.List<java.util.Map<String, Object>>> dailyRevenue7() throws Exception {
        java.util.List<java.util.Map<String, Object>> data = as.getDailyRevenue7d();
        return ResponseEntity.ok(data);
    }

	
}
