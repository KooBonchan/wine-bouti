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
    private ReviewMapper reviewMapper; //주입

    // 리뷰 ID로 리뷰 조회
    @Override
    public ReviewVO getReviewById(int reviewId) {
        return reviewMapper.getReviewById(reviewId);
    }

    // 모든 리뷰 조회
    @Override
    public List<ReviewVO> getAllReviews() {
        return reviewMapper.selectAllReviews();
    }
    

    // 리뷰 추가
    @Override
    public void insertReview(ReviewVO review) {
        reviewMapper.insertReview(review);
    }

    // 리뷰 수정
    @Override
    public void updateReview(ReviewVO review) {
        reviewMapper.updateReview(review);
    }

    // 리뷰 삭제
    @Override
    public int deleteReview(Long reviewId) {
    return reviewMapper.deleteReview(reviewId); 
    }
}

