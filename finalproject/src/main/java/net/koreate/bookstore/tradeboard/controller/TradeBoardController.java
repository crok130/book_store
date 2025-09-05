package net.koreate.bookstore.tradeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeBoardController {

	@GetMapping("tradebook/bookexchange")
	public void TradeBoard() {}
}
