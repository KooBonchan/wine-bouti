package com.winebouti.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

@Mapper
public interface ProductMapper {

    ProductVO getProductById(int product_id);  
    List<ReviewVO> getReviewsByProductId(int product_id);
    
    List<ProductVO> findRedWines();
}