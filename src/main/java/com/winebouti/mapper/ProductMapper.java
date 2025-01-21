package com.winebouti.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

@Mapper
public interface ProductMapper {

    ProductVO getProductById(int product_id);  
    List<ReviewVO> getReviewsByProductId(int product_id);
    List<WineVO> findRedWines();

    // 어노테이션 방식 제거
    List<ProductVO> findProductsByCategory(String category);
}