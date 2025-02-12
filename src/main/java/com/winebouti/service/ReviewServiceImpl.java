package com.winebouti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.ReviewMapper;
import com.winebouti.vo.ReviewVO;

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
	    
	    
	    @Override
	    public String getReviewResponse(Long reviewId) {
	        return reviewMapper.getReviewResponse(reviewId);
	    }

	    @Override
	    public int updateReviewResponse(Long reviewId, String response) {
	        return reviewMapper.updateReviewResponse(reviewId, response);
	    }

	    @Override
	    public int deleteReviewResponse(Long reviewId) {
	        return reviewMapper.deleteReviewResponse(reviewId);
	    }
	    
	    @Override
	    public void saveImagePath(long reviewId, String imagePath, String thumbnailPath) {
	        reviewMapper.updateImagePath(reviewId, imagePath, thumbnailPath); 
	    }
    
}

