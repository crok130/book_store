package net.koreate.bookstore.payment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.vo.CartVO;
import net.koreate.bookstore.vo.MemberVO;

public interface PaymentDAO {

    @Select("SELECT member_num, member_id, member_pw, member_name, member_addr, member_email, member_phone, member_status, member_nickname, member_birth FROM members WHERE member_num = #{member_num}")
    MemberVO findMemberByNum(int member_num) throws Exception;
    
    @Select("SELECT c.member_num, c.newbook_num, c.book_count, c.price, n.newbook_title, n.newbook_author, n.newbook_img FROM cart c LEFT JOIN newbook n ON n.newbook_num = c.newbook_num WHERE c.member_num = #{member_num}")
    List<CartVO> getCart(int member_num)throws Exception;
    
    @Insert("MERGE INTO cart c USING dual ON (c.member_num = #{member_num} AND c.newbook_num = #{newbook_num}) WHEN MATCHED THEN UPDATE SET c.book_count = c.book_count + #{book_count} WHEN NOT MATCHED THEN INSERT (member_num, newbook_num, book_count, price) VALUES (#{member_num}, #{newbook_num}, #{book_count}, #{price})")
    int AddCart(CartVO vo)throws Exception;

    @Update("UPDATE cart SET book_count = #{book_count} WHERE member_num = #{member_num} AND newbook_num = #{newbook_num}")
    int UpdateCartCount(CartVO vo) throws Exception;

    @Delete("DELETE FROM cart WHERE member_num = #{member_num} AND newbook_num = #{newbook_num}")
    int DeleteCartItem(CartVO vo) throws Exception;
}
