package net.koreate.bookstore.payment.dao;

import org.apache.ibatis.annotations.Select;

import net.koreate.bookstore.vo.MemberVO;

public interface PaymentDAO {

    @Select("SELECT member_num, member_id, member_pw, member_name, member_addr, member_email, member_phone, member_status, member_nickname, member_birth FROM members WHERE member_num = #{member_num}")
    MemberVO findMemberByNum(int member_num) throws Exception;
}
