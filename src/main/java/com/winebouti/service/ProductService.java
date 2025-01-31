package com.winebouti.service;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

import java.util.List;

public interface ProductService {
	/* 양정민  */
	

	// 상품 ID로 상세 조회
	ProductVO getProductById(int product_id);

	// 상품 ID로 리뷰 리스트 조회
	List<ReviewVO> getReviewsByProductId(int product_id);

	// 레드 와인 리스트 조회
	List<WineVO> findRedWines();

	// 카테고리별 상품 리스트 조회
	List<ProductVO> findProductsByCategory(String category);
    
    
	
    /* 이창현  */
    List<WineVO> getRedWines();
	List<WineVO> getwhiteWine();
	List<WineVO> getSparkleWine();
	List<WineVO> getGiftWine();
	List<WineVO> getpairingWine();
    
    
}
