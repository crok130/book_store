package net.koreate.bookstore.payment.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import net.koreate.bookstore.board.service.BoardService;
import net.koreate.bookstore.payment.service.PaymentService;
import net.koreate.bookstore.vo.BulkPaymentVO;
import net.koreate.bookstore.vo.CartVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.NewBookVO;
import net.koreate.bookstore.vo.PaymentVO;

@Controller
@RequiredArgsConstructor
public class PaymentController {

    
    private final BoardService bs;
    private final PaymentService ps;

    @GetMapping("payment/cart")
    public void cart(HttpSession session,Model model) throws Exception {
        MemberVO member = (MemberVO)session.getAttribute("userInfo");
        if (member == null) {
            model.addAttribute("cart", Collections.emptyList());
            return;
        }
        int member_num = member.getMember_num();
        List<CartVO> list = ps.getCart(member_num);
        if (list == null) list = Collections.emptyList();
        model.addAttribute("cart", list);
    }
    
    @GetMapping("payment/cart/checkout")
    public String cartCheckout(HttpSession session, Model model) throws Exception {
        MemberVO member = (MemberVO)session.getAttribute("userInfo");
        if (member == null) {
            return "redirect:/member/login";
        }
        
        int member_num = member.getMember_num();
        List<CartVO> cartItems = ps.getCart(member_num);
        
        if (cartItems == null || cartItems.isEmpty()) {
            return "redirect:/payment/cart";
        }
        
        // 총 결제 금액 계산
        int totalPrice = 0;
        for (CartVO item : cartItems) {
            totalPrice += item.getPrice() * item.getBook_count();
            System.out.println("장바구니 아이템: " + item.getNewbook_title() + ", 가격: " + item.getPrice() + ", 수량: " + item.getBook_count());
        }
        System.out.println("총 결제 금액: " + totalPrice);
        
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("member", member);
        
        return "payment/PaymentPage";
    }
    
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
    
    @GetMapping("payment/ready")
    public String paymentReadyGet(@RequestParam(value = "cart", required = false) String cart,
                                 HttpSession session, Model model) throws Exception {
        if ("true".equals(cart)) {
            // 장바구니 일괄 결제
            MemberVO member = (MemberVO)session.getAttribute("userInfo");
            if (member == null) {
                return "redirect:/member/login";
            }
            
            int member_num = member.getMember_num();
            List<CartVO> cartItems = ps.getCart(member_num);
            
            if (cartItems == null || cartItems.isEmpty()) {
                return "redirect:/payment/cart";
            }
            
            // 총 결제 금액 계산
            int totalPrice = 0;
            for (CartVO item : cartItems) {
                totalPrice += item.getPrice() * item.getBook_count();
            }
            
            model.addAttribute("cartItems", cartItems);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("member", member);
        }
        
        return "payment/PaymentPage";
    }

    @PostMapping("payment/addCart")
    public String addCart(CartVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userInfo");
        if (user == null) { rttr.addFlashAttribute("msg","로그인 필요"); return "redirect:/member/login"; }
        if (vo == null || vo.getBook_count() <= 0) { rttr.addFlashAttribute("msg","수량 오류"); return "redirect:/board/bookdetail?newbook_num=" + (vo != null ? vo.getNewbook_num() : 0); }
        NewBookVO book = bs.readBoard(vo.getNewbook_num());
        if (book == null) { rttr.addFlashAttribute("msg","상품 없음"); return "redirect:/board/list"; }
        if (book.getNewbook_count() < vo.getBook_count()) { rttr.addFlashAttribute("msg","재고 부족: " + book.getNewbook_count()); return "redirect:/board/bookdetail?newbook_num=" + vo.getNewbook_num(); }
        vo.setMember_num(user.getMember_num());
        // 서버에서 단가 확정
        vo.setPrice(book.getNewbook_price());
        String res = ps.addCartItem(vo);
        rttr.addFlashAttribute("msg", res);
        return "redirect:/payment/cart";
    }

    // ===== AJAX: 수량 변경 =====
    @PostMapping(value="/payment/cart/update", produces="text/plain; charset=UTF-8")
    @ResponseBody
    public String updateCartQuantity(@RequestParam("newbook_num") int newbook_num,
                                     @RequestParam("book_count") int book_count,
                                     HttpSession session) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userInfo");
        if (user == null) return "로그인 필요";
        if (book_count <= 0) return "유효하지 않은 수량";
        NewBookVO book = bs.readBoard(newbook_num);
        if (book == null) return "상품 없음";
        if (book.getNewbook_count() < book_count) return "재고 부족: " + book.getNewbook_count();
        ps.updateCartItemCount(user.getMember_num(), newbook_num, book_count);
        return "수량 변경 완료";
    }

    // ===== AJAX: 항목 삭제 =====
    @PostMapping(value="/payment/cart/delete", produces="text/plain; charset=UTF-8")
    @ResponseBody
    public String deleteCartItem(@RequestParam("newbook_num") int newbook_num,
                                 HttpSession session) throws Exception {
        MemberVO user = (MemberVO) session.getAttribute("userInfo");
        if (user == null) return "로그인 필요";
        ps.removeCartItem(user.getMember_num(), newbook_num);
        return "항목 삭제 완료";
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
    
    @PostMapping("payment/complete")
    @ResponseBody
    public ResponseEntity<String> completePayment(PaymentVO vo,
                                                  @RequestParam("member_addr1") String member_addr1,
                                                  @RequestParam("member_addr2") String member_addr2,
                                                  HttpSession session) throws Exception {
        try {
            MemberVO user = (MemberVO) session.getAttribute("userInfo");
            if (user == null) {
                return ResponseEntity.status(401).body("unauthorized");
            }

            vo.setMember_num(user.getMember_num());
            vo.setMember_addr(member_addr1 + "_" + member_addr2);
  

            String result = ps.processPayment(vo);
            if ("success".equals(result)) {
                // 결제 성공 시 장바구니 비우기
                ps.clearCart(user.getMember_num());
                return ResponseEntity.ok("success");
            }
            return ResponseEntity.ok("fail");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("error");
        }
    }
    
    // 장바구니 일괄 결제 처리
    @PostMapping("payment/cart/checkout")
    @ResponseBody
    public ResponseEntity<String> processCartCheckout(@RequestParam("member_addr1") String member_addr1,
                                                      @RequestParam("member_addr2") String member_addr2,
                                                      @RequestParam("payment_content") String payment_content,
                                                      HttpSession session) throws Exception {
        try {
            MemberVO user = (MemberVO) session.getAttribute("userInfo");
            if (user == null) {
                return ResponseEntity.status(401).body("unauthorized");
            }
            
            // 장바구니 조회
            List<CartVO> cartItems = ps.getCart(user.getMember_num());
            if (cartItems == null || cartItems.isEmpty()) {
                return ResponseEntity.ok("empty_cart");
            }
            
            // BulkPaymentVO 생성
            BulkPaymentVO bulkPayment = new BulkPaymentVO();
            bulkPayment.setMember_num(user.getMember_num());
            bulkPayment.setMember_name(user.getMember_name());
            bulkPayment.setMember_phone(user.getMember_phone());
            bulkPayment.setMember_addr(member_addr1 + "_" + member_addr2);
            bulkPayment.setPayment_content(payment_content);
            bulkPayment.setItem_status("주문완료");
            bulkPayment.setCartItems(cartItems);
            
            // 총 결제 금액 계산
            int totalPrice = 0;
            for (CartVO item : cartItems) {
                totalPrice += item.getPrice() * item.getBook_count();
            }
            bulkPayment.setPayment_total_price(totalPrice);
            
            // 일괄 결제 처리
            String result = ps.processBulkPayment(bulkPayment);
            if ("success".equals(result)) {
                // 결제 성공 시 장바구니 비우기
                ps.clearCart(user.getMember_num());
                return ResponseEntity.ok("success");
            }
            return ResponseEntity.ok("fail");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("error");
        }
    }
    
}
