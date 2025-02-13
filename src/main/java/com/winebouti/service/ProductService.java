package com.winebouti.service;

import java.util.List;

import org.eclipse.core.internal.runtime.Product;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

public interface ProductService {
	/* 양정민  */
	

	// 상품 ID로 상세 조회
	ProductVO getProductById(long product_id);

	// 상품 ID로 리뷰 리스트 조회
	List<ReviewVO> getReviewsByProductId(long product_id);

	
    
    
	/* 이창현 */
	List<ProductVO> findProductsByCategory(String category);
	
    List<ProductVO> getWines(String category);
    
    Product getProductById(Long productId);  // 특정 상품 상세 정보 가져오기

	List<ProductVO> getWinesByCategory(String string);

	List<ProductVO> getAllProducts(String category);
    
    
}
	


