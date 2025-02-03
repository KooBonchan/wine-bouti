package com.winebouti.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.util.MyBatisUtil;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

public interface ProductService {
	/* 양정민  */
	

	// 상품 ID로 상세 조회
	ProductVO getProductById(long product_id);

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
    
//	   // 상품 ID로 상품 조회
//    public static ProductVO getProductById(long productId) {
//        try (SqlSession session = MyBatisUtil.getSqlSession()) {
//            ProductMapper mapper = session.getMapper(ProductMapper.class);
//            return mapper.getProductById(productId);
//        }
//    }
}
