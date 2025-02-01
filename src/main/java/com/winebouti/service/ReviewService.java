package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.winebouti.vo.ReviewVO;

@Service
public interface ReviewService {

	   // 리뷰 ID로 리뷰 조회
	    ReviewVO getReviewById(int reviewId);

	    // 모든 리뷰 조회
	    List<ReviewVO> getAllReviews();
	    
	    // 리뷰 추가
	    void insertReview(ReviewVO review);

	    // 리뷰 수정
	    void updateReview(ReviewVO review);

	    // 리뷰 삭제
	    int deleteReview(Long reviewId);

	}

