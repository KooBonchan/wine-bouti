package com.winebouti.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.winebouti.vo.ReviewVO;

@Mapper
public interface ReviewMapper {


	// 리뷰 ID로 리뷰 조회
    ReviewVO getReviewById(int reviewId);

    // 모든 리뷰 조회
    List<ReviewVO> selectAllReviews();
    
    // 리뷰 추가
    void insertReview(ReviewVO review);

    // 리뷰 수정
    void updateReview(ReviewVO review);

    // 리뷰 삭제
    int deleteReview(Long reviewId);
    
}
