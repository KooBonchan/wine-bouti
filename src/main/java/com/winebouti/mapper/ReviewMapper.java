package com.winebouti.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.winebouti.util.Criteria;
import com.winebouti.vo.ReviewVO;

@Mapper
public interface ReviewMapper {


	// 리뷰 ID로 리뷰 조회
    ReviewVO getReviewById(long reviewId);

    // 리뷰 조회
    List<ReviewVO> getReviewsByProductId(@Param("productId") long productId);
    
    List<ReviewVO> getAllReviews();
    
    // 리뷰 추가
    void insertReview(ReviewVO review);

    // 리뷰 수정
    void updateReview(ReviewVO review);

    // 리뷰 삭제
    int deleteReview(@Param("reviewId") long reviewId);
    

    // 전체 리뷰 개수 가져오기
	int getTotalReviews();

}
