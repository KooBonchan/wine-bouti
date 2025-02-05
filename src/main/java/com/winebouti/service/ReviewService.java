package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.winebouti.vo.ReviewVO;

@Service
public interface ReviewService {

	ReviewVO getReviewById(long reviewId);
	
    List<ReviewVO> getReviewsByProductId(long productId);
    
    void insertReview(ReviewVO review);
    
    void updateReview(ReviewVO review);
    
    int deleteReview(long reviewId);

}

		

