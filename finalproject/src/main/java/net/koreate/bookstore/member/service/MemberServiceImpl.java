package net.koreate.bookstore.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.common.utils.PageMaker;
import net.koreate.bookstore.common.utils.SearchCriteria;
import net.koreate.bookstore.common.utils.SearchPageMaker;
import net.koreate.bookstore.member.dao.MemberDAO;
import net.koreate.bookstore.vo.MemberVO;
import net.koreate.bookstore.vo.PaymentVO;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{

	private final MemberDAO dao;
	
	@Override
	public String signUp(MemberVO vo) throws Exception {	
		return dao.register(vo) == 1 ? "가입 성공 로그인 해주세요." : "가입실패 다시 시도해주세요";
	}

	// 로그인
	@Override
	public MemberVO login(String member_id, String member_pw, HttpSession session) throws Exception {
		MemberVO vo = dao.login(member_id, member_pw);
		session.setAttribute("memberInfo", vo);
		return vo;
	}

	@Override
	public MemberVO getMemberByNum(int member_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO getMemberById(String member_id) throws Exception {
		return dao.getMemberById(member_id);
	}

	@Override
	public boolean updateMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean changePassword(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isIdAvailable(String member_id) throws Exception {
		return dao.isIdAvailable(member_id) == 0 ? true : false;
	}
	
    @Override
    public boolean isNicknameAvailable(String member_nickname) throws Exception {
        return dao.isNicknameAvailable(member_nickname) == 0 ? true : false;
    }

	@Override
	public boolean isEmailAvailable(String member_email) throws Exception{
		return dao.isEmailAvailable(member_email) == 0? true : false;
	}

	@Override
	public boolean isPhoneAvailable(String member_phone) throws Exception {		
		return false;
	}

	@Override
	public boolean changePasswordByEmail(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria scri, HttpSession session) throws Exception {
		MemberVO vo = new MemberVO();
		vo = (MemberVO)session.getAttribute("userInfo");
		int member_num = vo.getMember_num();
		int totalCount = dao.listCount(member_num);
		// 한 블럭 5페이지 기준 (Board 예제와 동일)
		return new SearchPageMaker(scri, totalCount, 5);
	}


	@Override
	public List<PaymentVO> listOrders(SearchCriteria scri, HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		int member_num = user.getMember_num();
		int offset = scri.getStartRow();
		int perPage = scri.getPerPageNum();
		return dao.listMemberOrders(member_num, offset, perPage);
	}
	
	



}
