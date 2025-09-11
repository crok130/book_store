package net.koreate.bookstore.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.MemberVO;

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
    
    @Insert("INSERT INTO members(member_id,member_pw,member_name,member_addr,member_email,member_phone,member_nickname,member_birth,member_status) VALUES(#{member_id},#{member_pw},#{member_name},#{member_addr},#{member_email},#{member_phone},#{member_nickname},#{member_birth},0)")
    int register(MemberVO vo) throws Exception;
    
    @Select("SELECT * members WHERE member_status = 0 AND member_id = #{member_id} AND member_pw = #{member_pw}")
    MemberVO login(@Param("member_id") String member_id, @Param("member_pw")String member_pw) throws Exception;
}
