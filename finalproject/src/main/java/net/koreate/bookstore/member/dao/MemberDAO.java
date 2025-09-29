package net.koreate.bookstore.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

public interface MemberDAO {
	
	// 아이디 중복 검사
	@Select("Select count(*) FROM members WHERE member_id = #{member_id}")
	int isIdAvailable(String member_id) throws Exception;
	
    // 닉네임 중복 검사
    @Select("SELECT COUNT(*) FROM members WHERE member_nickname = #{member_nickname}")
    int isNicknameAvailable(String member_nickname) throws Exception;

    // 이메일 중복 검사
    @Select("SELECT COUNT(*) FROM members WHERE member_email = #{member_email}")
    int isEmailAvailable(String member_email) throws Exception;
    
    // 회원가입 처리
    @Insert("INSERT INTO members(member_id,member_pw,member_name,member_addr,member_email,member_phone,member_nickname,member_birth,member_status) VALUES(#{member_id},#{member_pw},#{member_name},#{member_addr},#{member_email},#{member_phone},#{member_nickname},#{member_birth},0)")
    int register(MemberVO vo) throws Exception;
    
    // 로그인 : 상태값이 0 인 회원만 대상
    @Select("SELECT * FROM members WHERE member_status = 0 AND member_id = #{member_id} AND member_pw = #{member_pw}")
    MemberVO login(@Param("member_id") String member_id, @Param("member_pw")String member_pw) throws Exception;

    
    @Select("SELECT count(*) FROM payments WHERE member_num = #{member_num}")
    int listCount(int member_num) throws Exception;

	// 회원 주문내역 목록 (페이징)
	@Select("SELECT p.*, n.newbook_title, n.newbook_img FROM payments p JOIN newbook n ON n.newbook_num = p.newbook_num WHERE p.member_num = #{member_num} ORDER BY p.payment_date DESC OFFSET #{offset} ROWS FETCH NEXT #{perPageNum} ROWS ONLY")
	List<PaymentVO> listMemberOrders(@Param("member_num") int member_num, @Param("offset") int offset, @Param("perPageNum") int perPageNum) throws Exception;


    // 특정 ID로 회원 한 명을 찾는 기능
    @Select("SELECT * FROM members WHERE member_id = #{member_id}")
	MemberVO getMemberById(String member_id) throws Exception;

}
