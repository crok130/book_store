package net.koreate.bookstore.payment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.bookstore.vo.BulkPaymentVO;
import net.koreate.bookstore.vo.CartVO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

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
    
    @Insert("INSERT INTO payments (member_num, member_name, member_phone, member_addr, payment_content, newbook_num, payment_quantity, payment_total_price) VALUES (#{member_num}, #{member_name}, #{member_phone}, #{member_addr}, #{payment_content}, #{newbook_num}, #{payment_quantity}, #{payment_total_price})")
    int insertPayment(PaymentVO payment) throws Exception;
    
    @Update("UPDATE newbook SET newbook_count = newbook_count - #{payment_quantity} WHERE newbook_num = #{newbook_num}")
    int decreaseBookCount(PaymentVO payment) throws Exception;
    
    @Delete("DELETE FROM cart WHERE member_num = #{member_num}")
    int clearCart(int member_num) throws Exception;
    
    // 장바구니 일괄 결제를 위한 메서드들
    @Insert("INSERT INTO payments (member_num, member_name, member_phone, member_addr, payment_content, newbook_num, payment_quantity, payment_total_price, item_status) VALUES (#{member_num}, #{member_name}, #{member_phone}, #{member_addr}, #{payment_content}, #{newbook_num}, #{payment_quantity}, #{payment_total_price}, #{item_status})")
    int insertBulkPayment(PaymentVO payment) throws Exception;
    
    @Update("UPDATE newbook SET newbook_count = newbook_count - #{payment_quantity} WHERE newbook_num = #{newbook_num}")
    int decreaseBookCountForBulk(PaymentVO payment) throws Exception;
}
