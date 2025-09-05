package net.koreate.bookstore.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("member/login")
	public void login() {};
	
	@GetMapping("member/register")
	public void register() {};

}
