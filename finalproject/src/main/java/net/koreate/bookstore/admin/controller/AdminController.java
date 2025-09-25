package net.koreate.bookstore.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.admin.service.AdminService;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.vo.CountVO;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;
import net.koreate.bookstore.vo.StockUpdateVO;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
	
	private final AdminService as;
	
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
	
}
