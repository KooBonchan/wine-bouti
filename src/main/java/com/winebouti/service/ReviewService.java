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
    
    void saveImagePath(long reviewId, String imagePath, String thumbnailPath);

    String getReviewResponse(Long reviewId); // 답글 조회
    int updateReviewResponse(Long reviewId, String response); // 답글 추가/수정
    int deleteReviewResponse(Long reviewId); // 답글 삭제
    
}

		

