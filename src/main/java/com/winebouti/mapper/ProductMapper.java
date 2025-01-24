package com.winebouti.mapper;

import java.util.List;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

public interface ProductMapper {

	/* 양정민 */
	ProductVO getProductById(int product_id);  
    List<ReviewVO> getReviewsByProductId(int product_id);
    List<ProductVO> findProductsByCategory(String category);
    
    
    /* 이창현 */
    List<WineVO> findRedWines();
	List<WineVO> findWhiteWines();
	List<WineVO> findSparkleWines();
	List<WineVO> findGiftWines();
        
}