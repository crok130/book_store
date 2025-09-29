package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class CountVO {
	
	private int book;        // 전체 도서 수
	private int member;      // 전체 회원 수
	private int money;       // 총 매출
	private int oder;      // 총 주문 수
	
}
