package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int member_num;
    private String member_id;
    private String member_pw;
    private String member_name;
    private String member_addr;
    private String member_email;
    private String member_phone;
    private int member_status;
    private String member_nickname;	
}
