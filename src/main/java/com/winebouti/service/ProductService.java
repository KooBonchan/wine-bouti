package com.winebouti.service;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

import java.util.List;

public interface ProductService {
    ProductVO getProductById(int product_id);
    List<ReviewVO> getReviewsByProductId(int product_id);
}
