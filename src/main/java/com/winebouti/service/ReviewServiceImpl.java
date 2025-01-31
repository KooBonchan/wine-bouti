package com.winebouti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.ReviewMapper;
import com.winebouti.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<ReviewVO> getAllReviews() {
        return reviewMapper.selectAllReviews();
    }
    
    //등록
    public void register(ReviewVO review) {
    	 log.info("리뷰 저장 요청: " + review);
    	    reviewMapper.insertReview(review);
    	    log.info("리뷰 저장 완료");
    }
    
//    @Override
//	public ReviewVO get(Long bno) {
//		log.info("get..........." + bno);
//		return reviewMapper.read(bno);
//	}
}

