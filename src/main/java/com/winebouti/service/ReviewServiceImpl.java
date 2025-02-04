package com.winebouti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.ReviewMapper;
import com.winebouti.util.Criteria;
import com.winebouti.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {


	 @Autowired
	    private ReviewMapper reviewMapper;

	    @Override
	    public ReviewVO getReviewById(long reviewId) {
	        return reviewMapper.getReviewById(reviewId);
	    }

	    @Override
	    public List<ReviewVO> getReviewsByProductId(long productId) {
	        return reviewMapper.getReviewsByProductId(productId);
	    }

	    @Override
	    public void insertReview(ReviewVO review) {
	        reviewMapper.insertReview(review);
	    }

	    @Override
	    public void updateReview(ReviewVO review) {
	        reviewMapper.updateReview(review);
	    }

	    @Override
	    public int deleteReview(long reviewId) {
	        return reviewMapper.deleteReview(reviewId);
	    }
    
}

