package com.winebouti.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

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

	ReviewVO getReviewById(@Param("reviewId") Long reviewId);

	 String getReviewResponse(@Param("reviewId") Long reviewId); //  답글 조회
	  int updateReviewResponse(@Param("reviewId") Long reviewId, @Param("response") String response); // 답글 추가/수정
	  int deleteReviewResponse(@Param("reviewId") Long reviewId); //  답글 삭제

	void updateImagePath(long reviewId, String imagePath, String thumbnailPath);
}
