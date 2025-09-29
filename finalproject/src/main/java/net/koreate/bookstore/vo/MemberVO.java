package net.koreate.bookstore.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int member_num;
    private String member_id;			// 아이디
    private String member_pw;			// 비밀번호 
    private String member_name;			// 이름
    private String member_addr;			// 주소
    private String member_email;		// 이메일
    private String member_phone;		// 전화번호
    private int member_status;			// 1이면 관리자 0이면 일반회원
    private String member_nickname;		// 닉네임
    private String member_birth;		// 생년월일
    private String member_secession;	// 회원탈퇴 여부
}
