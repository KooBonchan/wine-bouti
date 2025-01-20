package com.winebouti.mapper;

import java.util.List;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

public interface ProductMapper {

    ProductVO getProductById(int product_id);  
    List<ReviewVO> getReviewsByProductId(int product_id);
    
    List<WineVO> findRedWines();
}