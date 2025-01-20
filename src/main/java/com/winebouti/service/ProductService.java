package com.winebouti.service;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

import java.util.List;

public interface ProductService {
	/* 양정민  */
	
    ProductVO getProductById(int product_id);
    List<ReviewVO> getReviewsByProductId(int product_id);
    
    
    /* 이창현  */
    List<WineVO> getRedWines();
	List<WineVO> getwhiteWine();
	List<WineVO> getsparkleWine();
	List<WineVO> getgiftWine();
    
    
}
