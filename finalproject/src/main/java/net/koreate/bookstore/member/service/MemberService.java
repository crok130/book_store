package net.koreate.bookstore.member.service;

import org.springframework.stereotype.Service;

import net.koreate.bookstore.vo.MemberVO;

@Service
public interface MemberService {

    /**
     * 회원 가입을 처리합니다.
     * @param member 등록할 회원 정보가 담긴 MemberVO 객체
     * @return 등록 성공 시 true, 실패 시 false
     */
    boolean signUp(MemberVO member)throws Exception;

    /**
     * 회원 로그인을 처리합니다.
     * 입력된 ID와 비밀번호를 검증하여 로그인을 처리합니다.
     * 
     * @param memberId 로그인할 회원 ID
     * @param memberPw 로그인할 회원 비밀번호
     * @return 로그인 성공 시 MemberVO 객체, 실패 시 null
     */
    MemberVO signIn(String memberId, String memberPw)throws Exception;

    /**
     * 회원 정보를 조회합니다.
     * 회원 번호를 기반으로 해당 회원의 상세 정보를 조회합니다.
     * 
     * @param memberNum 조회할 회원의 번호
     * @return 조회된 회원 정보가 담긴 MemberVO 객체, 해당 회원이 없으면 null
     */
    MemberVO getMemberByNum(int memberNum)throws Exception;

    /**
     * 회원 ID로 회원 정보를 조회합니다.
     * 회원 ID를 기반으로 해당 회원의 상세 정보를 조회합니다.
     * 
     * @param memberId 조회할 회원의 ID
     * @return 조회된 회원 정보가 담긴 MemberVO 객체, 해당 회원이 없으면 null
     */
    MemberVO getMemberById(String memberId)throws Exception;

    /**
     * 회원 정보를 수정합니다.
     * 기존 회원의 정보를 업데이트합니다.
     * 
     * @param member 수정할 회원 정보가 담긴 MemberVO 객체
     * @return 수정 성공 시 true, 실패 시 false
     */
    boolean updateMember(MemberVO member)throws Exception;

    /**
     * 회원 비밀번호를 변경합니다.
     * 기존 비밀번호 확인 후 새로운 비밀번호로 변경합니다.
     * 
     * @param memberNum 비밀번호를 변경할 회원 번호
     * @param currentPw 현재 비밀번호
     * @param newPw 새로운 비밀번호
     * @return 변경 성공 시 true, 실패 시 false
     */
    boolean changePassword(int memberNum, String currentPw, String newPw)throws Exception;

    /**
     * 회원 탈퇴를 처리.다.
     * 
     * @param memberNum 탈퇴할 회원의 번호
     * @param memberPw 탈퇴 확인을 위한 비밀번호
     * @return 탈퇴 성공 시 true, 실패 시 false
     */
    boolean deleteMember(int memberNum, String memberPw)throws Exception;

    /**
     * 회원 ID 중복을 검사.
     * 회원 가입 시 사용할 ID의 중복 여부를 확인합니다.
     * 
     * @param memberId 검사할 회원 ID
     * @return 중복되지 않으면 true, 중복되면 false
     */
    boolean isIdAvailable(String memberId)throws Exception;

    /**
     * 이메일 중복을 검사.
     * 회원 가입 시 사용할 이메일의 중복 여부를 확인합니다.
     * 
     * @param email 검사할 이메일 주소
     * @return 중복되지 않으면 true, 중복되면 false
     */
    boolean isEmailAvailable(String email);

    /**
     * 핸드폰 번호 중복을 검사.
     * 
     * @param phone 검사할 핸드폰 번호
     * @return 중복되지 않으면 true, 중복되면 false
     */
    boolean isPhoneAvailable(String phone)throws Exception;

    /**
     * 이메일로 비밀번호호 찾기 변경.
     * 
     * @param email 비밀번호를 변경할 회원의 이메일
     * @param newPw 새로운 비밀번호
     * @return 변경 성공 시 true, 실패 시 false
     */
    boolean changePasswordByEmail(String email, String newPw)throws Exception;

}
