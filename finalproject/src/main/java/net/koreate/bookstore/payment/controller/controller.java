package net.koreate.bookstore.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class controller {

	@GetMapping("member/cart")
	public void cart() {}
}
