package net.koreate.bookstore.payment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.service.BoardService;
import net.koreate.bookstore.payment.service.PaymentService;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.NewBookVO;

@Controller
@RequiredArgsConstructor
public class PaymentController {

    
	private final BoardService bs;
	private final PaymentService ps;

	@GetMapping("member/cart")
	public void cart() {}
	
    @PostMapping("payment/ready")
    public String paymentReady(int newbook_num,
                               int quantity,
                               Model model) throws Exception {
        NewBookVO book = bs.readBoard(newbook_num);
        int unitPrice = book.getNewbook_price();
        int totalPrice = unitPrice * quantity;
        model.addAttribute("book", book);
        model.addAttribute("quantity", quantity);
        model.addAttribute("totalPrice", totalPrice);
        return "payment/PaymentPage";
    }
	
	@GetMapping("board/checkQuantity")
	public ResponseEntity<Boolean> checkQuantity(@RequestParam("num") int newbook_num, 
											  @RequestParam("quantity") int quantity) throws Exception {
		try {
			NewBookVO book = bs.readBoard(newbook_num);
			boolean isAvailable = book.getNewbook_count() >= quantity;
			return ResponseEntity.ok(isAvailable);
		} catch (Exception e) {
			return ResponseEntity.ok(false);
		}
	}
	
    @GetMapping("/member/address")
    public ResponseEntity<MemberAddrResponse> memberAddr(HttpSession session) throws Exception{
        MemberVO user = (MemberVO) session.getAttribute("userInfo");
        if(user == null){
            return ResponseEntity.status(401).build();
        }
        MemberVO full = ps.memberAddr(user.getMember_num());
        String addr = full != null ? full.getMember_addr() : null;
        String addr1 = "";
        String addr2 = "";
        if(addr != null){
            int idx = addr.indexOf('_');
            if(idx >= 0){
                addr1 = addr.substring(0, idx);
                addr2 = addr.substring(idx+1);
            }else{
                addr1 = addr;
            }
        }
        return ResponseEntity.ok(new MemberAddrResponse(addr1, addr2));
    }

    public static class MemberAddrResponse{
        public String addr1;
        public String addr2;
        public MemberAddrResponse(String a1, String a2){ this.addr1=a1; this.addr2=a2; }
    }
	
}
