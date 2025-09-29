package net.koreate.bookstore.python.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.koreate.bookstore.python.dao.BestDAO;
import net.koreate.bookstore.vo.BestSellerVO;

@Service
@RequiredArgsConstructor
@Slf4j
public class BestServiceImpl implements BestService {
	
	private final BestDAO bestDAO;

    @Override
    public List<BestSellerVO> bestPage(int page, int size) throws Exception {
        int offset = (Math.max(page,1) - 1) * Math.max(size,1);
        return bestDAO.selectBestPage(offset, size);
    }

    @Override
    public int bestCount() throws Exception {
        return bestDAO.countBest();
    }
}
